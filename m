Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89824C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 07:00:35 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.23377.1647241234651981478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 00:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 7A887D27C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:00:32 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.243]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nTegy-0PCAqH0; Mon, 14 Mar 2022 08:00:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] cairo: update to v1.17.4
Date: Mon, 14 Mar 2022 08:00:21 +0100
Message-Id: <20220314070021.3479548-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647241232-00012DCC-4AB8BC71/0/0 CLEAN NORMAL
X-TOI-MSGID: e2fdee97-300b-47f5-b494-2635359cb19a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 07:00:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163125

-remove CVE-2018-19876.patch that was applied upstream
-add backported patch to remove automagic from symbol_lookup
-switch build system to meson

https://www.cairographics.org/news/cairo-1.17.4/

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...patch-to-make-symbol-lookup-optional.patch | 58 +++++++++++
 .../cairo/cairo/CVE-2018-19876.patch          | 34 -------
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   | 99 -------------------
 meta/recipes-graphics/cairo/cairo_1.17.4.bb   | 88 +++++++++++++++++
 4 files changed, 146 insertions(+), 133 deletions(-)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-cairo-backport=
-patch-to-make-symbol-lookup-optional.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patc=
h
 delete mode 100644 meta/recipes-graphics/cairo/cairo_1.16.0.bb
 create mode 100644 meta/recipes-graphics/cairo/cairo_1.17.4.bb

