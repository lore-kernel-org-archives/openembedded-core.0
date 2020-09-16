Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.3068.1600298590255757864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 16:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: stacy.gaikovaia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08GNN3cu026361
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 16:23:08 -0700 (PDT)
Received: from yow-sgaikova-lx.wrs.com (128.224.141.57) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 16 Sep 2020 16:23:05 -0700
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] fix memcheck vgtests remove fullpath-after flags
Date: Wed, 16 Sep 2020 19:23:04 -0400
Message-ID: <20200916232304.1706541-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

Previously in:
    f75792b28e valgrind: make a few more ptests pass
the vagrind test runner was adjusted to suppress part
of a path that only exists when run in the yocto ptest
environment. Unfortunately this change includes the
valgrind version and when valgrind was last updated,
the patch was not changed. Rather than continually updating
the patch or even generating the version dynamically,
we can simply change the expected output for two tests.

The reason the option: --fullpath-after=foo was
introduced into the effected valgrind ptests was to
deal with builds where ccache is used. Compiling with
ccache enabled sometimes causes the source file absolute
name to be found in a full path that is not the same as $PWD.

See commit c80f32e662dfa2a4f046960a25d5b8b7a8821bea in
valgrind for more information about changes to the
arguments that test badfree3 and varinfo5 run with.

There is also a minor fix to add the missing overloading.pm
perl package and put the dependencies in alphabetic order.

Upstream-Status: Inappropriate [embedded specific]

Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 ...vgtests-remove-fullpath-after-flags.patch} | 30 ++++++++++---------
 .../valgrind/valgrind_3.16.1.bb               | 16 ++++++++--
 2 files changed, 30 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/valgrind/valgrind/{0001-adjust-path-filter-for-2-memcheck-tests.patch => 0001-memcheck-vgtests-remove-fullpath-after-flags.patch} (52%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
similarity index 52%
rename from meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch
rename to meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index 4bc4bb086c..dce8b52ba3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,40 +1,42 @@
-From bf63e35c3036e6040c8cfecabc7160b1f36b0591 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Wed, 28 Aug 2019 12:31:15 -0400
-Subject: [PATCH] adjust path filter for 2 memcheck tests
+From 3ff82dcb844f98dbf67c69f11f6516bc234725a9 Mon Sep 17 00:00:00 2001
+From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
+Date: Wed, 16 Sep 2020 13:45:07 -0400
+Subject: [PATCH] memcheck vgtests remove fullpath-after flags
 
 Test executables produced when cross-compiling can contain
-relative paths such as:
-   coregrind/tests/../../../valgrind-3.15.0/coregrind/
-Use the --fullpath-after option to match and therefore
-suppress more of the prefix to enable test to pass.
+relative paths containing version number, such as:
+    coregrind/tests/../../../valgrind-3.16.1/coregrind
+
+Remove the --fullpath-after option so yocto project doesn't
+have to upgrade patch every valgrind uprev. Upgrade test stderr
+paths in corresponding tests .bb script.
 
 Upstream-Status: Inappropriate [embedded specific]
 
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 ---
  memcheck/tests/badfree3.vgtest | 2 +-
  memcheck/tests/varinfo5.vgtest | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/memcheck/tests/badfree3.vgtest b/memcheck/tests/badfree3.vgtest
-index 3dfc5fd8a..57eec21f3 100644
+index 3dfc5fd8a..4ee03f00a 100644
 --- a/memcheck/tests/badfree3.vgtest
 +++ b/memcheck/tests/badfree3.vgtest
 @@ -1,3 +1,3 @@
  prog: badfree
 -vgopts: -q --fullpath-after=memcheck/ --fullpath-after=coregrind/
-+vgopts: -q --fullpath-after=/valgrind-3.15.0/memcheck/ --fullpath-after=/valgrind-3.15.0/coregrind/
++vgopts: -q
  stderr_filter_args: badfree.c
 diff --git a/memcheck/tests/varinfo5.vgtest b/memcheck/tests/varinfo5.vgtest
-index 063d00dce..6907bb2f6 100644
+index 063d00dce..79c4a72a4 100644
 --- a/memcheck/tests/varinfo5.vgtest
 +++ b/memcheck/tests/varinfo5.vgtest
 @@ -1,3 +1,3 @@
  prog: varinfo5
 -vgopts: --fullpath-after=memcheck/  --fullpath-after=coregrind/ --read-var-info=yes --read-inline-info=yes -q
-+vgopts: --fullpath-after=/valgrind-3.15.0/memcheck/  --fullpath-after=/valgrind-3.15.0/coregrind/ --read-var-info=yes --read-inline-info=yes -q
++vgopts: --read-var-info=yes --read-inline-info=yes -q
  stderr_filter: filter_varinfo3
 -- 
-2.22.0
+2.25.1
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 484a229a1a..d4ca1a7752 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -36,7 +36,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
-           file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
+           file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
@@ -47,6 +47,17 @@ UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
+# patch 0001-memcheck-vgtests-remove-fullpath-after-flags.patch removes relative path
+# argument. Change expected stderr files accordingly.
+do_patch_append() {
+    bb.build.exec_func('do_sed_paths', d)
+}
+
+do_sed_paths() {
+    sed -i -e 's|tests/||' ${S}/memcheck/tests/badfree3.stderr.exp
+    sed -i -e 's|tests/||' ${S}/memcheck/tests/varinfo5.stderr.exp
+}
+
 # valgrind supports armv7 and above
 COMPATIBLE_HOST_armv4 = 'null'
 COMPATIBLE_HOST_armv5 = 'null'
@@ -118,7 +129,8 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 RDEPENDS_${PN}-ptest += " bash coreutils file \
    gdb libgomp \
    perl \
-   perl-module-getopt-long perl-module-file-basename perl-module-file-glob \
+   perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
+   perl-module-overloading \
    procps sed ${PN}-dbg ${PN}-src"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
-- 
2.25.1

