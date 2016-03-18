Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA3806FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:02:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2I92AhN017686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Mar 2016 02:02:10 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 02:02:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>
Date: Fri, 18 Mar 2016 05:01:44 -0400
Message-ID: <e7aec4307e51a9630d2884713e62d8e64d925869.1458282563.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/18] gcc-5.3/gcc-4.9:Reuse -fdebug-prefix-map to replace -ffile-prefix-map
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
X-List-Received-Date: Fri, 18 Mar 2016 09:02:12 -0000
Content-Type: text/plain

The oe-core may use external toolchain for compiling,
which did not support -ffile-prefix-map.

Since we use -fdebug-prefix-map to do the same thing,
so we could reuse it to replace -ffile-prefix-map.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch | 43 ++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 22783b2..87aa7da 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -88,6 +88,7 @@ SRC_URI = "\
     file://0070-libstdc-musl.patch \
     file://0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch \
     file://0072-support-ffile-prefix-map.patch \
+    file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
new file mode 100644
index 0000000..94e45ed
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
@@ -0,0 +1,43 @@
+From 5e10baff84038d26dc3d59b2412ba1db92cb8274 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 17 Mar 2016 00:34:01 -0400
+Subject: [PATCH 2/2] Reuse -fdebug-prefix-map to replace -ffile-prefix-map
+
+The oe-core may use external toolchain to compile,
+which may not support -ffile-prefix-map.
+
+Since we use -fdebug-prefix-map to do the same thing,
+so we could reuse it to replace -ffile-prefix-map.
+
+Upstream-Status: Inappropriate[oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/opts-global.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gcc/opts-global.c b/gcc/opts-global.c
+index 111884b..037f6c8 100644
+--- a/gcc/opts-global.c
++++ b/gcc/opts-global.c
+@@ -42,6 +42,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "toplev.h"
+ #include "tree-pass.h"
+ #include "context.h"
++#include "file-map.h"
+ 
+ typedef const char *const_char_p; /* For DEF_VEC_P.  */
+ 
+@@ -354,6 +355,9 @@ handle_common_deferred_options (void)
+ 
+ 	case OPT_fdebug_prefix_map_:
+ 	  add_debug_prefix_map (opt->arg);
++
++	  /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
++	  add_file_prefix_map (opt->arg);
+ 	  break;
+ 
+ 	case OPT_fdump_:
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 4861cfc..aa011fd 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -84,6 +84,7 @@ SRC_URI = "\
            file://0052-nios2-use-ret-with-r31.patch \
            file://0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch \
            file://0054-support-ffile-prefix-map.patch \
+           file://0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
new file mode 100644
index 0000000..c7caed8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
@@ -0,0 +1,43 @@
+From 14b79641ff6b0008aef7fbf7aa300daec11d1e78 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Mar 2016 05:39:59 -0400
+Subject: [PATCH] Reuse -fdebug-prefix-map to replace -ffile-prefix-map
+
+The oe-core may use external toolchain to compile,
+which may not support -ffile-prefix-map.
+
+Since we use -fdebug-prefix-map to do the same thing,
+so we could reuse it to replace -ffile-prefix-map.
+
+Upstream-Status: Inappropriate[oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/opts-global.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gcc/opts-global.c b/gcc/opts-global.c
+index b61bdcf..51bb177 100644
+--- a/gcc/opts-global.c
++++ b/gcc/opts-global.c
+@@ -50,6 +50,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "rtl.h"
+ #include "dbgcnt.h"
+ #include "debug.h"
++#include "file-map.h"
+ #include "hash-map.h"
+ #include "plugin-api.h"
+ #include "ipa-ref.h"
+@@ -378,6 +379,9 @@ handle_common_deferred_options (void)
+ 
+ 	case OPT_fdebug_prefix_map_:
+ 	  add_debug_prefix_map (opt->arg);
++
++	  /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
++	  add_file_prefix_map (opt->arg);
+ 	  break;
+ 
+ 	case OPT_fdump_:
+-- 
+1.9.1
+
-- 
1.9.1


