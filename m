Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 482CE79F39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:43:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2018 00:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,376,1539673200"; d="scan'208";a="112046153"
Received: from lwong-mobl2.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.137.224])
	by orsmga003.jf.intel.com with ESMTP; 20 Dec 2018 00:43:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 16:43:33 +0800
Message-Id: <20181220084336.7294-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181220084336.7294-1-anuj.mittal@intel.com>
References: <20181220084336.7294-1-anuj.mittal@intel.com>
Subject: [PATCH 2/5] libjpeg-turbo: upgrade 2.0.0 -> 2.0.1
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
X-List-Received-Date: Thu, 20 Dec 2018 08:43:39 -0000

* For changes, see:
https://github.com/libjpeg-turbo/libjpeg-turbo/blob/master/ChangeLog.md

* Removed upstreamed patch

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...1-libjpeg-turbo-fix-package_qa-error.patch |  18 +--
 ...x-wrongly-defined-define-HAVE_STDLIB.patch | 119 ------------------
 ...-turbo_2.0.0.bb => libjpeg-turbo_2.0.1.bb} |   6 +-
 3 files changed, 12 insertions(+), 131 deletions(-)
 delete mode 100644 meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.0.bb => libjpeg-turbo_2.0.1.bb} (92%)

diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
index 44c2c768b2..6f3d201b21 100644
--- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
@@ -1,4 +1,4 @@
-From 0a24f03a67425a7b58b3fd40d965c0c9801ae7a1 Mon Sep 17 00:00:00 2001
+From ce3bd4f0e46f738a9aec098e7c341ad6deeab9f2 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 27 Aug 2018 16:10:55 +0800
 Subject: [PATCH] libjpeg-turbo: fix package_qa error
