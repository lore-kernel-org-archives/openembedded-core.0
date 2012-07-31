Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwGFw-0006pp-SU
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 19:29:17 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 31 Jul 2012 10:17:37 -0700
Received: by wgbdr13 with SMTP id dr13so4114261wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 10:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ynO7mLX7IEpaOGFHQe7OUOLzWyT5+oNbuH8IBWaIa7c=;
	b=AxhANyW6syhqKLfoAAtsMIpPzdNbL39QmUpf60uVZKNb5DFw2TZfyzfsYkN0vi7Ciz
	5e9jynr1PkrG3VJudJjUoNTYtCQQgRY039MQZQEqhF77yCMZuVrsPpWpBdjM3X6f79Iq
	+UhEHLulRtqnL0lNrmAQ/Avc2F9SSxmuXbbDi6JkbFwXIT3AJc6xrZlvf49CkzsxiBQ6
	luh5UU/SmyVL3CcoAZID3RA2N/BAcSeFAo5LDO0+eLGWnenF+KtCg75/skNkxfd1SzYq
	3zKsZaDYRmG0gsEBlLtjW6l1ULh6SVawUWeFDyE2R5uHjcPA43Z8kJEOx+MZJpmr/6ae
	UArw==
Received: by 10.180.81.133 with SMTP id a5mr8680339wiy.17.1343755055772;
	Tue, 31 Jul 2012 10:17:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm1558325wiv.10.2012.07.31.10.17.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 10:17:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 18:17:06 +0100
Message-Id: <1343755026-12379-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmJ+2hvdyDtP25lp003FYQgjhotnKkOppIwi6TcP2nmFtuBrn7WJocGJWEfq2y5kcIVMKWs
Subject: [PATCH] gthumb: fix parallel build problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 17:29:17 -0000

It's possible with a parallel build for make to spin waiting for a file change
when it isn't going to.  Fix the build rules so this doesn't happen.

