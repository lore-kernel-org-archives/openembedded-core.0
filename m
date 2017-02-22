Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D39772FE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:44:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1M1iWrM031611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:44:33 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 17:44:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 17:44:26 -0800
Message-ID: <dd53cad2d2b93aa6a4aa55162f15c26c973bbd45.1487727826.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487727826.git.liezhi.yang@windriver.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] strace: 4.15 -> 4.16
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
X-List-Received-Date: Wed, 22 Feb 2017 01:44:33 -0000
Content-Type: text/plain

* The license cheksum is changed becuase a new line is added:
  Copyright (C) 2001-2017 The strace developers.

* Remove use-asm-sgidefs.h.patch, it doesn't check sgidefs.h any more, it was
  use for building on mips, I checked it built well.

* Update Makefile-ptest.patch and disable-git-version-gen.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../strace/strace/Makefile-ptest.patch             | 13 +++---
 .../strace/strace/disable-git-version-gen.patch    | 18 ++++----
 .../strace/strace/use-asm-sgidefs.h.patch          | 51 ----------------------
 .../strace/{strace_4.15.bb => strace_4.16.bb}      |  7 ++-
 4 files changed, 19 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
 rename meta/recipes-devtools/strace/{strace_4.15.bb => strace_4.16.bb} (84%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 2b76e8a1118..876c2d8629b 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -10,25 +10,26 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
+index b2b03c6..464a9dc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -36,7 +36,7 @@ AC_INIT([strace],
+@@ -39,7 +39,7 @@ AC_COPYRIGHT([Copyright (C) 1999-2017 The strace developers.])
  AC_CONFIG_SRCDIR([strace.c])
  AC_CONFIG_AUX_DIR([.])
  AC_CONFIG_HEADERS([config.h])
 -AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests])
 +AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules serial-tests])
+ AM_EXTRA_RECURSIVE_TARGETS([check-valgrind])
  AM_MAINTAINER_MODE
  AC_CANONICAL_HOST
- 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 9023029..e1917fa 100644
+index 311d3bb..72f9022 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -784,3 +784,21 @@ ksysent.h: $(srcdir)/ksysent.sed
- 
- BUILT_SOURCES = ksysent.h
+@@ -960,3 +960,21 @@ $(objects): scno.h
  CLEANFILES = ksysent.h $(TESTS:=.tmp)
+ 
+ include ../scno.am
 +
 +buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
 +
diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
index 7bc143635f7..76daf3a3b73 100644
--- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
+++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -5,16 +5,16 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 
-Index: strace-4.10/configure.ac
-===================================================================
---- strace-4.10.orig/configure.ac
-+++ strace-4.10/configure.ac
-@@ -1,7 +1,7 @@
- dnl Process this file with autoconf to create configure.  Use autoreconf.
+diff --git a/configure.ac b/configure.ac
+index 7004bd3..b2b03c6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,7 +31,7 @@
+ 
  AC_PREREQ(2.57)
  AC_INIT([strace],
 -	m4_esyscmd([./git-version-gen .tarball-version]),
 +	m4_esyscmd_s([cat .tarball-version]),
- 	[strace-devel@lists.sourceforge.net])
- AC_CONFIG_SRCDIR([strace.c])
- AC_CONFIG_AUX_DIR([.])
+ 	[strace-devel@lists.sourceforge.net],
+ 	[strace],
+ 	[https://strace.io])
diff --git a/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch b/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
deleted file mode 100644
index db83d1130ec..00000000000
--- a/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2995245d7e3f46e8b3995002995ebd28beca7d55 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Fri, 5 Feb 2016 14:00:00 -0800
-Subject: [PATCH] use <asm/sgidefs.h>
-
-Build fix for MIPS with musl libc.
-
-The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
-but not by musl. Regardless of the libc, the kernel headers provide
-<asm/sgidefs.h> which provides the same definitions, so use that
-instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1524b9b..287e03d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -196,20 +196,20 @@ AC_SUBST(arch_mx32)
- if test "$arch" = mips; then
- 	AC_CACHE_CHECK([for _MIPS_SIM], [st_cv__MIPS_SIM],
- 		       [AC_COMPUTE_INT([st_cv__MIPS_SIM], [_MIPS_SIM],
--				       [#include <sgidefs.h>],
-+				       [#include <asm/sgidefs.h>],
- 				       [AC_MSG_ERROR([_MIPS_SIM cannot be determined])])])
- 
- 	AC_CACHE_CHECK([for MIPS ABI], [st_cv_mips_abi],
- 		[AC_COMPILE_IFELSE(
--			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
-+			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
- 					 [[int i[_MIPS_SIM == _MIPS_SIM_ABI32 ? 1 : - 1];]])],
- 			[st_cv_mips_abi=o32],
- 		[AC_COMPILE_IFELSE(
--			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
-+			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
- 					 [[int i[_MIPS_SIM == _MIPS_SIM_NABI32 ? 1 : - 1];]])],
- 			[st_cv_mips_abi=n32],
- 		[AC_COMPILE_IFELSE(
--			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
-+			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
- 					 [[int i[_MIPS_SIM == _MIPS_SIM_ABI64 ? 1 : - 1];]])],
- 			[st_cv_mips_abi=n64],
- 			[st_cv_mips_abi=unknown])])])])
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace_4.15.bb b/meta/recipes-devtools/strace/strace_4.16.bb
similarity index 84%
rename from meta/recipes-devtools/strace/strace_4.15.bb
rename to meta/recipes-devtools/strace/strace_4.16.bb
index c5983e9c394..b6cd2ac9b9e 100644
--- a/meta/recipes-devtools/strace/strace_4.15.bb
+++ b/meta/recipes-devtools/strace/strace_4.16.bb
@@ -2,13 +2,12 @@ SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=488acb3aaaf5d14a2e1a852d13668a70"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
            file://more-robust-test-for-m32-mx32-compile-support.patch \
            file://update-gawk-paths.patch \
-           file://use-asm-sgidefs.h.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
@@ -16,8 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            "
 
-SRC_URI[md5sum] = "1ff96209fec19914c920608ed0791864"
-SRC_URI[sha256sum] = "c0cdc094d6141fd9dbf6aaad605142d651ae10998b660fda57fc61f7ad583ca9"
+SRC_URI[md5sum] = "2873366cac98770efcbed6e748d5ef23"
+SRC_URI[sha256sum] = "98487cb5178ec1259986cc9f6e2a844f50e5d1208c112cc22431a1e4d9adf0ef"
 
 inherit autotools ptest bluetooth
 
-- 
2.11.0.rc2.dirty


