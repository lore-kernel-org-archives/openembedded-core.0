Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4F26067D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:59:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2016 06:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,539,1444719600"; d="scan'208";a="889143728"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jan 2016 06:59:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 16:57:04 +0200
Message-Id: <85cdca4e7e51ad4d7688e8629328ab6d2ae6c37f.1452264916.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
References: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
References: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/3] valgrind: update to 3.11.0
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
X-List-Received-Date: Fri, 08 Jan 2016 14:59:57 -0000

LICENSE checksums are changed due to a change in FSF address, or copyright
years update.

Added patches:
0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch replaces remove-ppc-tests-failing-build.patch
and removes only those tests that are known to break the build on ppc32 configurations tested by
poky autobuilders

Rebased patches:
sepbuildfix.patch rebased to 0004-Fix-out-of-tree-builds.patch
add-ptest.patch rebased to 0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch

Removed patches:
force-nostabs.patch removed because it's patching lines that have been removed upstream
remove-ppc-tests-failing-build.patch replaced with 0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
enable.building.on.4.x.kernel.patch removed because the problem is fixed upstream
glibc.patch removed for the same reason

Removed backports:
pass-maltivec-only-if-it-supported.patch
0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...s-that-fail-to-build-on-some-PPC32-config.patch |  51 +++++
 ...able-rt_sigpending-syscall-on-ppc64-linux.patch |  35 ---
 .../valgrind/valgrind/0002-remove-rpath.patch      |  35 +++
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 175 +++++++++++++++
 ...vg_test-wrapper-to-support-PTEST-formats.patch} |  87 ++++----
 .../valgrind/enable.building.on.4.x.kernel.patch   |  37 ----
 .../valgrind/valgrind/force-nostabs.patch          |  42 ----
 .../recipes-devtools/valgrind/valgrind/glibc.patch |  44 ----
 .../pass-maltivec-only-if-it-supported.patch       |  68 ------
 .../valgrind/remove-ppc-tests-failing-build.patch  |  75 -------
 .../valgrind/valgrind/sepbuildfix.patch            | 235 ---------------------
 .../{valgrind_3.10.1.bb => valgrind_3.11.0.bb}     |  33 ++-
 12 files changed, 324 insertions(+), 593 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
 rename meta/recipes-devtools/valgrind/valgrind/{add-ptest.patch => 0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch} (80%)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.10.1.bb => valgrind_3.11.0.bb} (77%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
new file mode 100644
index 0000000..a78e195
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
@@ -0,0 +1,51 @@
+From 9762fd23e1f1db66d4b977c694a17d3bca3fe99a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 8 Jan 2016 16:36:29 +0200
+Subject: [PATCH] Remove tests that fail to build on some PPC32 configurations
+
+Failures are documented here:
+http://errors.yoctoproject.org/Errors/Search/?items=10&query=862d702fbb99e484631315aa44b9e46f8fc567da&filter=valgrind&type=recipe
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Upstream-Status: Pending
+---
+ memcheck/tests/ppc32/Makefile.am | 2 +-
+ none/tests/ppc32/Makefile.am     | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/memcheck/tests/ppc32/Makefile.am b/memcheck/tests/ppc32/Makefile.am
+index 26b95a2..8f05743 100644
+--- a/memcheck/tests/ppc32/Makefile.am
++++ b/memcheck/tests/ppc32/Makefile.am
+@@ -10,7 +10,7 @@ EXTRA_DIST = $(noinst_SCRIPTS) \
+ 	power_ISA2_07.stderr.exp power_ISA2_07.vgtest
+ 
+ check_PROGRAMS = \
+-	power_ISA2_05 power_ISA2_07
++	power_ISA2_07
+ 
+ power_ISA2_05_CFLAGS = $(AM_CFLAGS) $(WERROR) -Winline -Wall -Wshadow -g \
+ 		-I$(top_srcdir)/include @FLAG_M32@
+diff --git a/none/tests/ppc32/Makefile.am b/none/tests/ppc32/Makefile.am
+index 196239e..0fe3425 100644
+--- a/none/tests/ppc32/Makefile.am
++++ b/none/tests/ppc32/Makefile.am
+@@ -50,13 +50,13 @@ EXTRA_DIST = \
+ 
+ check_PROGRAMS = \
+ 	allexec \
+-	lsw jm-insns round \
++	lsw \
+ 	test_isa_2_06_part1 test_isa_2_06_part2 test_isa_2_06_part3 \
+ 	test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
+ 	test_isa_2_07_part1 test_isa_2_07_part2 \
+ 	test_tm test_touch_tm ldst_multiple data-cache-instructions \
+ 	test_fx test_gx \
+-	testVMX twi tw xlc_dbl_u32 power5+_round power6_bcmp \
++	twi tw xlc_dbl_u32 power6_bcmp \
+ 	bug129390-ppc32 bug139050-ppc32 \
+ 	ldstrev mftocrf mcrfs
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
deleted file mode 100644
index 56bb5f5..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1a8006f56342dae9f7100a3c33d80873676e0404 Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Mon, 24 Aug 2015 03:55:18 -0400
-Subject: [PATCH] valgrind: Enable rt_sigpending syscall on ppc64 linux
-
-New Revision: 15133
-Enable rt_sigpending syscall on ppc64 linux.
-Patch from Thomas Huth <thuth@redhat.com>
-
-Get the patch from valgrind upstream:
-http://valgrind.10908.n7.nabble.com/Valgrind-r15133-in-trunk-NEWS-coregrind-m-syswrap-syswrap-ppc64-linux-c-td54589.html
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- coregrind/m_syswrap/syswrap-ppc64-linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
-index 5946ee1..8aaa1d7 100644
---- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
-@@ -887,7 +887,7 @@ static SyscallTableEntry syscall_table[] = {
-    LINXY(__NR_rt_sigaction,      sys_rt_sigaction),       // 173
-    LINXY(__NR_rt_sigprocmask,    sys_rt_sigprocmask),     // 174
- 
--// _____(__NR_rt_sigpending,     sys_rt_sigpending),      // 175
-+   LINXY(__NR_rt_sigpending,     sys_rt_sigpending),      // 175
-    LINXY(__NR_rt_sigtimedwait,   sys_rt_sigtimedwait),    // 176
-    LINXY(__NR_rt_sigqueueinfo,   sys_rt_sigqueueinfo),    // 177
-    LINX_(__NR_rt_sigsuspend,     sys_rt_sigsuspend),      // 178
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch b/meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
new file mode 100644
index 0000000..e9112da
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
@@ -0,0 +1,35 @@
+From f96cf1f4eaa72860ab8b5e18ad10fdc704d78c5f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 15 Dec 2015 15:01:34 +0200
+Subject: [PATCH 2/5] remove rpath
+
+Upstream-Status: Inappropriate [embedded config]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ none/tests/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/none/tests/Makefile.am b/none/tests/Makefile.am
+index 54f2a7e..25b0f49 100644
+--- a/none/tests/Makefile.am
++++ b/none/tests/Makefile.am
+@@ -326,7 +326,6 @@ threadederrno_CFLAGS	+= --std=c99
+ endif
+ tls_SOURCES		= tls.c tls2.c
+ tls_DEPENDENCIES	= tls.so tls2.so
+-tls_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests
+ tls_LDADD		= tls.so tls2.so -lpthread
+ tls_so_SOURCES		= tls_so.c
+ tls_so_DEPENDENCIES	= tls2.so
+@@ -334,7 +333,7 @@ if VGCONF_OS_IS_DARWIN
+  tls_so_LDFLAGS		= -dynamic -dynamiclib -all_load -fpic
+  tls_so_LDADD		= `pwd`/tls2.so
+ else
+- tls_so_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests -shared -fPIC
++ tls_so_LDFLAGS		= -shared -fPIC
+  tls_so_LDADD		= tls2.so
+ endif
+ tls_so_CFLAGS		= $(AM_CFLAGS) -fPIC
+-- 
+2.6.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
new file mode 100644
index 0000000..ed313d6
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -0,0 +1,175 @@
+From 38ae233b6893a4eec7f9ed6d8ad02392bca8eaed Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 15 Dec 2015 15:31:50 +0200
+Subject: [PATCH 1/2] Fix out of tree builds.
+
+The paths to these files need to be fully specified in
+the out of tree build case. glibc-2.X.supp is a generated file so the full path
+is deliberately not specified in that case.
+
+RP 2013/03/23
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ configure.ac | 64 ++++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8ab7f9b..9366dc7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -377,44 +377,44 @@ case "${host_os}" in
+ 	     9.*)
+ 		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+ 	     10.*)
+ 		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_6, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin10.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+ 	     11.*)
+ 		  AC_MSG_RESULT([Darwin 11.x (${kernel}) / Mac OS X 10.7 Lion])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_7, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin11.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin11.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+ 	     12.*)
+ 		  AC_MSG_RESULT([Darwin 12.x (${kernel}) / Mac OS X 10.8 Mountain Lion])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_8, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin12.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin12.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+ 	     13.*)
+ 		  AC_MSG_RESULT([Darwin 13.x (${kernel}) / Mac OS X 10.9 Mavericks])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_9, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin13.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin13.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+ 	     14.*)
+ 		  AC_MSG_RESULT([Darwin 14.x (${kernel}) / Mac OS X 10.10 Yosemite])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_10, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin14.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin14.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+ 	     15.*)
+ 		  AC_MSG_RESULT([Darwin 15.x (${kernel}) / Mac OS X 10.11 El Capitan])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_11, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin15.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
+              *) 
+ 		  AC_MSG_RESULT([unsupported (${kernel})])
+@@ -426,13 +426,13 @@ case "${host_os}" in
+      solaris2.11*)
+         AC_MSG_RESULT([ok (${host_os})])
+         VGCONF_OS="solaris"
+-        DEFAULT_SUPP="solaris11.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/solaris11.supp ${DEFAULT_SUPP}"
+         ;;
+ 
+      solaris2.12*)
+         AC_MSG_RESULT([ok (${host_os})])
+         VGCONF_OS="solaris"
+-        DEFAULT_SUPP="solaris12.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/solaris12.supp ${DEFAULT_SUPP}"
+         ;;
+ 
+      *) 
+@@ -1015,29 +1015,29 @@ AC_MSG_CHECKING([the glibc version])
+ case "${GLIBC_VERSION}" in
+      2.2)
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+-	DEFAULT_SUPP="glibc-2.2.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.2.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.[[3-6]])
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+-	DEFAULT_SUPP="glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.[[7-9]])
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+ 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.10|2.11)
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+ 	AC_DEFINE([GLIBC_MANDATORY_STRLEN_REDIRECT], 1,
+ 		  [Define to 1 if strlen() has been optimized heavily (amd64 glibc >= 2.10)])
+ 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      2.*)
+ 	AC_MSG_RESULT(${GLIBC_VERSION} family)
+@@ -1046,8 +1046,8 @@ case "${GLIBC_VERSION}" in
+ 	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
+ 		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
+ 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+-	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+@@ -1057,7 +1057,7 @@ case "${GLIBC_VERSION}" in
+      bionic)
+ 	AC_MSG_RESULT(Bionic)
+ 	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
+-	DEFAULT_SUPP="bionic.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/bionic.supp ${DEFAULT_SUPP}"
+ 	;;
+      solaris)
+ 	AC_MSG_RESULT(Solaris)
+@@ -1079,11 +1079,11 @@ if test "$VGCONF_OS" != "solaris"; then
+     # attempt to detect whether such libraries are installed on the
+     # build machine (or even if any X facilities are present); just
+     # add the suppressions antidisirregardless.
+-    DEFAULT_SUPP="xfree-4.supp ${DEFAULT_SUPP}"
+-    DEFAULT_SUPP="xfree-3.supp ${DEFAULT_SUPP}"
++    DEFAULT_SUPP="$srcdir/xfree-4.supp ${DEFAULT_SUPP}"
++    DEFAULT_SUPP="$srcdir/xfree-3.supp ${DEFAULT_SUPP}"
+ 
+     # Add glibc and X11 suppressions for exp-sgcheck
+-    DEFAULT_SUPP="exp-sgcheck.supp ${DEFAULT_SUPP}"
++    DEFAULT_SUPP="$srcdir/exp-sgcheck.supp ${DEFAULT_SUPP}"
+ fi
+ 
+ 
+-- 
+2.6.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
similarity index 80%
rename from meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
rename to meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index 225f843..f5ac989 100644
--- a/meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -1,4 +1,7 @@
-Modify vg_test wrapper to support PTEST formats
+From f49f27f1bc67d07440b0ac9a7d767a8ea1589bfe Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 15 Dec 2015 15:50:44 +0200
+Subject: [PATCH 5/5] Modify vg_test wrapper to support PTEST formats
 
 Change the valgrind regression test script vg_regtest to
 support the yocto ptest stdout reporting format.  The commit adds
