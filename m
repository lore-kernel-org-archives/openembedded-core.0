Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AD9CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:21:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42675.1782134472611022634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MspD3/c4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9A204E40116
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0357601BB;
	Mon, 22 Jun 2026 13:21:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DACF2106C8A8F;
	Mon, 22 Jun 2026 15:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782134470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d9NMkj5mbXJdJsGpkGAEHFu7fWE/QuvxJraAn0asxl8=;
	b=MspD3/c4cbd6c/qOupXUOW5HkqBjxcW61AvipBEdPl/1GhXmsmdGPFwNuDXcLHEtv5/Dze
	ZSxYi5eFeVi7R1cWHXR2pP/r78GuSsBYc09/O6iCkYLIfBQI4SfYCo/36H9DJVfN1NAThb
	O9hol5B4fIg7NG9dJ4bnQJk7p83WF205F/yBifL9B+bguDyHIU1Iya6sxDHj/Wr/mYI6Ym
	P/m9r3ya/T5AswzpTbZ5KCUGMiPripPwq9tKrM2ZiD12pVYaGHfuJ/IshBwYluAIwA9tAp
	3qJUAWauueS+LgterlyFbU8Wla5LB5s4GDX2CKf0433FPykCuwNNTYMC1N+9oQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 4/4] llvm-project-source.inc: add vardeps to do_preconfigure
Date: Mon, 22 Jun 2026 15:20:21 +0200
Message-ID: <20260622132021.37598-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
References: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239294

The task's signature should change if CLANG_EXTRA_OE_DISTRO and/or
CLANG_EXTRA_OE_VENDORS, considering the couple of for loops in
do_preconfigure iterate over their values.

By adding them to 'vardeps', bitbake will correctly detect if
do_preconfigure needs to be executed.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 85b5ef06dc..84d4bae0ab 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -90,4 +90,5 @@ python do_preconfigure() {
=20
 do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
 addtask do_preconfigure after do_patch
+do_preconfigure[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_VEND=
ORS"
 do_create_spdx[depends] +=3D "${PN}:do_preconfigure"
--=20
2.47.0


