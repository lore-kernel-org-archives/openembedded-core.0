Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2358.1792709326386017388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YZoDScqs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261022224844b4e3f8cd9e0002075f-xf4uj0@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261022224844b4e3f8cd9e0002075f
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9S8yatxTxwD6pnJO+JQ4aQd75mzvAcLg94B2qScZ22Y=;
 b=YZoDScqsQ3BGSV1/QL5zsJIpXujre1JQfMx0BoffHKjZR86Ctda62RHLLgIyPbgROKWda0
 TWhPAzmf3FJWK1OYo2xewRwf0xL/c+rmuTEKKeboUAJcSac1N6q1i0+7BLgySSeq4N/9qkYb
 zcM60Mc03tuTmzqkFAlvREpoHdIVzXpBnb9VRijBdY2h4SelIVHjOB8GzCVqs8pwB3yEoY7f
 kgpheKit90jB/4DfIV9z8+lC+7St5wcYnoYOpZfvnjM8fVy1ZJ23X/KK9E63Rn1gArgVSz1f
 3xZcTNsI4MPSSwyDh6Gud7Wfs+iMRndy736w+6Va8wdMx/0K71JN077w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 12/15] glibc: patch CVE-2026-86805 and CVE-2026-95818
Date: Fri, 23 Oct 2026 00:47:05 +0200
Message-ID: <20261022224711.3783258-12-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248467
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 3.41 (oldest release still
receiving security updates) which is mentioned in [3] and [4].

Additionally pick 3 patches for test harness to support new tests.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=71648e80042658f23965924616fb7db9c2fccff9
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed0c137b97eb940b4b64981e84ed806d3276edd9
[3] https://security-tracker.debian.org/tracker/CVE-2026-86805
[3] https://security-tracker.debian.org/tracker/CVE-2026-95818

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...043-CVE-2026-86805-CVE-2026-95818-01.patch | 244 +++++
 ...044-CVE-2026-86805-CVE-2026-95818-02.patch | 298 ++++++
 ...045-CVE-2026-86805-CVE-2026-95818-03.patch | 115 +++
 ...046-CVE-2026-86805-CVE-2026-95818-04.patch | 862 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   4 +
 5 files changed, 1523 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-95818-01.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-95818-02.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-95818-03.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-95818-04.patch