@@ -15,51 +18,50 @@ Upstream-Status: Pending
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 55 insertions(+), 20 deletions(-)
 
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 224385f..3e0383b 100755
+index a441f42..cb05b52 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
-@@ -39,11 +39,11 @@
- #               --valgrind.)
- #   --keep-unfiltered: keep a copy of the unfiltered output/error output
- #     of each test by adding an extension .unfiltered.out
--#
- #   --outer-valgrind: run this valgrind under the given outer valgrind.
- #     This valgrind must be configured with --enable-inner.
- #   --outer-tool: tool to use by the outer valgrind (default memcheck).
- #   --outer-args: use this as outer tool args.
+@@ -47,6 +47,7 @@
+ #   --loop-till-fail: loops on the test(s) till one fail, then exit
+ #              This is useful to obtain detailed trace or --keep-unfiltered
+ #              output of a non deterministic test failure
 +#   --yocto-ptest: output in yocto ptest format
  #
  # The easiest way is to run all tests in valgrind/ with (assuming you installed
  # in $PREFIX):
-@@ -126,7 +126,7 @@ use strict;
- my $usage="\n"
+@@ -139,7 +140,7 @@ my $usage="\n"
       . "Usage:\n"
       . "   vg_regtest [--all, --valgrind, --valgrind-lib, --keep-unfiltered\n"
