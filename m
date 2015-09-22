Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 32E4E7391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:48:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2015 04:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,572,1437462000"; d="scan'208";a="810332024"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 04:48:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 14:50:40 +0300
Message-Id: <3b071803e9da9773dd43ae0c4bc651bbac6c18b2.1442922193.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1442922193.git.jussi.kukkonen@intel.com>
References: <cover.1442922193.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] gmp: Use __gnu_inline__ attribute in 4.2.1 with gcc 5
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
X-List-Received-Date: Tue, 22 Sep 2015 11:48:27 -0000

gcc 5 defaults to C11 rules about "extern inline": this breaks
any code that includes gmp.h header from gmp 4.2.1 with 'multiple
definition' errors. Backport a fix from 6.0.0.

disable-stdc patch is no longer required because of this.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../Use-gnu-inline-attribute-with-gcc-5.patch      | 45 ++++++++++++++++++++++
 .../gmp/gmp-4.2.1/disable-stdc.patch               | 39 -------------------
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  2 +-
 3 files changed, 46 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/Use-gnu-inline-attribute-with-gcc-5.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/Use-gnu-inline-attribute-with-gcc-5.patch b/meta/recipes-support/gmp/gmp-4.2.1/Use-gnu-inline-attribute-with-gcc-5.patch
new file mode 100644
index 0000000..fe78a0a
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/Use-gnu-inline-attribute-with-gcc-5.patch
@@ -0,0 +1,45 @@
+From 90e87be447c7b9ffe79b10746bafb24e673131a8 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 22 Sep 2015 13:16:23 +0300
+Subject: [PATCH] Use __gnu_inline__ attribute with gcc 5
+
+gcc5 uses C11 inline rules. This means the old "extern inline"
+semantics are not available without a special attribute.
+
+Upstream-Status: Backport
+See: https://gcc.gnu.org/gcc-5/porting_to.html
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gmp-h.in | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/gmp-h.in b/gmp-h.in
+index eed6fe4..59521dc 100644
+--- a/gmp-h.in
++++ b/gmp-h.in
+@@ -416,11 +416,18 @@ typedef __mpq_struct *mpq_ptr;
+    inline" would be an acceptable substitute if the compiler (or linker)
+    discards unused statics.  */
+ 
+-/* gcc has __inline__ in all modes, including strict ansi.  Give a prototype
+-   for an inline too, so as to correctly specify "dllimport" on windows, in
+-   case the function is called rather than inlined.  */
++ /* gcc has __inline__ in all modes, including strict ansi.  Give a prototype
++    for an inline too, so as to correctly specify "dllimport" on windows, in
++    case the function is called rather than inlined.
++    GCC 4.3 and above with -std=c99 or -std=gnu99 implements ISO C99
++    inline semantics, unless -fgnu89-inline is used.  */
+ #ifdef __GNUC__
++#if (defined __GNUC_STDC_INLINE__) || (__GNUC__ == 4 && __GNUC_MINOR__ == 2) \
++  || (defined __GNUC_GNU_INLINE__ && defined __cplusplus)
++#define __GMP_EXTERN_INLINE extern __inline__ __attribute__ ((__gnu_inline__))
++#else
+ #define __GMP_EXTERN_INLINE      extern __inline__
++#endif
+ #define __GMP_INLINE_PROTOTYPES  1
+ #endif
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch b/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
deleted file mode 100644
index 5decb1c..0000000
--- a/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-This patch was removed in f181c6ce8b3 when gmp 4.2.1 was mistakenly
-dropped.
-
-Upstream is not interested in patches for ancient versions.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-# "extern inline" in traditional gcc means that the function should be 
-# inlined wherever it's seen, while in C99, "extern inline" means that i
-# the function should only be inlined where the inline definition is 
-# seen while in other places it's not inlined:
-# http://gcc.gnu.org/ml/gcc/2006-11/msg00006.html
-#
-# gmp checks "--std=gnu99" to use C99 convention however it internally 
-# defines some "extern inline" functions in gmp.h, which is included
-# by mainly .c files and finally lead a flood of redefinition function
-# errors when linking objects together.
-#
-# So disable C99/ANSI detection to stick to tranditional gcc behavior
-#
-# by Kevin Tian <kevin.tian@intel.com>, 2010-08-13
-#
-# (this patch is licensed under GPLv2+)
-
-diff --git a/configure.in b/configure.in
-index 450cc92..aab0b59 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1869,9 +1869,7 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
- 
- # The C compiler and preprocessor, put into ANSI mode if possible.
- AC_PROG_CC
--AC_PROG_CC_STDC
- AC_PROG_CPP
--GMP_H_ANSI
- 
- 
- # The C compiler on the build system, and associated tests.
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 928c01a..ea7ace1 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://gmp-h.in;beginline=6;endline=21;md5=e056f74a12c3277d730dbcfb85d2ca34"
 
-SRC_URI += "file://disable-stdc.patch \
+SRC_URI += "file://Use-gnu-inline-attribute-with-gcc-5.patch \
             file://gmp_fix_for_automake-1.12.patch \
             "
 
-- 
2.1.4


