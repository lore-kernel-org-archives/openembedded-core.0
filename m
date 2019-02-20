Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 953BE7CA8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:50:50 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u21so17669996lfu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 05:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FIiMnP2Tr+6yexE6f92C0hnQg5O8x1uwuFw2SB3NVaw=;
	b=FvYR8msQJjNS40R/eXwkLkRSRADhDpmEI2dF87XYmUmNkEd+rDzK+eVdcPMRuHVF7C
	Wozsy1dZew1+T3twwRK6Fhqo1NmzYC2qa51w8s1RGZTHNJq9fJ7s5I/vVbBHcHohBt5q
	qm2tIfvT2UZX1EtlTw1zpHoSPvu4bQHxPGC8tiVQcx62RUe/tsZttTL6vHUWLVdBkUVM
	+tY0bDSEf/P57mQnJW0KM+AbNe8GwfXmmsInhDSjOrxF5poy+4zVSt8oXHprpoXZCFBf
	uPcm7VJ120LcwmgKFFuw//pQvCRkfmVnSXLpTM3xdLHv9CUg318YhtLr7mJ5D2OugJTN
	NA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FIiMnP2Tr+6yexE6f92C0hnQg5O8x1uwuFw2SB3NVaw=;
	b=BkctYE6HbPYNuuMpFODkrTUB1JBPX1bPXnC1DEbRyt8rpAAdQIjuOQNdQundOR8TGc
	fuwB+tp3GCDVA12dwv03McIKr6IiAqIXI3al0O+MUHjyM8ANRXxIEo3uj3bD5D3+1Kl3
	RttC6ahQpwrJGgfBpDrgOU4kbwUmr+lsRxNzgOD/FSgTmjK5nXCwQt3JD4/ptdiA1ueT
	vKoJNUPbQMxvaWYbgQVqn61hLgwBGp2rnrIp0UmIpMjb8iSbo+MmkTLkpHV/b/+DkExy
	g8L8N9iCN3pOJROQGgANJ0KVyqp3TXK69OcWwAd2LsRrOLpUw+pwWen4zDG6gmQjpRjU
	x3EA==
X-Gm-Message-State: AHQUAub2UMsdf1omr2XQVZYIowIRq76FdavleJWF8WbJsp4pMZREvc9S
	0SsM2FBpz5483wSCAx/ETw+fASBm
X-Google-Smtp-Source: AHgI3IZXNp2JbH/0i/1b6IGlSOQ1H8GIeWDJ6f1AmnMd1b13tVi7j+NEHmY1ax29mjCtzKdkQll4Lw==
X-Received: by 2002:a19:f508:: with SMTP id j8mr20396358lfb.87.1550670650687; 
	Wed, 20 Feb 2019 05:50:50 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	85-v6sm5533870lja.16.2019.02.20.05.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 05:50:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 14:50:40 +0100
Message-Id: <20190220135043.25837-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] pango: convert from autotools to meson
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 13:50:50 -0000

libxft is a hard dependency now, accordingly drop the patch that
was made for it being optional.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...on-of-docs-pango.types-it-is-build-c.patch | 147 ------------------
 meta/recipes-graphics/pango/pango_1.42.4.bb   |  32 ++--
 2 files changed, 21 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch b/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
