Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.42191.1595264093104353358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 09:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=google header.b=P3VpmWt1;
 spf=pass (domain: globallogic.com, ip: 209.85.208.181, mailfrom: oleksandr.s.popovych@globallogic.com)
Received: by mail-lj1-f181.google.com with SMTP id q7so21045682ljm.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iGyQy25qcNuR6nlyYEj59FbaJiU5brXDOBO4tTF2hSo=;
        b=P3VpmWt1V0wQIWJH64lxAXQWgktM0aqYOZPtmh6NrO1rQZF2c+QOpM36oI0ikwh7zi
         z6eHURYQZVO9IkA3x1oizoTQlAwLwIXSVjJKvG4rj2ItFDFBbnjuOqthZuGrp2wHsE1C
         LOgqg+zrDG6utCCcPMVVisR44HzEru0SvH9EVORFENdPlH+dL0psX3glA1O7jOOJl+tN
         zWRW4IlC2Ggqy3WMHesFoqq6ghnSjPhaLX0r5EVQ12JuqQEl8abkQsFkCbtULGNz1NFi
         yFxdmKvNjegKmTzjRlU3labnHxcCElcHNZUv8DSgRPlkC2FQDTqGtvYnCMkECZKOdZLL
         YIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iGyQy25qcNuR6nlyYEj59FbaJiU5brXDOBO4tTF2hSo=;
        b=gQyTgIeysQAsl6N77JaG1rSpeVAnsppNyiYm6WjADKmI2JZYYakkA0Xb5Yur6xjZ5G
         Oe91D0s+RiQNbiqF3SNXUGMZ6Kjp6SX3AL6N3uqDDdzQI79pFJkMHinfpuEIveK9PLpi
         IX43chTz+7W2LwM2SF0nOgrzkAxgiu50YIuPrEdnYcb98S/eYnGpd0RlmXwwJ09W0tUf
         sLOYVya98CCKikAgio2QlYLcINX84whKhnU25XJMP8Y86Jep+kOYnOQjQY2Ya79eDx5I
         P+wkzJ4CJTmNQwifoAmMIGGeIcY9MBIp2N5kxPCxNmk+9EuI4qFmh9s7xht69yrR6Y0S
         IG1A==
X-Gm-Message-State: AOAM532eH02QZ3BkROgfq+x2HWj5fIbL4+QlHYmCVvq8Bx6MDK5n0cVX
	FV0AGEyDm1xsn8Avx9iroi+Gmxkdsbo=
X-Google-Smtp-Source: ABdhPJyDMNlGbz3sSq/VOEntz7EDzPf9EXIe9aaB86LgLrvADa26eaxD7YD2tU08YqOEHUMCr3wwJA==
X-Received: by 2002:a2e:780e:: with SMTP id t14mr11457982ljc.444.1595264090656;
        Mon, 20 Jul 2020 09:54:50 -0700 (PDT)
Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from localhost.localdomain ([92.60.178.172])
        by smtp.gmail.com with ESMTPSA id x205sm1629988lfa.96.2020.07.20.09.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 09:54:49 -0700 (PDT)
From: "Oleksandr" <oleksandr.s.popovych@globallogic.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Subject: [OE-core][PATCH v10] expat: Added ptest
Date: Mon, 20 Jul 2020 19:54:42 +0300
Message-Id: <20200720165442.23867-1-oleksandr.s.popovych@globallogic.com>
X-Mailer: git-send-email 2.17.1

For ptest support of expat package:

 - expat_2.2.9.bb recipe was switched on cmake-based building system to
avoid cahnges in autotools build system which considered in upstream as
potentially deprecated (https://github.com/libexpat/libexpat/issues/330).

 - cmake-native_3.17.3.bb recipe was forced to use bundled version of
expat from CMake source tree. Therefore expat-native package has been removed
from DEPENDS variable for cmake-native recipe. Without
these changes, next dependency loop appears:

Dependency loop #1 found:
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_compile (dependent Tasks ['cmake-native_3.17.3.bb:do_configure'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_install (dependent Tasks ['cmake-native_3.17.3.bb:do_compile'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_populate_sysroot (dependent Tasks ['cmake-native_3.17.3.bb:do_install'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_prepare_recipe_sysroot (dependent Tasks ['cmake-native_3.17.3.bb:do_populate_sysroot', 'ninja_1.10.0.bb:do_populate_sysroot', 'expat_2.2.9.bb:do_fetch'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_configure (dependent Tasks ['expat_2.2.9.bb:do_patch', 'expat_2.2.9.bb:do_prepare_recipe_sysroot', 'expat_2.2.9.bb:do_generate_toolchain_file', 'expat_2.2.9.bb:do_deploy_source_date_epoch'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_compile (dependent Tasks ['expat_2.2.9.bb:do_configure'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_install (dependent Tasks ['expat_2.2.9.bb:do_compile'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot (dependent Tasks ['expat_2.2.9.bb:do_install'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_prepare_recipe_sysroot (dependent Tasks ['expat_2.2.9.bb:do_populate_sysroot', 'xz_5.2.5.bb:do_populate_sysroot', 'bzip2_1.0.8.bb:do_populate_sysroot', 'ncurses_6.2.bb:do_populate_sysroot', 'zlib_1.2.11.bb:do_populate_sysroot', 'cmake-native_3.17.3.bb:do_fetch', 'curl_7.71.1.bb:do_populate_sysroot'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_configure (dependent Tasks ['cmake-native_3.17.3.bb:do_deploy_source_date_epoch', 'cmake-native_3.17.3.bb:do_patch', 'cmake-native_3.17.3.bb:do_prepare_recipe_sysroot'])

 - run-ptest script that initalizes testing, copies testing
executables' output to log file and measures execution time of each testing
executable was added.

 - patch that implements output of each testcase result in testing exectutable
was added.

Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
---
 .../0001-Add-output-of-tests-result.patch     | 83 +++++++++++++++++++
 meta/recipes-core/expat/expat/run-ptest       | 23 ++++++
 meta/recipes-core/expat/expat_2.2.9.bb        | 14 +++-
 .../cmake/cmake-native_3.17.3.bb              |  3 +-
 4 files changed, 118 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
 create mode 100644 meta/recipes-core/expat/expat/run-ptest

diff --git a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
new file mode 100644
index 0000000000..c78fd2bbef
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
@@ -0,0 +1,83 @@
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
diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
new file mode 100644
index 0000000000..7bc81eba8a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -0,0 +1,23 @@
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
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
index b2952ee5f5..d91e42ef9a 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
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
