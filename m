Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.251.1588265735425987573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 09:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=google header.b=LtLCO7XF;
 spf=pass (domain: globallogic.com, ip: 209.85.167.44, mailfrom: oleksandr.s.popovych@globallogic.com)
Received: by mail-lf1-f44.google.com with SMTP id u10so1810253lfo.8
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 09:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=16ClTpDLjYrPunyKGufWM8FfQKkXz3Wxu2LHmONreZs=;
        b=LtLCO7XFByybfICJCoTU61BWOMkxZG4Q9kMGujvgbpQXj/05LWq6gAqPgWwHwylY4C
         xQC7Ub9knQb36hEERWHyFpFGAbVZqfdo3uzBX4tUbX/ezkjgeYxHM8zwicdo2QI1EACf
         65s2pzSOsti6H+813AeyjfrVV6KUz6nUNsQZkS0L5UQhW9wdnAkb2de4XUv5eisnNFJM
         KDxX1ZiUY+T/OE4as9i0Gn4YCcasvqLC8WbPuRJEv+sRMWDCUhPqS+iDE3Kp9zVvLLeb
         jVCPoOTnU0BELYa1Kax/dXlQYQ60ENzU+euRT7LlELe+Gu6TRdRi0JjLFWuCCVmFemv8
         2W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=16ClTpDLjYrPunyKGufWM8FfQKkXz3Wxu2LHmONreZs=;
        b=aec0R9Z65EHlTzetIloK8a9ogPPpn6gIoJBWzuofYr8a5O7PWfdDLfDt6JNXRTn8H/
         0ZpBaSw/E0TyoCpzSAv5JNVWSG5fRwhk0j3mlReO4/8whU9RVtwYDtxbRcPeOnCus49d
         FmOHDF5ya4eLFxcQkYBfViNgYdYiQOem48e2T+YvAfhfjKdr/qPwFaZkCagGIZoc7vh2
         yzdNXvC3+zPOvmGqTxNG0E6lpAmNd6cp3zMOlGQOSuOtj2smTcH/L7dss5NHH7zq4LPK
         CfZYjXNJAP9pDBJ86VbVz8I8UwLhs+m898Z5bbIYQvd1/VU8+HrBGk9g4s3AplocOULz
         MRfg==
X-Gm-Message-State: AGi0PuaeZ9h/Ql0lNixKJ4deQMDcZho4lFy4sAncdexgJbdn9lXnYLHi
	u7JkdRKucW5dY8qAYR/4vegunyc1KP8=
X-Google-Smtp-Source: APiQypIadCWoPJ/E5hroyfZ3g9lUhAbxH5sOcgP2QBvbpEaBix+Ib9BhwoPc4xz3jVpvI2Rc6kL40Q==
X-Received: by 2002:ac2:46ea:: with SMTP id q10mr2890389lfo.128.1588265732915;
        Thu, 30 Apr 2020 09:55:32 -0700 (PDT)
Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from localhost.localdomain ([31.172.136.39])
        by smtp.gmail.com with ESMTPSA id j23sm136125lfh.65.2020.04.30.09.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 09:55:32 -0700 (PDT)
From: "Oleksandr" <oleksandr.s.popovych@globallogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Subject: [OE-core][PATCH v8] expat: Added ptest
Date: Thu, 30 Apr 2020 19:55:29 +0300
Message-Id: <20200430165529.23657-1-oleksandr.s.popovych@globallogic.com>
X-Mailer: git-send-email 2.17.1

For ptest support of expat package:

 - expat_2.2.9.bb recipe was switched on cmake-based building system to
avoid cahnges in autotools build system  which considered in upstream as
potentially deprecated (https://github.com/libexpat/libexpat/issues/330).

 - cmake-native_3.16.5.bb recipe was forced to use bundled version of
expat from CMake source tree. Therefore expat-native package has been removed
from DEPENDS variable for cmake-native recipe. Without
these changes, next dependency loop appears:

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
 .../0001-Add-output-of-tests-result.patch     | 84 +++++++++++++++++++
 meta/recipes-core/expat/expat/run-ptest       | 24 ++++++
 meta/recipes-core/expat/expat_2.2.9.bb        | 14 +++-
 .../cmake/cmake-native_3.16.5.bb              |  3 +-
 4 files changed, 120 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
 create mode 100644 meta/recipes-core/expat/expat/run-ptest

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
index 8f3db41352..f477f99baf 100644
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
+EXTRA_OECMAKE_class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-do_configure_prepend () {
-	rm -f ${S}/conftools/libtool.m4
+RDEPENDS_${PN}-ptest += "bash"
+
+inherit cmake lib_package ptest
+
+do_install_ptest_class-target() {
+	install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND += "native nativesdk"
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
index b2952ee5f5..d91e42ef9a 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
+DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
@@ -21,6 +21,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
-- 
2.17.1

