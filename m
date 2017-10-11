Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1452871A72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945751"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:04 +0300
Message-Id: <d45b2866640ab7f964beee771411a62b0f50f88f.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/50] vala: update to 0.38.2
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:32 -0000

Valadoc has been merged into the main vala tree, so
add necessary patches to disable it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/vala.inc                |   2 +
 .../vala/vala/0001-Disable-valadoc.patch           |  32 +++
 .../vala/vala/disable-graphviz.patch               | 223 +++++++++++++++++++++
 .../vala/{vala_0.36.4.bb => vala_0.38.2.bb}        |   6 +-
 4 files changed, 261 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
 create mode 100644 meta/recipes-devtools/vala/vala/disable-graphviz.patch
 rename meta/recipes-devtools/vala/{vala_0.36.4.bb => vala_0.38.2.bb} (44%)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 1261c02777f..b22faad7805 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -34,6 +34,8 @@ EOF
         chmod +x ${B}/vapigen-wrapper
 }
 
+EXTRA_OECONF += " --disable-graphviz"
+
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install_append_class-target() {
diff --git a/meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch b/meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
new file mode 100644
index 00000000000..9b27b7fd14a
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
@@ -0,0 +1,32 @@
+From b6ca3876e233c724fd460c1579abc4ab63c8d01e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 4 Oct 2017 15:23:08 +0300
+Subject: [PATCH] Disable valadoc
+
+Valadoc is a documentation generator for Vala sources, which was
+recently merged into the main vala source tree. Unsurprisingly,
+it's broken in cross-compile environment in multiple ways,
+so let's fix it some other time.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e5dc0cc..813b3fc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,8 +13,6 @@ SUBDIRS = \
+ 	doc \
+ 	gobject-introspection \
+ 	vapigen \
+-	libvaladoc \
+-	valadoc \
+ 	$(NULL)
+ 
+ if ENABLE_UNVERSIONED
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/vala/vala/disable-graphviz.patch b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
new file mode 100644
index 00000000000..15d186de054
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
@@ -0,0 +1,223 @@
+From eb716dc856c20b3da146a4e83e9800bd1f53c739 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Wed, 6 Sep 2017 18:52:55 +0200
+Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
+ valadoc
+
+https://bugzilla.gnome.org/show_bug.cgi?id=787375
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Upstream-Status: Submitted [bugzilla link above]
+---
+ configure.ac                          | 60 +++++++++++++++++++----------------
+ libvaladoc/Makefile.am                | 25 +++++++++++----
+ libvaladoc/html/basicdoclet.vala      |  8 +++++
+ libvaladoc/html/htmlmarkupwriter.vala |  4 +++
+ 4 files changed, 63 insertions(+), 34 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c73d5d6b1..291e503d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -98,34 +98,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
+ AC_SUBST(GMODULE_CFLAGS)
+ AC_SUBST(GMODULE_LIBS)
+ 
+-PKG_CHECK_MODULES(LIBGVC, libgvc >= $LIBGVC_REQUIRED)
+-AC_MSG_CHECKING([for CGRAPH])
+-cgraph_tmp_LIBADD="$LIBADD"
+-cgraph_tmp_CFLAGS="$CFLAGS"
+-LIBADD="$LIBADD $LIBGVC_LIBS"
+-CFLAGS="$CFLAGS $LIBGVC_CFLAGS"
+-AC_RUN_IFELSE(
+-	[AC_LANG_SOURCE([
+-		#include <gvc.h>
+-
+-		int main(void) {
+-			#ifdef WITH_CGRAPH
+-				return 0;
+-			#else
+-				return -1;
+-			#endif
+-		}
+-	])], [
+-		AC_MSG_RESULT([yes])
+-		VALAFLAGS="$VALAFLAGS -D WITH_CGRAPH"
+-		have_cgraph=yes
+-	], [
+-		AC_MSG_RESULT([no])
+-		have_cgraph=no
+-	]
+-)
+-LIBADD="$cgraph_tmp_LIBADD"
+-CFLAGS="$cgraph_tmp_CFLAGS"
++AC_ARG_ENABLE(graphviz, AS_HELP_STRING([--disable-graphviz], [Disable graphviz usage for valadoc]), enable_graphviz=$enableval, enable_graphviz=yes)
++if test x$enable_graphviz = xyes; then
++	PKG_CHECK_MODULES(LIBGVC, libgvc >= $LIBGVC_REQUIRED)
++	AC_MSG_CHECKING([for CGRAPH])
++	VALAFLAGS="$VALAFLAGS -D HAVE_GRAPHVIZ"
++	cgraph_tmp_LIBADD="$LIBADD"
++	cgraph_tmp_CFLAGS="$CFLAGS"
++	LIBADD="$LIBADD $LIBGVC_LIBS"
++	CFLAGS="$CFLAGS $LIBGVC_CFLAGS"
++	AC_RUN_IFELSE(
++		[AC_LANG_SOURCE([
++			#include <gvc.h>
++			int main(void) {
++				#ifdef WITH_CGRAPH
++					return 0;
++				#else
++					return -1;
++				#endif
++			}
++		])], [
++			AC_MSG_RESULT([yes])
++			VALAFLAGS="$VALAFLAGS -D WITH_CGRAPH"
++			have_cgraph=yes
++		], [
++			AC_MSG_RESULT([no])
++			have_cgraph=no
++		]
++	)
++	LIBADD="$cgraph_tmp_LIBADD"
++	CFLAGS="$cgraph_tmp_CFLAGS"
++fi
++AM_CONDITIONAL(ENABLE_GRAPHVIZ, test x$enable_graphviz = xyes)
+ AM_CONDITIONAL(HAVE_CGRAPH, test "$have_cgraph" = "yes")
+ 
+ AC_PATH_PROG([XSLTPROC], [xsltproc], :)
+diff --git a/libvaladoc/Makefile.am b/libvaladoc/Makefile.am
+index 89245d86b..7c07498b9 100644
+--- a/libvaladoc/Makefile.am
++++ b/libvaladoc/Makefile.am
+@@ -127,10 +127,6 @@ libvaladoc_la_VALASOURCES = \
+ 	content/tablerow.vala \
+ 	content/taglet.vala \
+ 	content/text.vala \
+-	charts/chart.vala \
+-	charts/chartfactory.vala \
+-	charts/hierarchychart.vala \
+-	charts/simplechartfactory.vala \
+ 	parser/manyrule.vala \
+ 	parser/oneofrule.vala \
+ 	parser/optionalrule.vala \
+@@ -158,13 +154,24 @@ libvaladoc_la_VALASOURCES = \
+ 	highlighter/codetoken.vala \
+ 	highlighter/highlighter.vala \
+ 	html/basicdoclet.vala \
+-	html/htmlchartfactory.vala \
+ 	html/linkhelper.vala \
+ 	html/cssclassresolver.vala \
+ 	html/htmlmarkupwriter.vala \
+ 	html/htmlrenderer.vala \
+ 	$(NULL)
+ 
++if ENABLE_GRAPHVIZ
++libvaladoc_la_VALASOURCES += \
++	charts/chart.vala \
++	charts/chartfactory.vala \
++	charts/hierarchychart.vala \
++	charts/simplechartfactory.vala \
++	html/htmlchartfactory.vala \
++	$(NULL)
++
++LIBGVC_PKG = --vapidir $(top_srcdir)/vapi --pkg libgvc
++endif
++
+ libvaladoc@PACKAGE_SUFFIX@_la_SOURCES = \
+ 	libvaladoc.vala.stamp \
+ 	$(libvaladoc_la_VALASOURCES:.vala=.c) \
+@@ -182,8 +189,8 @@ libvaladoc.vala.stamp: $(libvaladoc_la_VALASOURCES)
+ 		--library valadoc \
+ 		--vapi valadoc@PACKAGE_SUFFIX@.vapi \
+ 		--vapidir $(top_srcdir)/vapi --pkg gmodule-2.0 \
+-		--vapidir $(top_srcdir)/vapi --pkg libgvc \
+ 		--vapidir $(top_srcdir)/gee --pkg gee \
++		$(LIBGVC_PKG) \
+ 		--pkg config \
+ 		$(filter %.vala %.c,$^)
+ 	touch $@
+@@ -209,6 +216,9 @@ nodist_pkgconfig_DATA = valadoc@PACKAGE_SUFFIX@.pc
+ 
+ valadoc@PACKAGE_SUFFIX@.pc: valadoc.pc
+ 	cp $< $@
++if !ENABLE_GRAPHVIZ
++	sed -i "s/libgvc //g" $@
++endif
+ 
+ vapidir = $(datadir)/vala/vapi
+ dist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.vapi
+@@ -216,6 +226,9 @@ nodist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.deps
+ 
+ valadoc@PACKAGE_SUFFIX@.deps: valadoc.deps
+ 	cp $< $@
++if !ENABLE_GRAPHVIZ
++	sed -i "s/libgvc//g" $@
++endif
+ 
+ EXTRA_DIST = \
+ 	$(libvaladoc_la_VALASOURCES) \
+diff --git a/libvaladoc/html/basicdoclet.vala b/libvaladoc/html/basicdoclet.vala
+index cc9ea4ed7..432c3818f 100644
+--- a/libvaladoc/html/basicdoclet.vala
++++ b/libvaladoc/html/basicdoclet.vala
+@@ -46,7 +46,11 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
+ 	protected HtmlRenderer _renderer;
+ 	protected Html.MarkupWriter writer;
+ 	protected Html.CssClassResolver cssresolver;
++#if HAVE_GRAPHVIZ
+ 	protected Charts.Factory image_factory;
++#else
++	protected void* image_factory;
++#endif
+ 	protected ErrorReporter reporter;
+ 	protected string package_list_link = "../index.html";
+ 
+@@ -120,7 +124,9 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
+ 		this.linker = new LinkHelper ();
+ 
+ 		_renderer = new HtmlRenderer (settings, this.linker, this.cssresolver);
++#if HAVE_GRAPHVIZ
+ 		this.image_factory = new SimpleChartFactory (settings, linker);
++#endif
+ 	}
+ 
+ 
+@@ -1025,6 +1031,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
+ 	}
+ 
+ 	protected void write_image_block (Api.Node element) {
++#if HAVE_GRAPHVIZ
+ 		if (element is Class || element is Interface || element is Struct) {
+ 			unowned string format = (settings.use_svg_images ? "svg" : "png");
+ 			var chart = new Charts.Hierarchy (image_factory, element);
+@@ -1044,6 +1051,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
+ 									   this.get_img_path_html (element, format)});
+ 			writer.add_usemap (chart);
+ 		}
++#endif
+ 	}
+ 
+ 	public void write_namespace_content (Namespace node, Api.Node? parent) {
+diff --git a/libvaladoc/html/htmlmarkupwriter.vala b/libvaladoc/html/htmlmarkupwriter.vala
+index 15ed9efd1..fe0d705d4 100644
+--- a/libvaladoc/html/htmlmarkupwriter.vala
++++ b/libvaladoc/html/htmlmarkupwriter.vala
+@@ -43,12 +43,16 @@ public class Valadoc.Html.MarkupWriter : Valadoc.MarkupWriter {
+ 		}, xml_declaration);
+ 	}
+ 
++#if HAVE_GRAPHVIZ
+ 	public MarkupWriter add_usemap (Charts.Chart chart) {
+ 		string? buf = (string?) chart.write_buffer ("cmapx");
+ 		if (buf != null) {
+ 			raw_text ("\n");
+ 			raw_text ((!) buf);
+ 		}
++#else
++	public MarkupWriter add_usemap (void* chart) {
++#endif
+ 
+ 		return this;
+ 	}
+-- 
+2.14.1
diff --git a/meta/recipes-devtools/vala/vala_0.36.4.bb b/meta/recipes-devtools/vala/vala_0.38.2.bb
similarity index 44%
rename from meta/recipes-devtools/vala/vala_0.36.4.bb
rename to meta/recipes-devtools/vala/vala_0.38.2.bb
index 51000d9e126..18751fe81a7 100644
--- a/meta/recipes-devtools/vala/vala_0.36.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.38.2.bb
@@ -2,7 +2,9 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
+	     file://disable-graphviz.patch \
+	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "3c19014093f1a3d995357253b463082c"
-SRC_URI[sha256sum] = "e9f23ce711c1a72ce664d10946fbc5953f01b0b7f2a3562e7a01e362d86de059"
+SRC_URI[md5sum] = "720846116448fc20b0ab3c0921e19798"
+SRC_URI[sha256sum] = "20d5d9c4fbd17877969dbce27e6428da67138e116b1717cc07b5b75fd6ab78a7"
-- 
2.14.1