diff --git a/meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-95818-01.patch b/meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-95818-01.patch
new file mode 100644
index 00000000000..42294f02838
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0043-CVE-2026-86805-CVE-2026-95818-01.patch
@@ -0,0 +1,244 @@
+From 71648e80042658f23965924616fb7db9c2fccff9 Mon Sep 17 00:00:00 2001
+From: Joe Simmons-Talbott <josimmon@redhat.com>
+Date: Thu, 29 Feb 2024 19:55:58 +0000
+Subject: [PATCH] rtld: Add glibc.rtld.enable_secure tunable.
+
+Add a tunable for setting __libc_enable_secure to 1.  Do not set
+__libc_enable_secure to 0 if the tunable is set to 0.  Ignore all
+tunables if glib.rtld.enable_secure is set.  One use-case for this
+addition is to enable testing code paths that depend on
+__libc_enable_secure being set without the need to use setxid binaries.
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+CVE: CVE-2026-86805
+CVE: CVE-2026-95818
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=71648e80042658f23965924616fb7db9c2fccff9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                             |   5 ++
+ elf/Makefile                     |   2 +
+ elf/dl-tunables.c                |  10 +++
+ elf/dl-tunables.list             |   6 ++
+ elf/tst-rtld-list-tunables.exp   |   1 +
+ elf/tst-tunables-enable_secure.c | 126 +++++++++++++++++++++++++++++++
+ 6 files changed, 150 insertions(+)
+ create mode 100644 elf/tst-tunables-enable_secure.c
+
+diff --git a/NEWS b/NEWS
+index 2d8eaffc58..19f4e93ea3 100644
+--- a/NEWS
++++ b/NEWS
+@@ -177,6 +177,11 @@ Major new features:
+   exp, expf, exp10, exp10f, exp2, exp2f, expm1, expm1f, log, logf,
+   log10, log10f, log1p, log1pf, log2, log2f, sin, sinf, tan, tanf.
+ 
++* A new tunable, glibc.rtld.enable_secure, used to run a program
++  as if it were a setuid process. This is currently a testing tool to allow
++  more extensive verification tests for AT_SECURE programs and not meant to
++  be a security feature.
++
+ Deprecated and removed features, and other changes affecting compatibility:
+ 
+ * The ldconfig program now skips file names containing ';' or ending in
+diff --git a/elf/Makefile b/elf/Makefile
+index f0439ef634..520a270f0f 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -288,6 +288,7 @@ tests-static-internal := \
+   tst-tls1-static \
+   tst-tls1-static-non-pie \
+   tst-tunables \
++  tst-tunables-enable_secure \
+   # tests-static-internal
+ 
+ CRT-tst-tls1-static-non-pie := $(csu-objpfx)crt1.o
+@@ -2741,6 +2742,7 @@ $(objpfx)tst-glibc-hwcaps-mask.out: \
+ $(objpfx)tst-glibc-hwcaps-cache.out: $(objpfx)tst-glibc-hwcaps
+ 
+ tst-tunables-ARGS = -- $(host-test-program-cmd)
++tst-tunables-enable_secure-ARGS = -- $(host-test-program-cmd)
+ 
+ $(objpfx)list-tunables.out: tst-rtld-list-tunables.sh $(objpfx)ld.so
+ 	$(SHELL) $< $(objpfx)ld.so '$(test-wrapper-env)' \
+diff --git a/elf/dl-tunables.c b/elf/dl-tunables.c
+index 03e1a68675..d3ccd2ecd4 100644
+--- a/elf/dl-tunables.c
++++ b/elf/dl-tunables.c
+@@ -225,6 +225,16 @@ parse_tunables_string (const char *valstring, struct tunable_toset_t *tunables)
+ 	      tunables[ntunables++] =
+ 		(struct tunable_toset_t) { cur, value, p - value };
+ 
++	      /* Ignore tunables if enable_secure is set */
++	      if (tunable_is_name ("glibc.rtld.enable_secure", name))
++		{
++                  tunable_num_t val = (tunable_num_t) _dl_strtoul (value, NULL);
++		  if (val == 1)
++		    {
++		      __libc_enable_secure = 1;
++		      return 0;
++		    }
++		}
+ 	      break;
+ 	    }
+ 	}
+diff --git a/elf/dl-tunables.list b/elf/dl-tunables.list
+index 1b40407814..1186272c81 100644
+--- a/elf/dl-tunables.list
++++ b/elf/dl-tunables.list
+@@ -136,6 +136,12 @@ glibc {
+       minval: 0
+       default: 512
+     }
++    enable_secure {
++      type: INT_32
++      minval: 0
++      maxval: 1
++      default: 0
++    }
+   }
+ 
+   mem {
+diff --git a/elf/tst-rtld-list-tunables.exp b/elf/tst-rtld-list-tunables.exp
+index 2233ea9c7c..db0e1c86e9 100644
+--- a/elf/tst-rtld-list-tunables.exp
++++ b/elf/tst-rtld-list-tunables.exp
+@@ -12,5 +12,6 @@ glibc.malloc.tcache_unsorted_limit: 0x0 (min: 0x0, max: 0x[f]+)
+ glibc.malloc.top_pad: 0x20000 (min: 0x0, max: 0x[f]+)
+ glibc.malloc.trim_threshold: 0x0 (min: 0x0, max: 0x[f]+)
+ glibc.rtld.dynamic_sort: 2 (min: 1, max: 2)
++glibc.rtld.enable_secure: 0 (min: 0, max: 1)
+ glibc.rtld.nns: 0x4 (min: 0x1, max: 0x10)
+ glibc.rtld.optional_static_tls: 0x200 (min: 0x0, max: 0x[f]+)
+diff --git a/elf/tst-tunables-enable_secure.c b/elf/tst-tunables-enable_secure.c
+new file mode 100644
+index 0000000000..e31e1f7faa
+--- /dev/null
++++ b/elf/tst-tunables-enable_secure.c
+@@ -0,0 +1,126 @@
++/* Check GLIBC_TUNABLES parsing for enable_secure.
++   Copyright (C) 2024 Free Software Foundation, Inc.
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
++#include <array_length.h>
++#include <dl-tunables.h>
++#include <getopt.h>
++#include <intprops.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <support/capture_subprocess.h>
++#include <support/check.h>
++#include <sys/auxv.h>
++#include <unistd.h>
++
++static int restart;
++#define CMDLINE_OPTIONS \
++  { "restart", no_argument, &restart, 1 },
++
++static const struct test_t
++{
++  const char *env;
++  int32_t expected_malloc_check;
++  int32_t expected_enable_secure;
++} tests[] =
++{
++  /* Expected tunable format.  */
++  /* Tunables should be ignored if enable_secure is set. */
++  {
++    "glibc.malloc.check=2:glibc.rtld.enable_secure=1",
++    0,
++    1,
++  },
++  /* Tunables should be ignored if enable_secure is set. */
++  {
++    "glibc.rtld.enable_secure=1:glibc.malloc.check=2",
++    0,
++    1,
++  },
++  /* Tunables should be set if enable_secure is unset. */
++  {
++    "glibc.rtld.enable_secure=0:glibc.malloc.check=2",
++    2,
++    0,
++  },
++};
++
++static int
++handle_restart (int i)
++{
++  if (tests[i].expected_enable_secure == 1)
++    {
++      TEST_COMPARE (1, __libc_enable_secure);
++    }
++  else
++    {
++      TEST_COMPARE (tests[i].expected_malloc_check,
++		    TUNABLE_GET_FULL (glibc, malloc, check, int32_t, NULL));
++      TEST_COMPARE (tests[i].expected_enable_secure,
++		    TUNABLE_GET_FULL (glibc, rtld, enable_secure, int32_t,
++		    NULL));
++    }
++  return 0;
++}
++
++static int
++do_test (int argc, char *argv[])
++{
++  /* We must have either:
++     - One or four parameters left if called initially:
++       + path to ld.so         optional
++       + "--library-path"      optional
++       + the library path      optional
++       + the application name
++       + the test to check  */
++
++  TEST_VERIFY_EXIT (argc == 2 || argc == 5);
++
++  if (restart)
++    return handle_restart (atoi (argv[1]));
++
++  char nteststr[INT_BUFSIZE_BOUND (int)];
++
++  char *spargv[10];
++  {
++    int i = 0;
++    for (; i < argc - 1; i++)
++      spargv[i] = argv[i + 1];
++    spargv[i++] = (char *) "--direct";
++    spargv[i++] = (char *) "--restart";
++    spargv[i++] = nteststr;
++    spargv[i] = NULL;
++  }
++
++  for (int i = 0; i < array_length (tests); i++)
++    {
++      snprintf (nteststr, sizeof nteststr, "%d", i);
++
++      printf ("[%d] Spawned test for %s\n", i, tests[i].env);
++      setenv ("GLIBC_TUNABLES", tests[i].env, 1);
++      struct support_capture_subprocess result
++	= support_capture_subprogram (spargv[0], spargv);
++      support_capture_subprocess_check (&result, "tst-tunables-enable_secure",
++		                        0, sc_allow_stderr);
++      support_capture_subprocess_free (&result);
++    }
++
++  return 0;
++}
++
++#define TEST_FUNCTION_ARGV do_test
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-95818-02.patch b/meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-95818-02.patch
new file mode 100644
index 00000000000..bcb1e08a30f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0044-CVE-2026-86805-CVE-2026-95818-02.patch
@@ -0,0 +1,298 @@
+From 1e1ad714ee9a663eda0e2bffad1d9f258b00a4e9 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Mon, 6 May 2024 13:18:47 -0300
+Subject: [PATCH] support: Add envp argument to support_capture_subprogram
+
+So tests can specify a list of environment variables.
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+CVE: CVE-2026-86805
+CVE: CVE-2026-95818
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=1e1ad714ee9a663eda0e2bffad1d9f258b00a4e9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ elf/tst-audit18.c                        | 2 +-
+ elf/tst-audit19b.c                       | 2 +-
+ elf/tst-audit22.c                        | 2 +-
+ elf/tst-audit23.c                        | 2 +-
+ elf/tst-audit25a.c                       | 4 ++--
+ elf/tst-audit25b.c                       | 4 ++--
+ elf/tst-glibc-hwcaps-2-cache.c           | 2 +-
+ elf/tst-rtld-run-static.c                | 4 ++--
+ elf/tst-tunables-enable_secure.c         | 2 +-
+ elf/tst-tunables.c                       | 2 +-
+ support/capture_subprocess.h             | 9 +++++----
+ support/subprocess.h                     | 7 ++++---
+ support/support_capture_subprocess.c     | 5 +++--
+ support/support_subprocess.c             | 5 +++--
+ support/tst-support_capture_subprocess.c | 2 +-
+ sysdeps/x86/tst-hwcap-tunables.c         | 2 +-
+ 16 files changed, 30 insertions(+), 26 deletions(-)
+
+diff --git a/elf/tst-audit18.c b/elf/tst-audit18.c
+index 841251dd70..cec93e269c 100644
+--- a/elf/tst-audit18.c
++++ b/elf/tst-audit18.c
+@@ -79,7 +79,7 @@ do_test (int argc, char *argv[])
+ 
+   setenv ("LD_AUDIT", "tst-auditmod18.so", 0);
+   struct support_capture_subprocess result
+-    = support_capture_subprogram (spargv[0], spargv);
++    = support_capture_subprogram (spargv[0], spargv, NULL);
+   support_capture_subprocess_check (&result, "tst-audit18", 0, sc_allow_stderr);
+ 
+   struct
+diff --git a/elf/tst-audit19b.c b/elf/tst-audit19b.c
+index 70bfe4eadf..88d99a416b 100644
+--- a/elf/tst-audit19b.c
++++ b/elf/tst-audit19b.c
+@@ -69,7 +69,7 @@ do_test (int argc, char *argv[])
+ 
+   setenv ("LD_AUDIT", "tst-auditmod18b.so", 0);
+   struct support_capture_subprocess result
+-    = support_capture_subprogram (spargv[0], spargv);
++    = support_capture_subprogram (spargv[0], spargv, NULL);
+   support_capture_subprocess_check (&result, "tst-audit18b", 0, sc_allow_stderr);
+ 
+   bool find_symbind = false;
+diff --git a/elf/tst-audit22.c b/elf/tst-audit22.c
+index 4e97be3be0..6aa18af948 100644
+--- a/elf/tst-audit22.c
++++ b/elf/tst-audit22.c
+@@ -83,7 +83,7 @@ do_test (int argc, char *argv[])
+ 
+   setenv ("LD_AUDIT", "tst-auditmod22.so", 0);
+   struct support_capture_subprocess result
+-    = support_capture_subprogram (spargv[0], spargv);
++    = support_capture_subprogram (spargv[0], spargv, NULL);
+   support_capture_subprocess_check (&result, "tst-audit22", 0, sc_allow_stderr);
+ 
+   /* The respawned process should always print the vDSO address (otherwise it
+diff --git a/elf/tst-audit23.c b/elf/tst-audit23.c
+index 32e7c8b2a3..d2640fe8b2 100644
+--- a/elf/tst-audit23.c
++++ b/elf/tst-audit23.c
+@@ -87,7 +87,7 @@ do_one_test (int argc, char *argv[], bool pass_dlclose_flag)
+ 
+   setenv ("LD_AUDIT", "tst-auditmod23.so", 0);
+   struct support_capture_subprocess result
+-    = support_capture_subprogram (spargv[0], spargv);
++    = support_capture_subprogram (spargv[0], spargv, NULL);
+   support_capture_subprocess_check (&result, "tst-audit22", 0, sc_allow_stderr);
+ 
+   {
+diff --git a/elf/tst-audit25a.c b/elf/tst-audit25a.c
+index b209ee820f..cdd4f2ce2b 100644
+--- a/elf/tst-audit25a.c
++++ b/elf/tst-audit25a.c
+@@ -77,7 +77,7 @@ do_test (int argc, char *argv[])
+ 
+   {
+     struct support_capture_subprocess result
+-      = support_capture_subprogram (spargv[0], spargv);
++      = support_capture_subprogram (spargv[0], spargv, NULL);
+     support_capture_subprocess_check (&result, "tst-audit25a", 0,
+ 				      sc_allow_stderr);
+ 
+@@ -102,7 +102,7 @@ do_test (int argc, char *argv[])
+   {
+     setenv ("LD_BIND_NOW", "1", 0);
+     struct support_capture_subprocess result
+-      = support_capture_subprogram (spargv[0], spargv);
++      = support_capture_subprogram (spargv[0], spargv, NULL);
+     support_capture_subprocess_check (&result, "tst-audit25a", 0,
+ 				      sc_allow_stderr);
+ 
+diff --git a/elf/tst-audit25b.c b/elf/tst-audit25b.c
+index 9b8665d517..939f4d6188 100644
+--- a/elf/tst-audit25b.c
++++ b/elf/tst-audit25b.c
+@@ -76,7 +76,7 @@ do_test (int argc, char *argv[])
+ 
+   {
+     struct support_capture_subprocess result
+-      = support_capture_subprogram (spargv[0], spargv);
++      = support_capture_subprogram (spargv[0], spargv, NULL);
+     support_capture_subprocess_check (&result, "tst-audit25a", 0,
+ 				      sc_allow_stderr);
+ 
+@@ -102,7 +102,7 @@ do_test (int argc, char *argv[])
+   {
+     setenv ("LD_BIND_NOW", "1", 0);
+     struct support_capture_subprocess result
+-      = support_capture_subprogram (spargv[0], spargv);
++      = support_capture_subprogram (spargv[0], spargv, NULL);
+     support_capture_subprocess_check (&result, "tst-audit25a", 0,
+ 				      sc_allow_stderr);
+ 
+diff --git a/elf/tst-glibc-hwcaps-2-cache.c b/elf/tst-glibc-hwcaps-2-cache.c
+index 81ab44ff78..af91476cca 100644
+--- a/elf/tst-glibc-hwcaps-2-cache.c
++++ b/elf/tst-glibc-hwcaps-2-cache.c
+@@ -32,7 +32,7 @@ main (int argc, char **argv)
+   /* Run ldconfig to populate the cache.  */
+   char *command = xasprintf ("%s/ldconfig", support_install_rootsbindir);
+   struct support_capture_subprocess result =
+-    support_capture_subprogram (command,  &((char *) { NULL }));
++    support_capture_subprogram (command,  &((char *) { NULL }), NULL);
+   support_capture_subprocess_check (&result, "ldconfig", 0, sc_allow_none);
+   free (command);
+ 
+diff --git a/elf/tst-rtld-run-static.c b/elf/tst-rtld-run-static.c
+index b2650e85ff..f05c00eb7b 100644
+--- a/elf/tst-rtld-run-static.c
++++ b/elf/tst-rtld-run-static.c
+@@ -30,7 +30,7 @@ do_test (void)
+   {
+     char *argv[] = { (char *) "ld.so", ldconfig_path, (char *) "--help", NULL };
+     struct support_capture_subprocess cap
+-      = support_capture_subprogram (support_objdir_elf_ldso, argv);
++      = support_capture_subprogram (support_objdir_elf_ldso, argv, NULL);
+     support_capture_subprocess_check (&cap, "no --argv0", 0, sc_allow_stdout);
+     puts ("info: output without --argv0:");
+     puts (cap.out.buffer);
+@@ -46,7 +46,7 @@ do_test (void)
+         ldconfig_path, (char *) "--help", NULL
+       };
+     struct support_capture_subprocess cap
+-      = support_capture_subprogram (support_objdir_elf_ldso, argv);
++      = support_capture_subprogram (support_objdir_elf_ldso, argv, NULL);
+     support_capture_subprocess_check (&cap, "with --argv0", 0, sc_allow_stdout);
+     puts ("info: output with --argv0:");
+     puts (cap.out.buffer);
+diff --git a/elf/tst-tunables-enable_secure.c b/elf/tst-tunables-enable_secure.c
+index e31e1f7faa..f5db1c84e9 100644
+--- a/elf/tst-tunables-enable_secure.c
++++ b/elf/tst-tunables-enable_secure.c
+@@ -113,7 +113,7 @@ do_test (int argc, char *argv[])
+       printf ("[%d] Spawned test for %s\n", i, tests[i].env);
+       setenv ("GLIBC_TUNABLES", tests[i].env, 1);
+       struct support_capture_subprocess result
+-	= support_capture_subprogram (spargv[0], spargv);
++	= support_capture_subprogram (spargv[0], spargv, NULL);
+       support_capture_subprocess_check (&result, "tst-tunables-enable_secure",
+ 		                        0, sc_allow_stderr);
+       support_capture_subprocess_free (&result);
+diff --git a/elf/tst-tunables.c b/elf/tst-tunables.c
+index dff34ed748..4884dd09f0 100644
+--- a/elf/tst-tunables.c
++++ b/elf/tst-tunables.c
+@@ -396,7 +396,7 @@ do_test (int argc, char *argv[])
+ 	      tests[i].value);
+       setenv (tests[i].name, tests[i].value, 1);
+       struct support_capture_subprocess result
+-	= support_capture_subprogram (spargv[0], spargv);
++	= support_capture_subprogram (spargv[0], spargv, NULL);
+       support_capture_subprocess_check (&result, "tst-tunables", 0,
+ 					sc_allow_stderr);
+       support_capture_subprocess_free (&result);
+diff --git a/support/capture_subprocess.h b/support/capture_subprocess.h
+index 1ecbdfe4fc..93b7245d2a 100644
+--- a/support/capture_subprocess.h
++++ b/support/capture_subprocess.h
+@@ -35,11 +35,12 @@ struct support_capture_subprocess
+ struct support_capture_subprocess support_capture_subprocess
+   (void (*callback) (void *), void *closure);
+ 
+-/* Issue FILE with ARGV arguments by using posix_spawn and capture standard
+-   output, standard error, and the exit status.  The out.buffer and err.buffer
+-   are handle as support_capture_subprocess.  */
++/* Issue FILE with ARGV arguments and ENVP environments by using posix_spawn
++   and capture standard output, standard error, and the exit status.  If
++   ENVP is NULL the current environment variable is used.  The out.buffer and
++   err.buffer are handle by support_capture_subprocess.  */
+ struct support_capture_subprocess support_capture_subprogram
+-  (const char *file, char *const argv[]);
++  (const char *file, char *const argv[], char *const envp[]);
+ 
+ /* Copy the running program into a setgid binary and run it with
+    CHILD_ID argument.  If the program exits with a non-zero status,
+diff --git a/support/subprocess.h b/support/subprocess.h
+index 8fbb895353..8274a2b22b 100644
+--- a/support/subprocess.h
++++ b/support/subprocess.h
+@@ -33,10 +33,11 @@ struct support_subprocess
+ struct support_subprocess support_subprocess
+   (void (*callback) (void *), void *closure);
+ 
+-/* Issue FILE with ARGV arguments by using posix_spawn and return is PID, a
+-   pipe redirected to STDOUT, and a pipe redirected to STDERR.  */
++/* Issue FILE with ARGV arguments and ENVP environments by using posix_spawn
++   and return is PID, a pipe redirected to STDOUT, and a pipe redirected to
++   STDERR.  If ENVP is NULL the current environment variable is used.  */
+ struct support_subprocess support_subprogram
+-  (const char *file, char *const argv[]);
++  (const char *file, char *const argv[], char *const envp[]);
+ 
+ /* Invoke program FILE with ARGV arguments by using posix_spawn and wait for it
+    to complete.  Return program exit status.  */
+diff --git a/support/support_capture_subprocess.c b/support/support_capture_subprocess.c
+index ffced8a89f..53847194cb 100644
+--- a/support/support_capture_subprocess.c
++++ b/support/support_capture_subprocess.c
+@@ -98,13 +98,14 @@ support_capture_subprocess (void (*callback) (void *), void *closure)
+ }
+ 
+ struct support_capture_subprocess
+-support_capture_subprogram (const char *file, char *const argv[])
++support_capture_subprogram (const char *file, char *const argv[],
++			    char *const envp[])
+ {
+   struct support_capture_subprocess result;
+   xopen_memstream (&result.out);
+   xopen_memstream (&result.err);
+ 
+-  struct support_subprocess proc = support_subprogram (file, argv);
++  struct support_subprocess proc = support_subprogram (file, argv, envp);
+ 
+   support_capture_poll (&result, &proc);
+   return result;
+diff --git a/support/support_subprocess.c b/support/support_subprocess.c
+index a2fef394d4..b692a7f8b1 100644
+--- a/support/support_subprocess.c
++++ b/support/support_subprocess.c
+@@ -69,7 +69,7 @@ support_subprocess (void (*callback) (void *), void *closure)
+ }
+ 
+ struct support_subprocess
+-support_subprogram (const char *file, char *const argv[])
++support_subprogram (const char *file, char *const argv[], char *const envp[])
+ {
+   struct support_subprocess result = support_subprocess_init ();
+ 
+@@ -84,7 +84,8 @@ support_subprogram (const char *file, char *const argv[])
+   xposix_spawn_file_actions_addclose (&fa, result.stdout_pipe[1]);
+   xposix_spawn_file_actions_addclose (&fa, result.stderr_pipe[1]);
+ 
+-  result.pid = xposix_spawn (file, &fa, NULL, argv, environ);
++  result.pid = xposix_spawn (file, &fa, NULL, argv,
++			     envp == NULL ? environ : envp);
+ 
+   xclose (result.stdout_pipe[1]);
+   xclose (result.stderr_pipe[1]);
+diff --git a/support/tst-support_capture_subprocess.c b/support/tst-support_capture_subprocess.c
+index 8145548982..756fb75d19 100644
+--- a/support/tst-support_capture_subprocess.c
++++ b/support/tst-support_capture_subprocess.c
+@@ -238,7 +238,7 @@ do_subprogram (const struct test *test)
+   args[argc]   = NULL;
+   TEST_VERIFY (argc < argv_size);
+ 
+-  return support_capture_subprogram (args[0], args);
++  return support_capture_subprogram (args[0], args, NULL);
+ }
+ 
+ enum test_type
+diff --git a/sysdeps/x86/tst-hwcap-tunables.c b/sysdeps/x86/tst-hwcap-tunables.c
+index f6a65b88de..8589a9fd66 100644
+--- a/sysdeps/x86/tst-hwcap-tunables.c
++++ b/sysdeps/x86/tst-hwcap-tunables.c
+@@ -133,7 +133,7 @@ do_test (int argc, char *argv[])
+       setenv ("GLIBC_TUNABLES", tunable, 1);
+ 
+       struct support_capture_subprocess result
+-	= support_capture_subprogram (spargv[0], spargv);
++	= support_capture_subprogram (spargv[0], spargv, NULL);
+       support_capture_subprocess_check (&result, "tst-tunables", 0,
+ 					sc_allow_stderr);
+       support_capture_subprocess_free (&result);
diff --git a/meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-95818-03.patch b/meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-95818-03.patch
new file mode 100644
index 00000000000..bb39978881d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0045-CVE-2026-86805-CVE-2026-95818-03.patch
@@ -0,0 +1,115 @@
+From eeb687bb4b371d67abcd3c4c84d5990d8bc78b71 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20B=C3=A9rat?= <fberat@redhat.com>
+Date: Fri, 29 Nov 2024 14:48:43 +0100
+Subject: [PATCH] support: Add support_next_to_fault_before support function
+
+Refactor the support_next_to_fault and add the
+support_next_to_fault_before method returns a buffer with a protected
+page before it, to be able to test buffer underflow accesses.
+
+Reviewed-by: Tulio Magno Quites Machado Filho <tuliom@redhat.com>
+(cherry picked from commit fa53723cdb6f0338558e57a2a0a6459c00a1bc5f)
+
+CVE: CVE-2026-86805
+CVE: CVE-2026-95818
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=eeb687bb4b371d67abcd3c4c84d5990d8bc78b71]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ support/next_to_fault.c | 44 +++++++++++++++++++++++++++++++----------
+ support/next_to_fault.h |  5 +++++
+ 2 files changed, 39 insertions(+), 10 deletions(-)
+
+diff --git a/support/next_to_fault.c b/support/next_to_fault.c
+index eb2457d12d..b60d5a5744 100644
+--- a/support/next_to_fault.c
++++ b/support/next_to_fault.c
+@@ -1,4 +1,4 @@
+-/* Memory allocation next to an unmapped page.
++/* Memory allocation either before or after an unmapped page.
+    Copyright (C) 2017-2024 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+@@ -16,34 +16,58 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
++#include <stdbool.h>
+ #include <support/check.h>
+ #include <support/next_to_fault.h>
+ #include <support/xunistd.h>
+ #include <sys/mman.h>
+ #include <sys/param.h>
+ 
+-struct support_next_to_fault
+-support_next_to_fault_allocate (size_t size)
++static struct support_next_to_fault
++support_next_to_fault_allocate_any (size_t size, bool fault_after_alloc)
+ {
+   long page_size = sysconf (_SC_PAGE_SIZE);
++  long protect_offset = 0;
++  long buffer_offset = page_size;
++
+   TEST_VERIFY_EXIT (page_size > 0);
+   struct support_next_to_fault result;
+   result.region_size = roundup (size, page_size) + page_size;
+   if (size + page_size <= size || result.region_size <= size)
+-    FAIL_EXIT1 ("support_next_to_fault_allocate (%zu): overflow", size);
++    FAIL_EXIT1 ("%s (%zu): overflow", __func__, size);
+   result.region_start
+     = xmmap (NULL, result.region_size, PROT_READ | PROT_WRITE,
+              MAP_PRIVATE | MAP_ANONYMOUS, -1);
+-  /* Unmap the page after the allocation.  */
+-  xmprotect (result.region_start + (result.region_size - page_size),
+-             page_size, PROT_NONE);
+-  /* Align the allocation within the region so that it ends just
+-     before the PROT_NONE page.  */
+-  result.buffer = result.region_start + result.region_size - page_size - size;
++
++  if (fault_after_alloc)
++    {
++      protect_offset = result.region_size - page_size;
++      buffer_offset = protect_offset - size;
++    }
++
++  /* Unmap the page before or after the allocation.  */
++  xmprotect (result.region_start + protect_offset, page_size, PROT_NONE);
++  /* Align the allocation within the region so that it starts after or ends
++     just before the PROT_NONE page.  */
++  result.buffer = result.region_start + buffer_offset;
+   result.length = size;
+   return result;
+ }
+ 
++/* Unmapped a page after the buffer */
++struct support_next_to_fault
++support_next_to_fault_allocate (size_t size)
++{
++  return support_next_to_fault_allocate_any (size, true);
++}
++
++/* Unmapped a page before the buffer */
++struct support_next_to_fault
++support_next_to_fault_allocate_before (size_t size)
++{
++  return support_next_to_fault_allocate_any (size, false);
++}
++
+ void
+ support_next_to_fault_free (struct support_next_to_fault *ntf)
+ {
+diff --git a/support/next_to_fault.h b/support/next_to_fault.h
+index 7112cc4c65..cec4b97332 100644
+--- a/support/next_to_fault.h
++++ b/support/next_to_fault.h
+@@ -41,6 +41,11 @@ struct support_next_to_fault
+    fault).  */
+ struct support_next_to_fault support_next_to_fault_allocate (size_t size);
+ 
++/* Allocate a buffer of SIZE bytes just *after* a page which is mapped
++   with PROT_NONE (so that under-running the buffer will cause a
++   fault).  */
++struct support_next_to_fault support_next_to_fault_allocate_before (size_t size);
++
+ /* Deallocate the memory region allocated by
+    next_to_fault_allocate.  */
+ void support_next_to_fault_free (struct support_next_to_fault *);
diff --git a/meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-95818-04.patch b/meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-95818-04.patch
new file mode 100644
index 00000000000..f6c92a7a3a8
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0046-CVE-2026-86805-CVE-2026-95818-04.patch
@@ -0,0 +1,862 @@
+From 629565b0c91dc326ac622b05982f21a374cd03c4 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Mon, 17 Aug 2026 15:15:32 -0300
+Subject: [PATCH] elf: Open the normalized $ORIGIN rpath in AT_SECURE programs
+ (BZ 34360)
+
+For AT_SECURE programs the loader honors $ORIGIN in DT_RPATH only when the
+expansion is rooted in a trusted directory, but it validated the lexically
+normalized path while opening the raw expansion.  As "a/b/../c" only names
+"a/c" when "b" is not a symlink, an attacker who controls a component of
+$ORIGIN -- e.g. by hard-linking the setuid binary into an attacker-owned
+directory -- can make the opened path escape the trusted directory even
+though the check passed, loading an attacker-controlled object.
+
+Normalize the expansion in place and open that, so the path that is opened
+is exactly the path that was validated.  _dl_normalize_path rewrites the
+string in place without ever advancing its write cursor past its read
+cursor or appending, so it stays within the original storage.
+
+Add elf/tst-origin-secure as a regression test.
+
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit ed0c137b97eb940b4b64981e84ed806d3276edd9)
+
+CVE: CVE-2026-86805
+CVE: CVE-2026-95818
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=629565b0c91dc326ac622b05982f21a374cd03c4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ elf/Makefile                             |  18 ++
+ elf/dl-load.c                            |  74 +++------
+ elf/dl-path-normalize.h                  | 118 +++++++++++++
+ elf/libtst-origin-secure-mod.c           |  25 +++
+ elf/tst-dl-path-normalize.c              | 142 ++++++++++++++++
+ elf/tst-origin-secure-evilmod.c          |  28 ++++
+ elf/tst-origin-secure-victim.c           |  43 +++++
+ elf/tst-origin-secure.c                  | 203 +++++++++++++++++++++++
+ elf/tst-origin-secure.h                  |  41 +++++
+ elf/tst-origin-secure.root/postclean.req |   0
+ 10 files changed, 643 insertions(+), 49 deletions(-)
+ create mode 100644 elf/dl-path-normalize.h
+ create mode 100644 elf/libtst-origin-secure-mod.c
+ create mode 100644 elf/tst-dl-path-normalize.c
+ create mode 100644 elf/tst-origin-secure-evilmod.c
+ create mode 100644 elf/tst-origin-secure-victim.c
+ create mode 100644 elf/tst-origin-secure.c
+ create mode 100644 elf/tst-origin-secure.h
+ create mode 100644 elf/tst-origin-secure.root/postclean.req
+
+diff --git a/elf/Makefile b/elf/Makefile
+index d8a0c0c4ae..8a5aa0123a 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -520,6 +520,7 @@ tests-internal += \
+   tst-audit19a \
+   tst-create_format1 \
+   tst-dl-hwcaps_split \
++  tst-dl-path-normalize \
+   tst-dl_find_object \
+   tst-dl_find_object-threads \
+   tst-dlmopen2 \
+@@ -543,12 +544,14 @@ endif
+ tests-container += \
+   tst-dlopen-self-container \
+   tst-dlopen-tlsmodid-container \
++  tst-origin-secure \
+   tst-pldd \
+   tst-preload-pthread-libc \
+   tst-rootdir \
+   # tests-container
+ 
+ test-srcs = \
++  tst-origin-secure-victim \
+   tst-pathopt \
+   tst-sprof-basic \
+   # tests-srcs
+@@ -722,6 +725,7 @@ modules-names += \
+   libtracemod3-1 \
+   libtracemod4-1 \
+   libtracemod5-1 \
++  libtst-origin-secure-mod \
+   ltglobmod1 \
+   ltglobmod2 \
+   neededobj1 \
+@@ -907,6 +911,7 @@ modules-names += \
+   tst-nodeps2-mod \
+   tst-non-directory-mod \
+   tst-null-argv-lib \
++  tst-origin-secure-evilmod \
+   tst-p_alignmod-base \
+   tst-p_alignmod3 \
+   tst-recursive-tlsmallocmod \
+@@ -3217,3 +3222,16 @@ $(objpfx)tst-dlopen-constructor-null: \
+   $(objpfx)tst-dlopen-constructor-null-mod2.so
+ $(objpfx)tst-dlopen-constructor-null-mod2.so: \
+   $(objpfx)tst-dlopen-constructor-null-mod1.so
++
++LDFLAGS-libtst-origin-secure-mod.so += -Wl,-soname,libtst-origin-secure-mod.so
++LDFLAGS-tst-origin-secure-evilmod.so += -Wl,-soname,libtst-origin-secure-mod.so
++$(objpfx)tst-origin-secure-victim: $(objpfx)libtst-origin-secure-mod.so
++# The number of "../" here must match the layout invariants described in
++# tst-origin-secure.c.
++LDFLAGS-tst-origin-secure-victim += \
++  -Wl,--no-as-needed \
++  -Wl,-rpath,\$$ORIGIN/sub/../../../../..$(slibdir)/tst-origin-secure \
++  -Wl,--disable-new-dtags
++$(objpfx)tst-origin-secure.out: $(objpfx)tst-origin-secure-victim \
++			       $(objpfx)libtst-origin-secure-mod.so \
++			       $(objpfx)tst-origin-secure-evilmod.so
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index 7b21f1dffa..0d141a61c1 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <gnu/lib-names.h>
++#include <dl-path-normalize.h>
+ 
+ /* Type for the buffer we put the ELF header and hopefully the program
+    header.  This buffer does not really have to be too large.  In most
+@@ -124,54 +125,24 @@ static const size_t system_dirs_len[] =
+ };
+ #define nsystem_dirs_len array_length (system_dirs_len)
+ 
++/* Return true if the normalized path NPATH of length NLEN is rooted in one of
++   the trusted system directories.  The system_dirs entries carry a trailing
++   '/'; NPATH matches an entry when it shares the entry's leading component
++   sequence and then either ends or continues with '/'.  For instance,
++   "/lib64" and "/lib64/x" match "/lib64/" but "/lib64x" does not.  */
+ static bool
+-is_trusted_path_normalize (const char *path, size_t len)
++path_is_trusted (const char *npath, size_t nlen)
+ {
+-  if (len == 0)
+-    return false;
+-
+-  char *npath = (char *) alloca (len + 2);
+-  char *wnp = npath;
+-  while (*path != '\0')
+-    {
+-      if (path[0] == '/')
+-	{
+-	  if (path[1] == '.')
+-	    {
+-	      if (path[2] == '.' && (path[3] == '/' || path[3] == '\0'))
+-		{
+-		  while (wnp > npath && *--wnp != '/')
+-		    ;
+-		  path += 3;
+-		  continue;
+-		}
+-	      else if (path[2] == '/' || path[2] == '\0')
+-		{
+-		  path += 2;
+-		  continue;
+-		}
+-	    }
+-
+-	  if (wnp > npath && wnp[-1] == '/')
+-	    {
+-	      ++path;
+-	      continue;
+-	    }
+-	}
+-
+-      *wnp++ = *path++;
+-    }
+-
+-  if (wnp == npath || wnp[-1] != '/')
+-    *wnp++ = '/';
+-
+   const char *trun = system_dirs;
+ 
+   for (size_t idx = 0; idx < nsystem_dirs_len; ++idx)
+     {
+-      if (wnp - npath >= system_dirs_len[idx]
+-	  && memcmp (trun, npath, system_dirs_len[idx]) == 0)
+-	/* Found it.  */
++      /* Compare against the entry without its trailing '/'.  */
++      size_t dirlen = system_dirs_len[idx] - 1;
++
++      if (nlen >= dirlen
++	  && memcmp (trun, npath, dirlen) == 0
++	  && (npath[dirlen] == '/' || npath[dirlen] == '\0'))
+ 	return true;
+ 
+       trun += system_dirs_len[idx] + 1;
+@@ -361,16 +332,21 @@ _dl_dst_substitute (struct link_map *l, const char *input, char *result)
+      checked for trust, the authors of the binaries themselves are
+      trusted to have designed this correctly.  Only $ORIGIN is tested in
+      this way because it may be manipulated in some ways with hard
+-     links.  */
+-  if (__glibc_unlikely (check_for_trusted)
+-      && !is_trusted_path_normalize (result, wp - result))
+-    {
+-      *result = '\0';
+-      return result;
+-    }
++     links.
++
++     _dl_normalize_path replaces the expansion with its normalized form
++     in place, so that the path that is opened is exactly the path that
++     was validated.  */
+ 
+   *wp = '\0';
+ 
++  if (__glibc_unlikely (check_for_trusted))
++    {
++      size_t nlen = _dl_normalize_path (result);
++      if (!path_is_trusted (result, nlen))
++	*result = '\0';
++    }
++
+   return result;
+ }
+ 
+diff --git a/elf/dl-path-normalize.h b/elf/dl-path-normalize.h
+new file mode 100644
+index 0000000000..ca4b14698c
+--- /dev/null
++++ b/elf/dl-path-normalize.h
+@@ -0,0 +1,118 @@
++/* In-place lexical path normalization for the dynamic loader.
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#ifndef _DL_PATH_NORMALIZE_H
++#define _DL_PATH_NORMALIZE_H
++
++#include <stddef.h>
++#include <string.h>
++
++/* Lexically normalize the null-terminated PATH in place and return the
++   length of the result (excluding the terminating NUL byte):
++
++   - Runs of '/' are collapsed to a single '/'.
++
++   - "." components are removed.
++
++   - A ".." component removes the preceding component if there is one and it
++     is not itself a preserved "..".  In an absolute path a surplus ".." at
++     the root is dropped ("/../a" normalizes to "/a"), in a relative path
++     leading ".." components are preserved ("../a" stays "../a", "a/../../b"
++     normalizes to "../b").
++
++   - The result has no trailing '/' except for the root path "/" itself
++     ("/a/" normalizes to "/a").
++
++   - The result is empty if and only if every component cancels or is removed
++     ("", ".", "a/.." all normalize to "").
++
++   The PATH is written in place, and the internal write cursor never runs
++   ahead of the read cursor.  Only bytes within the strlen (PATH) + 1 storage
++   are accessed.  */
++static inline size_t
++_dl_normalize_path (char *path)
++{
++  /* The root '/' of an absolute path is not removed.  */
++  char *pstart = path + (path[0] == '/');
++  const char *rnp = pstart;
++  char *wnp = pstart;
++  /* End of the prefix a ".." may not remove.  Either the root '/', or, for
++     relative paths, the original start of the string extended by any
++     preserved leading ".." components.  */
++  char *limit = pstart;
++
++  while (*rnp != '\0')
++    {
++      /* Collapse consecutive separators.  */
++      if (*rnp == '/')
++	{
++	  ++rnp;
++	  continue;
++	}
++
++      /* [RNP, REND) is the next input component.  */
++      const char *rend = rnp;
++      while (*rend != '\0' && *rend != '/')
++	++rend;
++      size_t clen = rend - rnp;
++
++      /* Drop '.' component.  */
++      if (clen == 1 && rnp[0] == '.')
++	;
++      else if (clen == 2 && rnp[0] == '.' && rnp[1] == '.')
++	{
++	  if (wnp > limit)
++	    {
++	      /* Remove the last component along with the '/' separating it
++		 from its predecessor (the root '/' of an absolute path is
++		 retained).  */
++	      while (wnp > limit && wnp[-1] != '/')
++		--wnp;
++	      if (wnp > pstart)
++		--wnp;
++	    }
++	  else if (pstart == path)
++	    {
++	      /* No component is left and the original path is relative:
++		 keep the unresolvable ".." (it becomes part of the
++		 preserved prefix).  */
++	      if (wnp > pstart)
++		*wnp++ = '/';
++	      *wnp++ = '.';
++	      *wnp++ = '.';
++	      limit = wnp;
++	    }
++	  /* Otherwise the path is absolute and the surplus ".." at the
++	     root is dropped ("/../a" normalizes to "/a").  */
++	}
++      else
++	{
++	  if (wnp > pstart)
++	    *wnp++ = '/';
++	  memmove (wnp, rnp, clen);
++	  wnp += clen;
++	}
++
++      rnp = rend;
++    }
++
++  *wnp = '\0';
++  return wnp - path;
++}
++
++#endif /* _DL_PATH_NORMALIZE_H */
+diff --git a/elf/libtst-origin-secure-mod.c b/elf/libtst-origin-secure-mod.c
+new file mode 100644
+index 0000000000..8d7f372094
+--- /dev/null
++++ b/elf/libtst-origin-secure-mod.c
+@@ -0,0 +1,25 @@
++/* Module for tst-origin-secure (the "good" copy).
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#include "tst-origin-secure.h"
++
++int
++origin_secure_id (void)
++{
++  return ORIGIN_SECURE_ID_TRUSTED;
++}
+diff --git a/elf/tst-dl-path-normalize.c b/elf/tst-dl-path-normalize.c
+new file mode 100644
+index 0000000000..f6d45d654f
+--- /dev/null
++++ b/elf/tst-dl-path-normalize.c
+@@ -0,0 +1,142 @@
++/* Unit tests for dl-path-normalize.h.
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#include <dl-path-normalize.h>
++#include <stdbool.h>
++#include <stdio.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/next_to_fault.h>
++
++static void
++check_one_guarded (const char *input, const char *expected, bool before)
++{
++  size_t size = strlen (input) + 1;
++  struct support_next_to_fault ntf
++    = before ? support_next_to_fault_allocate_before (size)
++	     : support_next_to_fault_allocate (size);
++  memcpy (ntf.buffer, input, size);
++
++  size_t len = _dl_normalize_path (ntf.buffer);
++
++  TEST_COMPARE (len, strlen (ntf.buffer));
++  TEST_COMPARE_STRING (ntf.buffer, expected);
++
++  support_next_to_fault_free (&ntf);
++}
++
++static void
++check_one (const char *input, const char *expected)
++{
++  /* Check that _dl_normalize_path does not access the string outside the
++     input argument.  It checks for both over-runs and under-runs (the
++     latter for the case of '..' expansions).  */
++  check_one_guarded (input, expected, false);
++  check_one_guarded (input, expected, true);
++}
++
++static int
++do_test (void)
++{
++  /* Absolute paths.  */
++  check_one ("/", "/");
++  check_one ("//", "/");
++  check_one ("///", "/");
++  check_one ("////", "/");
++  check_one ("/a", "/a");
++  check_one ("/a/", "/a");
++  check_one ("/a//", "/a");
++  check_one ("//a//b//", "/a/b");
++  check_one ("/.", "/");
++  check_one ("/./", "/");
++  check_one ("/./a", "/a");
++  check_one ("/a/./b", "/a/b");
++  check_one ("/a/.", "/a");
++  check_one ("/..", "/");
++  check_one ("/../", "/");
++  check_one ("/../a", "/a");
++  check_one ("/a/..", "/");
++  check_one ("/a/../", "/");
++  check_one ("/a/../..", "/");
++  check_one ("/a/../b", "/b");
++  check_one ("/a/../../b", "/b");
++  check_one ("/a/b/../../c", "/c");
++  check_one ("/a/b/../c", "/a/c");
++  check_one ("/a/b/c/../..", "/a");
++  check_one ("/usr/lib/../lib64", "/usr/lib64");
++  check_one ("/usr/lib/../lib64/", "/usr/lib64");
++  check_one ("/usr/lib/..//lib64/", "/usr/lib64");
++  check_one ("/usr/lib/../../lib64/", "/lib64");
++
++  /* "." and ".." are special only as complete components.  */
++  check_one ("/a..", "/a..");
++  check_one ("/..a", "/..a");
++  check_one ("/a/...", "/a/...");
++  check_one ("/.../a", "/.../a");
++  check_one ("/a./b", "/a./b");
++  check_one (".a", ".a");
++  check_one ("a.", "a.");
++  check_one ("..a", "..a");
++  check_one ("...", "...");
++
++  /* Relative paths.  */
++  check_one ("", "");
++  check_one (".", "");
++  check_one ("./", "");
++  check_one ("..", "..");
++  check_one ("../", "..");
++  check_one ("a", "a");
++  check_one ("a/", "a");
++  check_one ("a//b", "a/b");
++  check_one ("a..", "a..");
++  check_one ("./a", "a");
++  check_one ("./.", "");
++  check_one ("./..", "..");
++
++  check_one ("a/..", "");
++  check_one ("a/../", "");
++  check_one ("ab/..", "");
++  check_one (".a/..", "");
++  check_one ("a./..", "");
++  check_one (".../..", "");
++  check_one ("a/./..", "");
++  check_one ("a/b/..", "a");
++  check_one ("abc/def/..", "abc");
++
++  /* Appending a component to an emptied relative output must not produce a
++     leading '/' (the path must stay relative).  */
++  check_one ("a/../b", "b");
++  check_one ("a/.././b", "b");
++  check_one ("a/../lib64/b", "lib64/b");
++
++  /* Leading ".." components of a relative path are preserved and stack
++     instead of cancelling each other; ordinary components may follow and be
++     removed again afterwards.  */
++  check_one ("../a", "../a");
++  check_one ("../..", "../..");
++  check_one ("../../..", "../../..");
++  check_one ("../../a", "../../a");
++  check_one ("../a/..", "..");
++  check_one ("../../a/..", "../..");
++  check_one ("a/../../b", "../b");
++  check_one ("a/b/../../..", "..");
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/elf/tst-origin-secure-evilmod.c b/elf/tst-origin-secure-evilmod.c
+new file mode 100644
+index 0000000000..0913e32e21
+--- /dev/null
++++ b/elf/tst-origin-secure-evilmod.c
+@@ -0,0 +1,28 @@
++/* Module for tst-origin-secure (the attacker-controlled copy).
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#include "tst-origin-secure.h"
++
++/* If the victim reports this copy, the loader opened the un-normalized rpath
++   and resolved it through the attacker's symlink -- i.e. the trusted-path
++   check was bypassed (bug 34360).  */
++int
++origin_secure_id (void)
++{
++  return ORIGIN_SECURE_ID_ATTACKER;
++}
+diff --git a/elf/tst-origin-secure-victim.c b/elf/tst-origin-secure-victim.c
+new file mode 100644
+index 0000000000..601265aaa4
+--- /dev/null
++++ b/elf/tst-origin-secure-victim.c
+@@ -0,0 +1,43 @@
++/* Victim program for tst-origin-secure.
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#include "tst-origin-secure.h"
++
++extern int __libc_enable_secure;
++
++/* Report both which module was loaded and whether the loader ran in secure
++   mode, so the driver can tell a genuine trusted-path bypass apart from a run
++   that simply was not secure.
++
++   The exit status is the combination of the ORIGIN_SECURE_STATUS_* bits:
++
++     _NONE                    trusted copy, not secure
++     _ATTACKER                attacker copy, not secure  (the control run)
++     _SECURE                  trusted copy, secure       (a fixed loader)
++     _SECURE | _ATTACKER      attacker copy, secure      (the bug: the raw
++                                                          rpath was opened)  */
++int
++main (void)
++{
++  int status = ORIGIN_SECURE_STATUS_NONE;
++  if (origin_secure_id () == ORIGIN_SECURE_ID_ATTACKER)
++    status |= ORIGIN_SECURE_STATUS_ATTACKER;
++  if (__libc_enable_secure != 0)
++    status |= ORIGIN_SECURE_STATUS_SECURE;
++  return status;
++}
+diff --git a/elf/tst-origin-secure.c b/elf/tst-origin-secure.c
+new file mode 100644
+index 0000000000..f304823b49
+--- /dev/null
++++ b/elf/tst-origin-secure.c
+@@ -0,0 +1,203 @@
++/* Test that AT_SECURE $ORIGIN rpath entries are looked up using the
++   normalized (trusted) path, not the raw expansion (bug 34360).
++
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++
++/* For a SUID/SGID program the loader only honors $ORIGIN in DT_RPATH when
++   the normalized expansion is rooted in a trusted directory.  If the loader
++   opens the un-normalized string (that contains "../"), it might disagree
++   as soon as a path component is a symbolic link.
++
++   This test builds the executable with the rpath:
++
++     $ORIGIN/sub/../../../../..SLIBDIR/tst-origin-secure
++
++   and runs it as BASE/a/b/victim, so $ORIGIN is BASE/a/b.  Lexically the
++   five "../" pop $ORIGIN/sub back to "/" (BASE is /tmp/tst-origin-secure,
++   so $ORIGIN/sub is the five components tmp, tst-origin-secure, a, b, sub),
++   and the entry normalizes to the trusted SLIBDIR/tst-origin-secure.  But
++   "sub" is a symlink pointing six levels deep under BASE, so opening the raw
++   string makes the kernel resolve the "../" through the symlink and land in
++   BASE/x1 SLIBDIR/tst-origin-secure instead.
++
++   The "../" count in the rpath (see the Makefile) is therefore
++   depth(BASE) + 2 (for the "a/b" of $ORIGIN) + 1 (for "sub"); it is
++   independent of SLIBDIR, which is appended whole on both the raw and the
++   normalized side.
++
++   A trusted copy of the module (ORIGIN_SECURE_ID_TRUSTED) is installed in
++   SLIBDIR/tst-origin-secure; an attacker copy (ORIGIN_SECURE_ID_ATTACKER) is
++   placed at the symlink-diverted location.  The trusted subdirectory is
++   rooted under SLIBDIR (so it passes the trusted-path check) but is not
++   itself a default loader search directory.
++
++   The victim reports, in its exit status, both which module it loaded and
++   whether it ran in secure mode.
++
++   Secure mode is forced with glibc.rtld.enable_secure=1 so that no real
++   SUID/SGID binary is required.  */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <sys/wait.h>
++
++#include <support/capture_subprocess.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/xunistd.h>
++#include "tst-origin-secure.h"
++
++#define BASE   "/tmp/tst-origin-secure"
++#define SONAME "libtst-origin-secure-mod.so"
++/* Subdirectory of the trusted SLIBDIR that the rpath normalizes to.  It is
++   trusted (rooted under SLIBDIR) but not a default search directory.  */
++#define SUBDIR "tst-origin-secure"
++
++static int
++run_victim (char *const *envp)
++{
++  const char *victim = BASE "/a/b/victim";
++  char *const argv[] = { (char *) victim, NULL };
++
++  struct support_capture_subprocess res
++    = support_capture_subprogram (victim, argv, envp);
++  /* The victim itself prints nothing; forward any loader diagnostics to
++     the test log.  */
++  if (res.err.length > 0)
++    printf ("info: victim stderr: %s\n", res.err.buffer);
++  int status = res.status;
++  support_capture_subprocess_free (&res);
++  return WIFEXITED (status) ? WEXITSTATUS (status) : -1;
++}
++
++/* With SLIBDIR "/lib64" the container layout is:
++
++     /lib64/tst-origin-secure/libtst-origin-secure-mod.so   trusted copy (id 1)
++     BASE/a/b/victim                                        the executable
++     BASE/a/b/sub -> BASE/x1/x2/x3/x4/x5/x6                 six levels deep
++     BASE/x1/lib64/tst-origin-secure/libtst-origin-secure-mod.so
++                                                            attacker copy (id 2)
++     BASE/x1/x2/x3/x4/x5/x6/                                the symlink target
++
++   The victim's rpath is $ORIGIN/sub + five "../" + /lib64/tst-origin-secure.  */
++static void
++do_prepare (int argc, char **argv)
++{
++  const char *slibdir = support_slibdir_prefix;
++  const char *objelf = support_objdir_root;
++
++  char *good_src = xasprintf ("%s/elf/libtst-origin-secure-mod.so", objelf);
++  char *evil_src = xasprintf ("%s/elf/tst-origin-secure-evilmod.so", objelf);
++  char *victim_src = xasprintf ("%s/elf/tst-origin-secure-victim", objelf);
++
++  xmkdirp (BASE "/a/b", 0755);
++  xmkdirp (BASE "/x1/x2/x3/x4/x5/x6", 0755);
++
++  /* Where the trusted copy lives (reached only via the normalized rpath,
++     SLIBDIR/SUBDIR) ...  */
++  char *good_dir = xasprintf ("%s/%s", slibdir, SUBDIR);
++  char *good_dst = xasprintf ("%s/%s", good_dir, SONAME);
++  xmkdirp (good_dir, 0755);
++  /* ... and where the raw, symlink-diverted lookup lands.  */
++  char *evil_dir = xasprintf ("%s/x1%s/%s", BASE, slibdir, SUBDIR);
++  char *evil_dst = xasprintf ("%s/%s", evil_dir, SONAME);
++  xmkdirp (evil_dir, 0755);
++
++  /* support_copy_file preserves the source mode, so the victim stays
++     executable and the modules readable; no chmod is needed.  */
++  support_copy_file (good_src, good_dst);
++  support_copy_file (evil_src, evil_dst);
++  support_copy_file (victim_src, BASE "/a/b/victim");
++
++  unlink (BASE "/a/b/sub");
++  xsymlink (BASE "/x1/x2/x3/x4/x5/x6", BASE "/a/b/sub");
++
++  free (good_src);
++  free (evil_src);
++  free (victim_src);
++  free (good_dir);
++  free (good_dst);
++  free (evil_dir);
++  free (evil_dst);
++}
++#define PREPARE do_prepare
++
++static int
++do_test (void)
++{
++  /* Control run: in normal mode $ORIGIN is honored without the trusted check,
++     so the raw rpath resolves through "sub" and the attacker copy is
++     loaded.  */
++  {
++    char *const env[] = { NULL };
++    int rc = run_victim (env);
++    if (rc != ORIGIN_SECURE_STATUS_ATTACKER)
++      FAIL_EXIT1 ("control run returned status %d, expected %d (attacker "
++		  "copy, not secure): the $ORIGIN layout does not reproduce "
++		  "the divergence between the raw and the normalized rpath",
++		  rc, ORIGIN_SECURE_STATUS_ATTACKER);
++  }
++
++  /* Secure run: force AT_SECURE.  A fixed loader normalizes the rpath to the
++     trusted SLIBDIR/SUBDIR and loads the trusted copy; a loader with the bug
++     opens the raw path, resolves "sub", and loads the attacker copy.  */
++  {
++    char *const env[] = { (char *) "GLIBC_TUNABLES=glibc.rtld.enable_secure=1",
++			  NULL };
++    int rc = run_victim (env);
++    switch (rc)
++      {
++      /* Secure, trusted copy loaded via the normalized rpath: fixed.  */
++      case ORIGIN_SECURE_STATUS_SECURE:
++	break;
++
++      /* Secure, attacker copy loaded: the raw rpath was opened.  */
++      case ORIGIN_SECURE_STATUS_SECURE | ORIGIN_SECURE_STATUS_ATTACKER:
++	FAIL_EXIT1 ("secure-mode loader resolved the un-normalized rpath "
++		    "through the attacker symlink (bug 34360)");
++
++      /* Not secure, attacker copy: exactly what the control run produced, so
++	 the tunable did not engage and this run says nothing about the
++	 trusted-path handling.  */
++      case ORIGIN_SECURE_STATUS_ATTACKER:
++	FAIL_UNSUPPORTED ("glibc.rtld.enable_secure=1 did not enable "
++			  "secure mode (victim status %d)", rc);
++
++      /* Not secure, yet the trusted copy was loaded, which is reachable only
++	 through the normalized rpath, and only a secure loader normalizes it.
++	 Fail rather than report UNSUPPORTED.  */
++      case ORIGIN_SECURE_STATUS_NONE:
++	FAIL_EXIT1 ("secure run loaded the trusted copy but the victim "
++		    "reports not being secure: __libc_enable_secure is no "
++		    "longer a valid proxy for secure mode");
++
++      /* Neither copy loaded: since the trusted copy is reachable only through
++	 the normalized rpath, this means the rpath entry was not honored at
++	 all.  */
++      default:
++	FAIL_EXIT1 ("secure run did not load the module via the normalized "
++		    "rpath (victim status %d)", rc);
++      }
++  }
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/elf/tst-origin-secure.h b/elf/tst-origin-secure.h
+new file mode 100644
+index 0000000000..2e2b944607
+--- /dev/null
++++ b/elf/tst-origin-secure.h
+@@ -0,0 +1,41 @@
++/* Definitions shared by the tst-origin-secure test, its victim and modules.
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#ifndef _TST_ORIGIN_SECURE_H
++#define _TST_ORIGIN_SECURE_H 1
++
++enum
++  {
++    ORIGIN_SECURE_ID_TRUSTED = 1,  /* The copy installed in the trusted
++				      SLIBDIR.  */
++    ORIGIN_SECURE_ID_ATTACKER = 2, /* The copy reachable only by resolving the
++				      "sub" symlink.  */
++  };
++
++extern int origin_secure_id (void);
++
++enum
++  {
++    ORIGIN_SECURE_STATUS_NONE = 0,
++    ORIGIN_SECURE_STATUS_ATTACKER = 1 << 0,  /* The victim loaded attacker
++						rather than the trusted.  */
++    ORIGIN_SECURE_STATUS_SECURE = 1 << 1,    /* The loader ran the victim in
++						secure mode.  */
++  };
++
++#endif
+diff --git a/elf/tst-origin-secure.root/postclean.req b/elf/tst-origin-secure.root/postclean.req
+new file mode 100644
+index 0000000000..e69de29bb2
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 3b27328c21a..d8867bcff9a 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -75,6 +75,10 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0040-CVE-2026-18374-01.patch \
            file://0041-CVE-2026-18374-02.patch \
            file://0042-CVE-2026-8674.patch \
+           file://0043-CVE-2026-86805-CVE-2026-95818-01.patch \
+           file://0044-CVE-2026-86805-CVE-2026-95818-02.patch \
+           file://0045-CVE-2026-86805-CVE-2026-95818-03.patch \
+           file://0046-CVE-2026-86805-CVE-2026-95818-04.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
