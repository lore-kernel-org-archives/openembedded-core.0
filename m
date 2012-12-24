Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iK-0003rc-QJ
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440653"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:58 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:17 +0200
Message-Id: <a248e5ee5a24449477456470912a96c0f032c022.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 05/15] gthumb: remove recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 08:48:58 -0000

Part of the sato trimming process

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gthumb/files/parallel.patch     | 158 ---------------------
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |  27 ----
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 -
 3 files changed, 186 deletions(-)
 delete mode 100644 meta/recipes-gnome/gthumb/files/parallel.patch
 delete mode 100644 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb

diff --git a/meta/recipes-gnome/gthumb/files/parallel.patch b/meta/recipes-gnome/gthumb/files/parallel.patch
deleted file mode 100644
index 20ce5c5..0000000
--- a/meta/recipes-gnome/gthumb/files/parallel.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 34969cde1dcb7740b4a7c3b6e3d04d481e5980b5 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 31 Jul 2012 17:26:27 +0100
-Subject: [PATCH] build: Fix parallel build problems with enum generation
-
-This is a backport from a patch against master.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=680925]
----
- extensions/file_tools/Makefile.am    |   10 ++++------
- extensions/importer/Makefile.am      |   10 ++++------
- extensions/pixbuf_savers/Makefile.am |   10 ++++------
- gthumb/Makefile.am                   |   10 ++++------
- 4 files changed, 16 insertions(+), 24 deletions(-)
-
-diff --git a/extensions/file_tools/Makefile.am b/extensions/file_tools/Makefile.am
-index 7785eff..d70a8a5 100644
---- a/extensions/file_tools/Makefile.am
-+++ b/extensions/file_tools/Makefile.am
-@@ -24,17 +24,16 @@ HEADER_FILES = 				\
- 	gth-file-tool-undo.h		\
- 	preferences.h
- 
--enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
-+enum-types.h: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.h )
- 
--enum-types.c: $(HEADER_FILES) enum-types.h
-+enum-types.c: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -42,8 +41,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.c )
- 
- libfile_tools_la_SOURCES = 		\
- 	$(ENUM_TYPES)			\
-diff --git a/extensions/importer/Makefile.am b/extensions/importer/Makefile.am
-index 29e7f2c..07c1eba 100644
---- a/extensions/importer/Makefile.am
-+++ b/extensions/importer/Makefile.am
-@@ -14,17 +14,16 @@ HEADER_FILES = 					\
- 	preferences.h				\
- 	utils.h
- 
--gth-import-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
-+gth-import-enum-types.h: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-import-enum-types.h || cp xgen-$(@F) gth-import-enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-import-enum-types.h )
- 
--gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
-+gth-import-enum-types.c: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -32,8 +31,7 @@ gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-import-enum-types.c || cp xgen-$(@F) gth-import-enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-import-enum-types.c )
- 
- libimporter_la_SOURCES = 			\
- 	$(ENUM_TYPES)				\
-diff --git a/extensions/pixbuf_savers/Makefile.am b/extensions/pixbuf_savers/Makefile.am
-index bfe9f34..4764c32 100644
---- a/extensions/pixbuf_savers/Makefile.am
-+++ b/extensions/pixbuf_savers/Makefile.am
-@@ -10,17 +10,16 @@ ENUM_TYPES =				\
- HEADER_FILES = 				\
- 	preferences.h
- 
--enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
-+enum-types.h: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.h )
- 
--enum-types.c: $(HEADER_FILES) enum-types.h
-+enum-types.c: $(HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -28,8 +27,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) enum-types.c )
- 
- libpixbuf_savers_la_SOURCES = 	\
- 	$(ENUM_TYPES)		\
-diff --git a/gthumb/Makefile.am b/gthumb/Makefile.am
-index e9e385e..2f14e03 100644
---- a/gthumb/Makefile.am
-+++ b/gthumb/Makefile.am
-@@ -296,17 +296,16 @@ gthumb_CFLAGS =							\
- 	-DGTHUMB_EXTENSIONS_DIR=\"$(extensions_dir)\"		\
- 	$(NULL)
- 
--gth-enum-types.h: $(PUBLIC_HEADER_FILES) $(GLIB_MKENUMS)
-+gth-enum-types.h: $(PUBLIC_HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#ifndef GTH_ENUM_TYPES_H\n#define GTH_ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
- 		--fprod "/* enumerations from \"@filename@\" */\n" \
- 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
- 		--ftail "G_END_DECLS\n\n#endif /* GTH_ENUM_TYPES_H */" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-enum-types.h || cp xgen-$(@F) gth-enum-types.h ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-enum-types.h )
- 
--gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
-+gth-enum-types.c: $(PUBLIC_HEADER_FILES)
- 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
- 		--fhead "#include <glib-object.h>\n" \
- 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
-@@ -314,8 +313,7 @@ gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
- 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
- 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
- 		$^> xgen-$(@F) \
--	&& (cmp -s xgen-$(@F) gth-enum-types.c || cp xgen-$(@F) gth-enum-types.c ) \
--	&& rm -f xgen-$(@F) )
-+	&& mv -f xgen-$(@F) gth-enum-types.c )
- 
- gth-marshal.h: gth-marshal.list $(GLIB_GENMARSHAL)
- 	$(AM_V_GEN)( $(GLIB_GENMARSHAL) $(srcdir)/gth-marshal.list --header --prefix=gth_marshal > $@ )
--- 
-1.7.10.4
-
diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
deleted file mode 100644
index 0414386..0000000
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "gThumb is an image viewer and browser for the GNOME Desktop"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
-
-PR = "r4"
-
-EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
-
-inherit gnome pkgconfig
-
-SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
-SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
-
-SRC_URI += "file://parallel.patch"
-
-do_install_append () {
-	rm ${D}${libdir}/${BPN}/extensions/*.a
-}
-
-FILES_${PN} += "${datadir}/icons"
-FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
-                ${libdir}/${BPN}/extensions/*.extension"
-FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
-FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
-
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index f2997a7..057be24 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -53,7 +53,6 @@ WEB ?= ""
 
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
-    gthumb \
     leafpad \
     gaku \
     x11vnc \
-- 
1.7.11.7



