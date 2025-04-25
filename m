Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3F5C369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:43:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4647.1745581408275900354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ACF0106F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:43:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D4393F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:43:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] libunwind: fix the build with GCC 15
Date: Fri, 25 Apr 2025 12:43:22 +0100
Message-ID: <20250425114322.718562-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425114322.718562-1-ross.burton@arm.com>
References: <20250425114322.718562-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215463

Backport a patch from upstream to fix the build when GCC 15 is used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libunwind/libunwind/malloc.patch          | 255 ++++++++++++++++++
 .../libunwind/libunwind_1.8.1.bb              |   1 +
 2 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/malloc.patch

diff --git a/meta/recipes-support/libunwind/libunwind/malloc.patch b/meta=
/recipes-support/libunwind/libunwind/malloc.patch
new file mode 100644
index 00000000000..026a56f1559
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/malloc.patch
@@ -0,0 +1,255 @@
+From b67d508a93bf1ba231c18dce3894cfee25c16e0d Mon Sep 17 00:00:00 2001
+From: Stephen Webb <swebb@blackberry.com>
+Date: Wed, 12 Feb 2025 12:08:07 -0500
+Subject: [PATCH] Fix bad prototype for malloc() in test
+
+The unit test Gtest-nomalloc.c had an incorrect prototype for malloc()
+which caused newer compilers to fail compiling for newer C editions.
+
+Corrected the prototype and corrected a few other errors. The unit now
+compiles using GCC with `CFLAGS=3D-Wall -Wextra -pedantic -C11` with no
+warnings, which is the minimum requirement.
+
+Added the tests/unw_test.h header as a first step to cleaning up some
+unit tests further.
+
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/commit=
/b67d508]]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/Gtest-nomalloc.c | 124 +++++++++++++++++++++++------------------
+ tests/Makefile.am      |   2 +-
+ tests/unw_test.h       |  47 ++++++++++++++++
+ 3 files changed, 117 insertions(+), 56 deletions(-)
+ create mode 100644 tests/unw_test.h
+
+diff --git a/tests/Gtest-nomalloc.c b/tests/Gtest-nomalloc.c
+index 5b97fc709..e770ff614 100644
+--- a/tests/Gtest-nomalloc.c
++++ b/tests/Gtest-nomalloc.c
+@@ -1,78 +1,92 @@
+-/* libunwind - a platform-independent unwind library
+-   Copyright (C) 2009 Google, Inc
+-	Contributed by Arun Sharma <arun.sharma@google.com>
++/**
++ * @file tests/Gtest-nomalloc.c
++ *
++ * Verify that @c malloc() is not called during an unwinding operation.
++ */
++/*
++ * This file is part of libunwind.
++ *   Copyright 2025 Stephen M. Webb <stephen.webb@bregmasoft.ca>
++ *   Copyright (C) 2009 Google, Inc
++ *   Contributed by Arun Sharma <arun.sharma@google.com>
++ *
++ * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
++ * of this software and associated documentation files (the "Software")=
, to
++ * deal in the Software without restriction, including without limitati=
on the
++ * rights to use, copy, modify, merge, publish, distribute, sublicense,=
 and/or
++ * sell copies of the Software, and to permit persons to whom the Softw=
are is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be inclu=
ded in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
++ * IN THE SOFTWARE.
++ */
+=20
+-Permission is hereby granted, free of charge, to any person obtaining
+-a copy of this software and associated documentation files (the
+-"Software"), to deal in the Software without restriction, including
+-without limitation the rights to use, copy, modify, merge, publish,
+-distribute, sublicense, and/or sell copies of the Software, and to
+-permit persons to whom the Software is furnished to do so, subject to
+-the following conditions:
+-
+-The above copyright notice and this permission notice shall be
+-included in all copies or substantial portions of the Software.
+-
+-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+-NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+-
+-#include <unistd.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+ #include <dlfcn.h>
+ #include <libunwind.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
+=20
+-#define panic(args...)				\
+-	{ fprintf (stderr, args); exit (-1); }
++#include "unw_test.h"
+=20
+-int verbose;
+-int num_errors;
++int malloc_call_count;
+ int in_unwind;
+=20
++/**
++ * Intercepted malloc() call.
++ *
++ * If invoked during unwinding this call will increment the test error =
count
++ * and indicate a failure by returning NULL. Otherwise it just calls th=
e real
++ * malloc().
++ */
+ void *
+-malloc(size_t s)
++malloc (size_t sz)
+ {
+-  static void * (*func)();
++  typedef void *(*malloc_t) (size_t);
+=20
+-  if(!func)
+-    func =3D (void *(*)()) dlsym(RTLD_NEXT, "malloc");
++  static malloc_t real_malloc =3D NULL;
++  if (real_malloc =3D=3D NULL)
++    {
++      real_malloc =3D (malloc_t)(intptr_t)dlsym (RTLD_NEXT, "malloc");
++      if (real_malloc =3D=3D NULL)
++        {
++          fprintf (stderr, "no malloc() found\n");
++          exit (UNW_TEST_EXIT_HARD_ERROR);                             =
             \
++        }
++    }
+=20
+-  if (in_unwind) {
+-    num_errors++;
+-    return NULL;
+-  } else {
+-    return func(s);
+-  }
++  if (in_unwind)
++    {
++      malloc_call_count++;
++    }
++  return real_malloc (sz);
+ }
+=20
+ static void
+ do_backtrace (void)
+ {
+-  unw_word_t ip, sp;
+-  unw_cursor_t cursor;
++  unw_cursor_t  cursor;
+   unw_context_t uc;
+-  int ret;
++  int           ret;
+=20
+   in_unwind =3D 1;
+   unw_getcontext (&uc);
+   if (unw_init_local (&cursor, &uc) < 0)
+-    panic ("unw_init_local failed!\n");
++    {
++      fprintf (stderr, "unw_init_local failed!\n");
++      exit (UNW_TEST_EXIT_HARD_ERROR);                                 =
         \
++    }
+=20
+   do
+     {
+-      unw_get_reg (&cursor, UNW_REG_IP, &ip);
+-      unw_get_reg (&cursor, UNW_REG_SP, &sp);
+-
+       ret =3D unw_step (&cursor);
+-      if (ret < 0)
+-	{
+-	  ++num_errors;
+-	}
+     }
+   while (ret > 0);
+   in_unwind =3D 0;
+@@ -99,12 +113,12 @@ foo1 (void)
+ int
+ main (void)
+ {
+-  foo1();
++  foo1 ();
+=20
+-  if (num_errors > 0)
++  if (malloc_call_count > 0)
+     {
+-      fprintf (stderr, "FAILURE: detected %d errors\n", num_errors);
+-      exit (-1);
++      fprintf (stderr, "FAILURE: malloc called %d times, expected 0\n",=
 malloc_call_count);
++      exit (UNW_TEST_EXIT_FAIL);
+     }
+-  return 0;
++  exit (UNW_TEST_EXIT_PASS);
+ }
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index adc34ac63..60f3f3adc 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -214,7 +214,7 @@ endif
+=20
+ noinst_PROGRAMS =3D $(noinst_PROGRAMS_common) $(noinst_PROGRAMS_cdep) \
+ 	$(noinst_PROGRAMS_arch)
+-noinst_HEADERS =3D ident.h
++noinst_HEADERS =3D ident.h unw_test.h
+=20
+ do_test_subst =3D sed -e 's,[@]TESTS[@],$(TESTS),g' \
+                     -e 's,[@]XFAIL_TESTS[@],$(XFAIL_TESTS),g' \
+diff --git a/tests/unw_test.h b/tests/unw_test.h
+new file mode 100644
+index 000000000..9ae86dce1
+--- /dev/null
++++ b/tests/unw_test.h
+@@ -0,0 +1,47 @@
++/**
++ * @file tests/unw_test.h
++ *
++ * Common unit test API for libunwind.
++ */
++/*
++ * This file is part of libunwind.
++ *   Copyright 2025 Stephen M. Webb <stephen.webb@bregmasoft.ca>
++ *
++ * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
++ * of this software and associated documentation files (the "Software")=
, to
++ * deal in the Software without restriction, including without limitati=
on the
++ * rights to use, copy, modify, merge, publish, distribute, sublicense,=
 and/or
++ * sell copies of the Software, and to permit persons to whom the Softw=
are is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be inclu=
ded in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
++ * IN THE SOFTWARE.
++ */
++#ifndef LIBUNWIND_UNW_TEST_H
++#define LIBUNWIND_UNW_TEST_H 1
++
++/**
++ * Exit values for test programs.
++ * Based on https://www.gnu.org/software/automake/manual/html_node/Scri=
pts_002dbased-Testsuites.html
++ *
++ * These are used to interact with the test harness (eg. a TAP-based ha=
rness,
++ * CTest, or automake).
++ */
++enum {
++  UNW_TEST_EXIT_PASS        =3D  0,  /* Item under test is a PASS */
++  UNW_TEST_EXIT_FAIL        =3D  1,  /* Item under test is a FAIL */
++  UNW_TEST_EXIT_BAD_COMMAND =3D  2,  /* Test program is invoked with in=
valid arguments */
++  UNW_TEST_EXIT_SKIP        =3D 77,  /* Test should be skipped */
++  UNW_TEST_EXIT_HARD_ERROR  =3D 99   /* Test program itself has failed =
*/
++};
++
++#endif /* LIBUNWIND_UNW_TEST_H */
++
diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.1.bb
index b22cb30646e..caa110c6da4 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "https://github.com/libunwind/libunwind/rel=
eases/download/v${PV}/${BP}
            file://0004-Rework-inline-aarch64-as-for-setcontext.patch \
            file://0005-Handle-musl-on-PPC32.patch \
            file://libatomic.patch \
+           file://malloc.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006=
c33e6df79e6a6157"
--=20
2.43.0


