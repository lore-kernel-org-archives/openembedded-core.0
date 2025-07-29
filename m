Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C25AC87FCE
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 21:46:45 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.20318.1753825595793798406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 14:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=C7yiax1X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202507292146319260521b12993c378c-kumqi_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202507292146319260521b12993c378c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 29 Jul 2025 23:46:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BGm0PgmyfFkTl1jJeEe0XhWPeaHSwY/L3+KnngYrpmM=;
 b=C7yiax1XqVUeYCQqfIemqrlw/NNZpeqbu7mUGC98jn86/DuOQTLLjBuiArNhJZ0uFfM8CI
 2lBIKFFwpU+MD7BoRt2Swf4Pplalu3/W43KL2LT2qRhlfHxf1WnyJJH+A3qZJeeZ2KQKdFDF
 wgA35aVTy/c+n/48cAMGqhHfQVAd6+jjlK8K3M8Gmg/kV0Np0oY7x8XNMC2gZpKvN/ijty+G
 CFNRS82+J6eb6V7JKqMbt7N8O+7JBfmUY4PW33n/YpUh2osLaVeZ5kJatyr9F2NQHNqijs15
 umSsBLKtQFvC8OQ1aJamG45uz7i2ZUoQupbdQN55iJvTNJHgyD6f6tWg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Tue, 29 Jul 2025 23:45:43 +0200
Message-Id: <20250729214543.3641528-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 21:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221087

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline d2febe7c407665c18cfea1930c65f41899ab3aa3..a66bc3941ff298e474d5f02d0c3303401951141f
a66bc3941f posix: Fix double-free after allocation failure in regcomp (bug 33185)
8040100201 Fix error reporting (false negatives) in SGID tests
c6ec750be5 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
c9e44b6467 support: Don't fail on fchown when spawning sgid processes
621c65ccf1 elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
c7ff2bc297 Revert "elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static"
8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)
08aea7712d support: Add support_record_failure_barrier
901e24b128 support: Use const char * argument in support_capture_subprogram_self_sgid
bff3b0f16c elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static

Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.

Drop backported CVE patch (and add it to CVE ignore list).

Also add CVE-2025-0395 CVE ignore which was already included in previous
hash bumps.

Testing Results:
             Before   After    Diff
PASS          4753     4755     +2
XPASS         6        6         0
FAIL          173      168      -5
XFAIL         16       16        0
UNSUPPORTED   240      244      +4

FAIL -> UNSUPPORTED:
+elf/tst-dlopen-sgid
+elf/tst-env-setuid
+elf/tst-env-setuid-tunables
+stdlib/tst-secure-getenv

FAIL (other diff):
-posix/tst-wait3
-string/test-memcpy
-string/test-mempcpy
+malloc/tst-mallocfork3-mcheck
+malloc/tst-malloc-fork-deadlock-malloc-hugetlb1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0025-CVE-2025-4802.patch      | 249 ------------------
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +-
 3 files changed, 2 insertions(+), 251 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 34b199c02b..0b06005b25 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "d2febe7c407665c18cfea1930c65f41899ab3aa3"
