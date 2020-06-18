Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.10580.1592494952815733855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=adwkDdyA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id n6so4902532otl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O1w+iURfiNXDPg8TNGWEQAJbgq5tapdH9vkk1qwDThQ=;
        b=adwkDdyAaFW8Wg1aoV8PcCBEpYKNcWYfIMJiGEy0OMyaMN/rt+aIIJv0t3dkE7tkGy
         BI1oY+tixfpMiK/V2ssDBSjz4/VB/i8g1FxDbaF0wf0+qytGpscj6h/bROZ4nOwToIcQ
         jv9S9TIOkAE7wXOHvVCEFt6cVVxwfUcgGsp3CkeztpjUAGIDR8EsOyWF0VaHTfwiV8NJ
         eTxLygT0Zk1G3KlZi6hzit+UG37dAly9GtUSmZxwEF096PDrBMAErGEPf2VV8B/5Xu1C
         6x3z6dGRBPuTzAvOIU47kh6jQmbpsSSSdqKa+qLKbBMX+krS4UkZXUcgYzMv9yTivoXl
         RgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O1w+iURfiNXDPg8TNGWEQAJbgq5tapdH9vkk1qwDThQ=;
        b=bsd9ACJD75MbZZLeLLSPT/v/gyXLQYrcEHwqZEwa8Bj1ZKIMHXDx3cgl8hI/AskQxs
         xW2VSEcCCGLLBdy1quT1yToFeFQ7QtEI4esUbr4oJaLbC6AaIO5LxWqYx/e0ooo/uDTC
         sLm6CRjIQMpnTwQMQPw3n8n7xT+bTbQikD1VnWXfuVB48l9htMP8NdC+zBfvaWRElXD8
         PShYy4ZKeoEPDleF2ruvHAW6MsP2WjVMjh3rBANZ72xbLfpHtBgTNk/7QqaH2ZDWVhDT
         8DagXB16hwZGK07hWAILDgE/zvfKH0UvOidwCHRI7VIQ+oE+WRhVeuuOWt8FMmj8wWRL
         koqw==
X-Gm-Message-State: AOAM532tRFcgYfiPSEBjnMBInZua5snXKmXx1nWg5wgr7kZj9Xyz5rv2
	5Bw1NXpRWvTiAZ2tLpj+y+9/MnM6ZBq9TQ==
X-Google-Smtp-Source: ABdhPJwNm13QqMNiQNjHgIPSZ9QOgvtDqMJwJtF9cooYxVqVeAoys0ZbKol5Dbh1PAldBxzfYAyQtA==
X-Received: by 2002:a9d:7e8d:: with SMTP id m13mr4001735otp.64.1592494951602;
        Thu, 18 Jun 2020 08:42:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/21] menu-cache: Replace -fcommon with fix
Date: Thu, 18 Jun 2020 05:40:42 -1000
Message-Id: <a0fb1e3eab57ce84d98b94d452d541149b8f6fb3.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97984f171b562f4ccaef527e6766b0e94697cf43)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

