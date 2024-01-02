Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FED0C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:50:49 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.34931.1704217839789972676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 09:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCLEN41f;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-555f581aed9so2395054a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704217838; x=1704822638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoEfDrmuttBl17GrsDce6fDAzKC6KcHpY8YbMFSNU0Q=;
        b=VCLEN41fkMAf9EPAxDZj99FZUsMHXeu8vvG26y0kzuuayza4rwsX5vWvuarRelNuTs
         +rIK+drrKEIcPpZvXZKRr20qr3SFLkq3f5knykxoj2afGqHwXQ52mX3ROt8+GZ3flDkM
         fZ7xKxHVQ45lcKqFE1CVU5iJ1dZgqA37WtweqMV5HdVrXvtqCwyZM+ERuiu1mKRGERFo
         EAFpGXcsz5UeTzBVBL0gpgDeuziP2s/FdGtJMj+p11aCZ2w6U8En4mtA2xrUxhEc85XA
         RVHuI0159jXM2nFL1m2HEEgVwz6ceYPgO7VKqHO3XmKM80EDagS9QU+MTbyMJVN/KS+x
         GsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704217838; x=1704822638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoEfDrmuttBl17GrsDce6fDAzKC6KcHpY8YbMFSNU0Q=;
        b=FpTQJD0L05kO6u26FuJ1suCTbf+T9kESHH1Kjl2r8ISO6VU5TaCL16GyYqKzXnVMc3
         Uy0l+9YFPP/1z2HUAI5P7l0mlvHhY8BnjURqtth6c3fvZ08gbSNwSyHMI/R8SKSJh7lF
         LQMVx6upsY4palbX30+AaqqAiquV95t3sESAb7ZgJCFY1B59B8da3feAsj4/XiX918xJ
         0g6qBbA5CVakd6+2sD8hME+dvsxTbM9zQPAwrcbmhoOAw4nsCo/6FkXtVEpBbiDSbta/
         2SccQ7ADHQFUA+XQlJ9k1aDtNsKRMoOK3n97XcsA4Ndgs99iUUZ5b4Af828qUQTdFra6
         saHA==
X-Gm-Message-State: AOJu0Yz+D9MvsF8moi5fESRi7LBRsoMLkv/Eeh80w6laZGj053bdRTXI
	OsixN014bt7yde7It8ttI5+WDzD67zs=
X-Google-Smtp-Source: AGHT+IF51FcxisTzgDpcjDfTkx7mpo9exxOjtR4EHdgCxu+ycVeknwHc2cOPsJWCMMnnrhAsSrbmhQ==
X-Received: by 2002:a50:9b03:0:b0:551:e9e0:2a58 with SMTP id o3-20020a509b03000000b00551e9e02a58mr10893395edi.68.1704217837968;
        Tue, 02 Jan 2024 09:50:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u8-20020aa7d548000000b00551cddfc5b8sm16164551edr.5.2024.01.02.09.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 09:50:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: qiutt <qiutt@fujitsu.com>
Subject: [PATCH v5 1/2] cairo: upgrade 1.16.0 -> 1.18.0
Date: Tue,  2 Jan 2024 18:50:25 +0100
Message-Id: <20240102175026.2903297-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 17:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193252

From: qiutt <qiutt@fujitsu.com>

Changelog for 1.18.0 [1]:
  The cairo-sphinx tool has been removed
  Cairo now implements Type 3 color fonts for PDF
  The XML surface has been removed
  The Tee surface is now automatically enabled
  The Quartz surface is improved
  Cairo now hides all private symbols by default on every platform
  Fixed multiple issues

As a part of 1.18.0, the following patches should be dropped.
  CVE-2018-19876.patch : https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645
  CVE-2019-6461.patch  : https://gitlab.freedesktop.org/cairo/cairo/-/commit/09643ee1abdd5daacebfcb564448f29be9a79bac
  CVE-2019-6462.patch  : https://gitlab.freedesktop.org/cairo/cairo/-/commit/bbeaf08190d3006a80b80a77724801cd477a37b8
  CVE-2020-35492.patch : https://gitlab.freedesktop.org/cairo/cairo/-/commit/c986a7310bb06582b7d8a566d5f007ba4e5e75bf

These options are all gone [2]: directfb, valgrind, egl, glesv2, opengl, trace

Build tool is changed : autotools -> meson