+SRCREV_glibc ?= "a66bc3941ff298e474d5f02d0c3303401951141f"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
deleted file mode 100644
index 0298f5a865..0000000000
--- a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-From 32917e7ee972e7a01127a04454f12ef31dc312ed Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Wed, 11 Jun 2025 03:19:10 -0700
-Subject: [PATCH] elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for
- static
-
-It mimics the ld.so behavior.
-Checked on x86_64-linux-gnu.
-
-[New Test Case]
-elf: Test case for bug 32976
-[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]
-
-Check that LD_LIBRARY_PATH is ignored for AT_SECURE statically
-linked binaries, using support_capture_subprogram_self_sgid.
-
-Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
-                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2]
-
-CVE: CVE-2025-4802
-
-Co-authored-by: Florian Weimer <fweimer@redhat.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- elf/Makefile              |   4 ++
- elf/dl-support.c          |  46 ++++++++---------
- elf/tst-dlopen-sgid-mod.c |   1 +
- elf/tst-dlopen-sgid.c     | 104 ++++++++++++++++++++++++++++++++++++++
- 4 files changed, 132 insertions(+), 23 deletions(-)
- create mode 100644 elf/tst-dlopen-sgid-mod.c
- create mode 100644 elf/tst-dlopen-sgid.c
-
-diff --git a/elf/Makefile b/elf/Makefile
-index 61c41ea6..3ad66ab6 100644
---- a/elf/Makefile
-+++ b/elf/Makefile
-@@ -274,6 +274,7 @@ tests-static-normal := \
-   tst-array1-static \
-   tst-array5-static \
-   tst-dl-iter-static \
-+  tst-dlopen-sgid \
-   tst-dst-static \
-   tst-env-setuid \
-   tst-env-setuid-tunables \
-@@ -807,6 +808,7 @@ modules-names = \
-   tst-dlmopen-gethostbyname-mod \
-   tst-dlmopen-twice-mod1 \
-   tst-dlmopen-twice-mod2 \
-+  tst-dlopen-sgid-mod \
-   tst-dlopenfaillinkmod \
-   tst-dlopenfailmod1 \
-   tst-dlopenfailmod2 \
-@@ -2913,3 +2915,5 @@ $(objpfx)tst-recursive-tls.out: \
-     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
- $(objpfx)tst-recursive-tlsmod%.os: tst-recursive-tlsmodN.c
- 	$(compile-command.c) -DVAR=thread_$* -DFUNC=get_threadvar_$*
-+
-+$(objpfx)tst-dlopen-sgid.out: $(objpfx)tst-dlopen-sgid-mod.so
-diff --git a/elf/dl-support.c b/elf/dl-support.c
-index 09079c12..c2baed69 100644
---- a/elf/dl-support.c
-+++ b/elf/dl-support.c
-@@ -272,8 +272,6 @@ _dl_non_dynamic_init (void)
-   _dl_main_map.l_phdr = GL(dl_phdr);
-   _dl_main_map.l_phnum = GL(dl_phnum);
- 
--  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
--
-   /* Set up the data structures for the system-supplied DSO early,
-      so they can influence _dl_init_paths.  */
-   setup_vdso (NULL, NULL);
-@@ -281,27 +279,6 @@ _dl_non_dynamic_init (void)
-   /* With vDSO setup we can initialize the function pointers.  */
-   setup_vdso_pointers ();
- 
--  /* Initialize the data structures for the search paths for shared
--     objects.  */
--  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
--		  /* No glibc-hwcaps selection support in statically
--		     linked binaries.  */
--		  NULL, NULL);
--
--  /* Remember the last search directory added at startup.  */
--  _dl_init_all_dirs = GL(dl_all_dirs);
--
--  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
--
--  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
--
--  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
--
--  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
--  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
--    _dl_profile_output
--      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
--
-   if (__libc_enable_secure)
-     {
-       static const char unsecure_envvars[] =
-@@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
- #endif
-     }
- 
-+  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
-+
-+  /* Initialize the data structures for the search paths for shared
-+     objects.  */
-+  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
-+		  /* No glibc-hwcaps selection support in statically
-+		     linked binaries.  */
-+		  NULL, NULL);
-+
-+  /* Remember the last search directory added at startup.  */
-+  _dl_init_all_dirs = GL(dl_all_dirs);
-+
-+  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
-+
-+  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
-+
-+  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
-+
-+  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
-+  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
-+    _dl_profile_output
-+      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
-+
- #ifdef DL_PLATFORM_INIT
-   DL_PLATFORM_INIT;
- #endif
-diff --git a/elf/tst-dlopen-sgid-mod.c b/elf/tst-dlopen-sgid-mod.c
-new file mode 100644
-index 00000000..5eb79eef
---- /dev/null
-+++ b/elf/tst-dlopen-sgid-mod.c
-@@ -0,0 +1 @@
-+/* Opening this object should not succeed.  */
-diff --git a/elf/tst-dlopen-sgid.c b/elf/tst-dlopen-sgid.c
-new file mode 100644
-index 00000000..47829a40
---- /dev/null
-+++ b/elf/tst-dlopen-sgid.c
-@@ -0,0 +1,104 @@
-+/* Test case for ignored LD_LIBRARY_PATH in static startug (bug 32976).
-+   Copyright (C) 2025 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <dlfcn.h>
-+#include <gnu/lib-names.h>
-+#include <stddef.h>
-+#include <stdint.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <support/capture_subprocess.h>
-+#include <support/check.h>
-+#include <support/support.h>
-+#include <support/temp_file.h>
-+#include <unistd.h>
-+
-+/* This is the name of our test object.  Use a custom module for
-+   testing, so that this object does not get picked up from the system
-+   path.  */
-+static const char dso_name[] = "tst-dlopen-sgid-mod.so";
-+
-+/* Used to mark the recursive invocation.  */
-+static const char magic_argument[] = "run-actual-test";
-+
-+static int
-+do_test (void)
-+{
-+/* Pathname of the directory that receives the shared objects this
-+   test attempts to load.  */
-+  char *libdir = support_create_temp_directory ("tst-dlopen-sgid-");
-+
-+  /* This is supposed to be ignored and stripped.  */
-+  TEST_COMPARE (setenv ("LD_LIBRARY_PATH", libdir, 1), 0);
-+
-+  /* Copy of libc.so.6.  */
-+  {
-+    char *from = xasprintf ("%s/%s", support_objdir_root, LIBC_SO);
-+    char *to = xasprintf ("%s/%s", libdir, LIBC_SO);
-+    add_temp_file (to);
-+    support_copy_file (from, to);
-+    free (to);
-+    free (from);
-+  }
-+
-+  /* Copy of the test object.   */
-+  {
-+    char *from = xasprintf ("%s/elf/%s", support_objdir_root, dso_name);
-+    char *to = xasprintf ("%s/%s", libdir, dso_name);
-+    add_temp_file (to);
-+    support_copy_file (from, to);
-+    free (to);
-+    free (from);
-+  }
-+
-+  TEST_COMPARE (support_capture_subprogram_self_sgid (magic_argument), 0);
-+
-+  free (libdir);
-+
-+  return 0;
-+}
-+
-+static void
-+alternative_main (int argc, char **argv)
-+{
-+  if (argc == 2 && strcmp (argv[1], magic_argument) == 0)
-+    {
-+      if (getgid () == getegid ())
-+        /* This can happen if the file system is mounted nosuid.  */
-+        FAIL_UNSUPPORTED ("SGID failed: GID and EGID match (%jd)\n",
-+                          (intmax_t) getgid ());
-+
-+      /* Should be removed due to SGID.  */
-+      TEST_COMPARE_STRING (getenv ("LD_LIBRARY_PATH"), NULL);
-+
-+      TEST_VERIFY (dlopen (dso_name, RTLD_NOW) == NULL);
-+      {
-+        const char *message = dlerror ();
-+        TEST_COMPARE_STRING (message,
-+                             "tst-dlopen-sgid-mod.so:"
-+                             " cannot open shared object file:"
-+                             " No such file or directory");
-+      }
-+
-+      support_record_failure_barrier ();
-+      exit (EXIT_SUCCESS);
-+    }
-+}
-+
-+#define PREPARE alternative_main
-+#include <support/test-driver.c>
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3023e9c1ed..265dcb9129 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -27,6 +27,7 @@ CVE_CHECK_IGNORE += "CVE-2023-4527"
 CVE_CHECK_IGNORE += " \
     CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
     CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
+    CVE-2025-0395 CVE-2025-4802 CVE-2025-8058 \
 "
 
 DEPENDS += "gperf-native bison-native"
@@ -61,7 +62,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0025-CVE-2025-4802.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \

