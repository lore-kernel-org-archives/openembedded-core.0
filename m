Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 346AA60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:44:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 05:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="960442771"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 05:44:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 15:44:06 +0300
Message-Id: <908c31ff96cf0d636e5b43045a8c7c1d27c86121.1464004128.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
References: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464004128.git.jussi.kukkonen@intel.com>
References: <cover.1464004128.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/5] fontconfig: Upgrade 2.11.94 -> 2.11.95
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
X-List-Received-Date: Mon, 23 May 2016 12:44:15 -0000

Remove a backported patch.
License checksum stays the same but license location changed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ges-made-to-FcConfigAppFontAddDir-recentl.patch | 132 ---------------------
 ...fontconfig_2.11.94.bb => fontconfig_2.11.95.bb} |   7 +-
 2 files changed, 3 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.94.bb => fontconfig_2.11.95.bb} (84%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch
deleted file mode 100644
index f2fd5d4..0000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 46ec6a52d4cc447cc3ff4a13b2067ecb76c9db2e Mon Sep 17 00:00:00 2001
-From: Behdad Esfahbod <behdad@behdad.org>
-Date: Fri, 26 Jun 2015 17:02:13 -0700
-Subject: [PATCH] Revert changes made to FcConfigAppFontAddDir() recently
-
-In 32ac7c75e8db0135ef37cf86f92d8b9be000c8bb the behavior of
-FcConfigAppFontAddFile/Dir() were changed to return false
-if not fonts were found.  While this is welldefined and useful
-for AddFile(), it's quite problematic for AddDir().  For example,
-if the directory is empty, is that a failure or success?  Worse,
-the false value from AddDir() was being propagated all the way
-to FcInit() returning false now.  This only happened upon memory
-allocation failure before, and some clients assert that FcInit()
-is successful.
-
-With this change, AddDir() is reverted back to what it was.
-AddFont() change (which was actually in fcdir.c) from the original
-commit is left in.
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- doc/fcconfig.fncs |    2 +-
- src/fccfg.c       |   29 +++++++++++------------------
- src/fcint.h       |    3 ---
- src/fcstr.c       |    8 --------
- 4 files changed, 12 insertions(+), 30 deletions(-)
-
-Index: fontconfig-2.11.94/doc/fcconfig.fncs
-===================================================================
---- fontconfig-2.11.94.orig/doc/fcconfig.fncs
-+++ fontconfig-2.11.94/doc/fcconfig.fncs
-@@ -232,7 +232,7 @@ the current configuration is used.
- @DESC@
- Scans the specified directory for fonts, adding each one found to the
- application-specific set of fonts. Returns FcFalse
--if the fonts cannot be added (due to allocation failure or no fonts found).
-+if the fonts cannot be added (due to allocation failure).
- Otherwise returns FcTrue. If <parameter>config</parameter> is NULL,
- the current configuration is used.
- @@
-Index: fontconfig-2.11.94/src/fccfg.c
-===================================================================
---- fontconfig-2.11.94.orig/src/fccfg.c
-+++ fontconfig-2.11.94/src/fccfg.c
-@@ -368,7 +368,6 @@ FcConfigAddDirList (FcConfig *config, Fc
-     FcStrList	    *dirlist;
-     FcChar8	    *dir;
-     FcCache	    *cache;
--    FcBool	     ret = FcFalse;
- 
-     dirlist = FcStrListCreate (dirSet);
-     if (!dirlist)
-@@ -383,10 +382,9 @@ FcConfigAddDirList (FcConfig *config, Fc
- 	    continue;
- 	FcConfigAddCache (config, cache, set, dirSet);
- 	FcDirCacheUnload (cache);
--	ret = FcTrue;
-     }
-     FcStrListDone (dirlist);
--    return ret;
-+    return FcTrue;
- }
- 
- /*
-@@ -2199,7 +2197,6 @@ FcConfigAppFontAddFile (FcConfig    *con
-     FcStrSet	*subdirs;
-     FcStrList	*sublist;
-     FcChar8	*subdir;
--    FcBool	 ret = FcFalse;
- 
-     if (!config)
-     {
-@@ -2229,19 +2226,16 @@ FcConfigAppFontAddFile (FcConfig    *con
- 	FcStrSetDestroy (subdirs);
- 	return FcFalse;
-     }
--    if (subdirs->num == 0)
--	ret = FcTrue;
--    else if ((sublist = FcStrListCreate (subdirs)))
-+    if ((sublist = FcStrListCreate (subdirs)))
-     {
- 	while ((subdir = FcStrListNext (sublist)))
- 	{
--	    if (FcConfigAppFontAddDir (config, subdir))
--		ret = FcTrue;
-+	    FcConfigAppFontAddDir (config, subdir);
- 	}
- 	FcStrListDone (sublist);
-     }
-     FcStrSetDestroy (subdirs);
--    return ret;
-+    return FcTrue;
- }
- 
- FcBool
-@@ -2250,7 +2244,6 @@ FcConfigAppFontAddDir (FcConfig	    *con
- {
-     FcFontSet	*set;
-     FcStrSet	*dirs;
--    FcBool	 ret = FcTrue;
- 
-     if (!config)
-     {
-@@ -2269,8 +2262,8 @@ FcConfigAppFontAddDir (FcConfig	    *con
- 	set = FcFontSetCreate ();
- 	if (!set)
- 	{
--	    ret = FcFalse;
--	    goto bail;
-+	    FcStrSetDestroy (dirs);
-+	    return FcFalse;
- 	}
- 	FcConfigSetFonts (config, set, FcSetApplication);
-     }
-@@ -2278,10 +2271,12 @@ FcConfigAppFontAddDir (FcConfig	    *con
-     FcStrSetAddFilename (dirs, dir);
- 
-     if (!FcConfigAddDirList (config, FcSetApplication, dirs))
--	ret = FcFalse;
--bail:
-+    {
-+	FcStrSetDestroy (dirs);
-+	return FcFalse;
-+    }
-     FcStrSetDestroy (dirs);
--    return ret;
-+    return FcTrue;
- }
- 
- void
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.95.bb
similarity index 84%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.11.95.bb
index b427947..5db4436 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.95.bb
@@ -14,7 +14,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1199;endline=1214;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1278;endline=1293;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
@@ -22,10 +22,9 @@ DEPENDS = "expat freetype zlib"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
-           file://0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch \
            "
-SRC_URI[md5sum] = "479be870c7f83f15f87bac085b61d641"
-SRC_URI[sha256sum] = "73f6d323c7bcfbde25d78397675191d55b8f4139132c6a9444410f3a2d8a9a95"
+SRC_URI[md5sum] = "da605e910d9c037f8886d65607b06920"
+SRC_URI[sha256sum] = "39da7704b348b3c9c83f449e9aa6e0e131ffe77e3533b68017f3b40a95d75a9c"
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
2.1.4