diff --git a/meta/recipes-graphics/cairo/cairo/0001-cairo-backport-patch-=
to-make-symbol-lookup-optional.patch b/meta/recipes-graphics/cairo/cairo/=
0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch
new file mode 100644
index 0000000000..e118d2c84a
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0001-cairo-backport-patch-to-make=
-symbol-lookup-optional.patch
@@ -0,0 +1,58 @@
+From 623e718303202f92180fcfac47c38f1989c256b8 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 13 Mar 2022 19:16:29 +0100
+Subject: [PATCH] cairo: backport patch to make symbol-lookup optional
+
+Upstream-Status: Backport
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build       | 16 ++++++++--------
+ meson_options.txt |  4 ++++
+ 2 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index b159b4071..fbd9e670b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -657,14 +657,14 @@ if zlib_dep.found() and png_dep.found()
+   }]
+ endif
+=20
+-# Untested, libiberty.h is in a libiberty subfolder for me
+-# FIXME: automagic
+-bfd_dep =3D cc.find_library('bfd', required: false)
+-if bfd_dep.found() and cc.has_function('bfd_openr', dependencies: [bfd_=
dep])
+-  if cc.has_header('libiberty.h')
+-    conf.set('HAVE_BFD', 1)
+-    deps +=3D [bfd_dep]
+-  endif
++bfd_dep =3D cc.find_library('bfd', has_headers: ['bfd.h'], required: ge=
t_option('symbol-lookup'))
++if bfd_dep.found() and \
++   cc.has_function('bfd_openr', dependencies: [bfd_dep]) and \
++   cc.links(files('meson-cc-tests/bfd-section-flags.c'), name: 'bfd_sec=
tion_flags', dependencies: bfd_dep)
++  conf.set('HAVE_BFD', 1)
++  deps +=3D [bfd_dep]
++elif get_option('symbol-lookup').enabled()
++  error('symbol lookup via bfd was enabled via options but is not avail=
able (bfd might be too old)')
+ endif
+=20
+ # Untested, see above
+diff --git a/meson_options.txt b/meson_options.txt
+index ff11fe7ed..46e48b12e 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -23,6 +23,10 @@ option('zlib', type : 'feature', value : 'auto') # sc=
ript, ps, pdf, xml surfaces
+ # Tests
+ option('tests', type : 'feature', value : 'auto')
+=20
++#Symbol lookup
++option('symbol-lookup', type: 'feature', value : 'auto',
++       description: 'Symbol lookup in debug utils via binutils/bfd')
++
+ # Util deps
+ option('gtk2-utils', type : 'feature', value : 'disabled')
+=20
+--=20
+2.25.1
+
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/met=
a/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
deleted file mode 100644
index 4252a5663b..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-CVE: CVE-2018-19876
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available i=
n
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >=3D 2.9
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
-=20
---=20
-2.11.0
-
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-g=
raphics/cairo/cairo_1.16.0.bb
deleted file mode 100644
index 0b5d1d548f..0000000000
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ /dev/null
@@ -1,99 +0,0 @@
-SUMMARY =3D "The Cairo 2D vector graphics library"
-DESCRIPTION =3D "Cairo is a multi-platform library providing anti-aliase=
d \
-vector-based rendering for multiple target backends. Paths consist \
-of line segments and cubic splines and can be rendered at any width \
-with various join and cap styles. All colors may be specified with \
-optional translucence (opacity/alpha) and combined using the \
-extended Porter/Duff compositing algebra as found in the X Render \
-Extension."
-HOMEPAGE =3D "http://cairographics.org"
-BUGTRACKER =3D "http://bugs.freedesktop.org"
-SECTION =3D "libs"
-
-LICENSE =3D "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
-LICENSE:${PN} =3D "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-dev =3D "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-doc =3D "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-gobject =3D "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-script-interpreter =3D "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-perf-utils =3D "GPL-3.0-or-later"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72b5ac9012424fa157a=
d77"
-
-DEPENDS =3D "fontconfig glib-2.0 libpng pixman zlib"
-
-SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
-           file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff=
 \
-           file://CVE-2018-19876.patch \
-           file://CVE-2019-6461.patch \
-           file://CVE-2019-6462.patch \
-           file://CVE-2020-35492.patch \
-          "
-
-SRC_URI[md5sum] =3D "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] =3D "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16=
d44be45e66052331"
-
-inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_sc=
ript
-
-MULTILIB_SCRIPTS =3D "${PN}-perf-utils:${bindir}/cairo-trace"
-
-X11DEPENDS =3D "virtual/libx11 libsm libxrender libxext"
-
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d=
)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 x=
cb', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'opengl', '', d)} \
-                   trace"
-PACKAGECONFIG:class-native =3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'x11 xcb', '', d)}"
-PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES=
', 'x11', 'x11 xcb', '', d)}"
-
-PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno --disa=
ble-xlib,${X11DEPENDS}"
-PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
-PACKAGECONFIG[directfb] =3D "--enable-directfb=3Dyes,,directfb"
-PACKAGECONFIG[valgrind] =3D "--enable-valgrind=3Dyes,--disable-valgrind,=
valgrind"
-PACKAGECONFIG[egl] =3D "--enable-egl=3Dyes,--disable-egl,virtual/egl"
-PACKAGECONFIG[glesv2] =3D "--enable-glesv2,--disable-glesv2,virtual/libg=
les2"
-PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
-PACKAGECONFIG[trace] =3D "--enable-trace,--disable-trace"
-
-EXTRA_OECONF +=3D " \
-    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-=
point', '', d)} \
-    --enable-tee \
-"
-
-# We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr=3D"no"
-# Ensure we don't depend on LZO
-export ac_cv_lib_lzo2_lzo2a_decompress=3D"no"
-
-do_install:append () {
-	rm -rf ${D}${bindir}/cairo-sphinx
-	rm -rf ${D}${libdir}/cairo/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
-	[ ! -d ${D}${bindir} ] ||
-		rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
-	[ ! -d ${D}${libdir}/cairo ] ||
-		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
-}
-
-PACKAGES =3D+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
-
-SUMMARY:cairo-gobject =3D "The Cairo library GObject wrapper library"
-DESCRIPTION:cairo-gobject =3D "A GObject wrapper library for the Cairo A=
PI."
-
-SUMMARY:cairo-script-interpreter =3D "The Cairo library script interpret=
er"
-DESCRIPTION:cairo-script-interpreter =3D "The Cairo script interpreter i=
mplements \
-CairoScript.  CairoScript is used by tracing utilities to enable the abi=
lity \
-to replay rendering."
-
-DESCRIPTION:cairo-perf-utils =3D "The Cairo library performance utilitie=
s"
-
-FILES:${PN} =3D "${libdir}/libcairo.so.*"
-FILES:${PN}-gobject =3D "${libdir}/libcairo-gobject.so.*"
-FILES:${PN}-script-interpreter =3D "${libdir}/libcairo-script-interprete=
r.so.*"
-FILES:${PN}-perf-utils =3D "${bindir}/cairo-trace* ${libdir}/cairo/*.la =
${libdir}/cairo/libcairo-trace.so"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-UPSTREAM_CHECK_REGEX =3D "cairo-(?P<pver>\d+(\.\d+)+).tar.xz"
diff --git a/meta/recipes-graphics/cairo/cairo_1.17.4.bb b/meta/recipes-g=
raphics/cairo/cairo_1.17.4.bb
new file mode 100644
index 0000000000..6330b60ed8
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
@@ -0,0 +1,88 @@
+SUMMARY =3D "The Cairo 2D vector graphics library"
+DESCRIPTION =3D "Cairo is a multi-platform library providing anti-aliase=
d \
+vector-based rendering for multiple target backends. Paths consist \
+of line segments and cubic splines and can be rendered at any width \
+with various join and cap styles. All colors may be specified with \
+optional translucence (opacity/alpha) and combined using the \
+extended Porter/Duff compositing algebra as found in the X Render \
+Extension."
+HOMEPAGE =3D "http://cairographics.org"
+BUGTRACKER =3D "http://bugs.freedesktop.org"
+SECTION =3D "libs"
+
+LICENSE =3D "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
+LICENSE:${PN} =3D "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-dev =3D "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-doc =3D "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-gobject =3D "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-script-interpreter =3D "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-perf-utils =3D "GPL-3.0-or-later"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72b5ac9012424fa157a=
d77"
+
+DEPENDS =3D "glib-2.0 pixman"
+
+SRC_URI =3D " \
+	https://cairographics.org/snapshots/cairo-1.17.4.tar.xz \
+	file://0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch \
+	file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
+	file://CVE-2019-6461.patch \
+	file://CVE-2019-6462.patch \
+	file://CVE-2020-35492.patch \
+"
+
+SRC_URI[sha256sum] =3D "74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237=
a6fa787401959705"
+
+inherit meson pkgconfig upstream-version-is-even multilib_script
+
+PACKAGECONFIG ??=3D " \
+	fontconfig \
+	freetype \
+	png \
+	zlib \
+	lzo \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'glesv3', '', d)} \
+"
+
+PACKAGECONFIG[x11] =3D "-Dgl-backend=3Dgl -Dxcb=3Denabled -Dxlib=3Denabl=
ed,-Dxcb=3Ddisabled -Dxlib=3Ddisabled,virtual/libx11 virtual/libgl libsm =
libxrender libxext libxcb"
+PACKAGECONFIG[fontconfig] =3D ",,fontconfig"
+PACKAGECONFIG[freetype] =3D ",,freetype"
+PACKAGECONFIG[glesv2] =3D "-Dgl-backend=3Dglesv2 -Dglesv2=3Denabled"
+PACKAGECONFIG[glesv3] =3D "-Dgl-backend=3Dglesv3 -Dglesv3=3Denabled"
+PACKAGECONFIG[png] =3D ",,libpng"
+PACKAGECONFIG[xml] =3D ",,libxml2"
+PACKAGECONFIG[zlib] =3D ",,zlib"
+PACKAGECONFIG[lzo] =3D ",,lzo"
+PACKAGECONFIG[tee] =3D "-Dtee=3Denabled,-Dtee=3Ddisabled"
+
+EXTRA_OEMESON =3D "-Dtests=3Ddisabled -Dsymbol-lookup=3Ddisabled"
+
+do_install:append () {
+	rm -rf ${D}${bindir}/cairo-sphinx
+	rm -rf ${D}${libdir}/cairo/libcairo-fdr*
+	rm -rf ${D}${libdir}/cairo/libcairo-sphinx*
+	rm -rf ${D}${libdir}/cairo/.debug/libcairo-fdr*
+	rm -rf ${D}${libdir}/cairo/.debug/libcairo-sphinx*
+}
+
+PACKAGES =3D+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
+
+SUMMARY:cairo-gobject =3D "The Cairo library GObject wrapper library"
+DESCRIPTION:cairo-gobject =3D "A GObject wrapper library for the Cairo A=
PI."
+
+SUMMARY:cairo-script-interpreter =3D "The Cairo library script interpret=
er"
+DESCRIPTION:cairo-script-interpreter =3D "The Cairo script interpreter i=
mplements \
+CairoScript.  CairoScript is used by tracing utilities to enable the abi=
lity \
+to replay rendering."
+
+DESCRIPTION:cairo-perf-utils =3D "The Cairo library performance utilitie=
s"
+
+FILES:${PN} =3D "${libdir}/libcairo.so.*"
+FILES:${PN}-gobject =3D "${libdir}/libcairo-gobject.so.*"
+FILES:${PN}-script-interpreter =3D "${libdir}/libcairo-script-interprete=
r.so.*"
+FILES:${PN}-perf-utils =3D "${bindir}/cairo-trace* ${libdir}/cairo/*.la =
${libdir}/cairo/libcairo-trace.so"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+UPSTREAM_CHECK_REGEX =3D "cairo-(?P<pver>\d+(\.\d+)+).tar.xz"
--=20
2.25.1


