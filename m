Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3227DEB1068
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 15:02:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42129.1773154918419099519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 08:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFBD7169C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 08:01:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 868FC3F7BD
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 08:01:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gstreamer1.0-vaapi: remove recipe
Date: Tue, 10 Mar 2026 15:01:55 +0000
Message-ID: <20260310150155.1692111-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 15:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232794

From: Wang Mingyu <wangmy@fujitsu.com>

gstreamer-vappi has been removed in favour of the va plugin and is no lon=
ger
updated going forward.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../gstreamer/gstreamer1.0-vaapi_1.26.9.bb    | 53 -------------------
 2 files changed, 54 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_=
1.26.9.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3c7fc4974de..c7a646a643e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -261,7 +261,6 @@ RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-good =3D "U=
nassigned <unassigned@yoctopr
 RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-ugly =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-python =3D "Unassigned <unassigned@yoc=
toproject.org>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server =3D "Unassigned <unassigne=
d@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-gtk+3 =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gtk-doc =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-online.de>"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
deleted file mode 100644
index dc5055bb0c7..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY =3D "VA-API support to GStreamer"
-HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
-DESCRIPTION =3D "gstreamer-vaapi consists of a collection of VA-API \
-based plugins for GStreamer and helper libraries: `vaapidecode', \
-`vaapiconvert', and `vaapisink'."
-
-REALPN =3D "gstreamer-vaapi"
-
-LICENSE =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
-
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-$=
{PV}.tar.xz"
-
-SRC_URI[sha256sum] =3D "bf989040404515dc9b042f4fdc49ff33a6dccf49d5447361=
50e967b42665598e"
-
-S =3D "${UNPACKDIR}/${REALPN}-${PV}"
-DEPENDS =3D "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-p=
lugins-bad"
-
-inherit meson pkgconfig features_check upstream-version-is-even
-
-REQUIRED_DISTRO_FEATURES ?=3D "opengl"
-
-EXTRA_OEMESON +=3D " \
-    -Ddoc=3Ddisabled \
-    -Dexamples=3Ddisabled \
-    -Dtests=3Denabled \
-"
-
-PACKAGES =3D+ "${PN}-tests"
-
-# OpenGL packageconfig factored out to make it easy for distros
-# and BSP layers to pick either glx, egl, or no GL. By default,
-# try detecting X11 first, and if found (with OpenGL), use GLX,
-# otherwise try to check if EGL can be used.
-PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11 open=
gl', 'glx', \
-                        bb.utils.contains('DISTRO_FEATURES',     'opengl=
', 'egl', \
-                                                                       '=
', d), d)}"
-
-PACKAGECONFIG ??=3D "drm encoders \
-                   ${PACKAGECONFIG_GL} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', =
d)}"
-
-PACKAGECONFIG[drm] =3D "-Ddrm=3Denabled,-Ddrm=3Ddisabled,udev libdrm"
-PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
-PACKAGECONFIG[encoders] =3D "-Dencoders=3Denabled,-Dencoders=3Ddisabled"
-PACKAGECONFIG[glx] =3D "-Dglx=3Denabled,-Dglx=3Ddisabled,virtual/libgl"
-PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,way=
land-native wayland wayland-protocols"
-PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
libxrandr libxrender"
-
-FILES:${PN} +=3D "${libdir}/gstreamer-*/*.so"
-FILES:${PN}-dbg +=3D "${libdir}/gstreamer-*/.debug"
-FILES:${PN}-dev +=3D "${libdir}/gstreamer-*/*.a"
-FILES:${PN}-tests =3D "${bindir}/*"
--=20
2.43.0


