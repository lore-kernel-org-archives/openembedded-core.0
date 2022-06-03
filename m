Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C945C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 06:42:05 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.4589.1654238519820974430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 23:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=QhjVGB8N;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20,
 mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id E0F213200313;
	Fri,  3 Jun 2022 02:41:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 03 Jun 2022 02:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1654238516; x=1654324916; bh=6QtDxHLmxaTC6dU6qwO4vPXop
	3UdPDJ9j3mohv2qx/0=; b=QhjVGB8NVnGalYWnlrLOYles4RLHqMhv311w/vT/N
	URhKn/doSClRun4Bk2ftL1H8Viy7fUbrDcc2s2qPFekR3BU9mFtEpifKfHdwHqRK
	gCohK53RhIpVIdmYYBHfx1JrxGbFfHpWf9C+OcD5/btvMSy46sKxfcPCP5bxl85q
	RlTSTH9oH6zrhlYWsdqpbt8O6o2T0kLtlojK5+bE2XW67mlLxLqfF32knCYUH0fK
	SImD8auWTC1//ZPEww9CLUcLMqCEOgA/NfYYQqIe5TNKuAqT6XRjYtE8x1bh2WwC
	mJMlJv8AxxI6faBSyKZtGr+/EWvJEWa/XoMWTfGCw2ZeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1654238516; x=1654324916; bh=6QtDxHLmxaTC6dU6qwO4vPXop3UdPDJ9j3m
	ohv2qx/0=; b=fozkjIoKVPko3PAcjuU/dmlXKE7H4q/3620fCMDdwMKrPN09ZUy
	adTbWrUUrAVkeY2lBVbyKVIzw5TjajKDSNFYS5FhKUuu8TInytHAv65fWPfNLASy
	zaeai6nmFloUurejzXQt42vMc9dkMbcVWTBVYmfhISDL5t9q8l85xyrp8mZUtKgX
	oAg0kBp8aHt1Zl3TL7E4C7G5zWXSZK+HA+48tTVEcrbJfWU9dmNpDAGf2guxjmQK
	Z5y120WYcwM3qHnqy5pVvFSHzv4HhDpKzEr6oQjGX/iveoBUIgGBi7lQzdZcbQv5
	Qx/VkkYUJ5HESJQ4U52b56XxYjqvO/InyaA==
X-ME-Sender: <xms:M62ZYsdlrhYomcigusUStL5RBa27BkNgkIZsIEIh9w3kTRPo00OnUg>
    <xme:M62ZYuM7HAVrN9UGDp57zS6WtSaBvx9-uFGUM35Ak8xUyjV94LV5tnrBz1r9K9AGh
    SpUkLpfzlUd8tqbEm0>
X-ME-Received: 
 <xmr:M62ZYtjJd5GWeUzvZ_AhFB0-Llj1Oiyxw8w0rEsKRiDMb4gUxMC9k5OtN2jHV2zwdif-dBtMxloVTa6T2QRczNQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrleehgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:M62ZYh9tXDeJJYV9Nl4gTMYSZkQcIUWm2cgEdPQgQz42zuyymoYl-Q>
    <xmx:M62ZYosUPFPbozKR6wr5_mdfV30fZApQvlYCAdROs1eH1FxgZys9TA>
    <xmx:M62ZYoE9FGYNUfdYd4JugypcQ_BiZclwCLwO_DWiDkRTodlS6X6Yjg>
    <xmx:NK2ZYlVdgqyKgYYQB4KausT0p2-XcggfEz5-S6tYyTKTAith1RPJhA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 02:41:55 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] bitbake.conf: Make TCLIBC and TCMODE lazy assigned
Date: Fri,  3 Jun 2022 08:41:22 +0200
Message-Id: <20220603064121.7395-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 06:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166509

This allows two level of overriding (distro level and local.conf/shell
variable). Previous settings blocked shell variables overring
if it was overriden on distro level.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0e939aca4f..2a3cf6f8aa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 # General work and output directories for the build system.
 ##################################################################
 
-TCMODE ?= "default"
-TCLIBC ?= "glibc"
+TCMODE ??= "default"
+TCLIBC ??= "glibc"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-- 
2.35.1


