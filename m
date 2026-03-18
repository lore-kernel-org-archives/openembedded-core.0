Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5586110775F1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:15:07 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19756.1773854098659919426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=evy3nADv;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=29KE65NK;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C948EC010A;
	Wed, 18 Mar 2026 13:14:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Mar 2026 13:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854098;
	 x=1773940498; bh=n9veOmnv8rwRwUk1cOpZi0tDpmacWJ2FjOHuU1R6A8k=; b=
	evy3nADv2CoVGZq51YKT7ljUu4ywbT0sSNMGSis3ZRk7g5zWbGJ81ElZ3d3j2ztG
	D4xq/EUj7hZWvWZnvz60lUEccdAlFf7LX8LLF2dJ4F/oefg9kDdSs95mUcWbzDpC
	fGuKN5At5c/hfiHObutMEYI40EfTdIlh6AQgn5/vyNR/Cn3flk5kMudhgNLQp4q2
	pV6zccxrU8u2/Pv8uxcN6bpwBO4rmGH7bOPyiUO5kUExoBBAQ2jZA5CVwWpi4oDe
	OR5Lxxg3bWYyGFNWvzy+dYoS0YvbPU/+AwcYA1/7mP3Tm2Tkg3/UELPqtty5Bc60
	uTZwIe+iv/MTJkGdSKxewA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854098; x=
	1773940498; bh=n9veOmnv8rwRwUk1cOpZi0tDpmacWJ2FjOHuU1R6A8k=; b=2
	9KE65NK8IHd378Qx39uzGoTJFG554h7JOdLjWfI2DBHo2pruHTBoe5jJccsRUgdI
	HtSe4g295P6+CMiKTIf0PrBms2rDvX5haz7k3MR2aIDZ2gTRvmFI+2PdQdR86+b5
	SoMYf0KgDmPCr9IKXfov8dhV0n7uWiRJ299EwtHST+KY2FLa4hQorQgru/ino/m4
	Ltk8awzEjQNat4GIlMT4MST+TCRM6P3SKBdaHt1xukw0uDIymY+0DDQs8mV5yycI
	APlRv0Caa6vNCjbZTHnsvnm1GyIb0Ano9t9WzVk0Poo6zjetuYaZLMtwn+g4jRKU
	MaGslzqzBLRtq2vQ8FmTw==
X-ME-Sender: <xms:kd26aZXlxZABtj2FkYWBB2J-LnqOcuTwBzJt73tq5op7Ctw97rQmxA>
    <xme:kd26afk9diRm9ty_-DVKJJtoQ-q6fAEnewyLf2LE6CSEEIcpz0qSHIbnNScA7TCe7
    rrAh4qSZeBnmPVqg2mLLhz4wm-u2HVoHaNXqkOs8AdeaRsJMeqejZk>
X-ME-Received: <xmr:kd26aTAP2wW_8wgBXBM97oil51EumOYn6CftpWZjm3dDZI3L8uoXNVtZbbmXtcys0HkzZkW0WaH1npSbR_7-VPsxYCu9-Bs>
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
X-ME-Proxy: <xmx:kd26aXfgBBa2fKcVMxnbBKrZvfQ7J5yXRcqBGF-8QXID49qbnkjzag>
    <xmx:kd26aWL6OMtEO6TsCiSh49twWeVllQNcYufCEYFfiHZn4IxYB8cRsw>
    <xmx:kd26aSeTJiTz0bOJjhRGJolg4Sto99BNBvxqg8dVsfcyiJN-fdLyUA>
    <xmx:kd26aV1kKmLSCq4TU1nhCBQSk3f4xAzmLABtSYHTgoCHBwTU84HD6g>
    <xmx:kt26aa4bFh1CH1Sx1qhtCrMWvYU33MEBERp_h_aARVA1jQfioPbIUiR2>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:57 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:52 +0000
Subject: [PATCH 09/12] linux-yocto: Avoid arch dependent vardeps for
 SRC_URI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-9-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=CT2Ke5FRAb0INq0GMIu8WieuUVbatW+7/ei1s0daTNQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutup8q2jt8e367DgGp4jR2fKdPql5ycdmCHJY8Z9O
 KdaIGd2RykLgxgXg6yYIsvmnq/3n/Y68maE3FKAmcPKBDKEgYtTACYS95Lhr5BdtcKn8Kkqkx8n
 y65LKbabbv+6d2O1fbVvorvanVWK+xj+qVm3iwfmFhwqDg39Vczas2eNAtO8h09s9fnfVTpprnR
 hBQA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233426

yocto-check-layer will fail if SRC_URI is dependent on the target
architecture. Usually we would try to remove the dependency, but for the
linux-yocto recipe it's necessary in order to select the appropriate
branch from the source repository.

As none of the checks performed by yocto-check-layer actually depend on
the selected branch, we can discard this depedency by specifying a
generic vardepvalue for the branch name.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index f47873348a9a..18f910f34e56 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -93,3 +93,8 @@ do_devshell:prepend() {
     d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
     d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
 }
+
+# Avoid potentially architecture dependent value when evaluating vardeps of
+# SRC_URI. This does mean do_recipe_qa may not re-run when KBRANCH changes, but
+# that should not invalidate the QA test.
+KBRANCH[vardepvalue] = "master"

-- 
2.43.0


