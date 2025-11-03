Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E753DCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:46:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18618.1762170372041197401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 791C21D13
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 03:46:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E49923F66E
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 03:46:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] xserver-xorg: remove redundant patch
Date: Mon,  3 Nov 2025 11:45:08 +0000
Message-ID: <20251103114511.1271396-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225649

The underlying issue with -fno-common was resolved upstream in xserver
21.1.0 onwards[1].

[1] xserver 0148a15da ("compiler.h: don't define inb/outb and friends on =
mips")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-duplicate-definitions-of-IOPortBase.patch | 28 -------------------
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  4 +--
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
Avoid-duplicate-definitions-of-IOPortBase.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-d=
uplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xse=
rver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
deleted file mode 100644
index e9cbc9b4daa..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicat=
e-definitions-of-IOPortBase.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Aug 2020 10:50:51 -0700
-Subject: [PATCH] Avoid duplicate definitions of IOPortBase
-
-This fixed build with gcc10/-fno-common
-
-Fixes
-compiler.h:528: multiple definition of `IOPortBase';
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hw/xfree86/os-support/linux/lnx_video.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-sup=
port/linux/lnx_video.c
-index fd83022..1d0d96e 100644
---- a/hw/xfree86/os-support/linux/lnx_video.c
-+++ b/hw/xfree86/os-support/linux/lnx_video.c
-@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
- /**********************************************************************=
*****/
- /* I/O Permissions section                                             =
    */
- /**********************************************************************=
*****/
-+_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area =
*/
-=20
- #if defined(__powerpc__)
- volatile unsigned char *ioBase =3D NULL;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 3c8cb0173f4..f42f99d6c60 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -1,8 +1,6 @@
 require xserver-xorg.inc
=20
-SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           "
+SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch"
 SRC_URI[sha256sum] =3D "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f=
2994deff90116352"
=20
 # These extensions are now integrated into the server, so declare the mi=
gration
--=20
2.43.0


