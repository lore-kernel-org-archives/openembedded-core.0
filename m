Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.6467.1589292861626598064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=cpWdk9Sy;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0DC6CQ4zKj
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292860;
	bh=482w4DolNV3yQv4fvzRQoKf3PI++Jk/uHgt/MiApHNc=;
	h=From:To:Subject:Date:From;
	b=cpWdk9SyCN/uZhn9F4GJv6aZ4OjJglpsfq/5kxPD5pD1OVmEk9i2MPJWFmS17lR2x
	 gpQEEiosRy3PvxkenrDMsX6hYqgXtiUFqZmm8R0UO/7JnFyMtJ216FoR2QBjeB4I+A
	 NyescOAqGgHynQYRXzYuDIoymd11y4hiKYjOnnIxRdUL00Cb9gZ3ZdhY6NzuyA/LV6
	 Hdrw+pS0qvQQf9kQ1ljVSY3gS/eoqkb3cKXrmFs4iPc8bogml00I2Div1ZetweDg0y
	 448y19eeKprQm0/2AmXFJRPV/c32yGy5ogR/797Ycqc1bI36aH8/elBDKpSsHbBqA6
	 KNnaase3aaimWOmkBH76ATTHGZ+mxLZ5fCIm1QK0UFUZfICSdYGAOmVzaNQniGfPhi
	 EdYjrKEEajQlblzB3l2oHJz8usfFqSW1aSvZMKhiFUdtHLhMkqPyNLfcYb5TLtXGga
	 Q3pmqtnDOZ3g9n4luQYiAaIgtsYJc/TMv9+sm+Eioc8uanZ1FqyrtiU94ScofjfEkX
	 S04YrbuPIMpIWlbnAjs6yge6M8Dg4bADSUXthhDGwOMq3mS06AzVqDCBv2OaMahP54
	 q3WLZcJKtYfSSpGOeW7TmDFeBgexGn8hfWcWFO1aThWdtiMCO/0iprAxdLeyfCVJ+r
	 d5g1PB0zW4qNXGCJ5oXdKoyM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] menu-cache: Replace -fcommon with fix
Date: Tue, 12 May 2020 17:14:14 +0300
Message-Id: <20200512141416.5327-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-Support-gcc10-compilation.patch      | 111 ++++++++++++++++++
 .../menu-cache/menu-cache_1.1.0.bb            |   6 +-
 2 files changed, 114 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/menu-cache/files/0001-Support-gcc10-compilation.patch