--     . "                 --outer-valgrind, --outer-tool, --outer-args]\n"
-+     . "                 --outer-valgrind, --outer-tool, --outer-args, --yocto-ptest]\n"
+      . "                 --outer-valgrind, --outer-tool, --outer-args\n"
+-     . "                 --loop-till-fail]\n"
++     . "                 --loop-till-fail, --yocto-ptest]\n"
       . "   Use EXTRA_REGTEST_OPTS to supply extra args for all tests\n"
       . "\n";
  
-@@ -170,6 +170,7 @@ my $outer_args;
- 
+@@ -186,6 +187,7 @@ my $outer_args;
  my $valgrind_lib = "$tests_dir/.in_place";
  my $keepunfiltered = 0;
+ my $looptillfail = 0;
 +my $yoctoptest = 0;
  
  # default filter is the one named "filter_stderr" in the test's directory
  my $default_stderr_filter = "filter_stderr";
-@@ -226,6 +227,8 @@ sub process_command_line()
-                 $valgrind_lib = $1;
-             } elsif ($arg =~ /^--keep-unfiltered$/) {
+@@ -244,6 +246,8 @@ sub process_command_line()
                  $keepunfiltered = 1;
+             } elsif ($arg =~ /^--loop-till-fail$/) {
+                 $looptillfail = 1;
 +            } elsif ($arg =~ /^--yocto-ptest$/) {
 +                $yoctoptest = 1;
              } else {
                  die $usage;
              }
