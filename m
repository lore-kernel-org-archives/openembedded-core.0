Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6D60A730DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 05:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="1114107233"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 05:02:47 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 966936A4080;
	Wed, 22 Feb 2017 05:02:45 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:36 +0200
Message-Id: <de75d26894de3de281527ee071f8cb2664a49076.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/6] gdk-pixbuf: Upgrade 2.36.1 -> 2.36.5
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:49 -0000

Mostly bug fix releases.

Generating the thumbnailer metadata now requires running yet another
tool at build time. This is broken for cross-compiling, add a
work-around.

Add gdk-pixbuf-native to DEPENDS to make the above workaround possible:
We already build gdk-pixbuf-native anyway so this is not a huge deal.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...-around-thumbnailer-cross-compile-failure.patch | 47 ++++++++++++++++++++++
 .../{gdk-pixbuf_2.36.1.bb => gdk-pixbuf_2.36.5.bb} | 12 ++++--
 2 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.1.bb => gdk-pixbuf_2.36.5.bb} (88%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
new file mode 100644
index 0000000..31ed988
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-cross-compile-failure.patch
@@ -0,0 +1,47 @@
+From 6646e8aadc4030d891ac27c25494e5793d59dc85 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 22 Feb 2017 11:24:39 +0200
+Subject: [PATCH] Work-around thumbnailer cross-compile failure
+
+Install gdk-pixbuf-print-mime-types that's needed for thumbnail
+metadata generation.
+
+Use native gdk-pixbuf-print-mime-types when generating the thumbnail
+metadata. This works but the mime types will come from native
+loader.cache (which will only contain in-tree loaders), not from the
+target loader.cache.
+
+The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ thumbnailer/Makefile.am | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/thumbnailer/Makefile.am b/thumbnailer/Makefile.am
+index c9fe123..b0c6c70 100644
+--- a/thumbnailer/Makefile.am
++++ b/thumbnailer/Makefile.am
+@@ -1,5 +1,4 @@
+-bin_PROGRAMS = gdk-pixbuf-thumbnailer
+-noinst_PROGRAMS = gdk-pixbuf-print-mime-types
++bin_PROGRAMS = gdk-pixbuf-thumbnailer gdk-pixbuf-print-mime-types
+ 
+ gdk_pixbuf_thumbnailer_SOURCES = gdk-pixbuf-thumbnailer.c gnome-thumbnailer-skeleton.c gnome-thumbnailer-skeleton.h
+ gdk_pixbuf_thumbnailer_CPPFLAGS =			\
+@@ -25,9 +24,9 @@ gdk_pixbuf_print_mime_types_LDADD =			\
+ 
+ thumbnailerdir = $(datadir)/thumbnailers/
+ thumbnailer_DATA = gdk-pixbuf-thumbnailer.thumbnailer
+-gdk-pixbuf-thumbnailer.thumbnailer: gdk-pixbuf-thumbnailer.thumbnailer.in Makefile gdk-pixbuf-print-mime-types$(EXEEXT) $(top_builddir)/gdk-pixbuf/loaders.cache
++gdk-pixbuf-thumbnailer.thumbnailer: gdk-pixbuf-thumbnailer.thumbnailer.in Makefile gdk-pixbuf-print-mime-types$(EXEEXT)
+ 	$(AM_V_GEN) $(SED) -e "s|\@bindir\@|$(bindir)|"						\
+-	-e "s|\@mimetypes\@|`GDK_PIXBUF_MODULE_FILE=$(top_builddir)/gdk-pixbuf/loaders.cache GDK_PIXBUF_PIXDATA=$(top_builddir)/gdk-pixbuf/gdk-pixbuf-pixdata $(builddir)/gdk-pixbuf-print-mime-types`|" \
++	-e "s|\@mimetypes\@|`gdk-pixbuf-print-mime-types`|" \
+ 	$< > $@
+ 
+ EXTRA_DIST = gdk-pixbuf-thumbnailer.thumbnailer.in
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.5.bb
similarity index 88%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.5.bb
index 98e5090..5d42697 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 SECTION = "libs"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 gdk-pixbuf-native"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
@@ -17,10 +17,10 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
+           file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            "
-
-SRC_URI[md5sum] = "fe30b0420e013f2c4590ae6226d895d4"
-SRC_URI[sha256sum] = "9d5ba72070460c1b5b74115d395a3e33daeb7b7b67fb256cdccc9d7187c42a38"
+SRC_URI[md5sum] = "0173fd5c11a5d2030d09201090636477"
+SRC_URI[sha256sum] = "7ace06170291a1f21771552768bace072ecdea9bd4a02f7658939b9a314c40fc"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
@@ -53,6 +53,7 @@ FILES_${PN}-bin += "${datadir}/thumbnailers/gdk-pixbuf-thumbnailer.thumbnailer"
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
 	${bindir}/gdk-pixbuf-pixdata \
+        ${bindir}/gdk-pixbuf-print-mime-types \
 	${includedir}/* \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
 "
@@ -88,6 +89,9 @@ do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-pixdata \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
+	create_wrapper ${D}/${bindir}/gdk-pixbuf-print-mime-types \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
+
 	create_wrapper ${D}/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
-- 
2.1.4


