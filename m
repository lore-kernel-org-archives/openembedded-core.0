Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C09FF60E1
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:13:04 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15360.1774944778939092476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 01:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZIlz3GhZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27AAF1A30AB
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:12:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDDBA6029D
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:12:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FB2F10450EF5;
	Tue, 31 Mar 2026 10:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774944776; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=WNUZXI/LiQuDyu3hwk4KM1yv8dLyrN0p7ixnAojsh7w=;
	b=ZIlz3GhZKVCc2lUO8NG9OQUENyIp8rDzxltAP/W9otRLydcZZcwax/d/KHDSoCcdBZ5F/U
	abP8AJhTcaNjVsvrY2lME0JKftDEq//hAb6YtFaLgM3EGvdNTghr2wpzFiVk0b/jtfbUqb
	b+GWPGMAoIhsMZja+cFq3dA/Es9wcayZ2kzvof1Vcpu1WJPFzodzLAkCiodz0anmBFhdVu
	hySvmnhW0GEyzEqJG1yKap0INejXlHMIris8q/lDDrqLr9m8a3NXc73BMFV58L2dRFv5pR
	pZbEYBT8T4V5in7xPXxaqCQfN7ffqR1ZwXrQ4r/4FuLIIHQ6SwarZY3WWTg8Zw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] lto: disable for expect and add DEBUG_PREFIX_MAP to ldflags
Date: Tue, 31 Mar 2026 10:12:46 +0200
Message-ID: <20260331081246.73406-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234270

From: Thomas Perrot <thomas.perrot@bootlin.com>

Disable LTO for the expect package and append DEBUG_PREFIX_MAP to
TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping
is applied consistently alongside LTO flags.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/distro/include/lto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
index 8752249685a4..c66dfc5a8074 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -4,6 +4,7 @@
 #
=20
 # Disable LTO for following packages
+LTO:pn-expect =3D ""
 LTO:pn-glibc =3D ""
 LTO:pn-gcc-runtime =3D ""
 LTO:pn-libgcc-initial =3D ""
--=20
2.53.0