-@@ -340,13 +343,28 @@ sub read_vgtest_file($)
+@@ -365,13 +369,28 @@ sub read_vgtest_file($)
  #----------------------------------------------------------------------------
  # Since most of the program time is spent in system() calls, need this to
  # propagate a Ctrl-C enabling us to quit.
@@ -93,12 +95,12 @@ index 224385f..3e0383b 100755
  # if $keepunfiltered, copies $1 to $1.unfiltered.out
  # renames $0 tp $1
  sub filtered_rename($$) 
-@@ -394,19 +412,21 @@ sub do_diffs($$$$)
+@@ -419,23 +438,25 @@ sub do_diffs($$$$)
                  # A match;  remove .out and any previously created .diff files.
                  unlink("$name.$mid.out");
                  unlink(<$name.$mid.diff*>);
 -                return;
-+                return 0;
++                return 1;
              }
          }
      }
@@ -107,7 +109,11 @@ index 224385f..3e0383b 100755
 +    print "*** $name failed ($mid) ***\n" if ($yoctoptest == 0) ;
      push(@failures, sprintf("%-40s ($mid)", "$fullname"));
      $num_failures{$mid}++;
-+    return 1;
+     if ($looptillfail == 1) {
+        print "Failure encountered, stopping to loop\n";
+        exit 1
+     }
++    return 0;
  }
  
  sub do_one_test($$) 
@@ -117,7 +123,7 @@ index 224385f..3e0383b 100755
      $vgtest =~ /^(.*)\.vgtest/;
      my $name = $1;
      my $fullname = "$dir/$name"; 
-@@ -425,7 +445,11 @@ sub do_one_test($$)
+@@ -454,7 +475,11 @@ sub do_one_test($$)
          } elsif (256 == $prereq_res) {
              # Nb: weird Perl-ism -- exit code of '1' is seen by Perl as 256...
              # Prereq failed, skip.
@@ -130,8 +136,8 @@ index 224385f..3e0383b 100755
              return;
          } else {
              # Bad prereq; abort.
-@@ -438,7 +462,7 @@ sub do_one_test($$)
-     if (defined $progB) {
+@@ -472,7 +497,7 @@ sub do_one_test($$)
+         }
          # If there is a progB, let's start it in background:
          printf("%-16s valgrind $extraopts $vgopts $prog $args (progB: $progB $argsB)\n",
 -               "$name:");
@@ -139,7 +145,7 @@ index 224385f..3e0383b 100755
          # progB.done used to detect child has finished. See below.
          # Note: redirection of stdout and stderr is before $progB to allow argsB
          # to e.g. redirect stdoutB to stderrB
-@@ -452,7 +476,8 @@ sub do_one_test($$)
+@@ -488,7 +513,8 @@ sub do_one_test($$)
                       . "touch progB.done)  &");
          }
      } else {
@@ -147,9 +153,9 @@ index 224385f..3e0383b 100755
 +        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:")
 +            if ($yoctoptest == 0);
      }
-  
-     # Pass the appropriate --tool option for the directory (can be overridden
-@@ -487,7 +512,7 @@ sub do_one_test($$)
+ 
+     # Collect environment variables, if any.
+@@ -529,7 +555,7 @@ sub do_one_test($$)
      # Find all the .stdout.exp files.  If none, use /dev/null.
      my @stdout_exps = <$name.stdout.exp*>;
      @stdout_exps = ( "/dev/null" ) if (0 == scalar @stdout_exps);
@@ -158,7 +164,7 @@ index 224385f..3e0383b 100755
  
      # Filter stderr
      $stderr_filter_args = $name if (! defined $stderr_filter_args);
-@@ -496,7 +521,7 @@ sub do_one_test($$)
+@@ -538,7 +564,7 @@ sub do_one_test($$)
      # Find all the .stderr.exp files.  At least one must exist.
      my @stderr_exps = <$name.stderr.exp*>;
      (0 != scalar @stderr_exps) or die "Could not find `$name.stderr.exp*'\n";