Fix cross compile error [3] by adding cairo.cross file.

 [1] https://www.cairographics.org/news/cairo-1.18.0/
 [2] https://gitlab.freedesktop.org/cairo/cairo/-/blob/master/meson_options.txt
 [3] https://gitlab.freedesktop.org/cairo/cairo/-/issues/613

Signed-off-by: qiutt <qiutt@fujitsu.com>
---
 .../cairo/cairo/CVE-2018-19876.patch          | 34 ---------
 .../cairo/cairo/CVE-2019-6461.patch           | 20 ------
 .../cairo/cairo/CVE-2019-6462.patch           | 40 -----------
 .../cairo/cairo/CVE-2020-35492.patch          | 60 ----------------
 .../{cairo_1.16.0.bb => cairo_1.18.0.bb}      | 72 +++++++------------
 5 files changed, 25 insertions(+), 201 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.18.0.bb} (51%)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
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
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >= 2.9
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
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
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
- 
--    assert (angle_max >= angle_min);
-+    if (angle_max < angle_min)
-+       return;
- 
-     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
- 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
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
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
-
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size = ARRAY_LENGTH (table);
-+    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
- 
-     for (i = 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
- 
-     ++i;
-+
-     do {
- 	angle = M_PI / i++;
- 	error = _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
- 
-     return angle;
- }
--- 
-2.38.1
-
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
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
-@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 		    unsigned num_spans)
- {
-     cairo_image_span_renderer_t *r = abstract_renderer;
--    uint8_t *m;
-+    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
-     int x0;
- 
-     if (num_spans == 0)
- 	return CAIRO_STATUS_SUCCESS;
- 
-     x0 = spans[0].x;
--    m = r->_buf;
-+    m = base;
-     do {
- 	int len = spans[1].x - spans[0].x;
- 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
-@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 				      spans[0].x, y,
- 				      spans[1].x - spans[0].x, h);
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else if (spans[0].coverage == 0x0) {
- 	    if (spans[0].x != x0) {
-@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- #endif
- 	    }
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else {
- 	    *m++ = spans[0].coverage;
--- 
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
similarity index 51%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.0.bb
index ffb813d2905..ffae13b48a6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -7,7 +7,7 @@ optional translucence (opacity/alpha) and combined using the \
 extended Porter/Duff compositing algebra as found in the X Render \
 Extension."
 HOMEPAGE = "http://cairographics.org"
-BUGTRACKER = "http://bugs.freedesktop.org"
+BUGTRACKER = "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
 SECTION = "libs"
 
 LICENSE = "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
@@ -26,62 +26,40 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
                     ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
 
 
-DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
+DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
-           file://CVE-2018-19876.patch \
-           file://CVE-2019-6461.patch \
-           file://CVE-2019-6462.patch \
-           file://CVE-2020-35492.patch \
           "
 
-SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
+SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"
 
-inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
+inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
+
+# Tell libsoup where the target ntlm_auth is installed
+do_write_config:append:class-target() {
+    cat >${WORKDIR}/cairo.cross <<EOF
+[binaries]
+ipc_rmid_deferred_release = 'true'
+EOF
+}
+EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/cairo.cross"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}-perf-utils:${bindir}/cairo-trace"
 
-X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
-                   trace"
-PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
-PACKAGECONFIG:class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
-
-PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
-PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
-PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
-PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
-PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
-PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
-PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-# trace is under GPLv3
-PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
-
-EXTRA_OECONF += " \
-    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
-    --enable-tee \
-"
-
-# We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr="no"
-# Ensure we don't depend on LZO
-export ac_cv_lib_lzo2_lzo2a_decompress="no"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xlib xcb', '', d)} trace"
+PACKAGECONFIG[xlib] = "-Dxlib=enabled,-Dxlib=disabled,virtual/libx11 libxrender libxext"
+PACKAGECONFIG[xcb] = "-Dxcb=enabled,-Dxcb=disabled,libxcb"
+# cairo-trace is GPLv3 so add an option to remove it
+PACKAGECONFIG[trace] = ""
 
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
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'true', 'false', d)}; then
+        rm ${D}${bindir}/cairo-trace ${D}${libdir}/cairo/libcairo-trace.so
+        rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${libdir}/cairo
+    fi
 }
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
@@ -99,7 +77,7 @@ DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
 FILES:${PN} = "${libdir}/libcairo.so.*"
 FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES:${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES:${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
+FILES:${PN}-perf-utils = "${bindir}/cairo-* ${libdir}/cairo/libcairo-trace.so ${libdir}/cairo/libcairo-fdr.so"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


