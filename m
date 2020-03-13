Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4854860C1E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:18:55 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id g12so10967129ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=f6XEbqu+2dM/QKmRBjtCrhZbVmGYNw5qwqTlydGBBmE=;
	b=NAhw8/HOUDaHMB2Coea6WbNsOYdh4CXYqxa5cu0P9LGoYjLAQvcuVYPZvis68GjumM
	7+uPBC3hcD6GbdfbSwQibWW+jVmiwTIFKcTVoXstLpybcgcpKCAyEd1guJvgbqv2JO1k
	zUbr1AzspV57ZCDfdi5A9ZvDRN/aCvJhB8HW+UivLZ8hisS371y2VatA5XNn8fjlbftb
	9gpC/ebSclKDTWdDeTQ0X/RNJ+rbmtxRpkpf8Td6v5J/kiJJkuhflIdwisG5c0G3KqLJ
	6mKToAs5zxnM+0fD/s/tucnKkPoVMngLJF9ZP2BVKXlAlY2MUcGlaqLgeHux7isk5Bhb
	Ng7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f6XEbqu+2dM/QKmRBjtCrhZbVmGYNw5qwqTlydGBBmE=;
	b=aHK/V9ONf98oXWAkoCW5frvsAWO4s6B+NLhPjcfpmrGlzDb6cCpW8Rhr5DkIWkEit+
	es45q4jxYHygYg6Ihes4bAyc/f2EddERuX1FHt6y7joGswwgVvZou91DdLKOhKCvOGaH
	8xGI9Z1DPTviFDhaNEZLP//h0Q/32fnzZbhJ6nzV4Lugn5Yi/Nz5Gx6i3dSmXAKw892k
	OkJXIay3Cb3tVIAlaU1cu2zIwqwel/IDSKPIuMY0f2/LeUI3tb3b7yCVU6pmXIeP8wJl
	Pz4dL9HkRLMAD+DqloBgOmKcPsQt6pmkaGG11Fl/2jjeHBnOlyEW1OmMNgqxxYN62a6U
	Zydw==
X-Gm-Message-State: ANhLgQ2ajxtmdpbb5Ft8PVy4S+x+qd7+m9JPT6TEwbh1D4oTx/WtGzer
	HxJJEwAENuTxfLe449JbfV2cdfkQu6Y=
X-Google-Smtp-Source: ADFU+vuhaqvqzj9ltythYRLJOACKKU0TptZvkymdMUwYy+HN8IEAyGzLIDL+dfarBEmlotc4CFAaKQ==
X-Received: by 2002:a2e:9949:: with SMTP id r9mr7032916ljj.135.1584112734555; 
	Fri, 13 Mar 2020 08:18:54 -0700 (PDT)
Received: from kbp1-ldl-F65306.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	g25sm29136150ljn.107.2020.03.13.08.18.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 08:18:53 -0700 (PDT)
From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 17:18:41 +0200
Message-Id: <20200313151841.11613-1-oleksandr.s.popovych@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v7] expat: Added ptest
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
X-List-Received-Date: Fri, 13 Mar 2020 15:18:55 -0000

For ptest support for expat package:

 - expat_2.2.9.bb recipe was switched on cmake-based building system to
