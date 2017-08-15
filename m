Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EC1D0783F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 10:33:23 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 15 Aug 2017 03:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="137572626"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 15 Aug 2017 03:33:25 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6CFA658035B;
	Tue, 15 Aug 2017 03:33:24 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 13:33:18 +0300
Message-Id: <324f5f87f49bf91cff92f3b8b69b55263ab01a0f.1502792828.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1502792828.git.jussi.kukkonen@intel.com>
References: <cover.1502792828.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] fontconfig: Upgrade 2.12.1 -> 2.12.4
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
X-List-Received-Date: Tue, 15 Aug 2017 10:33:24 -0000

Bug fix upgrades.
* Remove one upstreamed patch.
* Update a license location.
* Add gperf-native as dependency as a hash function header is no
  longer shipped and must be generated.
* Add workaround for a related build issue (reported upstream)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...icts-with-integer-width-macros-from-TS-18.patch | 72 ----------------------
 .../{fontconfig_2.12.1.bb => fontconfig_2.12.4.bb} | 14 +++--
 2 files changed, 9 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.1.bb => fontconfig_2.12.4.bb} (80%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
deleted file mode 100644
index cad7170..0000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 20cddc824c6501c2082cac41b162c34cd5fcc530 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 11 Dec 2016 14:32:00 -0800
-Subject: [PATCH] Avoid conflicts with integer width macros from TS
- 18661-1:2014
-
-glibc 2.25+ has now defined these macros in <limits.h>
-https://sourceware.org/git/?p=glibc.git;a=commit;h=5b17fd0da62bf923cb61d1bb7b08cf2e1f1f9c1a
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- fontconfig/fontconfig.h | 2 +-
- src/fcobjs.h            | 2 +-
- src/fcobjshash.gperf    | 2 +-
- src/fcobjshash.h        | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-Index: fontconfig-2.12.1/fontconfig/fontconfig.h
-===================================================================
---- fontconfig-2.12.1.orig/fontconfig/fontconfig.h
-+++ fontconfig-2.12.1/fontconfig/fontconfig.h
-@@ -128,7 +128,8 @@ typedef int		FcBool;
- #define FC_USER_CACHE_FILE	    ".fonts.cache-" FC_CACHE_VERSION
- 
- /* Adjust outline rasterizer */
--#define FC_CHAR_WIDTH	    "charwidth"	/* Int */
-+#define FC_CHARWIDTH	    "charwidth"	/* Int */
-+#define FC_CHAR_WIDTH	    FC_CHARWIDTH
- #define FC_CHAR_HEIGHT	    "charheight"/* Int */
- #define FC_MATRIX	    "matrix"    /* FcMatrix */
- 
-Index: fontconfig-2.12.1/src/fcobjs.h
-===================================================================
---- fontconfig-2.12.1.orig/src/fcobjs.h
-+++ fontconfig-2.12.1/src/fcobjs.h
-@@ -51,7 +51,7 @@ FC_OBJECT (DPI,			FcTypeDouble,	NULL)
- FC_OBJECT (RGBA,		FcTypeInteger,	NULL)
- FC_OBJECT (SCALE,		FcTypeDouble,	NULL)
- FC_OBJECT (MINSPACE,		FcTypeBool,	NULL)
--FC_OBJECT (CHAR_WIDTH,		FcTypeInteger,	NULL)
-+FC_OBJECT (CHARWIDTH,		FcTypeInteger,	NULL)
- FC_OBJECT (CHAR_HEIGHT,		FcTypeInteger,	NULL)
- FC_OBJECT (MATRIX,		FcTypeMatrix,	NULL)
- FC_OBJECT (CHARSET,		FcTypeCharSet,	FcCompareCharSet)
-Index: fontconfig-2.12.1/src/fcobjshash.gperf
-===================================================================
---- fontconfig-2.12.1.orig/src/fcobjshash.gperf
-+++ fontconfig-2.12.1/src/fcobjshash.gperf
-@@ -44,7 +44,7 @@ int id;
- "rgba",FC_RGBA_OBJECT
- "scale",FC_SCALE_OBJECT
- "minspace",FC_MINSPACE_OBJECT
--"charwidth",FC_CHAR_WIDTH_OBJECT
-+"charwidth",FC_CHARWIDTH_OBJECT
- "charheight",FC_CHAR_HEIGHT_OBJECT
- "matrix",FC_MATRIX_OBJECT
- "charset",FC_CHARSET_OBJECT
-Index: fontconfig-2.12.1/src/fcobjshash.h
-===================================================================
---- fontconfig-2.12.1.orig/src/fcobjshash.h
-+++ fontconfig-2.12.1/src/fcobjshash.h
-@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char
-       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
-       {-1},
- #line 47 "fcobjshash.gperf"
--      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
-+      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
- #line 48 "fcobjshash.gperf"
-       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
- #line 55 "fcobjshash.gperf"
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.4.bb
similarity index 80%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.12.4.bb
index 95b066c..a058b35 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.4.bb
@@ -14,18 +14,22 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1360;endline=1375;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1367;endline=1382;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
-DEPENDS = "expat freetype zlib"
+DEPENDS = "expat freetype zlib gperf-native"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
-           file://0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch \
            "
-SRC_URI[md5sum] = "ce55e525c37147eee14cc2de6cc09f6c"
-SRC_URI[sha256sum] = "a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292"
+SRC_URI[md5sum] = "4fb01fc3f41760c41c69e37cc784b658"
+SRC_URI[sha256sum] = "fd5a6a663f4c4a00e196523902626654dd0c4a78686cbc6e472f338e50fdf806"
+
+do_configure_prepend() {
+    # work around https://bugs.freedesktop.org/show_bug.cgi?id=101280
+    rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
+}
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
2.1.4


