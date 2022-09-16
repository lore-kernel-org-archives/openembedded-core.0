Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH] grub: Apply backports to fix build with clang on x86
Date: Fri, 16 Sep 2022 12:05:47 -0700
Message-Id: <20220916190547.1234529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-obsoleted-malign-jumps-loops-functi.patch | 48 +++++++++++++++
 ...for-falign-jumps-1-beside-falign-loo.patch | 59 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 3 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch

diff --git a/meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch b/meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch
new file mode 100644
index 0000000000..98142a7b60
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch
@@ -0,0 +1,48 @@
+From eb486898dac8cbc29b2cc39f911b657c3417ae34 Mon Sep 17 00:00:00 2001
+From: Fangrui Song via Grub-devel <grub-devel@gnu.org>
+Date: Thu, 26 Aug 2021 09:02:31 -0700
+Subject: [PATCH 1/2] configure: Remove obsoleted -malign-{jumps, loops,
+ functions}
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The GCC warns "cc1: warning: ‘-malign-loops’ is obsolete, use ‘-falign-loops’".
+The Clang silently ignores -malign-{jumps,loops,functions}.
+
+The preferred -falign-* forms have been supported since GCC 3.2. So, just
+remove -malign-{jumps,loops,functions}.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=eb486898dac8cbc29b2cc39f911b657c3417ae34]
+Signed-off-by: Fangrui Song <maskray@google.com>
+Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ configure.ac | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bee28dbeb..9a12151bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -805,17 +805,8 @@ if test "x$target_cpu" = xi386; then
+ 	[grub_cv_cc_falign_loop=no])
+   ])
+ 
+-  AC_CACHE_CHECK([whether -malign-loops works], [grub_cv_cc_malign_loop], [
+-    CFLAGS="$TARGET_CFLAGS -malign-loops=1 -Werror"
+-    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
+-        [grub_cv_cc_malign_loop=yes],
+-	[grub_cv_cc_malign_loop=no])
+-  ])
+-
+   if test "x$grub_cv_cc_falign_loop" = xyes; then
+     TARGET_CFLAGS="$TARGET_CFLAGS -falign-jumps=1 -falign-loops=1 -falign-functions=1"
+-  elif test "x$grub_cv_cc_malign_loop" = xyes; then
+-    TARGET_CFLAGS="$TARGET_CFLAGS -malign-jumps=1 -malign-loops=1 -malign-functions=1"
+   fi
+ fi
+ 
+-- 
+2.37.3
+
diff --git a/meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch b/meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch
new file mode 100644
index 0000000000..437e5b29b2
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch
@@ -0,0 +1,59 @@
+From e372dcb0d4541ee9b9682cde088ec87a7b238ca2 Mon Sep 17 00:00:00 2001
+From: Fangrui Song via Grub-devel <grub-devel@gnu.org>
+Date: Thu, 26 Aug 2021 09:02:32 -0700
+Subject: [PATCH 2/2] configure: Check for -falign-jumps=1 beside
+ -falign-loops=1
+
+The Clang does not support -falign-jumps and only recently gained support
+for -falign-loops. The -falign-jumps=1 should be tested beside
+-fliang-loops=1 to avoid passing unrecognized options to the Clang:
+
+  clang-14: error: optimization flag '-falign-jumps=1' is not supported [-Werror,-Wignored-optimization-argument]
+
+The -falign-functions=1 is supported by GCC 5.1.0/Clang 3.8.0. So, just
+add the option unconditionally.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e372dcb0d4541ee9b9682cde088ec87a7b238ca2]
+Signed-off-by: Fangrui Song <maskray@google.com>
+Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ configure.ac | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9a12151bd..eeb5d2211 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -798,6 +798,8 @@ fi
+ 
+ # Force no alignment to save space on i386.
+ if test "x$target_cpu" = xi386; then
++  TARGET_CFLAGS="$TARGET_CFLAGS -falign-functions=1"
++
+   AC_CACHE_CHECK([whether -falign-loops works], [grub_cv_cc_falign_loop], [
+     CFLAGS="$TARGET_CFLAGS -falign-loops=1 -Werror"
+     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
+@@ -806,7 +808,18 @@ if test "x$target_cpu" = xi386; then
+   ])
+ 
+   if test "x$grub_cv_cc_falign_loop" = xyes; then
+-    TARGET_CFLAGS="$TARGET_CFLAGS -falign-jumps=1 -falign-loops=1 -falign-functions=1"
++    TARGET_CFLAGS="$TARGET_CFLAGS -falign-loops=1"
++  fi
++
++  AC_CACHE_CHECK([whether -falign-jumps works], [grub_cv_cc_falign_jumps], [
++    CFLAGS="$TARGET_CFLAGS -falign-jumps=1 -Werror"
++    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
++        [grub_cv_cc_falign_jumps=yes],
++        [grub_cv_cc_falign_jumps=no])
++  ])
++
++  if test "x$grub_cv_cc_falign_jumps" = xyes; then
++    TARGET_CFLAGS="$TARGET_CFLAGS -falign-jumps=1"
+   fi
+ fi
+ 
+-- 
+2.37.3
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 47ea561002..4a4bd571f5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch \
            file://CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch \
            file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch \
+           file://0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch \
+           file://0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.37.3