@@ -167,7 +173,7 @@ index 224385f..3e0383b 100755
  
      if (defined $progB) {
          # wait for the child to be finished
-@@ -520,7 +545,7 @@ sub do_one_test($$)
+@@ -562,7 +588,7 @@ sub do_one_test($$)
          # Find all the .stdoutB.exp files.  If none, use /dev/null.
          my @stdoutB_exps = <$name.stdoutB.exp*>;
          @stdoutB_exps = ( "/dev/null" ) if (0 == scalar @stdoutB_exps);
@@ -176,7 +182,7 @@ index 224385f..3e0383b 100755
          
          # Filter stderr
          $stderrB_filter_args = $name if (! defined $stderrB_filter_args);
-@@ -529,7 +554,7 @@ sub do_one_test($$)
+@@ -571,7 +597,7 @@ sub do_one_test($$)
          # Find all the .stderrB.exp files.  At least one must exist.
          my @stderrB_exps = <$name.stderrB.exp*>;
          (0 != scalar @stderrB_exps) or die "Could not find `$name.stderrB.exp*'\n";
@@ -185,7 +191,7 @@ index 224385f..3e0383b 100755
      }
  
      # Maybe do post-test check
-@@ -541,7 +566,7 @@ sub do_one_test($$)
+@@ -583,7 +609,7 @@ sub do_one_test($$)
  	    # Find all the .post.exp files.  If none, use /dev/null.
  	    my @post_exps = <$name.post.exp*>;
  	    @post_exps = ( "/dev/null" ) if (0 == scalar @post_exps);
@@ -194,7 +200,7 @@ index 224385f..3e0383b 100755
  	}
      }
   
-@@ -550,6 +575,13 @@ sub do_one_test($$)
+@@ -592,6 +618,13 @@ sub do_one_test($$)
              print("(cleanup operation failed: $cleanup)\n");
      }
  
@@ -208,7 +214,7 @@ index 224385f..3e0383b 100755
      $num_tests_done++;
  }
  
-@@ -589,7 +621,7 @@ sub test_one_dir($$)
+@@ -631,7 +664,7 @@ sub test_one_dir($$)
      my $found_tests = (0 != (grep { $_ =~ /\.vgtest$/ } @fs));
  
      if ($found_tests) {
@@ -217,7 +223,7 @@ index 224385f..3e0383b 100755
      }
      foreach my $f (@fs) {
          if (-d $f) {
-@@ -599,7 +631,7 @@ sub test_one_dir($$)
+@@ -641,7 +674,7 @@ sub test_one_dir($$)
          }
      }
      if ($found_tests) {
@@ -226,7 +232,7 @@ index 224385f..3e0383b 100755
      }
  
      chdir("..");
-@@ -625,10 +657,12 @@ sub summarise_results
+@@ -667,10 +700,12 @@ sub summarise_results
             $num_failures{"stdout"},   plural($num_failures{"stdout"}),
             $num_failures{"stderrB"},  plural($num_failures{"stderrB"}),
             $num_failures{"stdoutB"},  plural($num_failures{"stdoutB"}),
@@ -241,3 +247,6 @@ index 224385f..3e0383b 100755
      }
      print "\n";
  }
