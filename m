Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD227937D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 07:52:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U7q6m9017368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 00:52:06 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 00:52:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 15:52:03 +0800
Message-ID: <1535615523-101240-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libjpeg-turbo: fix wrongly defined HAVE_STDLIB_H
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
X-List-Received-Date: Thu, 30 Aug 2018 07:52:07 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

After uprade to 2.0.0, build system change from
autotools to cmake, wrong usage of #cmakedefine
cause wrongly defined HAVE_STDLIB_H, which cause
some other package compile failed.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...bo-fix-wrongly-defined-define-HAVE_STDLIB.patch | 119 +++++++++++++++++++++
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb  |   3 +-
 2 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch

diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch
new file mode 100644
index 0000000..16767eb
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch
@@ -0,0 +1,119 @@
+From d301019d0f23d12b9666d3d88b0859067a4ade77 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 30 Aug 2018 15:08:23 +0800
+Subject: [PATCH] libjpeg-turbo: fix wrongly defined define HAVE_STDLIB_H
+
+when change build system from autotools to cmake, below
+part is replace wrongly:
+
+"#undef HAVE_STDLIB_H"
+should be change to "#cmakedefine HAVE_STDLIB_H 1"
+not "#cmakedefine HAVE_STDLIB_H"
+
+otherwise, even if stdlib.h is found, output file
+of configure_file() will define like: #define HAVE_STDLIB_H
+but we need it as #define HAVE_STDLIB_H 1, since for
+different defination of HAVE_STDLIB_H will cause below error:
+error: "HAVE_STDLIB_H" redefined [-Werror]
+
+Upstream-Status: Submitted[https://github.com/libjpeg-turbo/libjpeg-turbo/pull/275]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ jconfig.h.in    | 28 ++++++++++++++--------------
+ jconfigint.h.in |  4 ++--
+ 2 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/jconfig.h.in b/jconfig.h.in
+index 2842754..18a69a4 100644
+--- a/jconfig.h.in
++++ b/jconfig.h.in
+@@ -10,16 +10,16 @@
+ #define LIBJPEG_TURBO_VERSION_NUMBER  @LIBJPEG_TURBO_VERSION_NUMBER@
+ 
+ /* Support arithmetic encoding */
+-#cmakedefine C_ARITH_CODING_SUPPORTED
++#cmakedefine C_ARITH_CODING_SUPPORTED 1
+ 
+ /* Support arithmetic decoding */
+-#cmakedefine D_ARITH_CODING_SUPPORTED
++#cmakedefine D_ARITH_CODING_SUPPORTED 1
+ 
+ /* Support in-memory source/destination managers */
+-#cmakedefine MEM_SRCDST_SUPPORTED
++#cmakedefine MEM_SRCDST_SUPPORTED 1
+ 
+ /* Use accelerated SIMD routines. */
+-#cmakedefine WITH_SIMD
++#cmakedefine WITH_SIMD 1
+ 
+ /*
+  * Define BITS_IN_JSAMPLE as either
+@@ -33,37 +33,37 @@
+ #define BITS_IN_JSAMPLE  @BITS_IN_JSAMPLE@      /* use 8 or 12 */
+ 
+ /* Define to 1 if you have the <locale.h> header file. */
+-#cmakedefine HAVE_LOCALE_H
++#cmakedefine HAVE_LOCALE_H 1
+ 
+ /* Define to 1 if you have the <stddef.h> header file. */
+-#cmakedefine HAVE_STDDEF_H
++#cmakedefine HAVE_STDDEF_H 1
+ 
+ /* Define to 1 if you have the <stdlib.h> header file. */
+-#cmakedefine HAVE_STDLIB_H
++#cmakedefine HAVE_STDLIB_H 1
+ 
+ /* Define if you need to include <sys/types.h> to get size_t. */
+-#cmakedefine NEED_SYS_TYPES_H
++#cmakedefine NEED_SYS_TYPES_H 1
+ 
+ /* Define if you have BSD-like bzero and bcopy in <strings.h> rather than
+    memset/memcpy in <string.h>. */
+-#cmakedefine NEED_BSD_STRINGS
++#cmakedefine NEED_BSD_STRINGS 1
+ 
+ /* Define to 1 if the system has the type `unsigned char'. */
+-#cmakedefine HAVE_UNSIGNED_CHAR
++#cmakedefine HAVE_UNSIGNED_CHAR 1
+ 
+ /* Define to 1 if the system has the type `unsigned short'. */
+-#cmakedefine HAVE_UNSIGNED_SHORT
++#cmakedefine HAVE_UNSIGNED_SHORT 1
+ 
+ /* Compiler does not support pointers to undefined structures. */
+-#cmakedefine INCOMPLETE_TYPES_BROKEN
++#cmakedefine INCOMPLETE_TYPES_BROKEN 1
+ 
+ /* Define if your (broken) compiler shifts signed values as if they were
+    unsigned. */
+-#cmakedefine RIGHT_SHIFT_IS_UNSIGNED
++#cmakedefine RIGHT_SHIFT_IS_UNSIGNED 1
+ 
+ /* Define to 1 if type `char' is unsigned and you are not using gcc.  */
+ #ifndef __CHAR_UNSIGNED__
+-  #cmakedefine __CHAR_UNSIGNED__
++  #cmakedefine __CHAR_UNSIGNED__ 1
+ #endif
+ 
+ /* Define to empty if `const' does not conform to ANSI C. */
+diff --git a/jconfigint.h.in b/jconfigint.h.in
+index 55df053..6c898ac 100644
+--- a/jconfigint.h.in
++++ b/jconfigint.h.in
+@@ -17,10 +17,10 @@
+ #define SIZEOF_SIZE_T  @SIZE_T@
+ 
+ /* Define if your compiler has __builtin_ctzl() and sizeof(unsigned long) == sizeof(size_t). */
+-#cmakedefine HAVE_BUILTIN_CTZL
++#cmakedefine HAVE_BUILTIN_CTZL 1
+ 
+ /* Define to 1 if you have the <intrin.h> header file. */
+-#cmakedefine HAVE_INTRIN_H
++#cmakedefine HAVE_INTRIN_H 1
+ 
+ #if defined(_MSC_VER) && defined(HAVE_INTRIN_H)
+ #if (SIZEOF_SIZE_T == 8)
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
index 7737a59..282bf95 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
@@ -11,7 +11,8 @@ DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://0001-libjpeg-turbo-fix-package_qa-error.patch"
+           file://0001-libjpeg-turbo-fix-package_qa-error.patch \
+           file://0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch"
 
 SRC_URI[md5sum] = "b12a3fcf1d078db38410f27718a91b83"
 SRC_URI[sha256sum] = "778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868"
-- 
2.7.4


