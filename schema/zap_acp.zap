# zap-acp — Agent Communication Protocol over ZAP.
#
# FIPA-style speech acts (inform, request, agree, refuse, query, …)
# wrapped in ZAP frames, each signed by the speaking agent. Provides
# structured intent and provenance for multi-agent orchestration.

struct Message
  conversationId Text
  inReplyTo      Text
  performative   Performative
  sender         Text       # agent identifier (resolves via zap-rns)
  receivers      List(Text)
  ontology       Text
  language       Text       # content language (e.g. "json", "fipa-sl")
  encoding       Text       # content encoding (e.g. "utf-8")
  content        Data
  protocol       Text
  replyBy        UInt64     # unix nanos; 0 = no deadline
  signature      Data       # signed by sender's long-term key

# FIPA Communicative Act Library performatives. The list is canonical
# but not closed — implementations MAY introduce new performatives via
# the `customPerformative` field on Message extensions in v0.2.
enum Performative
  acceptProposal
  agree
  cancel
  cfp
  confirm
  disconfirm
  failure
  inform
  informIf
  informRef
  notUnderstood
  propagate
  propose
  proxy
  queryIf
  queryRef
  refuse
  rejectProposal
  request
  requestWhen
  requestWhenever
  subscribe
