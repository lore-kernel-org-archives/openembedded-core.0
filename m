Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9200160272
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 11:24:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2018 04:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,344,1534834800"; d="scan'208";a="76432897"
Received: from varadata-mobl7.amr.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.249.71.227])
	by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2018 04:24:04 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 19:24:01 +0800
Message-Id: <20181005112401.12949-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] strace: fix ptests
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
X-List-Received-Date: Fri, 05 Oct 2018 11:24:04 -0000

* Let automake use parallel test harness which ensures that appropriate
environment variables are actually used.

* Copy generated config.h as part of ptest package and define a variable
in tests Makefile to control the name of target that we'd like to
invoke for tests instead of relying on default value.

* configure relies on tools that are not available in release tarballs
resulting in warnings and failed tests. Get the required information
from available files instead.

* Reduces the count of failing tests to 18 from 35. The rest of
tests fail or get skipped mostly because of missing syscalls. Number of
tests getting skipped can probably be reduced further.

Fixes [YOCTO #12948]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../strace/strace/Makefile-ptest.patch        | 35 ++++++++-----------
 .../strace/disable-git-version-gen.patch      | 31 ++++++++++++----
 meta/recipes-devtools/strace/strace/run-ptest |  2 +-
 meta/recipes-devtools/strace/strace_4.24.bb   |  2 ++
 4 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index a12f4c3e45..460b6e26ee 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,36 +1,31 @@
-From 0574ae9926308dcbca78bd8cd0f0f143f19cbcb5 Mon Sep 17 00:00:00 2001
+From 207fc7814bbeb0241382329215d21fd3b57066f9 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
-Subject: [PATCH 4/8] strace: Add ptest
+Subject: [PATCH] strace: Add ptest
 
 Upstream-Status: Inappropriate
 
 Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
 ---
- configure.ac      |  2 +-
- tests/Makefile.am | 18 ++++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
+ tests/Makefile.am | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index 5f0aec4..8eaacc6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -42,7 +42,7 @@ AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
- AC_CONFIG_SRCDIR([strace.c])
- AC_CONFIG_AUX_DIR([.])
- AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests 1.13])
-+AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules serial-tests 1.13])
- AM_MAINTAINER_MODE
- AC_CANONICAL_HOST
- 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index b4ba22a..5836438 100644
+index a2f3950..4fa97e2 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -408,3 +408,21 @@ BUILT_SOURCES = ksysent.h
+@@ -34,6 +34,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+ MPERS_NAME =
+ MPERS_CC_FLAGS =
+ ARCH_MFLAGS =
++TEST_SUITE_LOG = test-suite.log
+ AM_CFLAGS = $(WARN_CFLAGS)
+ AM_CPPFLAGS = $(ARCH_MFLAGS) \
+ 	      -I$(builddir) \
+@@ -490,3 +491,21 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../scno.am
diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
index 47b1139c53..9e5ec11097 100644
--- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
+++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -1,15 +1,25 @@
-The git-version-gen script is not included in tarball releases,
-so we need to avoid attempts to call it when running autoreconf.
+From bee0680754730498485e24dd037303318c68916c Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 18 Jan 2016 13:33:50 -0800
+Subject: [PATCH] strace: remove need for scripts
+
+git-version-gen copyright-year-gen file-date-gen are not included in
+tarball releases, so we need to avoid attempts to call them.
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: strace-4.22/configure.ac
-===================================================================
---- strace-4.22.orig/configure.ac
-+++ strace-4.22/configure.ac
-@@ -32,7 +32,7 @@
+diff --git a/configure.ac b/configure.ac
+index ad1d00f..96fa205 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,12 +32,12 @@
  
  AC_PREREQ(2.57)
  AC_INIT([strace],
@@ -18,3 +28,10 @@ Index: strace-4.22/configure.ac
  	[strace-devel@lists.strace.io],
  	[strace],
  	[https://strace.io])
+-m4_define([copyright_year], m4_esyscmd([./copyright-year-gen .year]))
+-m4_define([manpage_date], m4_esyscmd([./file-date-gen strace.1.in]))
++m4_define([copyright_year], m4_esyscmd_s([cat .year]))
++m4_define([manpage_date], m4_esyscmd_s([cat .strace.1.in.date]))
+ AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
+ AC_CONFIG_SRCDIR([strace.c])
+ AC_CONFIG_AUX_DIR([.])
diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 133cf92d02..8070d83179 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-make -C tests -k runtest-TESTS
+make -B -C tests -k test-suite.log
diff --git a/meta/recipes-devtools/strace/strace_4.24.bb b/meta/recipes-devtools/strace/strace_4.24.bb
index e6f7e9cba7..9e40a064f8 100644
--- a/meta/recipes-devtools/strace/strace_4.24.bb
+++ b/meta/recipes-devtools/strace/strace_4.24.bb
@@ -44,6 +44,8 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
+	install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
+	install -m 644 ${B}/config.h ${D}${PTEST_PATH}
 	sed -i -e '/^src/s/strace.*[1-9]/ptest/' \
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-- 
2.17.1


