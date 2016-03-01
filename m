Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7A16011B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 05:23:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u215Nrn9003109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 21:23:53 -0800
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 29 Feb 2016 21:23:52 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Mar 2016 13:23:33 +0800
Message-ID: <1456809813-10502-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] fontconfig: Revert changes made to FcConfigAppFontAddDir() recently
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
X-List-Received-Date: Tue, 01 Mar 2016 05:23:54 -0000
Content-Type: text/plain

Backport <commit 46ec6a52d4cc447cc3ff4a13b2067ecb76c9db2e> from
fontconfig upstream <http://cgit.freedesktop.org/fontconfig/> to solve
issue: fontconfig changes break pybootchartgui tool generating bootchart
png file.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...ges-made-to-FcConfigAppFontAddDir-recentl.patch |  132 ++++++++++++++++++++
 .../fontconfig/fontconfig_2.11.94.bb               |    1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch
new file mode 100644
index 0000000..f2fd5d4
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch
@@ -0,0 +1,132 @@
+From 46ec6a52d4cc447cc3ff4a13b2067ecb76c9db2e Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 26 Jun 2015 17:02:13 -0700
+Subject: [PATCH] Revert changes made to FcConfigAppFontAddDir() recently
+
+In 32ac7c75e8db0135ef37cf86f92d8b9be000c8bb the behavior of
+FcConfigAppFontAddFile/Dir() were changed to return false
+if not fonts were found.  While this is welldefined and useful
+for AddFile(), it's quite problematic for AddDir().  For example,
+if the directory is empty, is that a failure or success?  Worse,
+the false value from AddDir() was being propagated all the way
+to FcInit() returning false now.  This only happened upon memory
+allocation failure before, and some clients assert that FcInit()
+is successful.
+
+With this change, AddDir() is reverted back to what it was.
+AddFont() change (which was actually in fcdir.c) from the original
+commit is left in.
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ doc/fcconfig.fncs |    2 +-
+ src/fccfg.c       |   29 +++++++++++------------------
+ src/fcint.h       |    3 ---
+ src/fcstr.c       |    8 --------
+ 4 files changed, 12 insertions(+), 30 deletions(-)
+
+Index: fontconfig-2.11.94/doc/fcconfig.fncs
+===================================================================
+--- fontconfig-2.11.94.orig/doc/fcconfig.fncs
++++ fontconfig-2.11.94/doc/fcconfig.fncs
+@@ -232,7 +232,7 @@ the current configuration is used.
+ @DESC@
+ Scans the specified directory for fonts, adding each one found to the
+ application-specific set of fonts. Returns FcFalse
+-if the fonts cannot be added (due to allocation failure or no fonts found).
++if the fonts cannot be added (due to allocation failure).
+ Otherwise returns FcTrue. If <parameter>config</parameter> is NULL,
+ the current configuration is used.
+ @@
+Index: fontconfig-2.11.94/src/fccfg.c
+===================================================================
+--- fontconfig-2.11.94.orig/src/fccfg.c
++++ fontconfig-2.11.94/src/fccfg.c
+@@ -368,7 +368,6 @@ FcConfigAddDirList (FcConfig *config, Fc
+     FcStrList	    *dirlist;
+     FcChar8	    *dir;
+     FcCache	    *cache;
+-    FcBool	     ret = FcFalse;
+ 
+     dirlist = FcStrListCreate (dirSet);
+     if (!dirlist)
+@@ -383,10 +382,9 @@ FcConfigAddDirList (FcConfig *config, Fc
+ 	    continue;
+ 	FcConfigAddCache (config, cache, set, dirSet);
+ 	FcDirCacheUnload (cache);
+-	ret = FcTrue;
+     }
+     FcStrListDone (dirlist);
+-    return ret;
++    return FcTrue;
+ }
+ 
+ /*
+@@ -2199,7 +2197,6 @@ FcConfigAppFontAddFile (FcConfig    *con
+     FcStrSet	*subdirs;
+     FcStrList	*sublist;
+     FcChar8	*subdir;
+-    FcBool	 ret = FcFalse;
+ 
+     if (!config)
+     {
+@@ -2229,19 +2226,16 @@ FcConfigAppFontAddFile (FcConfig    *con
+ 	FcStrSetDestroy (subdirs);
+ 	return FcFalse;
+     }
+-    if (subdirs->num == 0)
+-	ret = FcTrue;
+-    else if ((sublist = FcStrListCreate (subdirs)))
++    if ((sublist = FcStrListCreate (subdirs)))
+     {
+ 	while ((subdir = FcStrListNext (sublist)))
+ 	{
+-	    if (FcConfigAppFontAddDir (config, subdir))
+-		ret = FcTrue;
++	    FcConfigAppFontAddDir (config, subdir);
+ 	}
+ 	FcStrListDone (sublist);
+     }
+     FcStrSetDestroy (subdirs);
+-    return ret;
++    return FcTrue;
+ }
+ 
+ FcBool
+@@ -2250,7 +2244,6 @@ FcConfigAppFontAddDir (FcConfig	    *con
+ {
+     FcFontSet	*set;
+     FcStrSet	*dirs;
+-    FcBool	 ret = FcTrue;
+ 
+     if (!config)
+     {
+@@ -2269,8 +2262,8 @@ FcConfigAppFontAddDir (FcConfig	    *con
+ 	set = FcFontSetCreate ();
+ 	if (!set)
+ 	{
+-	    ret = FcFalse;
+-	    goto bail;
++	    FcStrSetDestroy (dirs);
++	    return FcFalse;
+ 	}
+ 	FcConfigSetFonts (config, set, FcSetApplication);
+     }
+@@ -2278,10 +2271,12 @@ FcConfigAppFontAddDir (FcConfig	    *con
+     FcStrSetAddFilename (dirs, dir);
+ 
+     if (!FcConfigAddDirList (config, FcSetApplication, dirs))
+-	ret = FcFalse;
+-bail:
++    {
++	FcStrSetDestroy (dirs);
++	return FcFalse;
++    }
+     FcStrSetDestroy (dirs);
+-    return ret;
++    return FcTrue;
+ }
+ 
+ void
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
index b3bc7eb..b427947 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
@@ -22,6 +22,7 @@ DEPENDS = "expat freetype zlib"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
+           file://0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch \
            "
 SRC_URI[md5sum] = "479be870c7f83f15f87bac085b61d641"
 SRC_URI[sha256sum] = "73f6d323c7bcfbde25d78397675191d55b8f4139132c6a9444410f3a2d8a9a95"
-- 
1.7.9.5


