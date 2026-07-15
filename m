Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBD5C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6667.1784124318455555341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dLVphb6E;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB3B1477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 940643F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124317; bh=aVsCpO8nnzQyt90qZoscyr/Vdn4KHMVvYJQM8atFALs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dLVphb6EQOBfvcIw6QHsbEbowbXjA4vA32lkxyQGzeOLNoBZhx4rZs5j4S2oPRhUy
	 2fUt8xiUJ5DKXwtPdx85l4vihSUVPjrGMLENM0sRLtLB+ee03l4mBQt1GZts/VVbBP
	 6CQQe7T3+YoATxwZQD1DSKFEDSzGjCGFd3blt3Bk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] xdpyinfo: build with meson
Date: Wed, 15 Jul 2026 15:05:02 +0100
Message-ID: <20260715140507.2329605-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240966

We can drop disable-xkb.patch as meson.build checks for the existance of
XKBlib.h.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-app/xdpyinfo/disable-xkb.patch       | 22 -------------------
 .../xorg-app/xdpyinfo_1.4.0.bb                |  4 +---
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.p=
atch

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch b/=
meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
deleted file mode 100644
index 1e8199cc668..00000000000
--- a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Index: xdpyinfo-1.3.0/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xdpyinfo-1.3.0.orig/configure.ac	2011-10-21 21:34:21.000000000 -0700
-+++ xdpyinfo-1.3.0/configure.ac	2011-11-28 20:06:56.554056935 -0800
-@@ -47,11 +47,15 @@
- 	AC_CHECK_HEADERS([X11/extensions/multibuf.h X11/extensions/XShm.h],,,[=
#include <X11/Xlib.h>])
- 	CPPFLAGS=3D"$SAVE_CPPFLAGS"],[echo "not found"])
-=20
-+AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support=
]),
-+	XKB=3D"$enableval", XKB=3D"yes")
-+if test "x$XKB" =3D "xyes" ; then
- PKG_CHECK_MODULES(DPY_XKB, x11,
- 	[SAVE_CPPFLAGS=3D"$CPPFLAGS"
- 	CPPFLAGS=3D"$CPPFLAGS $DPY_XKB_CFLAGS $DPY_X11_CFLAGS"
- 	AC_CHECK_HEADERS([X11/extensions/XKB.h X11/XKBlib.h],,,[#include <X11/=
Xlib.h>])
- 	CPPFLAGS=3D"$SAVE_CPPFLAGS"],[echo "not found"])
-+fi
-=20
- PKG_CHECK_MODULES(DPY_XF86VIDMODE, xxf86vm,
- 	[SAVE_CPPFLAGS=3D"$CPPFLAGS"
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb b/meta/reci=
pes-graphics/xorg-app/xdpyinfo_1.4.0.bb
index 804b284352d..6c6b31203ac 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
@@ -12,9 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df3d09e6b9e20=
3a1af489e16c708f4fb3"
 DEPENDS +=3D "libxtst libxext libxxf86vm libxi libxrender libxinerama li=
bxau libxcomposite"
 PE =3D "1"
=20
-SRC_URI +=3D "file://disable-xkb.patch"
-
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "dc1de6e6e091ed46c4837b0ae9811e8182f7be0d2af638ca=
b3e530ff081a48b6"
=20
-EXTRA_OECONF =3D "--disable-xkb"
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


