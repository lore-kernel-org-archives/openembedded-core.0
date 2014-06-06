Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B54D6FBF9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 01:25:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s561PCNP021983
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jun 2014 18:25:12 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 5 Jun 2014 18:25:11 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 09:25:10 +0800
Message-ID: <1402017910-6718-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH][V2] oprofile: Add PTEST regression testing to oprofile
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
X-List-Received-Date: Fri, 06 Jun 2014 01:25:11 -0000
Content-Type: text/plain

The commit changes the oe-core oprofile recipe by adding the PTEST
interface, implementing do_compile_ptest() and do_install_ptest().

The install routine adds several files that only the regression tests
require. Also, a patch is necessary to inhibit executing the tests on
the build host and to point to the correct target directory for the
libutil++ test 'file-manip-tests'.

That test requires the recipe to set SRCDIR in the build environment
instead of determining the value from build-time host paths as for a
self-hosted build.

Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |   31 ++++++-
 .../oprofile/oprofile-cross-compile-tests.patch    |   98 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile/run-ptest    |   18 ++++
 3 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index ccf9f9f..aaba48e 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -20,9 +20,11 @@ FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-root.patch \
-           file://acinclude.m4"
+           file://acinclude.m4 \
+           file://oprofile-cross-compile-tests.patch \
+           file://run-ptest"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig ptest
 
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
@@ -30,3 +32,28 @@ do_configure () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
 }
+
+EXTRA_OEMAKE = "SRCDIR=${PTEST_PATH}/libutil++/tests"
+do_compile_ptest() {
+	oe_runmake check
+}
+
+do_install_ptest() {
+	subdirs="libdb/tests libutil++/tests libregex/tests libutil/tests libop/tests libdb/tests "
+	cd ${S}
+	for tooltest in ${subdirs}
+	do
+		find ${tooltest} -perm /u=x -type f| cpio -pvdu ${D}${PTEST_PATH}
+	done
+
+	# needed by some libop tests
+	cp -r events ${D}${PTEST_PATH}
+
+	# needed by libregex regex_test
+	cp libregex/stl.pat ${D}${PTEST_PATH}/libregex
+	cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
+
+	# needed by litutil++ file_manip_tests
+	cp libutil++/tests/file_manip_tests.cpp \
+		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libutil++/tests
+}
diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
new file mode 100644
index 0000000..aefa954
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
@@ -0,0 +1,98 @@
+Prevent running check tests on host if cross compiling
+
+This patch enables running the 'make check' tests on the target
+in a cross-compiled environment. If not cross-compiling, then 'make
+ check' builds and executes the tests; no change from this patch.
+In a cross-compiling environment, the make variable CROSS_COMPILE is
+set which bypasses assiging tests to the makekfile variable TESTS.
+Since TESTS is empty, the 'make check' process never tries to run the
+tests on the hosts.  On the target, the tests must be run manually.
+
+Also, in the libutil++ tests, a makefile variable SRCDIR is passed into
+the compilation phase, pointing to the runtime location of the test
+'file-manip-tests'.  The mechanism used for a host test, based on
+'topdir' doesn't work.  Instead, if CROSS_COMPILE is set, the
+makefile takes the path of SRCDIR from the build environment and not
+from an expression based on the host path 'topdir'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index 41ece64..ce5a16f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -392,6 +392,7 @@ AC_ARG_ENABLE(account-check,
+ 	enable_account_check=$enableval, enable_account_check=yes)
+ 
+ AM_CONDITIONAL(CHECK_ACCOUNT, test "x$enable_account_check" = "xyes")
++AM_CONDITIONAL(CROSS_COMPILE, test "x$cross_compiling" = "xyes")
+ 
+ AC_SUBST(OP_CFLAGS)
+ AC_SUBST(OP_CXXFLAGS)
+diff --git a/libdb/tests/Makefile.am b/libdb/tests/Makefile.am
+index 8a69003..d820090 100644
+--- a/libdb/tests/Makefile.am
++++ b/libdb/tests/Makefile.am
+@@ -13,4 +13,6 @@ check_PROGRAMS = db_test
+ db_test_SOURCES = db_test.c
+ db_test_LDADD = ../libodb.a ../../libutil/libutil.a
+ 
++if ! CROSS_COMPILE
+ TESTS = ${check_PROGRAMS}
++endif
+diff --git a/libop/tests/Makefile.am b/libop/tests/Makefile.am
+index 8a79eb5..6d417c4 100644
+--- a/libop/tests/Makefile.am
++++ b/libop/tests/Makefile.am
+@@ -33,4 +33,6 @@ load_events_files_tests_LDADD = ${COMMON_LIBS}
+ mangle_tests_SOURCES = mangle_tests.c
+ mangle_tests_LDADD = ${COMMON_LIBS}
+ 
++if ! CROSS_COMPILE
+ TESTS = ${check_PROGRAMS} utf8_checker.sh
++endif
+diff --git a/libregex/tests/Makefile.am b/libregex/tests/Makefile.am
+index 6f19838..1d176f9 100644
+--- a/libregex/tests/Makefile.am
++++ b/libregex/tests/Makefile.am
+@@ -18,4 +18,6 @@ java_test_LDADD = \
+ 
+ EXTRA_DIST = mangled-name.in
+ 
++if ! CROSS_COMPILE
+ TESTS = ${check_PROGRAMS}
++endif
+diff --git a/libutil++/tests/Makefile.am b/libutil++/tests/Makefile.am
+index 51af031..a01ea2d 100644
+--- a/libutil++/tests/Makefile.am
++++ b/libutil++/tests/Makefile.am
+@@ -1,7 +1,9 @@
+ 
+ REALPATH= readlink -f
+ 
++if ! CROSS_COMPILE
+ SRCDIR := $(shell $(REALPATH) $(topdir)/libutil++/tests/ )
++endif
+ 
+ AM_CPPFLAGS = \
+ 	-I ${top_srcdir}/libutil++ -D SRCDIR="\"$(SRCDIR)/\"" @OP_CPPFLAGS@
+@@ -46,4 +48,6 @@ cached_value_tests_LDADD = ${COMMON_LIBS}
+ utility_tests_SOURCES = utility_tests.cpp
+ utility_tests_LDADD = ${COMMON_LIBS}
+ 
++if ! CROSS_COMPILE
+ TESTS = ${check_PROGRAMS}
++endif
+diff --git a/libutil/tests/Makefile.am b/libutil/tests/Makefile.am
+index dfcd6ec..e8831b5 100644
+--- a/libutil/tests/Makefile.am
++++ b/libutil/tests/Makefile.am
+@@ -12,4 +12,6 @@ file_tests_LDADD = ../libutil.a
+ string_tests_SOURCES = string_tests.c
+ string_tests_LDADD = ../libutil.a
+ 
++if ! CROSS_COMPILE
+ TESTS = ${check_PROGRAMS}
++endif
diff --git a/meta/recipes-kernel/oprofile/oprofile/run-ptest b/meta/recipes-kernel/oprofile/oprofile/run-ptest
new file mode 100644
index 0000000..583ee1b
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/bash
+saved_dir=$PWD
+for dir in */tests ; do
+	cd $dir
+	for atest in * ; do
+		if [ \( -x $atest \) -a \( -f $atest \) ] ; then
+			./$atest > ${atest}.stdout 2> ${atest}.stderr
+			if [ $? = 0 ] ; then
+				echo "PASS: $dir $atest"
+				rm ${atest}.stdout ${atest}.stderr
+			else
+				echo "FAIL: ${dir}/${atest}"
+			fi
+		fi
+	done
+	cd $saved_dir
+done
+
-- 
1.7.9.5


