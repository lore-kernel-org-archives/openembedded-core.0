Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68D5CD3436
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:52:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16582.1778068364640542600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 04:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=A7TDpQjw;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC475C5DC47
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2026 11:53:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 921826053C
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2026 11:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E15E4102F249F;
	Wed,  6 May 2026 13:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778068362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=X0zYO/uUpZDNevyLPcbuw+5UE10fNaDnCYU1DZq54l0=;
	b=A7TDpQjwXv//da/u79F89H+9qVyc72MZ6sSCSjhSpADhmT/ZbSlKnnWji3jc24y8gTrJse
	4KMMbtdeW/ZPU1ZIccW3CiPWm8Qi/ZBZaNiLbsStHAID0yi17lExRrKK9+CVEM3cgByzw0
	NuHSFIj/dgA4wurmqEXBwkWEY9s6XxbcAhSENfXjKPSKue2AE/UudqVM2+f5uSxRycqXbH
	IcX6m+gd5y8J5yxM9Ogcn15kBN0MPD/UHQyN+FcL5v1VO8HtUixYJKYcG8wA2ytiJ4g2nV
	fLBm7ZO4xV2ZkwEVONyuhpOUM1A/TxseikwWGDlMGcoUOIz6K7jQZm9//siiqA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] u-boot-tools: drop the hardlink workaround in do_compile
Date: Wed,  6 May 2026 13:52:19 +0200
Message-ID: <20260506115219.2371873-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 11:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236539

This workaround initially considered a host running git < v2.14, which
does not look realistic if we consider the fairly recent distros in
SANITY_TESTED_DISTROS.

Even in older build machines/distros, one can use buildtools to provide g=
it:

$ ./x86_64-buildtools-extended-nativesdk-standalone-5.0.sh
(...)
$ which git
(...)/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/git
$ git --version
git version 2.44.0

It is harmless, but still a bit outdated, so remove it.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/=
u-boot/u-boot-tools.inc
index 4e4f7fa092..738d843591 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -27,21 +27,6 @@ SED_CONFIG_EFI:aarch64 =3D ''
 SED_CONFIG_EFI:loongarch64 =3D ''
=20
 do_compile () {
-	# Yes, this is crazy. If you build on a system with git < 2.14 from scr=
atch, the tree will
-	# be marked as "dirty" and the version will include "-dirty", leading t=
o a reproducibility problem.
-	# The issue is the inode count for Licnses/README changing due to do_po=
pulate_lic hardlinking a
-	# copy of the file. We avoid this by ensuring the index is updated with=
 a "git diff" before the
-	# u-boot machinery tries to determine the version.
-	#
-	# build$ ../git/scripts/setlocalversion ../git
-	# ""
-	# build$ ln ../git/
-	# build$ ln ../git/README ../foo
-	# build$ ../git/scripts/setlocalversion ../git
-	# ""-dirty
-	# (i.e. creating a hardlink dirties the index)
-	cd ${S}; git diff; cd ${B}
-
 	oe_runmake -C ${S} tools-only_defconfig O=3D${B}
=20
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
--=20
2.44.0


