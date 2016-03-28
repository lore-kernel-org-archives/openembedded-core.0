Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D65646018C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S8JAYG007002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 01:19:11 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:46 -0400
Message-ID: <af1acc0204a2ebab23b21d01ca005e5c3953aa5e.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/17] gcc-5.3/gcc-4.9: -fdebug-prefix-map support to remap relative path
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:12 -0000
Content-Type: text/plain

For relative path in DWARF, -fdebug-prefix-map could not remap it,
so translate to real path before mapping.

[YOCTO #9305]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...prefix-map-support-to-remap-relative-path.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 ...prefix-map-support-to-remap-relative-path.patch | 51 ++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-support-to-remap-relative-path.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0056-fdebug-prefix-map-support-to-remap-relative-path.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 87aa7da..7e03f31 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -89,6 +89,7 @@ SRC_URI = "\
     file://0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch \
     file://0072-support-ffile-prefix-map.patch \
     file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
+    file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-support-to-remap-relative-path.patch b/meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-support-to-remap-relative-path.patch
new file mode 100644
index 0000000..0b91fdb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-support-to-remap-relative-path.patch
@@ -0,0 +1,51 @@
+From 289ad2969a5966c603bf6928ce442db74c4cbb25 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 24 Mar 2016 11:23:14 -0400
+Subject: [PATCH] gcc/final.c: -fdebug-prefix-map support to remap sources with
+ relative path
+
+PR other/70428
+* final.c (remap_debug_filename): Use lrealpath to translate
+relative path before remapping
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70428
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+diff --git a/gcc/final.c b/gcc/final.c
+index 55cf509..c3594c2 100644
+--- a/gcc/final.c
++++ b/gcc/final.c
+@@ -1554,16 +1554,25 @@ remap_debug_filename (const char *filename)
+   const char *name;
+   size_t name_len;
+ 
++  /* Support to remap filename with relative path  */
++  char *realpath = lrealpath (filename);
++  if (realpath == NULL)
++    return filename;
++
+   for (map = debug_prefix_maps; map; map = map->next)
+-    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++    if (filename_ncmp (realpath, map->old_prefix, map->old_len) == 0)
+       break;
+   if (!map)
+-    return filename;
+-  name = filename + map->old_len;
++    {
++      free (realpath);
++      return filename;
++    }
++  name = realpath + map->old_len;
+   name_len = strlen (name) + 1;
+   s = (char *) alloca (name_len + map->new_len);
+   memcpy (s, map->new_prefix, map->new_len);
+   memcpy (s + map->new_len, name, name_len);
++  free (realpath);
+   return ggc_strdup (s);
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index aa011fd..aa5645e 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -85,6 +85,7 @@ SRC_URI = "\
            file://0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch \
            file://0054-support-ffile-prefix-map.patch \
            file://0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
+           file://0056-fdebug-prefix-map-support-to-remap-relative-path.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0056-fdebug-prefix-map-support-to-remap-relative-path.patch b/meta/recipes-devtools/gcc/gcc-5.3/0056-fdebug-prefix-map-support-to-remap-relative-path.patch
new file mode 100644
index 0000000..0b91fdb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0056-fdebug-prefix-map-support-to-remap-relative-path.patch
@@ -0,0 +1,51 @@
+From 289ad2969a5966c603bf6928ce442db74c4cbb25 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 24 Mar 2016 11:23:14 -0400
+Subject: [PATCH] gcc/final.c: -fdebug-prefix-map support to remap sources with
+ relative path
+
+PR other/70428
+* final.c (remap_debug_filename): Use lrealpath to translate
+relative path before remapping
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70428
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+diff --git a/gcc/final.c b/gcc/final.c
+index 55cf509..c3594c2 100644
+--- a/gcc/final.c
++++ b/gcc/final.c
+@@ -1554,16 +1554,25 @@ remap_debug_filename (const char *filename)
+   const char *name;
+   size_t name_len;
+ 
++  /* Support to remap filename with relative path  */
++  char *realpath = lrealpath (filename);
++  if (realpath == NULL)
++    return filename;
++
+   for (map = debug_prefix_maps; map; map = map->next)
+-    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++    if (filename_ncmp (realpath, map->old_prefix, map->old_len) == 0)
+       break;
+   if (!map)
+-    return filename;
+-  name = filename + map->old_len;
++    {
++      free (realpath);
++      return filename;
++    }
++  name = realpath + map->old_len;
+   name_len = strlen (name) + 1;
+   s = (char *) alloca (name_len + map->new_len);
+   memcpy (s, map->new_prefix, map->new_len);
+   memcpy (s + map->new_len, name, name_len);
++  free (realpath);
+   return ggc_strdup (s);
+ }
+ 
+-- 
+2.7.4
+
-- 
1.9.1


