Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31501C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:23:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36333.1782735813309013846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Audbfb0Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 185551A0D24
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:23:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D09EA5FF96;
	Mon, 29 Jun 2026 12:23:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1C29106F0D1D;
	Mon, 29 Jun 2026 14:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782735810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+Zo9gWLL12qKNcKCxq6zFCvYKzr/H0NVSKfNep9z7aU=;
	b=Audbfb0ZvGNYhFAISHxZ50edyn0BI4pnuWNcBT4u8kwm0mOaP7fysdOEP4sNN7SKdnk4fu
	fwUSmLXfkHctOK64r6Z6aQ6ptm0YE10vhMofJXcwuk7wWtR1ZaKdj+pwdDvxSQ4cTJWWaL
	S4ObDD//NPRvOJocZ5s4NmxbC/KRQnSw/AjdFAhxhj/ixeMidZc7oF346ZBRde9MRT4is6
	wY52cZUM38pIryZ8UsNcUP2pvjYIeRXWJRPSIQud0dhLYU7l8khP+86+ayRUQKtcG11v88
	SiRq6/8f8DY7DxmIqfgTeh8ysYe7EOpk0tzP0tpNxDaGd29CHBn3FfdlVEa+GA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] webkitgtk: allow usign clang to compile for arm target
Date: Mon, 29 Jun 2026 14:23:10 +0200
Message-ID: <20260629122310.542373-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239763

This commit reverts:
be459bf17d: "webkitgtk: Use gcc to compile for arm target"

The issue #132322 [1] was resolved, and the corresponding fix [2] is
available in LLVM's v22.1.8 (currently used in oe-core master). It is
actually available since v22.1.0.

[1] https://github.com/llvm/llvm-project/issues/132322
[2] https://github.com/llvm/llvm-project/commit/5e803587eee0

I tested it with MACHINE=3D"qemuarm", and it builds correctly.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.50.6.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.50.6.bb
index 5d2c970b29..0cfeaf9ae7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
@@ -172,9 +172,6 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
=20
-# Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
-TOOLCHAIN:arm =3D "gcc"
-
 # Pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
 # workaround error:
--=20
2.47.0


