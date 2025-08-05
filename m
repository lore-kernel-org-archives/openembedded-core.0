Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FA8CA0EC0
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 16:43:56 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.4082.1754412229644000427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 09:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CmHoJ/0q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bd6e84eddso5777145b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754412229; x=1755017029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9zTCg731aPfgmJw5ig6Z0G9zxMI95lUEDqH3nGe9v8=;
        b=CmHoJ/0qfb75qiJlbnDUZ42xWnxvtMq0viIZEKX7wnZt7jsnbFlj0H7lEj3q6Uc7/4
         vtqhpKbgb10vtEEMmFdER3QmYZIpe75f1Pg6p8OjWnx5gKyE5qWdgVxF3beFi/OpJmnr
         JjQw5ObYlbl9nZXiGD+kozUm+3GMg9VLnGDpbR5zPAo+TsnxI6HDLH7oNdi6/8YRv8Zh
         90iBddNop+2XkCGDAGT9vDvNqqaZbQnH/Z61p3LOqKNpL+ABBF6b2L2KaVi3WbeOidpy
         FkSjW8uJOMNHW/utZ3cNQmUaPaYNmUTIF+Vf+fPHlYtUcKwlpT97E/wdLjNb/79sdwS+
         kZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412229; x=1755017029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9zTCg731aPfgmJw5ig6Z0G9zxMI95lUEDqH3nGe9v8=;
        b=HxURvS3hMiroiO1qi7gm1DOm+7Bivm8yDARmopU8xHiosX3HaVaxZDTyl0vNE2HX4j
         ICDW6+UP2C4coQzgtDQqPlAA12Zef1e3Pr8biFqxsRpUmf++K5Tv3jSfmfK0lMxEa0UP
         /wCg2UexFgvf+AfE/SBSuQQpLpedt9+Jkp4vffAJbYBjU8gslcCIvGXQoD6Ly8/8RuiT
         SlyHgRurMdoDwciTuENbe9lwegFKvKu28xTA1Eae6LUbqgLpkWgzkwQsLA9MnK77CK4e
         jdzVI9uBOtyEDNqQ2VdmrLflER7zvj3qm+QkrlcTquBHRoPFsB0/62USd1Q1V5fbGJwc
         WVuw==
X-Gm-Message-State: AOJu0Yw9mtfovOhBNRC6I+He17hNTPo8w3iAJrNLNoafB6XFqWpchPrv
	K313YYsKqlqsuGDGQFBCTu5WrkTIM82/iJWLyYueTu22g9Hlrt35vG7wI/cD8N8HW9vQmLFhIiP
	XDR57
X-Gm-Gg: ASbGncvd0uS5E7SPOqROo8Bd1Wc8hJ2MHRQUVWy4kNZ0wKllvagi/LDKZWJ9AvD3Fyi
	ujtH6jDctPFf3lAl+7dSBfncY85393FW7AHc0HnisNF2J91BSrgErP9LGlYoH5Vdw4QKo4i4qtY
	/ykC/KSalvstt57kj957nj/ziH9Jw4U8z9ZYU5q1ohV2TFLN4IOx7DHlRwv8uZO1UVnQZbcFBMW
	V+FNtbke6s6p9rO1hJ8rOIwJ0BuNqCcaFdyeTZ4kZ+ZAtz8Po2tpsW31+0zgp9TLyJNte/UegIA
	XkomRN15CJr5ZzckQdbAaqfpOhKhSxg652/HZaXsb9h0Jsc9gXWaZrECKp+2Qs6ykX/fbmRVqhm
	WMJMMEqspgNiD
X-Google-Smtp-Source: AGHT+IEUu2TkQ37OanE0489ogkh59iAdOBp0aFuWVn1spyl+dpnkMLllaaW5/nhRszI8oyKxjERVXw==
X-Received: by 2002:a17:903:1251:b0:23f:df36:5f17 with SMTP id d9443c01a7336-24246f7f2d7mr210563805ad.22.1754412228507;
        Tue, 05 Aug 2025 09:43:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3554:164c:182:30f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e7d8sm137633135ad.42.2025.08.05.09.43.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:43:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] glibc: stable 2.35 branch updates
Date: Tue,  5 Aug 2025 09:43:36 -0700
Message-ID: <3921549f6420e44a250d06cdef2c9d423fb6e39f.1754412086.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754412086.git.steve@sakoman.com>
References: <cover.1754412086.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 16:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221483

From: Peter Marko <peter.marko@siemens.com>

This is a single commit bump containing only CVE fix
$ git log --oneline d80401002011f470d9c6eb604bf734715e9b3a8c..a66bc3941ff298e474d5f02d0c3303401951141f
a66bc3941f posix: Fix double-free after allocation failure in regcomp (bug 33185)

Test results didn't change except newly added test succeeding.
(tst-regcomp-bracket-free)

Also add CVE-2025-0395 ignore which was already included in previous
hash bumps.

Also drop an unreferenced patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0025-CVE-2025-4802.patch      | 250 ------------------
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +-
 3 files changed, 2 insertions(+), 252 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b269518af4..0b06005b25 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "80401002011f470d9c6eb604bf734715e9b3a8c2"
+SRCREV_glibc ?= "a66bc3941ff298e474d5f02d0c3303401951141f"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
deleted file mode 100644
index a1197c0318..0000000000
--- a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
+++ /dev/null
@@ -1,250 +0,0 @@
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
-_dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;-  _dl_init_all_dirs = GL(dl_all_dirs);
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
- setup_vdso_pointers ();
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
index df5f14984a..265dcb9129 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -27,7 +27,7 @@ CVE_CHECK_IGNORE += "CVE-2023-4527"
 CVE_CHECK_IGNORE += " \
     CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
     CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
-    CVE-2025-4802 \
+    CVE-2025-0395 CVE-2025-4802 CVE-2025-8058 \
 "
 
 DEPENDS += "gperf-native bison-native"
-- 
2.43.0