[YOCTO #2319]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gthumb/files/parallel.patch |  158 ++++++++++++++++++++++++
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb     |    6 +-
 2 files changed, 161 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/gthumb/files/parallel.patch

diff --git a/meta/recipes-gnome/gthumb/files/parallel.patch b/meta/recipes-gnome/gthumb/files/parallel.patch
new file mode 100644
index 0000000..20ce5c5
--- /dev/null
+++ b/meta/recipes-gnome/gthumb/files/parallel.patch
@@ -0,0 +1,158 @@
+From 34969cde1dcb7740b4a7c3b6e3d04d481e5980b5 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 31 Jul 2012 17:26:27 +0100
+Subject: [PATCH] build: Fix parallel build problems with enum generation
+
+This is a backport from a patch against master.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=680925]
+---
+ extensions/file_tools/Makefile.am    |   10 ++++------
+ extensions/importer/Makefile.am      |   10 ++++------
+ extensions/pixbuf_savers/Makefile.am |   10 ++++------
+ gthumb/Makefile.am                   |   10 ++++------
+ 4 files changed, 16 insertions(+), 24 deletions(-)
+
+diff --git a/extensions/file_tools/Makefile.am b/extensions/file_tools/Makefile.am
+index 7785eff..d70a8a5 100644
+--- a/extensions/file_tools/Makefile.am
++++ b/extensions/file_tools/Makefile.am
+@@ -24,17 +24,16 @@ HEADER_FILES = 				\
+ 	gth-file-tool-undo.h		\
+ 	preferences.h
+ 
+-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
++enum-types.h: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.h )
+ 
+-enum-types.c: $(HEADER_FILES) enum-types.h
++enum-types.c: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -42,8 +41,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.c )
+ 
+ libfile_tools_la_SOURCES = 		\
+ 	$(ENUM_TYPES)			\
+diff --git a/extensions/importer/Makefile.am b/extensions/importer/Makefile.am
+index 29e7f2c..07c1eba 100644
+--- a/extensions/importer/Makefile.am
++++ b/extensions/importer/Makefile.am
+@@ -14,17 +14,16 @@ HEADER_FILES = 					\
+ 	preferences.h				\
+ 	utils.h
+ 
+-gth-import-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
++gth-import-enum-types.h: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-import-enum-types.h || cp xgen-$(@F) gth-import-enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-import-enum-types.h )
+ 
+-gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
++gth-import-enum-types.c: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -32,8 +31,7 @@ gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-import-enum-types.c || cp xgen-$(@F) gth-import-enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-import-enum-types.c )
+ 
+ libimporter_la_SOURCES = 			\
+ 	$(ENUM_TYPES)				\
+diff --git a/extensions/pixbuf_savers/Makefile.am b/extensions/pixbuf_savers/Makefile.am
+index bfe9f34..4764c32 100644
+--- a/extensions/pixbuf_savers/Makefile.am
++++ b/extensions/pixbuf_savers/Makefile.am
+@@ -10,17 +10,16 @@ ENUM_TYPES =				\
+ HEADER_FILES = 				\
+ 	preferences.h
+ 
+-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
++enum-types.h: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.h )
+ 
+-enum-types.c: $(HEADER_FILES) enum-types.h
++enum-types.c: $(HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -28,8 +27,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) enum-types.c )
+ 
+ libpixbuf_savers_la_SOURCES = 	\
+ 	$(ENUM_TYPES)		\
+diff --git a/gthumb/Makefile.am b/gthumb/Makefile.am
+index e9e385e..2f14e03 100644
+--- a/gthumb/Makefile.am
++++ b/gthumb/Makefile.am
+@@ -296,17 +296,16 @@ gthumb_CFLAGS =							\
+ 	-DGTHUMB_EXTENSIONS_DIR=\"$(extensions_dir)\"		\
+ 	$(NULL)
+ 
+-gth-enum-types.h: $(PUBLIC_HEADER_FILES) $(GLIB_MKENUMS)
++gth-enum-types.h: $(PUBLIC_HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#ifndef GTH_ENUM_TYPES_H\n#define GTH_ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
+ 		--fprod "/* enumerations from \"@filename@\" */\n" \
+ 		--vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
+ 		--ftail "G_END_DECLS\n\n#endif /* GTH_ENUM_TYPES_H */" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-enum-types.h || cp xgen-$(@F) gth-enum-types.h ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-enum-types.h )
+ 
+-gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
++gth-enum-types.c: $(PUBLIC_HEADER_FILES)
+ 	$(AM_V_GEN)( $(GLIB_MKENUMS) \
+ 		--fhead "#include <glib-object.h>\n" \
+ 		--fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
+@@ -314,8 +313,7 @@ gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
+ 		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
+ 		--vtail "      { 0, NULL, NULL }\n    };\n    etype = g_@type@_register_static (\"@EnumName@\", values);\n  }\n  return etype;\n}\n" \
+ 		$^> xgen-$(@F) \
+-	&& (cmp -s xgen-$(@F) gth-enum-types.c || cp xgen-$(@F) gth-enum-types.c ) \
+-	&& rm -f xgen-$(@F) )
++	&& mv -f xgen-$(@F) gth-enum-types.c )
+ 
+ gth-marshal.h: gth-marshal.list $(GLIB_GENMARSHAL)
+ 	$(AM_V_GEN)( $(GLIB_GENMARSHAL) $(srcdir)/gth-marshal.list --header --prefix=gth_marshal > $@ )
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 6ab63bb..0414386 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -4,17 +4,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
-PARALLEL_MAKEINST=""
-
 inherit gnome pkgconfig
 
 SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
 SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
 
+SRC_URI += "file://parallel.patch"
+
 do_install_append () {
 	rm ${D}${libdir}/${BPN}/extensions/*.a
 }
-- 
1.7.10



