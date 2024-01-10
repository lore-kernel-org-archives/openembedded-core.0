Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3FBC47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:01:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5329.1704920515659318221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41122F4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:02:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C28313F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:01:54 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cairo: upgrade to 1.18.0
Date: Wed, 10 Jan 2024 21:01:53 +0000
Message-Id: <20240110210153.2072657-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193526

From: Ross Burton <ross.burton@arm.com>

The changelog is large[1] but:

Added:
- Type 3 colour and COLRv2 fonts
- Tee surfice automatically enabled
- Meson build system

Removed:
- The cairo-sphinx tool
- The XML, GL, GLES, Qt5, BeOS, OS/2, DirectFB, DRM, Cogl, and OpenVL
  backends
- Autotools build system

These CVE patches have been merged upstream:
  CVE-2018-19876.patch: https://gitlab.freedesktop.org/cairo/cairo/-/comm=
it/90e85c2493fdfa3551f202ff10282463f1e36645
  CVE-2019-6461.patch: https://gitlab.freedesktop.org/cairo/cairo/-/commi=
t/09643ee1abdd5daacebfcb564448f29be9a79bac
  CVE-2019-6462.patch: https://gitlab.freedesktop.org/cairo/cairo/-/commi=
t/bbeaf08190d3006a80b80a77724801cd477a37b8
  CVE-2020-35492.patch: https://gitlab.freedesktop.org/cairo/cairo/-/comm=
it/c986a7310bb06582b7d8a566d5f007ba4e5e75bf

Some niche options have been removed in the migration to Meson, so the
recipe can be cleaned up.

Put libcairo-fdr ("flight data recorder") in the perf-utils package
instead of deleting it.

There is an executable test for IPC behaviour that needs to be set via a
cross file if qemu-user isn't available, thanks to Alex Kanavin for this
portion.

[1] https://www.cairographics.org/news/cairo-1.18.0/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cairo/cairo/CVE-2018-19876.patch          | 34 ---------
 .../cairo/cairo/CVE-2019-6461.patch           | 20 -----
 .../cairo/cairo/CVE-2019-6462.patch           | 40 ----------
 .../cairo/cairo/CVE-2020-35492.patch          | 60 ---------------
 ...tmap_surface-bsc1036789-CVE-2017-7475.diff |  2 +-
 .../{cairo_1.16.0.bb =3D> cairo_1.18.0.bb}      | 73 +++++++------------
 6 files changed, 27 insertions(+), 202 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patc=
h
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patc=
h
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb =3D> cairo_1.18.0.bb=
} (51%)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/met=
a/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
deleted file mode 100644
index 4252a5663b9..00000000000
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
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta=
/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
deleted file mode 100644
index a2dba6cb20f..00000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-There is an assertion in function _cairo_arc_in_direction().
-
-CVE: CVE-2019-6461
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1bde774a4 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
-     if (cairo_status (cr))
-         return;
-=20
--    assert (angle_max >=3D angle_min);
-+    if (angle_max < angle_min)
-+       return;
-=20
-     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
- 	angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta=
/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
deleted file mode 100644
index 7c3209291be..00000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-CVE: CVE-2019-6462
-Upstream-Status: Backport
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
-
-From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <hlewin@gmx.de>
-Date: Sun, 1 Aug 2021 11:16:03 +0000
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite l=
oop
-
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tole=
rance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size =3D ARRAY_LENGTH (table);
-+    const int max_segments =3D 1000; /* this value is chosen arbitraril=
y. this gives an error of about 1.74909e-20 */
-=20
-     for (i =3D 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
-=20
-     ++i;
-+
-     do {
- 	angle =3D M_PI / i++;
- 	error =3D _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
-=20
-     return angle;
- }
---=20
-2.38.1
-
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/met=
a/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
deleted file mode 100644
index fb6ce5cfdf8..00000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Fix stack buffer overflow.
-
-CVE: CVE-2020-35492
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <heiko.lewin@worldiety.de>
-Date: Tue, 15 Dec 2020 16:48:19 +0100
-Subject: [PATCH] Fix mask usage in image-compositor
-
----
- src/cairo-image-compositor.c                |   8 ++--
- test/Makefile.sources                       |   1 +
- test/bug-image-compositor.c                 |  39 ++++++++++++++++++++
- test/reference/bug-image-compositor.ref.png | Bin 0 -> 185 bytes
- 4 files changed, 44 insertions(+), 4 deletions(-)
- create mode 100644 test/bug-image-compositor.c
- create mode 100644 test/reference/bug-image-compositor.ref.png
-
-diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
-index 79ad69f68..4f8aaed99 100644
---- a/src/cairo-image-compositor.c
-+++ b/src/cairo-image-compositor.c
-@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int=
 y, int h,
- 		    unsigned num_spans)
- {
-     cairo_image_span_renderer_t *r =3D abstract_renderer;
--    uint8_t *m;
-+    uint8_t *m, *base =3D (uint8_t*)pixman_image_get_data(r->mask);
-     int x0;
-=20
-     if (num_spans =3D=3D 0)
- 	return CAIRO_STATUS_SUCCESS;
-=20
-     x0 =3D spans[0].x;
--    m =3D r->_buf;
-+    m =3D base;
-     do {
- 	int len =3D spans[1].x - spans[0].x;
- 	if (len >=3D r->u.composite.run_length && spans[0].coverage =3D=3D 0xf=
f) {
-@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int y=
, int h,
- 				      spans[0].x, y,
- 				      spans[1].x - spans[0].x, h);
-=20
--	    m =3D r->_buf;
-+	    m =3D base;
- 	    x0 =3D spans[1].x;
- 	} else if (spans[0].coverage =3D=3D 0x0) {
- 	    if (spans[0].x !=3D x0) {
-@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int y=
, int h,
- #endif
- 	    }
-=20
--	    m =3D r->_buf;
-+	    m =3D base;
- 	    x0 =3D spans[1].x;
- 	} else {
- 	    *m++ =3D spans[0].coverage;
---=20
diff --git a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-b=
sc1036789-CVE-2017-7475.diff b/meta/recipes-graphics/cairo/cairo/cairo-ge=
t_bitmap_surface-bsc1036789-CVE-2017-7475.diff
index 7aaad2eedd9..6c761bf2a70 100644
--- a/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc10367=
89-CVE-2017-7475.diff
+++ b/meta/recipes-graphics/cairo/cairo/cairo-get_bitmap_surface-bsc10367=
89-CVE-2017-7475.diff
@@ -3,7 +3,7 @@ Cairo: Fix Denial-of-Service Attack due to Logical Proble=
m in Program
 https://bugs.freedesktop.org/show_bug.cgi?id=3D100763
=20
 CVE: CVE-2017-7475
-Upstream-Status: Submitted
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/cairo/cairo/-=
/issues/80]
=20
 Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
=20
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-g=
raphics/cairo/cairo_1.18.0.bb
similarity index 51%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.0.bb
index ffb813d2905..fe72537b776 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -7,7 +7,7 @@ optional translucence (opacity/alpha) and combined using =
the \
 extended Porter/Duff compositing algebra as found in the X Render \
 Extension."
 HOMEPAGE =3D "http://cairographics.org"
-BUGTRACKER =3D "http://bugs.freedesktop.org"
+BUGTRACKER =3D "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
 SECTION =3D "libs"
=20
 LICENSE =3D "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
@@ -26,62 +26,41 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c=
72b5ac9012424fa157ad77 \
                     ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file=
://util/cairo-trace/COPYING-GPL-3;md5=3Dd32239bcb673463ab874e80d47fae504'=
, '', d)}"
=20
=20
-DEPENDS =3D "fontconfig glib-2.0 libpng pixman zlib"
+DEPENDS =3D "fontconfig freetype glib-2.0 libpng pixman zlib"
=20
 SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff=
 \