+-- 
+2.6.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch b/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
deleted file mode 100644
index 300f2f1..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Enable building valgrind on host with 4.x kernel.
-
-For OpenEmbedded builds we should be checking something like
-OLDEST_KERNEL instead of `uname -r`, but this is good enough for now.
-
-Building on 4.x* currently fails with:
-  configure:5556: checking for the kernel version
-  configure:5579: result: unsupported (4.0.0-rc3-00111-gaffb817)
-  configure:5581: error: Valgrind works on kernels 2.4, 2.6
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- valgrind-3.9.0/configure.ac.orig	2015-03-13 19:17:01.247310868 +0100
-+++ valgrind-3.9.0/configure.ac	2015-03-13 19:19:27.388316108 +0100
-@@ -276,9 +276,9 @@
-         kernel=`uname -r`
- 
-         case "${kernel}" in
--             2.6.*|3.*) 
--        	    AC_MSG_RESULT([2.6.x/3.x family (${kernel})])
--        	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x or Linux 3.x])
-+             2.6.*|3.*|4.*) 
-+        	    AC_MSG_RESULT([2.6.x/3.x/4.x family (${kernel})])
-+        	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x or Linux 3.x or Linux 4.x])
-         	    ;;
- 
-              2.4.*) 
-@@ -288,7 +288,7 @@
- 
-              *) 
-         	    AC_MSG_RESULT([unsupported (${kernel})])
--        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6])
-+        	    AC_MSG_ERROR([Valgrind works on kernels 2.4, 2.6, 3.x, 4.x])
-         	    ;;
-         esac
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch b/meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
deleted file mode 100644
index 849dfc5..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Suppress building ptest apps with the -gstabs option
-
-Force the configure tests for -gstabs compiler support to fail so that
-the regression tests don't try to build with the -gstabs option.
-Otherwise, the valgrind build when ptest is enabled fails with the
-error:
-    Stabs debuginfo not supported:
-    ../package/usr/lib/valgrind/ptest/memcheck/tests/deep_templates
-    ERROR: Function failed: split_and_strip_files
-
-Upstream-Status: Inappropriate [gstabs support is appropriate upstream,
-        but not for this distro]
-
-Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
-
-diff --git a/configure.ac b/configure.ac
-index 755dfb9..cc8b5e1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1743,22 +1743,7 @@ AM_CONDITIONAL(DWARF4, test x$ac_have_dwarf4 = xyes)
- CFLAGS=$safe_CFLAGS
- 
- 
--# does this compiler support -gstabs ?
--
--AC_MSG_CHECKING([if gcc accepts -gstabs])
--
--safe_CFLAGS=$CFLAGS
--CFLAGS="-gstabs"
--AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
--  return 0;
--]])], [
--ac_have_gstabs=yes
--AC_MSG_RESULT([yes])
--], [
- ac_have_gstabs=no
--AC_MSG_RESULT([no])
--])
--CFLAGS=$safe_CFLAGS
- AM_CONDITIONAL([HAVE_GSTABS], [test x$ac_have_gstabs = xyes])
- 
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind/glibc.patch b/meta/recipes-devtools/valgrind/valgrind/glibc.patch
deleted file mode 100644
index 863499d..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/glibc.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Backport of glibc 2.19 and 2.20 and 2.21 support.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: valgrind-3.10.1/configure.ac
-===================================================================
---- valgrind-3.10.1.orig/configure.ac
-+++ valgrind-3.10.1/configure.ac
-@@ -1018,6 +1018,34 @@ case "${GLIBC_VERSION}" in
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.19)
-+	AC_MSG_RESULT(2.19 family)
-+	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-+     2.20)
-+	AC_MSG_RESULT(2.20 family)
-+	AC_DEFINE([GLIBC_2_20], 1, [Define to 1 if you're using glibc 2.20.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-+     2.21)
-+	AC_MSG_RESULT(2.21 family)
-+	AC_DEFINE([GLIBC_2_21], 1, [Define to 1 if you're using glibc 2.21.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-+     2.22)
-+	AC_MSG_RESULT(2.22 family)
-+	AC_DEFINE([GLIBC_2_22], 1, [Define to 1 if you're using glibc 2.22.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
deleted file mode 100644
index f8167cb..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Backport
-
-r14566 | florian | 2014-09-24 17:02:54 -0500 (Wed, 24 Sep 2014) | 4 lines
-
-The testbuckets none/tests/ppc{32,64} did not build in case the
-toolchain did not support -maltivec -mabi=altivec.
-This should work now. Fixes BZ #338731
-
-Index: none/tests/ppc32/Makefile.am
-===================================================================
---- a/none/tests/ppc32/Makefile.am	(revision 14565)
-+++ b/none/tests/ppc32/Makefile.am	(revision 14566)
-@@ -72,8 +72,12 @@
- allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
- 
- if HAS_ALTIVEC
-+BUILD_FLAG_ALTIVEC = -maltivec
-+BUILD_FLAG_ABI_ALTIVEC = -mabi=altivec
- ALTIVEC_FLAG = -DHAS_ALTIVEC
- else
-+BUILD_FLAG_ALTIVEC =
-+BUILD_FLAG_ABI_ALTIVEC =
- ALTIVEC_FLAG =
- endif
- 
-@@ -101,11 +105,12 @@
- ISA_2_07_FLAG =
- endif
- 
--jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
--			@FLAG_M32@ $(ALTIVEC_FLAG)
-+jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
-+			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
- 
--testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -maltivec -mabi=altivec -DALTIVEC \
--			-DGCC_COMPILER @FLAG_M32@
-+testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -DALTIVEC \
-+			-DGCC_COMPILER @FLAG_M32@  $(BUILD_FLAG_ALTIVEC) \
-+			$(BUILD_FLAG_ABI_ALTIVEC)
- 
- test_isa_2_06_part1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
- 			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
-Index: none/tests/ppc64/Makefile.am
-===================================================================
---- a/none/tests/ppc64/Makefile.am	(revision 14565)
-+++ b/none/tests/ppc64/Makefile.am	(revision 14566)
-@@ -50,8 +50,10 @@
- allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
- 
- if HAS_ALTIVEC
-+BUILD_FLAG_ALTIVEC = -maltivec
- ALTIVEC_FLAG = -DHAS_ALTIVEC
- else
-+BUILD_FLAG_ALTIVEC =
- ALTIVEC_FLAG =
- endif
- 
-@@ -88,8 +90,8 @@
- test_isa_2_06_part3_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
- 			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
- 
--jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
--			@FLAG_M64@ $(ALTIVEC_FLAG)
-+jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
-+			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
- 
- test_dfp1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(DFP_FLAG) \
- 			@FLAG_M64@ $(BUILD_FLAGS_DFP)
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
deleted file mode 100644
index 1c640ff..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Remove test apps not building with ppc and PTEST
-
-For mpc8316-rdb in none/tests/ppc32, the oe compiler options are
-inconsistent with the imposed test compiler options generating errors
-as follows:
-test_isa_2_07_part1
-test_isa_2_07_part2
-test_tm
-test_touch_tm
-    : unrecognized command line option '-mhtm'
-
-jm-insns
-testVMX
-    : AltiVec not supported in this target
-
-For the following tests, their inline assembler is inconsistent with
-the ppce300c3 variant:
-round.c:393
-power5+_round.c:98
-    : impossible constraint in 'asm'
-
-For the following tests, with both mpc8316-rdb and with qemuppc bsp,
-the inline assember is inconsistent with the oe compiler machine
-tuning:
-In memcheck/tests/ppc32
- power_ISA2_05.c:56
-In none/tests/ppc32
- test_dfp1.c:85
- test_dfp2.c:160
- test_dfp3.c:157
- test_dfp4.c:73
- test_dfp5.c:73
-    : impossible constraint in 'asm'
-
-Upstream-Status: Pending
-
-Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
-
-Index: valgrind-3.10.0/memcheck/tests/ppc32/Makefile.am
-===================================================================
---- valgrind-3.10.0.orig/memcheck/tests/ppc32/Makefile.am
-+++ valgrind-3.10.0/memcheck/tests/ppc32/Makefile.am
-@@ -7,8 +7,7 @@ EXTRA_DIST = $(noinst_SCRIPTS) \
- 	power_ISA2_05.stderr.exp power_ISA2_05.stdout.exp power_ISA2_05.vgtest \
- 	power_ISA2_05.stdout.exp_Without_FPPO
- 
--check_PROGRAMS = \
--	power_ISA2_05
-+check_PROGRAMS = 
- 
- power_ISA2_05_CFLAGS = $(AM_CFLAGS) $(WERROR) -Winline -Wall -Wshadow -g \
- 		-I$(top_srcdir)/include @FLAG_M32@
-Index: valgrind-3.10.0/none/tests/ppc32/Makefile.am
-===================================================================
---- valgrind-3.10.0.orig/none/tests/ppc32/Makefile.am
-+++ valgrind-3.10.0/none/tests/ppc32/Makefile.am
-@@ -52,16 +52,8 @@ check_PROGRAMS = \
- 	allexec \
- 	bug129390-ppc32 \
- 	bug139050-ppc32 \
--	ldstrev lsw jm-insns mftocrf mcrfs round test_fx test_gx \
--	testVMX twi tw xlc_dbl_u32 power5+_round power6_bcmp \
--	test_isa_2_06_part1 \
--	test_isa_2_06_part2 \
--	test_isa_2_06_part3 \
--	test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
--	test_isa_2_07_part1 \
--	test_isa_2_07_part2 \
--	test_tm \
--	test_touch_tm \
-+	ldstrev lsw mftocrf mcrfs test_fx test_gx \
-+	twi tw xlc_dbl_u32 power6_bcmp \
- 	ldst_multiple \
- 	data-cache-instructions
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch b/meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
deleted file mode 100644
index 5db0ef8..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
+++ /dev/null
@@ -1,235 +0,0 @@
-Fix out of tree builds. The paths to these files need to be fully specified in
-the out of tree build case. glibc-2.X.supp is a generated file so the full path
-is deliberately not specified in that case.
-
-RP 2013/03/23
-
-Upstream-Status: Pending
-
-Index: valgrind-3.9.0/configure.ac
-===================================================================
---- valgrind-3.9.0.orig/configure.ac
-+++ valgrind-3.9.0/configure.ac
-@@ -325,26 +325,26 @@ case "${host_os}" in
- 	     9.*)
- 		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     10.*)
- 		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_6, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin10.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     11.*)
- 		  AC_MSG_RESULT([Darwin 11.x (${kernel}) / Mac OS X 10.7 Lion])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_7, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin11.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin11.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     12.*)
- 		  AC_MSG_RESULT([Darwin 12.x (${kernel}) / Mac OS X 10.8 Mountain Lion])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_8, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin12.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin12.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
-              *) 
- 		  AC_MSG_RESULT([unsupported (${kernel})])
-@@ -799,124 +799,124 @@ case "${GLIBC_VERSION}" in
-      2.2)
- 	AC_MSG_RESULT(2.2 family)
- 	AC_DEFINE([GLIBC_2_2], 1, [Define to 1 if you're using glibc 2.2.x])
--	DEFAULT_SUPP="glibc-2.2.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.2.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
- 
-      2.3)
- 	AC_MSG_RESULT(2.3 family)
- 	AC_DEFINE([GLIBC_2_3], 1, [Define to 1 if you're using glibc 2.3.x])
--	DEFAULT_SUPP="glibc-2.3.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.3.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
- 
-      2.4)
- 	AC_MSG_RESULT(2.4 family)
- 	AC_DEFINE([GLIBC_2_4], 1, [Define to 1 if you're using glibc 2.4.x])
--	DEFAULT_SUPP="glibc-2.4.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.4.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
- 
-      2.5)
- 	AC_MSG_RESULT(2.5 family)
- 	AC_DEFINE([GLIBC_2_5], 1, [Define to 1 if you're using glibc 2.5.x])
--	DEFAULT_SUPP="glibc-2.5.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.5.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.6)
- 	AC_MSG_RESULT(2.6 family)
- 	AC_DEFINE([GLIBC_2_6], 1, [Define to 1 if you're using glibc 2.6.x])
--	DEFAULT_SUPP="glibc-2.6.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.6.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.7)
- 	AC_MSG_RESULT(2.7 family)
- 	AC_DEFINE([GLIBC_2_7], 1, [Define to 1 if you're using glibc 2.7.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.8)
- 	AC_MSG_RESULT(2.8 family)
- 	AC_DEFINE([GLIBC_2_8], 1, [Define to 1 if you're using glibc 2.8.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.9)
- 	AC_MSG_RESULT(2.9 family)
- 	AC_DEFINE([GLIBC_2_9], 1, [Define to 1 if you're using glibc 2.9.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.10)
- 	AC_MSG_RESULT(2.10 family)
- 	AC_DEFINE([GLIBC_2_10], 1, [Define to 1 if you're using glibc 2.10.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.11)
- 	AC_MSG_RESULT(2.11 family)
- 	AC_DEFINE([GLIBC_2_11], 1, [Define to 1 if you're using glibc 2.11.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-         ;;
-      2.12)
- 	AC_MSG_RESULT(2.12 family)
- 	AC_DEFINE([GLIBC_2_12], 1, [Define to 1 if you're using glibc 2.12.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.13)
- 	AC_MSG_RESULT(2.13 family)
- 	AC_DEFINE([GLIBC_2_13], 1, [Define to 1 if you're using glibc 2.13.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.14)
- 	AC_MSG_RESULT(2.14 family)
- 	AC_DEFINE([GLIBC_2_14], 1, [Define to 1 if you're using glibc 2.14.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.15)
- 	AC_MSG_RESULT(2.15 family)
- 	AC_DEFINE([GLIBC_2_15], 1, [Define to 1 if you're using glibc 2.15.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.16)
- 	AC_MSG_RESULT(2.16 family)
- 	AC_DEFINE([GLIBC_2_16], 1, [Define to 1 if you're using glibc 2.16.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.17)
- 	AC_MSG_RESULT(2.17 family)
- 	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.18)
- 	AC_MSG_RESULT(2.18 family)
- 	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
-@@ -926,7 +926,7 @@ case "${GLIBC_VERSION}" in
-      bionic)
- 	AC_MSG_RESULT(Bionic)
- 	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
--	DEFAULT_SUPP="bionic.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/bionic.supp ${DEFAULT_SUPP}"
- 	;;
- 
-      *)
-@@ -943,11 +943,11 @@ AC_SUBST(GLIBC_VERSION)
- # attempt to detect whether such libraries are installed on the
- # build machine (or even if any X facilities are present); just
- # add the suppressions antidisirregardless.
--DEFAULT_SUPP="xfree-4.supp ${DEFAULT_SUPP}"
--DEFAULT_SUPP="xfree-3.supp ${DEFAULT_SUPP}"
-+DEFAULT_SUPP="$srcdir/xfree-4.supp ${DEFAULT_SUPP}"
-+DEFAULT_SUPP="$srcdir/xfree-3.supp ${DEFAULT_SUPP}"
- 
- # Add glibc and X11 suppressions for exp-sgcheck
--DEFAULT_SUPP="exp-sgcheck.supp ${DEFAULT_SUPP}"
-+DEFAULT_SUPP="$srcdir/exp-sgcheck.supp ${DEFAULT_SUPP}"
- 
- 
- #----------------------------------------------------------------------------
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
similarity index 77%
rename from meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index c1c11d4..0823144 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "Valgrind memory debugger and instrumentation framework"
 HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=e7071929a50d4b0fc27a3014b315b0f7 \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=92df8a1bde56fe2af70931ff55f6622f \
-                    file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=ebb8e640ef633f940c425686c873f9fa \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=4b5e24908e53016ea561c45f4234a327 \
+                    file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)} \
@@ -15,28 +15,21 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
-           file://sepbuildfix.patch \
-           file://glibc.patch \
-           file://force-nostabs.patch \
            file://remove-arm-variant-specific.patch \
-           file://remove-ppc-tests-failing-build.patch \
-           file://valgrind-remove-rpath.patch \
-           file://enable.building.on.4.x.kernel.patch \
-           file://add-ptest.patch \
-           file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
-           file://0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch \
            file://11_mips-link-tool.patch \
-          "
+           file://0002-remove-rpath.patch \
+           file://0004-Fix-out-of-tree-builds.patch \
+           file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
+           file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
+           "
 
-SRC_URI[md5sum] = "60ddae962bc79e7c95cfc4667245707f"
-SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1dfcb997"
+SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
+SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
 COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
-PR = "r1"
-
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
@@ -58,6 +51,10 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
 RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
 
+# One of the tests contains a bogus interpreter path on purpose, and QA
+# check complains about it
+INSANE_SKIP_${PN}-ptest += "file-rdeps"
+
 do_compile_ptest() {
     oe_runmake check CFLAGS="${CFLAGS} -O0" CXXFLAGS="${CXXFLAGS} -O0"
 }
-- 
2.6.4


