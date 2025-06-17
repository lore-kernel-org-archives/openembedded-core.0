Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CC6C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.31258.1750195234524889677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hZ1J9pXV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7481600130eso6828353b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195234; x=1750800034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGC75AFgi5BV8cQX/zJf18G7oVJsa3O+ashwNkOP7RA=;
        b=hZ1J9pXVQ2wlzMjku3jA6fjjvA/AE+7TwHueIMWEkjFdDpjf1FyXEyB123EOY0G0vH
         cF7BsuoT82eX4essiq/4wo/5N8jEMQ+0pnhZmPnlyfEhsNXRQ9GF9oNRnMbtJPaNR6I+
         9DiVG/dHhh9nfbfresloo02rHQs5hZyVZcjR7D67WRjzCht/KdikEdv27ZJX5mppwpdG
         SlOScgkfOrggXrQC/eL30Q3IYrlRDvJQ07si5DsJdzg8ibpKsJaay8dY/DNlPCty1tWp
         5EJehjGEmKeFVWORgk8+vaIiphuMYAamYXIea/CImh08V2pD5A1kGiEr00QkKx3/wWN3
         aSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195234; x=1750800034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGC75AFgi5BV8cQX/zJf18G7oVJsa3O+ashwNkOP7RA=;
        b=ViIVt1JKPBrflJK67wKMT2cjn4r0scwPE7mdjdR870zIbmjPYLExSbTYPEqQQ9sYaB
         sPraDq9QAAz+5ej/p73Xg9nzlxZEi+mGMI2IG8egOvWghzGIoS0gqW+h4hKyFq8lOFtE
         ROFqmN3uZanNGNliBSfa3d0Mjnoy0rgka4MvZrm5f3MiDyvEZKV1jvUW0VC/1va35lVZ
         QlnUNBx78MzyAdjG1+rvkeBdU1jptg9rQddSNTTCkoAVEy5RKYcJKWWFXSfPsTOz2vKy
         aiGDTLqShcX2pwKV0M2EU+y4CROWeA47e80l08FuW32znZJJarQBzIwNkapB1N0/hIkm
         TziA==
X-Gm-Message-State: AOJu0YxSMWXs0n+syQmjX6d6Ny3asZuki1CINDK56hRIAgADS6YDPmo3
	8oFEAVEPh0LBmGrf2BMd6O4mxLg+tcTayEGh2NvzQRGFc1OZpadcd7YyKIE9hpSDdxoMcDqUJu8
	O1tik
X-Gm-Gg: ASbGncukBg8Ejki7+JDy+MtrXt85Ws8yUcLywgXEkML7z8xBt8HmBCHXxUAJ9oJ3iDZ
	p3D3tsQNeGuGjarb4axGyKwIEMTiz9NRqkDI+LNyQkl6IlQ/Zn6l0a0bI2HW0bqdVxzMR5g6oYJ
	B5fYA3/OnmRydyEV3GJ2mkt3IOqAge1Pc+WAmqrmmCmUbrgbztXfjOMK/rUhB52AvluKRh/gb95
	z0GV6vAmD4XjwqJoy7jHKsgTkN7NbZ/lC9rCu3Pkw+x5uA88EC+a0VU9SnrRoGNM/fGwilHkpXi
	nXUsikWcHOxDKtBWo9/Qmc9io3PjJGUGlQT67Mf63QBkNgf+AV62nw==
X-Google-Smtp-Source: AGHT+IEwrHj5LQS/4HbIQds2ufidoKJ0aTmq5SOe9km5MqeCW2cR46XPn7saGHJQh3dApCjeMTItLQ==
X-Received: by 2002:a05:6a00:21cb:b0:73e:235a:1fca with SMTP id d2e1a72fcca58-7489d17526bmr21810264b3a.20.1750195233466;
        Tue, 17 Jun 2025 14:20:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/27] Glibc: Fix for CVE-2025-4802