-           file://CVE-2018-19876.patch \
-           file://CVE-2019-6461.patch \
-           file://CVE-2019-6462.patch \
-           file://CVE-2020-35492.patch \
           "
=20
-SRC_URI[md5sum] =3D "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] =3D "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16=
d44be45e66052331"
+SRC_URI[sha256sum] =3D "243a0736b978a33dee29f9cca7521733b78a65b5418206fe=
f7bd1c3d4cf10b64"
=20
-inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_sc=
ript
+inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
+
+# if qemu usermode isn't available, this value needs to be set staticall=
y
+# (otherwise it's determinted by running a small target executable with =
qemu)
+do_write_config:append:class-target() {
+    cat >${WORKDIR}/cairo.cross <<EOF
+[properties]
+ipc_rmid_deferred_release =3D 'true'
+EOF
+}
+EXTRA_OEMESON:append:class-target =3D "${@' --cross-file ${WORKDIR}/cair=
o.cross' if d.getVar('EXEWRAPPER_ENABLED') =3D=3D 'False' else ''}"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 MULTILIB_SCRIPTS =3D "${PN}-perf-utils:${bindir}/cairo-trace"
=20
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
-# trace is under GPLv3
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
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xli=
b xcb', '', d)} trace"
+PACKAGECONFIG[xlib] =3D "-Dxlib=3Denabled,-Dxlib=3Ddisabled,virtual/libx=
11 libxrender libxext"
+PACKAGECONFIG[xcb] =3D "-Dxcb=3Denabled,-Dxcb=3Ddisabled,libxcb"
+# cairo-trace is GPLv3 so add an option to remove it
+PACKAGECONFIG[trace] =3D ""
=20
 do_install:append () {
-	rm -rf ${D}${bindir}/cairo-sphinx
-	rm -rf ${D}${libdir}/cairo/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
-	[ ! -d ${D}${bindir} ] ||
-		rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
-	[ ! -d ${D}${libdir}/cairo ] ||
-		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'true', 'false',=
 d)}; then
+        rm ${D}${bindir}/cairo-trace ${D}${libdir}/cairo/libcairo-trace.=
so
+        rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${libdir}/cai=
ro
+    fi
 }
=20
 PACKAGES =3D+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
@@ -99,7 +78,7 @@ DESCRIPTION:cairo-perf-utils =3D "The Cairo library per=
formance utilities"
 FILES:${PN} =3D "${libdir}/libcairo.so.*"
 FILES:${PN}-gobject =3D "${libdir}/libcairo-gobject.so.*"
 FILES:${PN}-script-interpreter =3D "${libdir}/libcairo-script-interprete=
r.so.*"
-FILES:${PN}-perf-utils =3D "${bindir}/cairo-trace* ${libdir}/cairo/*.la =
${libdir}/cairo/libcairo-trace.so"
+FILES:${PN}-perf-utils =3D "${bindir}/cairo-* ${libdir}/cairo/libcairo-t=
race.so ${libdir}/cairo/libcairo-fdr.so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


