Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207F4D3EE77
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:31:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40157.1769095871832024750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=wl1G5NOP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A7554E421F5
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:31:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC18F606B6
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:31:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EF06119B8323;
	Thu, 22 Jan 2026 16:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769095869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TvfWG9djlQmPWZ8Fh+NQ40tILXhO8KUZftjfIICS5sM=;
	b=wl1G5NOPw6DpwzOoFyrIORII1J5kUT0tspOgnsldhxmEWZL7I/mANjTl/Pp0KsCPxTsD5H
	bvzNvvrzc86PC8nr9gIguHokp6fsTp/Hz+ANJdDZSL13A7TWYmQluzPafdUeAhz1EG+sZx
	5jIWNOlpfP8LlxApi0C9m7PhTTbS8Av5lN2tM6BoeBtyiRrDXgRBK4cs+ugGRkucgO3Eml
	t+SpsLoKrbh6/J4oIZZ6iBt3f0YGYbTYl3pZRQHht2SCT4c1tr2sphzLhF0miFjOGW9Kom
	t61KWaT5Myu1UQS5uTgpVZbVF1wcCiGhCC3eWZxyICROEPsmReuLw7RtLDpeIw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: force gcc toolchain
Date: Thu, 22 Jan 2026 16:30:50 +0100
Message-ID: <20260122153050.341395-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229847

From: Thomas Perrot <thomas.perrot@bootlin.com>

OpenSBI requires the gcc toolchain to build correctly. Set TOOLCHAIN
explicitly to prevent build failures when using alternative
toolchains.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp=
/opensbi/opensbi_1.8.1.bb
index 0a9652c2831e..52d7b38ff2ba 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -15,6 +15,8 @@ TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmwar=
e/"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
+TOOLCHAIN =3D "gcc"
+
 RISCV_SBI_FW_TEXT_START ??=3D "0x80000000"
 EXTRA_OEMAKE +=3D "REPRODUCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFIX} ELFFL=
AGS=3D"${LDFLAGS}" PLATFORM=3D${RISCV_SBI_PLAT} I=3D${D} FW_TEXT_START=3D=
${RISCV_SBI_FW_TEXT_START}"
 EXTRA_OEMAKE:append:toolchain-clang =3D " LLVM=3Dy"
--=20
2.52.0


