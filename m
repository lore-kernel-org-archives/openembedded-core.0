Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5026210775F4
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:15:07 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19687.1773854100096526860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=bCASben/;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=iRmjDiy/;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 73F7EEC0113;
	Wed, 18 Mar 2026 13:14:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 18 Mar 2026 13:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854099;
	 x=1773940499; bh=+PVbbvIo2KO29LNYNPOWs6zBcwfuRoPHEjYMxsCXiMI=; b=
	bCASben/1G5MXuj0ynl15Kelz9lOVgOkV8ZaI2WfL+SoceUArqLncX7GX7tLT/+S
	mO7BQu/eJYb13sKWoqtUcH4Gfid3Fjwxvt8i+WjbmjPcdnGZjTxGDw8V0Xm6dShe
	b4xeh+Qr8le4Dqwa7GP6VQy0htfXvIhkb8ZmchQibVYeGdoi5Fh/fRoGWmL+tcX5
	zVAGbUDNjnpdX+2yN6VkhL1bsYBYVsO6lnE/wFUZjPlRGc6dwDKCuRBXkl8kwxwI
	zVkzO4rX6S1edfe6o2v+KcHFS9Ss7lX7v0gk+pXn0c9QHyYbbIXsc43JLAvDRoYV
	TNYq3mQDCJFVx4cFtMLNSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854099; x=
	1773940499; bh=+PVbbvIo2KO29LNYNPOWs6zBcwfuRoPHEjYMxsCXiMI=; b=i
	RmjDiy/AoSina3cUWMWNWjYWpBFi0BcP1+5ajcPwRdP22Z3CaokOBENwVe3r3ac5
	/6ayGMFhZmQ+/j2CbSvgdeBI3qmXP0Y5rA970/pBxFYNe1htC39svpHotYgVXU6T
	s1Sf4ubSrvJYwFEAoQwCxT2hwsPnkseN6r2bnTGVfdfMjLVBduWoO1OcGZO/sI7U
	3xefHZAb9Y6OJSx46wEi+Vb/XxCPCYRlxWbnLnqtABBnv2KVTS5vOtVEdW/vZIXf
	AaUeW/IOxS2RkSbNBGcTOC4kOO/FKclou4v32vv5XnvvILU91zL5IhFJrmxnvV5K
	2fDFOO2Z1ygpYzFqm87qg==
X-ME-Sender: <xms:k926aRAG5TF5O66X9cGvTlYz3O1BfAxrxgYH19gahl3r2VUPNlYNqg>
    <xme:k926aViUSVFJxnrASZ1qCCp2FrvjTOF0DoipApCI_T_rmPX1Lyi1VDGLflzPoVlyU
    _O1p1PLDvKMt6D8UevQ7Z6pQ5FlyyVVROBN0mn3jPDPbqWerIZBt48N>
X-ME-Received: <xmr:k926aaMvBP0ZP9lyXu1Jrv-_aRAajf_tbdiw_nL2Y93hYDHAnu8RQTnAM8Go9PudRM03jVuf-cLEXBBJlyE5uhRqJHpG0pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:k926aW4Ds-l9r8c0hdSA07o7chpJK3hU_v7X_Huk4Fhx8y0XA2ERKQ>
    <xmx:k926aY3He83m4ybAa-4pwZHSPXLPt9zqnrCTDWaWtQTwlw4LDr8Pew>
    <xmx:k926aXaQkIw07XC9irJ-097kdUdQzmQYs7n3BARp5u1dBI0Xx1TMDg>
    <xmx:k926aQA5tBct0QCX-NNM9XhN24Z9CiUDF6vyj1Vuo5P0DwzNOUhouw>
    <xmx:k926aVnalVcuh8rcubDY2MGtNh_GkPDK9Q80RqfjldyuRK7_MhbTOzAa>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:58 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:54 +0000
Subject: [PATCH 11/12] graphene: Explicitly set PACKAGECONFIG vardeps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-11-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=/duNhyNSIM2TaMeFPaExT4keVJpJWiySkz+fRnCuBb0=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutslm8zM/P391nkyX/5v3G0VwHBK3mXPd/6zOovK4
 m9xc8xy7ShlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBElt5jZPgclmx8y+FMl4p8
 gP2uS/8N736wqf7348c2h6vvnesmGYQxMpx7YnRr8Rat7H+1O6f3OfQ6Pz7LsVeWnbf8hFmtp+O
 002wA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233428

The variable dependencies are discarded for PACKAGECONFIG, which may
cause tasks which use the value of PACKAGECONFIG to be considered
arch-independent, even when the value is actually different depending on
the target architecture.

In this case, we use the value of TUNE_FEATURES in PACKAGECONFIG, which
is obviously arch-dependent so we should explicitly list this
dependency.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index d14a6403ff43..5a051af1ca35 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -16,6 +16,9 @@ PACKAGECONFIG ?= "gobject-types ${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
 PACKAGECONFIG[gobject-types] = "-Dgobject_types=true,-Dgobject_types=false,glib-2.0"
 PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
 
+# PACKAGECONFIG dependencies are not automatically carried forwards
+PACKAGECONFIG[vardeps] += "TUNE_FEATURES"
+
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 

-- 
2.43.0


