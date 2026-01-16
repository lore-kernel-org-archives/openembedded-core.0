Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F22C982C4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 14:31:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7275.1768573894332287733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 06:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ONxvChnv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1FDDEC1F1FA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 14:31:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D88AC60732
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 14:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4AF110B688EB;
	Fri, 16 Jan 2026 15:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768573891; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=b2z4Tci3Zinl6XuPg+5Dm/LhTLR8lZuzsiI8T+j6jtE=;
	b=ONxvChnvIaEHBB22C/akjKmsQHG8ekUYXH7zEAUmPdwfSrosgOWYCR125WXTY3Sv/N42E6
	qplhOpwaBB1eQ4W1rzlmLHY8J0S5fhUF5EXqAzn+no8523ZApRtEh2eL87kbaRDySTRjBg
	MN59u+Ml8qt4CAaRU0q5yAFef8+A9WQyRwOqGtrct3N9PplzNMOk06WamP8rD7b+46CI7l
	1uvqxgTSU07uQNIrmX3LH/FaZM5A7exb8tpOvm6Qs67c35GlGHCMKosvXWv98jp5KDztQd
	a8wCi+1vCRWjv8Rlac+P+ZbUP2zfVt92AQhELe5tQO4EkUVTIWF7KQNRauErIA==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.8.1
Date: Fri, 16 Jan 2026 15:31:21 +0100
Message-ID: <20260116143121.1449415-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 14:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229547

From: Thomas Perrot <thomas.perrot@bootlin.com>

This intermediate release has following fixes:
- Typo fix in comments of sbi_hartindex_to_hartid()
- Fix hart protection abstraction for platforms without PMP

Allow the platform to boot without PMP, but it is still necessary to
enable PMP on QEMU; otherwise, there will be nothing to protect the
M-mode firmware (OpenSBI) from lower privilege modes.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.8.bb =3D> opensbi_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.8.bb =3D> opensbi_1.8.1.bb} (=
97%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.8.1.bb
similarity index 97%
rename from meta/recipes-bsp/opensbi/opensbi_1.8.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
index 5352c01d6693..0a9652c2831e 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -8,7 +8,7 @@ require opensbi-payloads.inc
=20
 inherit deploy
=20
-SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
+SRCREV =3D "74434f255873d74e56cc50aa762d1caf24c099f8"
 SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
=20
 TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
--=20
2.52.0