deleted file mode 100644
index 6784a105a55..00000000000
--- a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 526a6a9fc9a1cfe75c521c8bb39b61754fe42fe8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 2 Sep 2016 14:00:24 +0300
-Subject: [PATCH] Enforce recreation of docs/pango.types; it is build
- configuration-specific.
-
-In particular, it needs to exclude references to PangoXft if Xft is not available.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- docs/Makefile.am | 17 ++++--------
- docs/pango.types | 80 --------------------------------------------------------
- 2 files changed, 5 insertions(+), 92 deletions(-)
- delete mode 100644 docs/pango.types
-
-diff --git a/docs/Makefile.am b/docs/Makefile.am
-index f5f1317..8947a99 100644
---- a/docs/Makefile.am
-+++ b/docs/Makefile.am
-@@ -49,6 +49,10 @@ IGNORE_HFILES=			\
- 	pangocoretext-private.h		\
- 	pangoatsui-private.h
- 
-+if !HAVE_XFT
-+IGNORE_HFILES += pangoxft pangoxft-render.h
-+endif
-+
- # CFLAGS and LDFLAGS for compiling scan program. Only needed
- # if $(DOC_MODULE).types is non-empty.
- INCLUDES =               	\
-@@ -103,16 +107,6 @@ include $(top_srcdir)/gtk-doc.make
- # This line really belongs in gtk-doc.mk
- $(REPORT_FILES): sgml-build.stamp
- 
--pango.types:
--	@echo "Rebuilding $@"
--	@LANG=C; LIST=$$(grep 'pango_[_a-zA-Z0-9]*_get_type' $(HFILE_GLOB) | grep -v '\(private\|atsui\|core_text\|win32\)' | sed 's/\([^:]*:\).*\(pango[_a-zA-Z0-9]*_get_type\).*/\1\2/') && \
--	echo "$$LIST" | sed 's/.*\/\(pango\/.*\):.*/#include <\1>/' | sort -u > $@.tmp && \
--	echo >> $@.tmp && \
--	echo "$$LIST" | cut -d : -f 2 | sort -u >> $@.tmp && \
--	mv $@.tmp $@
--
--BUILT_SOURCES = pango.types
--
- ########################################################################
- 
- MAINTAINERCLEANFILES = $(BUILT_SOURCES)
-@@ -120,8 +114,7 @@ EXTRA_DIST +=				\
- 	layout.fig			\
- 	layout.eps			\
- 	version.xml.in			\
--	check.docs			\
--	pango.types
-+	check.docs
- 
- # force doc rebulid after configure
- dist-hook-local: dist-local-check-no-cross-references all-local
-diff --git a/docs/pango.types b/docs/pango.types
-deleted file mode 100644
-index 7d93cda..0000000
---- a/docs/pango.types
-+++ /dev/null
-@@ -1,80 +0,0 @@
--#include <pango/pango-attributes.h>
--#include <pango/pango-context.h>
--#include <pango/pango-engine.h>
--#include <pango/pango-enum-types.h>
--#include <pango/pango-font.h>
--#include <pango/pango-fontmap.h>
--#include <pango/pango-fontset.h>
--#include <pango/pango-glyph-item.h>
--#include <pango/pango-glyph.h>
--#include <pango/pango-item.h>
--#include <pango/pango-language.h>
--#include <pango/pango-layout.h>
--#include <pango/pango-matrix.h>
--#include <pango/pango-ot.h>
--#include <pango/pango-renderer.h>
--#include <pango/pango-tabs.h>
--#include <pango/pangocairo-fc.h>
--#include <pango/pangocairo.h>
--#include <pango/pangofc-decoder.h>
--#include <pango/pangofc-font.h>
--#include <pango/pangofc-fontmap.h>
--#include <pango/pangoft2.h>
--#include <pango/pangoxft-render.h>
--#include <pango/pangoxft.h>
--
--pango_alignment_get_type
--pango_attr_list_get_type
--pango_attr_type_get_type
--pango_bidi_type_get_type
--pango_cairo_fc_font_map_get_type
--pango_cairo_font_get_type
--pango_cairo_font_map_get_type
--pango_color_get_type
--pango_context_get_type
--pango_coverage_level_get_type
--pango_direction_get_type
--pango_ellipsize_mode_get_type
--pango_engine_get_type
--pango_engine_lang_get_type
--pango_engine_shape_get_type
--pango_fc_decoder_get_type
--pango_fc_font_get_type
--pango_fc_font_map_get_type
--pango_font_description_get_type
--pango_font_face_get_type
--pango_font_family_get_type
--pango_font_get_type
--pango_font_map_get_type
--pango_font_mask_get_type
--pango_font_metrics_get_type
--pango_fontset_get_type
--pango_fontset_simple_get_type
--pango_ft2_font_map_get_type
--pango_glyph_item_get_type
--pango_glyph_item_iter_get_type
--pango_glyph_string_get_type
--pango_gravity_get_type
--pango_gravity_hint_get_type
--pango_item_get_type
--pango_language_get_type
--pango_layout_get_type
--pango_layout_iter_get_type
--pango_layout_line_get_type
--pango_matrix_get_type
--pango_ot_info_get_type
--pango_ot_ruleset_get_type
--pango_render_part_get_type
--pango_renderer_get_type
--pango_script_get_type
--pango_stretch_get_type
--pango_style_get_type
--pango_tab_align_get_type
--pango_tab_array_get_type
--pango_underline_get_type
--pango_variant_get_type
--pango_weight_get_type
--pango_wrap_mode_get_type
--pango_xft_font_get_type
--pango_xft_font_map_get_type
--pango_xft_renderer_get_type
--- 
-2.9.3
-
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index a09f7a8e701..1da3f92924e 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -11,29 +11,34 @@ LICENSE = "LGPLv2.0+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
 
-DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
+DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi libxft"
+
+GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
+GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
+
+GI_ENABLE_FLAG = "-Dgir=true"
+GI_DISABLE_FLAG = "-Dgir=false"
+
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
 
-# This binary needs to be compiled for the host architecture.  This isn't pretty!
-do_compile_prepend_class-target () {
-	if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
-		make CC="${BUILD_CC}" CFLAGS="" LDFLAGS="${BUILD_LDFLAGS}" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
-	fi
-}
-
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
@@ -43,3 +48,8 @@ RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append_class-nativesdk () {
+    rm -rf ${D}${libexecdir}/installed-tests ${D}${datadir}/installed-tests
+    rmdir ${D}${libexecdir} ${D}${datadir}
+}
-- 
2.17.1


