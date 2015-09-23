Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4E44D73CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 07:32:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Sep 2015 00:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="811154409"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2015 00:32:39 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 10:34:56 +0300
Message-Id: <1442993696-27930-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b071803e9da9773dd43ae0c4bc651bbac6c18b2.1442922193.git.jussi.kukkonen@intel.com>
References: <3b071803e9da9773dd43ae0c4bc651bbac6c18b2.1442922193.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 1/1] gmp: Use __gnu_inline__ attribute in 4.2.1
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
X-List-Received-Date: Wed, 23 Sep 2015 07:32:41 -0000

gcc 5 defaults to C11 rules about "extern inline": this breaks
any code that includes gmp.h header from gmp 4.2.1 with 'multiple
definition' errors.

disable-stdc patch is no longer required because of this.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---


Changes since v1: I was rightly reminded backporting things from
incompatible licenses would be The Most Wrong Thing. This patch
is not quite as complete (as it changes behaviour for all gcc
versions) but it is all my work and should work fine for us.

Thanks/Sorry,
  Jussi


 .../gmp-4.2.1/Use-__gnu_inline__-attribute.patch   | 36 ++++++++++++++++++++
 .../gmp/gmp-4.2.1/disable-stdc.patch               | 39 ----------------------
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  2 +-
 3 files changed, 37 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/Use-__gnu_inline__-attribute.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/Use-__gnu_inline__-attribute.patch b/meta/recipes-support/gmp/gmp-4.2.1/Use-__gnu_inline__-attribute.patch
new file mode 100644
index 0000000..627d71a
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/Use-__gnu_inline__-attribute.patch
@@ -0,0 +1,36 @@
+From 3cb33502bafd04b8ad4ca3454fab16d5ff313297 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 22 Sep 2015 13:16:23 +0300
+Subject: [PATCH]  Use __gnu_inline__ attribute
+
+gcc5 uses C11 inline rules. This means the old "extern inline"
+semantics are not available without a special attribute.
+
+See: https://gcc.gnu.org/gcc-5/porting_to.html
+
+Upstream-Status: Inappropriate [Fixed in current versions]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gmp-h.in | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gmp-h.in b/gmp-h.in
+index eed6fe4..361dd1d 100644
+--- a/gmp-h.in
++++ b/gmp-h.in
+@@ -419,8 +419,11 @@ typedef __mpq_struct *mpq_ptr;
+ /* gcc has __inline__ in all modes, including strict ansi.  Give a prototype
+    for an inline too, so as to correctly specify "dllimport" on windows, in
+    case the function is called rather than inlined.  */
++
++/* Use __gnu_inline__ attribute: later gcc uses different "extern inline"
++   behaviour */
+ #ifdef __GNUC__
+-#define __GMP_EXTERN_INLINE      extern __inline__
++#define __GMP_EXTERN_INLINE      extern __inline__ __attribute__ ((__gnu_inline__))
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
index 928c01a..bfc6a38 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://gmp-h.in;beginline=6;endline=21;md5=e056f74a12c3277d730dbcfb85d2ca34"
 
-SRC_URI += "file://disable-stdc.patch \
+SRC_URI += "file://Use-__gnu_inline__-attribute.patch \
             file://gmp_fix_for_automake-1.12.patch \
             "
 
-- 
2.1.4