Date: Tue, 17 Jun 2025 14:19:58 -0700
Message-ID: <2d0c574852ed934f339547220364f1d236aad987.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218918

From: Sunil Dora <sunilkumar.dora@windriver.com>

elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]

Upstream-Status: Backport [ https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2 ]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0025-CVE-2025-4802.patch      | 249 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
new file mode 100644
index 0000000000..0298f5a865
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
@@ -0,0 +1,249 @@
+From 32917e7ee972e7a01127a04454f12ef31dc312ed Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Wed, 11 Jun 2025 03:19:10 -0700
+Subject: [PATCH] elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for
+ static
+
+It mimics the ld.so behavior.
+Checked on x86_64-linux-gnu.
+
+[New Test Case]
+elf: Test case for bug 32976
+[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]
+
+Check that LD_LIBRARY_PATH is ignored for AT_SECURE statically
+linked binaries, using support_capture_subprogram_self_sgid.
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
+                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2]
+
+CVE: CVE-2025-4802
+
+Co-authored-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ elf/Makefile              |   4 ++
+ elf/dl-support.c          |  46 ++++++++---------
+ elf/tst-dlopen-sgid-mod.c |   1 +
+ elf/tst-dlopen-sgid.c     | 104 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 132 insertions(+), 23 deletions(-)
+ create mode 100644 elf/tst-dlopen-sgid-mod.c
+ create mode 100644 elf/tst-dlopen-sgid.c
+
+diff --git a/elf/Makefile b/elf/Makefile
+index 61c41ea6..3ad66ab6 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -274,6 +274,7 @@ tests-static-normal := \
+   tst-array1-static \
+   tst-array5-static \
+   tst-dl-iter-static \
++  tst-dlopen-sgid \
+   tst-dst-static \
+   tst-env-setuid \
+   tst-env-setuid-tunables \
+@@ -807,6 +808,7 @@ modules-names = \
+   tst-dlmopen-gethostbyname-mod \
+   tst-dlmopen-twice-mod1 \
+   tst-dlmopen-twice-mod2 \
++  tst-dlopen-sgid-mod \
+   tst-dlopenfaillinkmod \
+   tst-dlopenfailmod1 \
+   tst-dlopenfailmod2 \
+@@ -2913,3 +2915,5 @@ $(objpfx)tst-recursive-tls.out: \
+     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
+ $(objpfx)tst-recursive-tlsmod%.os: tst-recursive-tlsmodN.c
+ 	$(compile-command.c) -DVAR=thread_$* -DFUNC=get_threadvar_$*
++
++$(objpfx)tst-dlopen-sgid.out: $(objpfx)tst-dlopen-sgid-mod.so
+diff --git a/elf/dl-support.c b/elf/dl-support.c
+index 09079c12..c2baed69 100644
+--- a/elf/dl-support.c
++++ b/elf/dl-support.c
+@@ -272,8 +272,6 @@ _dl_non_dynamic_init (void)
+   _dl_main_map.l_phdr = GL(dl_phdr);
+   _dl_main_map.l_phnum = GL(dl_phnum);
+ 
+-  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
+-
+   /* Set up the data structures for the system-supplied DSO early,
+      so they can influence _dl_init_paths.  */
+   setup_vdso (NULL, NULL);
+@@ -281,27 +279,6 @@ _dl_non_dynamic_init (void)
+   /* With vDSO setup we can initialize the function pointers.  */
+   setup_vdso_pointers ();
+ 
+-  /* Initialize the data structures for the search paths for shared
+-     objects.  */
+-  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
+-		  /* No glibc-hwcaps selection support in statically
+-		     linked binaries.  */
+-		  NULL, NULL);
+-
+-  /* Remember the last search directory added at startup.  */
+-  _dl_init_all_dirs = GL(dl_all_dirs);
+-
+-  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
+-
+-  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
+-
+-  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
+-
+-  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
+-  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
+-    _dl_profile_output
+-      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
+-
+   if (__libc_enable_secure)
+     {
+       static const char unsecure_envvars[] =
+@@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
+ #endif
+     }
+ 
++  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
++
++  /* Initialize the data structures for the search paths for shared
++     objects.  */
++  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
++		  /* No glibc-hwcaps selection support in statically
++		     linked binaries.  */
++		  NULL, NULL);
++
++  /* Remember the last search directory added at startup.  */
++  _dl_init_all_dirs = GL(dl_all_dirs);
++
++  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
++
++  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
++
++  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
++
++  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
++  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
++    _dl_profile_output
++      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
++
+ #ifdef DL_PLATFORM_INIT
+   DL_PLATFORM_INIT;
+ #endif
+diff --git a/elf/tst-dlopen-sgid-mod.c b/elf/tst-dlopen-sgid-mod.c
+new file mode 100644
+index 00000000..5eb79eef
+--- /dev/null
++++ b/elf/tst-dlopen-sgid-mod.c
+@@ -0,0 +1 @@
++/* Opening this object should not succeed.  */
+diff --git a/elf/tst-dlopen-sgid.c b/elf/tst-dlopen-sgid.c
+new file mode 100644
+index 00000000..47829a40
+--- /dev/null
++++ b/elf/tst-dlopen-sgid.c
+@@ -0,0 +1,104 @@
++/* Test case for ignored LD_LIBRARY_PATH in static startug (bug 32976).
++   Copyright (C) 2025 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <dlfcn.h>
++#include <gnu/lib-names.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/capture_subprocess.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/temp_file.h>
++#include <unistd.h>
++
++/* This is the name of our test object.  Use a custom module for
++   testing, so that this object does not get picked up from the system
++   path.  */
++static const char dso_name[] = "tst-dlopen-sgid-mod.so";
++
++/* Used to mark the recursive invocation.  */
++static const char magic_argument[] = "run-actual-test";
++
++static int
++do_test (void)
++{
++/* Pathname of the directory that receives the shared objects this
++   test attempts to load.  */
++  char *libdir = support_create_temp_directory ("tst-dlopen-sgid-");
++
++  /* This is supposed to be ignored and stripped.  */
++  TEST_COMPARE (setenv ("LD_LIBRARY_PATH", libdir, 1), 0);
++
++  /* Copy of libc.so.6.  */
++  {
++    char *from = xasprintf ("%s/%s", support_objdir_root, LIBC_SO);
++    char *to = xasprintf ("%s/%s", libdir, LIBC_SO);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  /* Copy of the test object.   */
++  {
++    char *from = xasprintf ("%s/elf/%s", support_objdir_root, dso_name);
++    char *to = xasprintf ("%s/%s", libdir, dso_name);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  TEST_COMPARE (support_capture_subprogram_self_sgid (magic_argument), 0);
++
++  free (libdir);
++
++  return 0;
++}
++
++static void
++alternative_main (int argc, char **argv)
++{
++  if (argc == 2 && strcmp (argv[1], magic_argument) == 0)
++    {
++      if (getgid () == getegid ())
++        /* This can happen if the file system is mounted nosuid.  */
++        FAIL_UNSUPPORTED ("SGID failed: GID and EGID match (%jd)\n",
++                          (intmax_t) getgid ());
++
++      /* Should be removed due to SGID.  */
++      TEST_COMPARE_STRING (getenv ("LD_LIBRARY_PATH"), NULL);
++
++      TEST_VERIFY (dlopen (dso_name, RTLD_NOW) == NULL);
++      {
++        const char *message = dlerror ();
++        TEST_COMPARE_STRING (message,
++                             "tst-dlopen-sgid-mod.so:"
++                             " cannot open shared object file:"
++                             " No such file or directory");
++      }
++
++      support_record_failure_barrier ();
++      exit (EXIT_SUCCESS);
++    }
++}
++
++#define PREPARE alternative_main
++#include <support/test-driver.c>
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..1ea4d5a252 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0025-CVE-2025-4802.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