avoid cahnges in autotools build system  which considered in upstream as
deprecated (https://github.com/libexpat/libexpat/issues/330).

 - expat_2.2.9.bb recipe was divided into expat_2.2.9.bb recipe which is
switched on cmake-based build system and expat-native_2.2.9.bb recipe
which is left with autotools build system. This solves problem with
dependency loop between cmake-native and expat-native packages. Without
this split, because expat-native package is listed in DEPENDS for
cmake-native package, next dependency loop appears:

	Dependency loop #1 found:
	  Task .../meta/recipes-devtools/cmake/cmake-native_3.16.1.bb:do_compile (dependent Tasks ['cmake-native_3.16.1.bb:do_configure'])
	  Task .../meta/recipes-devtools/cmake/cmake-native_3.16.1.bb:do_install (dependent Tasks ['cmake-native_3.16.1.bb:do_compile'])
	  Task .../meta/recipes-devtools/cmake/cmake-native_3.16.1.bb:do_populate_sysroot (dependent Tasks ['cmake-native_3.16.1.bb:do_install'])
	  Task virtual:native:.../meta/recipes-core/expat/expat_2.2.9.bb:do_prepare_recipe_sysroot (dependent Tasks ['ninja_1.10.0.bb:do_populate_sysroot', 'cmake-native_3.16.1.bb:do_populate_sysroot', 'expat_2.2.9.bb:do_fetch'])
	  Task virtual:native:.../meta/recipes-core/expat/expat_2.2.9.bb:do_configure (dependent Tasks ['expat_2.2.9.bb:do_prepare_recipe_sysroot', 'expat_2.2.9.bb:do_deploy_source_date_epoch', 'expat_2.2.9.bb:do_generate_toolchain_file', 'expat_2.2.9.bb:do_patch'])
	  Task virtual:native:.../meta/recipes-core/expat/expat_2.2.9.bb:do_compile (dependent Tasks ['expat_2.2.9.bb:do_configure'])
	  Task virtual:native:.../meta/recipes-core/expat/expat_2.2.9.bb:do_install (dependent Tasks ['expat_2.2.9.bb:do_compile'])
	  Task virtual:native:.../meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot (dependent Tasks ['expat_2.2.9.bb:do_install'])
	  Task .../meta/recipes-devtools/cmake/cmake-native_3.16.1.bb:do_prepare_recipe_sysroot (dependent Tasks ['expat_2.2.9.bb:do_populate_sysroot', 'zlib_1.2.11.bb:do_populate_sysroot', 'bzip2_1.0.8.bb:do_populate_sysroot', 'xz_5.2.4.bb:do_populate_sysroot', 'ncurses_6.2.bb:do_populate_sysroot', 'curl_7.69.0.bb:do_populate_sysroot', 'cmake-native_3.16.1.bb:do_fetch'])
	  Task .../meta/recipes-devtools/cmake/cmake-native_3.16.1.bb:do_configure (dependent Tasks ['cmake-native_3.16.1.bb:do_deploy_source_date_epoch', 'cmake-native_3.16.1.bb:do_patch', 'cmake-native_3.16.1.bb:do_prepare_recipe_sysroot'])

 - run-ptest script that initalizes testing, copies testing
executables' output to log file and measures execution time of each testing
executable was added.

 - patch that implements output of each testcase result in testing exectutable
was added.

Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
---
 meta/recipes-core/expat/expat-native_2.2.9.bb | 20 +++++
 .../0001-Add-output-of-tests-result.patch     | 84 +++++++++++++++++++
 meta/recipes-core/expat/expat/run-ptest       | 24 ++++++
 meta/recipes-core/expat/expat_2.2.9.bb        | 14 +++-
 4 files changed, 138 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat-native_2.2.9.bb
 create mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
 create mode 100644 meta/recipes-core/expat/expat/run-ptest

diff --git a/meta/recipes-core/expat/expat-native_2.2.9.bb b/meta/recipes-core/expat/expat-native_2.2.9.bb
new file mode 100644
index 0000000000..c5dbb09ee2
--- /dev/null
+++ b/meta/recipes-core/expat/expat-native_2.2.9.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A stream-oriented XML parser library"
+DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
+HOMEPAGE = "http://expat.sourceforge.net/"
+SECTION = "libs"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
+           file://libtool-tag.patch \
+	  "
+
+SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
+SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
+
+inherit autotools lib_package native
+
+do_configure_prepend () {
+	rm -f ${S}/conftools/libtool.m4
+}
diff --git a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
new file mode 100644
index 0000000000..c78fd2bbef
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
@@ -0,0 +1,84 @@
+From aa84835a00bfd65e784d58411e76f60658e939dc Mon Sep 17 00:00:00 2001
+From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+Date: Tue, 18 Feb 2020 19:04:55 +0200
+Subject: [PATCH] Add output of tests result
+
+Added console output of testing results in form 'RESULT: TEST_NAME'.
+
+Changed verbose mode of test application set by '-v' ('--verbose')
+argument to CK_NORMAL.
+Added new supported argument '-vv' ('--extra-verbose') that changes
+verbose mode of test application to CK_VERBOSE. Results of each test
+are shown in output only if this mode is set.
+
+Upstream-Status: Denied
+
+This patch changes potentially deprecated feature that shoud be changed
+in upstream. [https://github.com/libexpat/libexpat/issues/382]
+
+Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
+---
+ tests/minicheck.c | 10 +++++++++-
+ tests/runtests.c  |  4 +++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/expat/tests/minicheck.c b/expat/tests/minicheck.c
+index a5a1efb..94fa412 100644
+--- a/tests/minicheck.c
++++ b/tests/minicheck.c
+@@ -164,6 +164,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
+       if (tc->setup != NULL) {
+         /* setup */
+         if (setjmp(env)) {
++          if (verbosity >= CK_VERBOSE)
++            printf("SKIP: %s\n", _check_current_function);
+           add_failure(runner, verbosity);
+           continue;
+         }
+@@ -171,6 +173,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
+       }
+       /* test */
+       if (setjmp(env)) {
++        if (verbosity >= CK_VERBOSE)
++          printf("FAIL: %s\n", _check_current_function);
+         add_failure(runner, verbosity);
+         continue;
+       }
+@@ -178,12 +182,16 @@ srunner_run_all(SRunner *runner, int verbosity) {
+ 
+       /* teardown */
+       if (tc->teardown != NULL) {
+-        if (setjmp(env)) {
++        if (setjmp(env)) { 
++          if (verbosity >= CK_VERBOSE)
++           printf("PASS: %s\n", _check_current_function);
+           add_failure(runner, verbosity);
+           continue;
+         }
+         tc->teardown();
+       }
++      if (verbosity >= CK_VERBOSE)
++        printf("PASS: %s\n", _check_current_function);
+     }
+     tc = tc->next_tcase;
+   }
+diff --git a/tests/runtests.c b/expat/tests/runtests.c
+index 7791fe0..75724e5 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -11619,9 +11619,11 @@ main(int argc, char *argv[]) {
+   for (i = 1; i < argc; ++i) {
+     char *opt = argv[i];
+     if (strcmp(opt, "-v") == 0 || strcmp(opt, "--verbose") == 0)
+-      verbosity = CK_VERBOSE;
++      verbosity = CK_NORMAL;
+     else if (strcmp(opt, "-q") == 0 || strcmp(opt, "--quiet") == 0)
+       verbosity = CK_SILENT;
++    else if (strcmp(opt, "-vv") == 0 || strcmp(opt, "--extra-verbose") == 0)
++	verbosity = CK_VERBOSE;
+     else {
+       fprintf(stderr, "runtests: unknown option '%s'\n", opt);
+       return 2;
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
new file mode 100644
index 0000000000..7bc81eba8a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/bash
+
+output=${1:-"expat_tests.log"} # default log file 
+
+# logging function
+function testCheck() {
+	testExec="$1"
+	shift
+	echo && echo ${testExec} && ./${testExec} "$@"
+	error=$?
+	result=$([[ ${error} -eq 0 ]] && echo "PASS" || echo "FAIL")
+	echo "${result}: ${testExec}" && echo "============================"
+}
+
+export output
+export -f testCheck
+TIME=$(which time)
+
+echo "Architecture: $(uname -m)" > ${output}
+echo "Image: $(uname -sr)" >> ${output}
+${TIME} -f 'Execution time: %e s' bash -c "testCheck runtests -vv" |& tee -a ${output}
+${TIME} -f 'Execution time: %e s' bash -c "testCheck runtestspp -vv" |& tee -a ${output}
+echo
+
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 8f3db41352..a0224c627e 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -8,15 +8,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
+	   file://run-ptest \
+	   file://0001-Add-output-of-tests-result.patch \
 	  "
 
 SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
 SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
 
-inherit autotools lib_package
+RDEPENDS_${PN}-ptest += "bash"
 
-do_configure_prepend () {
-	rm -f ${S}/conftools/libtool.m4
+#S = "${WORKDIR}"
+
+inherit cmake lib_package ptest
+
+do_install_ptest_class-target() {
+	install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND += "nativesdk"
-- 
2.17.1


