Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709F3C44515
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6670.1784124322007163739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=kKpVG7mP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 479C9152B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20D323F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124321; bh=02/C950YM1g4q15492zBlkp0Q8QdB5ag3VlG3oOygUw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kKpVG7mPXdwybxA3BqvVJcozzF0m3U/d1qxVyXpKyGktkDTwlCN06UHHrbagSIzWV
	 3uNpk7fJCzVcXUYHxGrYflo6l2eGKYuqtsjfOT0bSFKhfEIdNXUKMSnqAsGKnl8Vyx
	 yNnW0ujHCLbMm/ipOnMRxHL7OiWMjZzknMNiqFJE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/12] xset: build with meson
Date: Wed, 15 Jul 2026 15:05:07 +0100
Message-ID: <20260715140507.2329605-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240971

We can drop disable-xkb.patch as meson.build checks for the existance of
XKBlib.h.

Don't explicitly disable xkb and fontcache, these are automatically
detected with meson.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-app/xset/disable-xkb.patch           | 32 -------------------
 meta/recipes-graphics/xorg-app/xset_1.2.6.bb  |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xset/disable-xkb.patch

diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta=
/recipes-graphics/xorg-app/xset/disable-xkb.patch
deleted file mode 100644
index e099623688c..00000000000
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a9a90a95047a0a08bb0fd0823961ed9707f451d4 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard@openedhand.com>
-Date: Mon, 22 May 2006 22:15:57 +0000
-Subject: [PATCH] add "-disable-xkb" option
-
-Upstream-Status: Pending
-
-Rebase for 1.2.1 by: Yu Ke <ke.yu@intel.com>
----
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e578bfe..1847258 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,11 +52,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
- 	AC_CHECK_HEADERS([X11/extensions/dpms.h X11/extensions/MITMisc.h],,,[#=
include <X11/Xlib.h>])
- 	CPPFLAGS=3D"$SAVE_CPPFLAGS"],[echo "not found"])
-=20
-+AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support=
]),
-+		XKB=3D"$enableval", XKB=3D"yes")
-+if test "x$XKB" =3D "xyes" ; then
- PKG_CHECK_MODULES(SET_XKB, x11,
- 	[SAVE_CPPFLAGS=3D"$CPPFLAGS"
- 	CPPFLAGS=3D"$CPPFLAGS $SET_XKB_CFLAGS $SET_X11_CFLAGS"
- 	AC_CHECK_HEADERS([X11/XKBlib.h],,,[#include <X11/Xlib.h>])
- 	CPPFLAGS=3D"$SAVE_CPPFLAGS"],[echo "not found"])
-+fi
-=20
- AC_ARG_WITH(xf86misc, AS_HELP_STRING([--with-xf86misc],[Enable xf86misc=
 support.]),
-                 [USE_XF86MISC=3D"$withval"], [USE_XF86MISC=3D"no"])
diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.6.bb b/meta/recipes-=
graphics/xorg-app/xset_1.2.6.bb
index 300aec9ebc8..7bd863f2d76 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.6.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D373a2cff5a=
5e58e7ccff069e0ce9fe74"
 DEPENDS +=3D "libxext libxmu libxau"
 PE =3D "1"
=20
-SRC_URI +=3D "file://disable-xkb.patch"
-
 SRC_URI_EXT =3D "xz"
=20
 SRC_URI[sha256sum] =3D "623837349ea887bc003f01ee2e4b6b8ddd9c2774f632c6d7=
0eead1b56306b695"
=20
+XORGBUILDCLASS =3D "meson"
+
 CFLAGS +=3D "-D_GNU_SOURCE"
-EXTRA_OECONF =3D "--disable-xkb --without-fontcache"
--=20
2.43.0


