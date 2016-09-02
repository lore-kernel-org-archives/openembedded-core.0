Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D6439736B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 12:08:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2016 05:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,270,1470726000"; 
   d="scan'208";a="3965489"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2016 05:08:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2016 15:06:43 +0300
Message-Id: <20160902120645.5271-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/3] pango: fix gtk-doc build when x11 is not in use
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
X-List-Received-Date: Fri, 02 Sep 2016 12:08:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...reation-of-docs-pango.types-it-is-build-c.patch | 147 +++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.40.1.bb        |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch b/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
new file mode 100644
index 0000000..6784a10
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
@@ -0,0 +1,147 @@
+From 526a6a9fc9a1cfe75c521c8bb39b61754fe42fe8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 2 Sep 2016 14:00:24 +0300
+Subject: [PATCH] Enforce recreation of docs/pango.types; it is build
+ configuration-specific.
+
+In particular, it needs to exclude references to PangoXft if Xft is not available.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ docs/Makefile.am | 17 ++++--------
+ docs/pango.types | 80 --------------------------------------------------------
+ 2 files changed, 5 insertions(+), 92 deletions(-)
+ delete mode 100644 docs/pango.types
+
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index f5f1317..8947a99 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -49,6 +49,10 @@ IGNORE_HFILES=			\
+ 	pangocoretext-private.h		\
+ 	pangoatsui-private.h
+ 
++if !HAVE_XFT
++IGNORE_HFILES += pangoxft pangoxft-render.h
++endif
++
+ # CFLAGS and LDFLAGS for compiling scan program. Only needed
+ # if $(DOC_MODULE).types is non-empty.
+ INCLUDES =               	\
+@@ -103,16 +107,6 @@ include $(top_srcdir)/gtk-doc.make
+ # This line really belongs in gtk-doc.mk
+ $(REPORT_FILES): sgml-build.stamp
+ 
+-pango.types:
+-	@echo "Rebuilding $@"
+-	@LANG=C; LIST=$$(grep 'pango_[_a-zA-Z0-9]*_get_type' $(HFILE_GLOB) | grep -v '\(private\|atsui\|core_text\|win32\)' | sed 's/\([^:]*:\).*\(pango[_a-zA-Z0-9]*_get_type\).*/\1\2/') && \
+-	echo "$$LIST" | sed 's/.*\/\(pango\/.*\):.*/#include <\1>/' | sort -u > $@.tmp && \
+-	echo >> $@.tmp && \
+-	echo "$$LIST" | cut -d : -f 2 | sort -u >> $@.tmp && \
+-	mv $@.tmp $@
+-
+-BUILT_SOURCES = pango.types
+-
+ ########################################################################
+ 
+ MAINTAINERCLEANFILES = $(BUILT_SOURCES)
+@@ -120,8 +114,7 @@ EXTRA_DIST +=				\
+ 	layout.fig			\
+ 	layout.eps			\
+ 	version.xml.in			\
+-	check.docs			\
+-	pango.types
++	check.docs
+ 
+ # force doc rebulid after configure
+ dist-hook-local: dist-local-check-no-cross-references all-local
+diff --git a/docs/pango.types b/docs/pango.types
+deleted file mode 100644
+index 7d93cda..0000000
+--- a/docs/pango.types
++++ /dev/null
+@@ -1,80 +0,0 @@
+-#include <pango/pango-attributes.h>
+-#include <pango/pango-context.h>
+-#include <pango/pango-engine.h>
+-#include <pango/pango-enum-types.h>
+-#include <pango/pango-font.h>
+-#include <pango/pango-fontmap.h>
+-#include <pango/pango-fontset.h>
+-#include <pango/pango-glyph-item.h>
+-#include <pango/pango-glyph.h>
+-#include <pango/pango-item.h>
+-#include <pango/pango-language.h>
+-#include <pango/pango-layout.h>
+-#include <pango/pango-matrix.h>
+-#include <pango/pango-ot.h>
+-#include <pango/pango-renderer.h>
+-#include <pango/pango-tabs.h>
+-#include <pango/pangocairo-fc.h>
+-#include <pango/pangocairo.h>
+-#include <pango/pangofc-decoder.h>
+-#include <pango/pangofc-font.h>
+-#include <pango/pangofc-fontmap.h>
+-#include <pango/pangoft2.h>
+-#include <pango/pangoxft-render.h>
+-#include <pango/pangoxft.h>
+-
+-pango_alignment_get_type
+-pango_attr_list_get_type
+-pango_attr_type_get_type
+-pango_bidi_type_get_type
+-pango_cairo_fc_font_map_get_type
+-pango_cairo_font_get_type
+-pango_cairo_font_map_get_type
+-pango_color_get_type
+-pango_context_get_type
+-pango_coverage_level_get_type
+-pango_direction_get_type
+-pango_ellipsize_mode_get_type
+-pango_engine_get_type
+-pango_engine_lang_get_type
+-pango_engine_shape_get_type
+-pango_fc_decoder_get_type
+-pango_fc_font_get_type
+-pango_fc_font_map_get_type
+-pango_font_description_get_type
+-pango_font_face_get_type
+-pango_font_family_get_type
+-pango_font_get_type
+-pango_font_map_get_type
+-pango_font_mask_get_type
+-pango_font_metrics_get_type
+-pango_fontset_get_type
+-pango_fontset_simple_get_type
+-pango_ft2_font_map_get_type
+-pango_glyph_item_get_type
+-pango_glyph_item_iter_get_type
+-pango_glyph_string_get_type
+-pango_gravity_get_type
+-pango_gravity_hint_get_type
+-pango_item_get_type
+-pango_language_get_type
+-pango_layout_get_type
+-pango_layout_iter_get_type
+-pango_layout_line_get_type
+-pango_matrix_get_type
+-pango_ot_info_get_type
+-pango_ot_ruleset_get_type
+-pango_render_part_get_type
+-pango_renderer_get_type
+-pango_script_get_type
+-pango_stretch_get_type
+-pango_style_get_type
+-pango_tab_align_get_type
+-pango_tab_array_get_type
+-pango_underline_get_type
+-pango_variant_get_type
+-pango_weight_get_type
+-pango_wrap_mode_get_type
+-pango_xft_font_get_type
+-pango_xft_font_map_get_type
+-pango_xft_renderer_get_type
+-- 
+2.9.3
+
diff --git a/meta/recipes-graphics/pango/pango_1.40.1.bb b/meta/recipes-graphics/pango/pango_1.40.1.bb
index 60288a1..f9f344a 100644
--- a/meta/recipes-graphics/pango/pango_1.40.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.1.bb
@@ -15,6 +15,7 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://run-ptest \
             file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
+            file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
 SRC_URI[archive.md5sum] = "6fc88c6529890d6c8e03074d57a3eceb"
 SRC_URI[archive.sha256sum] = "e27af54172c72b3ac6be53c9a4c67053e16c905e02addcf3a603ceb2005c1a40"
-- 
2.9.3


