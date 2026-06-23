Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F43CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:08:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19192.1782216528009777806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=uwImvUK1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 39DC21A0871
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EED3601C2;
	Tue, 23 Jun 2026 12:08:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1D3C106C8472;
	Tue, 23 Jun 2026 14:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782216524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GyOE0DlGbQbJncPZBqH0tnOEROkeWIL0j0/My/DhhH4=;
	b=uwImvUK1WmQw7AXh7FvtqZiRoMPmYs4tARRTNfnDlEh5MmTW0WV2clHXRD7L5lvCpXMAu2
	vL8CLvOU0Ch8GR10mSzwwL3w00xPmu6vMDb4zWezE/MTgb5PvER9ciwi0XT7DPQ7tnOToW
	ZLN4MjLRIF1HJgWVssa2LDQHYpFmSyAonsjeD4ULh5vGX9tUgs0FZwhUkOHBW0Y/5LZFiD
	KlxXsnZY30sclf9K+rymTHPUdftvA+17xOh06H+7c3FL36FCvhotHkscObnQkZeTCfc/vc
	CMQUPphdYvaNLU+q3Rn8Mv/ruWa0LZzEDxJWtGbKitAHr5UKhuXw3lk9P0OXgA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 5/5] llvm-project-source.inc: add vardeps to do_unpack
Date: Tue, 23 Jun 2026 14:08:18 +0200
Message-ID: <20260623120818.110754-6-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239364

The do_preconfigure task performs some string replacements, and the
patterns searched by sed are no longer there if they were replaced during=
 a
previous (successful) execution.

This means we need to unpack the sources again, and apply the patches,
before running do_preconfigure again. Regarding do_patch, it is already
handled by the addtask line. However, even if we define a dependency (e.g=
.
with deptask flag) between do_preconfigure and do_unpack, bitbake will no=
t
reexecute do_unpack because the stamp is still there.

The only workaround I see - not so elegant, yes - is to make sure
do_unpack's signature also depends on CLANG_EXTRA_OE_DISTRO and
CLANG_EXTRA_OE_VENDORS.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 84d4bae0ab..7cc4e1a9f0 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -91,4 +91,5 @@ python do_preconfigure() {
 do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
 addtask do_preconfigure after do_patch
 do_preconfigure[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_VEND=
ORS"
+do_unpack[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_VENDORS"
 do_create_spdx[depends] +=3D "${PN}:do_preconfigure"
--=20
2.43.0