@@ -10,23 +10,23 @@ usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
 Upstream-Status: Inappropriate[oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
- CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
+ CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1719522..682cef1 100644
+index efeb51a..bbebe55 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -109,8 +109,6 @@ endif()
+@@ -109,10 +109,6 @@ endif()
  
  include(cmakescripts/GNUInstallDirs.cmake)
  
--set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
+-if(ENABLE_SHARED)
+-  set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
+-endif()
 -
  macro(report_directory var)
    if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
      message(STATUS "CMAKE_INSTALL_${var} = ${CMAKE_INSTALL_${var}}")
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch
deleted file mode 100644
index 16767ebb6b..0000000000
--- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From d301019d0f23d12b9666d3d88b0859067a4ade77 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 30 Aug 2018 15:08:23 +0800
-Subject: [PATCH] libjpeg-turbo: fix wrongly defined define HAVE_STDLIB_H
-
-when change build system from autotools to cmake, below
-part is replace wrongly:
-
-"#undef HAVE_STDLIB_H"
-should be change to "#cmakedefine HAVE_STDLIB_H 1"
-not "#cmakedefine HAVE_STDLIB_H"
-
-otherwise, even if stdlib.h is found, output file
-of configure_file() will define like: #define HAVE_STDLIB_H
-but we need it as #define HAVE_STDLIB_H 1, since for
-different defination of HAVE_STDLIB_H will cause below error:
-error: "HAVE_STDLIB_H" redefined [-Werror]
-
-Upstream-Status: Submitted[https://github.com/libjpeg-turbo/libjpeg-turbo/pull/275]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- jconfig.h.in    | 28 ++++++++++++++--------------
- jconfigint.h.in |  4 ++--
- 2 files changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/jconfig.h.in b/jconfig.h.in
-index 2842754..18a69a4 100644
---- a/jconfig.h.in
-+++ b/jconfig.h.in
-@@ -10,16 +10,16 @@
- #define LIBJPEG_TURBO_VERSION_NUMBER  @LIBJPEG_TURBO_VERSION_NUMBER@
- 
- /* Support arithmetic encoding */
--#cmakedefine C_ARITH_CODING_SUPPORTED
-+#cmakedefine C_ARITH_CODING_SUPPORTED 1
- 
- /* Support arithmetic decoding */
--#cmakedefine D_ARITH_CODING_SUPPORTED
-+#cmakedefine D_ARITH_CODING_SUPPORTED 1
- 
- /* Support in-memory source/destination managers */
--#cmakedefine MEM_SRCDST_SUPPORTED
-+#cmakedefine MEM_SRCDST_SUPPORTED 1
- 
- /* Use accelerated SIMD routines. */
--#cmakedefine WITH_SIMD
-+#cmakedefine WITH_SIMD 1
- 
- /*
-  * Define BITS_IN_JSAMPLE as either
-@@ -33,37 +33,37 @@
- #define BITS_IN_JSAMPLE  @BITS_IN_JSAMPLE@      /* use 8 or 12 */
- 
- /* Define to 1 if you have the <locale.h> header file. */
--#cmakedefine HAVE_LOCALE_H
-+#cmakedefine HAVE_LOCALE_H 1
- 
- /* Define to 1 if you have the <stddef.h> header file. */
--#cmakedefine HAVE_STDDEF_H
-+#cmakedefine HAVE_STDDEF_H 1
- 
- /* Define to 1 if you have the <stdlib.h> header file. */
--#cmakedefine HAVE_STDLIB_H
-+#cmakedefine HAVE_STDLIB_H 1
- 
- /* Define if you need to include <sys/types.h> to get size_t. */
--#cmakedefine NEED_SYS_TYPES_H
-+#cmakedefine NEED_SYS_TYPES_H 1
- 
- /* Define if you have BSD-like bzero and bcopy in <strings.h> rather than
-    memset/memcpy in <string.h>. */
--#cmakedefine NEED_BSD_STRINGS
-+#cmakedefine NEED_BSD_STRINGS 1
- 
- /* Define to 1 if the system has the type `unsigned char'. */
--#cmakedefine HAVE_UNSIGNED_CHAR
-+#cmakedefine HAVE_UNSIGNED_CHAR 1
- 
- /* Define to 1 if the system has the type `unsigned short'. */
--#cmakedefine HAVE_UNSIGNED_SHORT
-+#cmakedefine HAVE_UNSIGNED_SHORT 1
- 
- /* Compiler does not support pointers to undefined structures. */
--#cmakedefine INCOMPLETE_TYPES_BROKEN
-+#cmakedefine INCOMPLETE_TYPES_BROKEN 1
- 
- /* Define if your (broken) compiler shifts signed values as if they were
-    unsigned. */
--#cmakedefine RIGHT_SHIFT_IS_UNSIGNED
-+#cmakedefine RIGHT_SHIFT_IS_UNSIGNED 1
- 
- /* Define to 1 if type `char' is unsigned and you are not using gcc.  */
- #ifndef __CHAR_UNSIGNED__
--  #cmakedefine __CHAR_UNSIGNED__
-+  #cmakedefine __CHAR_UNSIGNED__ 1
- #endif
- 
- /* Define to empty if `const' does not conform to ANSI C. */
-diff --git a/jconfigint.h.in b/jconfigint.h.in
-index 55df053..6c898ac 100644
---- a/jconfigint.h.in
-+++ b/jconfigint.h.in
-@@ -17,10 +17,10 @@
- #define SIZEOF_SIZE_T  @SIZE_T@
- 
- /* Define if your compiler has __builtin_ctzl() and sizeof(unsigned long) == sizeof(size_t). */
--#cmakedefine HAVE_BUILTIN_CTZL
-+#cmakedefine HAVE_BUILTIN_CTZL 1
- 
- /* Define to 1 if you have the <intrin.h> header file. */
--#cmakedefine HAVE_INTRIN_H
-+#cmakedefine HAVE_INTRIN_H 1
- 
- #if defined(_MSC_VER) && defined(HAVE_INTRIN_H)
- #if (SIZEOF_SIZE_T == 8)
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
similarity index 92%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index 282bf95e8a..72706be674 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -12,10 +12,10 @@ DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
-           file://0001-libjpeg-turbo-fix-wrongly-defined-define-HAVE_STDLIB.patch"
+           "
 
-SRC_URI[md5sum] = "b12a3fcf1d078db38410f27718a91b83"
-SRC_URI[sha256sum] = "778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868"
+SRC_URI[md5sum] = "1b05a66aa9b006fd04ed29f408e68f46"
+SRC_URI[sha256sum] = "e5f86cec31df1d39596e0cca619ab1b01f99025a27dafdfc97a30f3a12f866ff"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.17.1


