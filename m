Return-Path: <rafael@beims.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FEFE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 14:11:51 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.web10.13017.1735308705941786766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 06:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@beims.me header.s=fm1 header.b=A/oqbbFt;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fyC/QQxR;
 spf=pass (domain: beims.me, ip: 103.168.172.158, mailfrom: rafael@beims.me)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 420DC114006F;
	Fri, 27 Dec 2024 09:11:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Dec 2024 09:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1735308705; x=1735395105; bh=HU
	oaODlqF5lQNDTZ7vMBOnq2yn34BW5uBDghSPImsFc=; b=A/oqbbFtg8X1YHwq1t
	qvMzVw7P2mfpUff4W/SKevSU87fVO/HHOacGkHDIVI4w/BG4LbjoXNAJ+cqNHsQY
	A+Ogd2tMbcayvdSSTEUKUzZxzE5C8NKzHD6w4ODMqSX6TGiMZ2rlbXIEWrjaS6hx
	X8/O04E03Fmjng2aiQb5mVB1S6hWCnahdb+LTT0TDwzmkLWdZFUtVGom7FIXfQQF
	DPiewkvSPzTC+pwnlq1a1R+t1ALw58BmvFuTOVeH4mCPPQS1n+ILUCE8Q1Yz7Hzr
	9fM0gaBXwJhLms1b8hjtkv2p7ibf/J1DmK/EIY1zia6TYFlOy9LDXfUWM3RLcEcQ
	CTPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1735308705; x=1735395105; bh=HUoaODlqF5lQNDTZ7vMBOnq2yn34
	BW5uBDghSPImsFc=; b=fyC/QQxR9b4NChTEdWviRnSGM7NyUP3WaycSqon6Hjwv
	V8l3IUq3WKb2dacoVZ0ZyCxzDwMPNHbqA3qSt/D9qcdbyuxOghbxbN1r9cQjEqPw
	F7x2U00cFY8LphwnvWJZiZZFHeSPMGMETxyV7Zv021kqWfzfVkEb9+kaIqkhcS8C
	3mE9PF/gJhJukHta1bP1Ud/0jhrvCQjHgrmDJFZjXc13ynh90JKrui9xrYOxGNkO
	yJCQiCODMTqIOfI5tndydIPVO1oaG+UwPSTH7N7/41mQ6rdo9kNdYWLsE+q8b1eJ
	fPxYkuQtiHeS5Ps/t2NkyaF7rBUVOBR7WCNw4LTcXA==
X-ME-Sender: <xms:oLVuZ-19vZavDDt86rAn48CsgtW7qy5uaEyvTiNegX6XJR42kZ5rNw>
    <xme:oLVuZxGoQ1J5SmErOaJPva14rSXa1x38ISoIUGlR-91dXLB6o1V-mRDNfYuudQnfI
    gC4l6IQN-3g7FRmc10>
X-ME-Received: <xmr:oLVuZ24t2nTcMN0cGLsh6JDO-keJfCPcozB6aFTdLEa0OnU4nK5qGxRxxwEufHKMMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvtddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfg
    fvhffuvegtgfesthejredttddvjeenucfhrhhomheptfgrfhgrvghluceuvghimhhsuceo
    rhgrfhgrvghlsegsvghimhhsrdhmvgeqnecuggftrfgrthhtvghrnhepueeggfejuedtle
    ffkeehffffjefgvdejieejhfejtdelteeifefghfffiefggedvnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehrrghfrggvlhessggvihhmshdrmhgvpdhnsggprhgtphhtthhopedvpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorh
    gvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrnhhu
    jhdrmhhithhtrghlsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:oLVuZ_2XAVDNrOMcHGtGXG0fz8bXvKOxdzb9evYo52Rztsa8ocx4Ng>
    <xmx:oLVuZxHJuj5fLctl6HUv-xfdfgFkYe4pa5fSW50UqnBiKyejHLjLzA>
    <xmx:oLVuZ49-vyA1jxWREzXFMFMIzEhLlJ0x8gJ_UKJnB7hQMSKSGRPa6A>
    <xmx:oLVuZ2nurh3Yt4_8PqKfO__tc1p0bGWIVWBQFmRBUWoDiNxCxJA7Ag>
    <xmx:obVuZ2SHNXTRxchHEdD2YqBH-RwYDLhg_ncZazsXGbW9yyfN5BU6o1yQ>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Dec 2024 09:11:44 -0500 (EST)
Message-ID: <17206ef3-ac44-4b07-b881-a639fb94f6fc@beims.me>
Date: Fri, 27 Dec 2024 11:11:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: pt-BR
To: openembedded-core@lists.openembedded.org
From: Rafael Beims <rafael@beims.me>
Subject: Possible upgrade of Bluez in Scarthgap branch
Cc: anuj.mittal@intel.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 14:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209104

Hello,

We found a problem related to key exchange that affects Bluez 5.72. This 
problem was already resolved on Bluez 5.79 
(https://github.com/bluez/bluez/commit/366a8c522b648f47147de4852c5c030d69b916b3), 
and now we're wondering whether it would be acceptable to update the 
Bluez recipe to the newer version on the Scarthgap branch since we don't 
know the version policy regarding this recipe.

We can prepare a patch if this kind of change can be made on the 
released version.

I would appreciate any comments you have regarding this.

Rafael