diff --git a/meta/recipes-graphics/menu-cache/files/0001-Support-gcc10-compilation.patch b/meta/recipes-graphics/menu-cache/files/0001-Support-gcc10-compilation.patch
new file mode 100644
index 0000000000..aeae864cd4
--- /dev/null
+++ b/meta/recipes-graphics/menu-cache/files/0001-Support-gcc10-compilation.patch
@@ -0,0 +1,111 @@
+From 1ce739649b4d66339a03fc0ec9ee7a2f7c141780 Mon Sep 17 00:00:00 2001
+From: Mamoru TASAKA <mtasaka@fedoraproject.org>
+Date: Fri, 24 Jan 2020 13:33:00 +0900
+Subject: Support gcc10 compilation
+
+gcc10 now defaults to -fno-common, and with gcc10 menu-cache compilation fails like
+
+/bin/ld: menu-merge.o:menu-cache-gen/menu-tags.h:167: multiple definition of `DirDirs'; main.o:menu-cache-gen/menu-tags.h:167: first defined here
+/bin/ld: menu-merge.o:menu-cache-gen/menu-tags.h:164: multiple definition of `AppDirs'; main.o:menu-cache-gen/menu-tags.h:164: first defined here
+/bin/ld: menu-merge.o:menu-cache-gen/menu-tags.h:52: multiple definition of `menuTag_Layout'; main.o:menu-cache-gen/menu-tags.h:52: first defined here
+....
+
+This patch fixes compilation with gcc10: properly declaring variables in header with "extern", and also removing some unneeded variables in header files.
+
+Upstream-Status: Submitted [https://github.com/lxde/menu-cache/pull/19]
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ menu-cache-gen/menu-tags.h | 55 ++++++++++++--------------------------
+ 1 file changed, 17 insertions(+), 38 deletions(-)
+
+diff --git a/menu-cache-gen/menu-tags.h b/menu-cache-gen/menu-tags.h
+index f3fd7d3..f71c0bc 100644
+--- a/menu-cache-gen/menu-tags.h
++++ b/menu-cache-gen/menu-tags.h
+@@ -22,38 +22,17 @@
+ #include <libfm/fm-extra.h>
+ #include <menu-cache.h>
+ 
+-FmXmlFileTag menuTag_Menu;
+-FmXmlFileTag menuTag_AppDir;
+-FmXmlFileTag menuTag_DefaultAppDirs;
+-FmXmlFileTag menuTag_DirectoryDir;
+-FmXmlFileTag menuTag_DefaultDirectoryDirs;
+-FmXmlFileTag menuTag_Include;
+-FmXmlFileTag menuTag_Exclude;
+-FmXmlFileTag menuTag_Filename;
+-FmXmlFileTag menuTag_Or;
+-FmXmlFileTag menuTag_And;
+-FmXmlFileTag menuTag_Not;
+-FmXmlFileTag menuTag_Category;
+-FmXmlFileTag menuTag_MergeFile;
+-FmXmlFileTag menuTag_MergeDir;
+-FmXmlFileTag menuTag_DefaultMergeDirs;
+-FmXmlFileTag menuTag_Directory;
+-FmXmlFileTag menuTag_Name;
+-FmXmlFileTag menuTag_Deleted;
+-FmXmlFileTag menuTag_NotDeleted;
+-FmXmlFileTag menuTag_OnlyUnallocated;
+-FmXmlFileTag menuTag_NotOnlyUnallocated;
+-FmXmlFileTag menuTag_All;
+-FmXmlFileTag menuTag_LegacyDir;
+-FmXmlFileTag menuTag_KDELegacyDirs;
+-FmXmlFileTag menuTag_Move;
+-FmXmlFileTag menuTag_Old;
+-FmXmlFileTag menuTag_New;
+-FmXmlFileTag menuTag_Layout;
+-FmXmlFileTag menuTag_DefaultLayout;
+-FmXmlFileTag menuTag_Menuname;
+-FmXmlFileTag menuTag_Separator;
+-FmXmlFileTag menuTag_Merge;
++extern FmXmlFileTag menuTag_AppDir;
++extern FmXmlFileTag menuTag_DirectoryDir;
++extern FmXmlFileTag menuTag_Include;
++extern FmXmlFileTag menuTag_Exclude;
++extern FmXmlFileTag menuTag_Filename;
++extern FmXmlFileTag menuTag_Or;
++extern FmXmlFileTag menuTag_And;
++extern FmXmlFileTag menuTag_Not;
++extern FmXmlFileTag menuTag_Category;
++extern FmXmlFileTag menuTag_All;
++extern FmXmlFileTag menuTag_LegacyDir;
+ 
+ typedef enum {
+     MERGE_NONE, /* starting value */
+@@ -152,19 +131,19 @@ typedef struct {
+ } MenuRule;
+ 
+ /* requested language(s) */
+-char **languages;
++extern char **languages;
+ 
+ /* list of menu files to monitor */
+-GSList *MenuFiles;
++extern GSList *MenuFiles;
+ 
+ /* list of menu dirs to monitor */
+-GSList *MenuDirs;
++extern GSList *MenuDirs;
+ 
+ /* list of available app dirs */
+-GSList *AppDirs;
++extern GSList *AppDirs;
+ 
+ /* list of available dir dirs */
+-GSList *DirDirs;
++extern GSList *DirDirs;
+ 
+ /* parse and merge menu files */
+ MenuMenu *get_merged_menu(const char *file, FmXmlFile **xmlfile, GError **error);
+@@ -177,7 +156,7 @@ gboolean save_menu_cache(MenuMenu *layout, const char *menuname, const char *fil
+ void _free_layout_items(GList *data);
+ 
+ /* verbosity level */
+-gint verbose;
++extern gint verbose;
+ 
+ #define DBG if (verbose) g_debug
+ #define VDBG if (verbose > 1) g_debug
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index 7a11228ef0..fc4e0a4d84 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0964c689fcf4c21c6797ea87408416b6"
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 libfm-extra"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz \
+           file://0001-Support-gcc10-compilation.patch \
+"
 
 SRC_URI[md5sum] = "99999a0bca48b980105208760c8fd893"
 SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9273ec7"
@@ -16,5 +18,3 @@ SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.1/"
 
 inherit autotools gettext pkgconfig gtk-doc
-
-CFLAGS += "-fcommon"
-- 
2.17.1

