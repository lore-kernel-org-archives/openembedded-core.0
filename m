Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870F3C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 19:37:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.14634.1745609831615872932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 12:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awggwNWX;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499c5d9691so2891079e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745609830; x=1746214630; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TM1o3tuF8o8ogJvXueY1Hqy04DGIumqLjlZp/oLK85Q=;
        b=awggwNWXqjJFXkcdPgpbeL/INXHjyNPsN4O1jP2+dSfXCyu1wudmXwM083oefXCF1V
         d3HWiFXDUGGLM7fLiaNxWFiIZ9yNtUQOyPt1/d1KjG6s8CIYAHGySo+BzqHp3KmpkD4H
         cZkeFa+y8yTnEOn32A8BsB8CQMMZF04j4BQBcJIRe658IRYzw+upQhUyOwDoq7iEmlXq
         /2sAISomalo+iOp7FraGdS0nM7SsXRxybSTrOZQTnL1dI5AhQZRVbtPr13oQQBZhwYzf
         Ccf6CB0ws+Obb6y0zfvNX+jOvVRF7j+kkBcWrqGL2+VmQLxc2quRzHghaV71FaGYRdtK
         XqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609830; x=1746214630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM1o3tuF8o8ogJvXueY1Hqy04DGIumqLjlZp/oLK85Q=;
        b=ZSfDoeLGfAbUTxF/NJQleGgYUOEUVXx5bJBJMNmDSEJ0d1NwHGBQ3Z7rn7VizJCFui
         0j+6skNAhQ9PSoNoIUacbT2JDm4e3bN6f4jpaPmw025QPIGVwwdWs1BhlhkRdRqDCQll
         9OWygkZiEYi0nLmmoE13tfx0e4qt2URXNz9jAXIE6iKNwOzbFMDCEnVp8T9BEWcWz+W4
         3DaW/JZ6InNRtjY9pu7j4vA+KVax08Rq2M/RWht0KjiRjMRg2Z0V05LByHiOpLEnJXm9
         XqLuPKJg2ymNox5xhB2FB+TMLME/Sg6V4j4ThU5FkS5fW7KFJ1VKC4sPLrohI5Hbj0nl
         tZ/Q==
X-Gm-Message-State: AOJu0Yw/cmc1YY65tPsyLh9MwY7WaiINOqzYFvd4lGvLPYzYGdkz7leW
	LpP5tiUvmZdLSEQYDyv/Xvx4MbP8mV0OnHpK7sz4FwD8PdM15dN8+LRQFBjqvlSNAJfOQlb3AoV
	6EEF3OA6zIAxVOx3bxsA7osTJb7c=
X-Gm-Gg: ASbGncv1wFKJ0mwCQuxWKZ8jaY1dch2wq0obLWjx6q6HW0Of88UpRN/iiS7gPe/xbvF
	3aS0A6I2VMrdlC0jChyVdq9KTmTI23YFFGVBNPAsNRB2QaDzJ0AFurDUa1L5VVT9tAd0Q7UT5Dg
	REXDj5l+iYT3T2Fd7uqFwtLn7l
X-Google-Smtp-Source: AGHT+IEomGaBRozYRmjSpAKwgHtSLwZQVLxnKY+xrtb17DwyYhYQtvOsQwNfytvo+b8G4gB/enGYVgOjUb2wamkJpsw=
X-Received: by 2002:ac2:4e07:0:b0:544:ca1:da41 with SMTP id
 2adb3069b0e04-54e9000c2fcmr182515e87.44.1745609829407; Fri, 25 Apr 2025
 12:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250425114322.718562-1-ross.burton@arm.com> <20250425114322.718562-4-ross.burton@arm.com>
In-Reply-To: <20250425114322.718562-4-ross.burton@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Apr 2025 21:36:52 +0200
X-Gm-Features: ATxdqUHGKb97SIlrt6wKLRT509ZyikUffNq7cHu2RB-pdCt9AsIRCGaP_92LvXg
Message-ID: <CA+chaQcAWEwyZP-TaXvGbarxMniCMm61ibn7F7CK7zk=wcYi7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] libunwind: fix the build with GCC 15
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215495

Acked-by: Martin Jansa <martin.jansa@gmail.com>

Thank you.

On Fri, Apr 25, 2025 at 1:43=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Backport a patch from upstream to fix the build when GCC 15 is used.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libunwind/libunwind/malloc.patch          | 255 ++++++++++++++++++
>  .../libunwind/libunwind_1.8.1.bb              |   1 +
>  2 files changed, 256 insertions(+)
>  create mode 100644 meta/recipes-support/libunwind/libunwind/malloc.patch
>
> diff --git a/meta/recipes-support/libunwind/libunwind/malloc.patch b/meta=
/recipes-support/libunwind/libunwind/malloc.patch
> new file mode 100644
> index 00000000000..026a56f1559
> --- /dev/null
> +++ b/meta/recipes-support/libunwind/libunwind/malloc.patch
> @@ -0,0 +1,255 @@
> +From b67d508a93bf1ba231c18dce3894cfee25c16e0d Mon Sep 17 00:00:00 2001
> +From: Stephen Webb <swebb@blackberry.com>
> +Date: Wed, 12 Feb 2025 12:08:07 -0500
> +Subject: [PATCH] Fix bad prototype for malloc() in test
> +
> +The unit test Gtest-nomalloc.c had an incorrect prototype for malloc()
> +which caused newer compilers to fail compiling for newer C editions.
> +
> +Corrected the prototype and corrected a few other errors. The unit now
> +compiles using GCC with `CFLAGS=3D-Wall -Wextra -pedantic -C11` with no
> +warnings, which is the minimum requirement.
> +
> +Added the tests/unw_test.h header as a first step to cleaning up some
> +unit tests further.
> +
> +Upstream-Status: Backport [https://github.com/libunwind/libunwind/commit=
/b67d508]]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + tests/Gtest-nomalloc.c | 124 +++++++++++++++++++++++------------------
> + tests/Makefile.am      |   2 +-
> + tests/unw_test.h       |  47 ++++++++++++++++
> + 3 files changed, 117 insertions(+), 56 deletions(-)
> + create mode 100644 tests/unw_test.h
> +
> +diff --git a/tests/Gtest-nomalloc.c b/tests/Gtest-nomalloc.c
> +index 5b97fc709..e770ff614 100644
> +--- a/tests/Gtest-nomalloc.c
> ++++ b/tests/Gtest-nomalloc.c
> +@@ -1,78 +1,92 @@
> +-/* libunwind - a platform-independent unwind library
> +-   Copyright (C) 2009 Google, Inc
> +-      Contributed by Arun Sharma <arun.sharma@google.com>
> ++/**
> ++ * @file tests/Gtest-nomalloc.c
> ++ *
> ++ * Verify that @c malloc() is not called during an unwinding operation.
> ++ */
> ++/*
> ++ * This file is part of libunwind.
> ++ *   Copyright 2025 Stephen M. Webb <stephen.webb@bregmasoft.ca>
> ++ *   Copyright (C) 2009 Google, Inc
> ++ *   Contributed by Arun Sharma <arun.sharma@google.com>
> ++ *
> ++ * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
> ++ * of this software and associated documentation files (the "Software")=
, to
> ++ * deal in the Software without restriction, including without limitati=
on the
> ++ * rights to use, copy, modify, merge, publish, distribute, sublicense,=
 and/or
> ++ * sell copies of the Software, and to permit persons to whom the Softw=
are is
> ++ * furnished to do so, subject to the following conditions:
> ++ *
> ++ * The above copyright notice and this permission notice shall be inclu=
ded in
> ++ * all copies or substantial portions of the Software.
> ++ *
> ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
> ++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
> ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
> ++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
> ++ * IN THE SOFTWARE.
> ++ */
> +
> +-Permission is hereby granted, free of charge, to any person obtaining
> +-a copy of this software and associated documentation files (the
> +-"Software"), to deal in the Software without restriction, including
> +-without limitation the rights to use, copy, modify, merge, publish,
> +-distribute, sublicense, and/or sell copies of the Software, and to
> +-permit persons to whom the Software is furnished to do so, subject to
> +-the following conditions:
> +-
> +-The above copyright notice and this permission notice shall be
> +-included in all copies or substantial portions of the Software.
> +-
> +-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> +-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> +-NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> +-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> +-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> +-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> +-
> +-#include <unistd.h>
> +-#include <stdio.h>
> +-#include <stdlib.h>
> + #include <dlfcn.h>
> + #include <libunwind.h>
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <unistd.h>
> +
> +-#define panic(args...)                                \
> +-      { fprintf (stderr, args); exit (-1); }
> ++#include "unw_test.h"
> +
> +-int verbose;
> +-int num_errors;
> ++int malloc_call_count;
> + int in_unwind;
> +
> ++/**
> ++ * Intercepted malloc() call.
> ++ *
> ++ * If invoked during unwinding this call will increment the test error =
count
> ++ * and indicate a failure by returning NULL. Otherwise it just calls th=
e real
> ++ * malloc().
> ++ */
> + void *
> +-malloc(size_t s)
> ++malloc (size_t sz)
> + {
> +-  static void * (*func)();
> ++  typedef void *(*malloc_t) (size_t);
> +
> +-  if(!func)
> +-    func =3D (void *(*)()) dlsym(RTLD_NEXT, "malloc");
> ++  static malloc_t real_malloc =3D NULL;
> ++  if (real_malloc =3D=3D NULL)
> ++    {
> ++      real_malloc =3D (malloc_t)(intptr_t)dlsym (RTLD_NEXT, "malloc");
> ++      if (real_malloc =3D=3D NULL)
> ++        {
> ++          fprintf (stderr, "no malloc() found\n");
> ++          exit (UNW_TEST_EXIT_HARD_ERROR);                             =
             \
> ++        }
> ++    }
> +
> +-  if (in_unwind) {
> +-    num_errors++;
> +-    return NULL;
> +-  } else {
> +-    return func(s);
> +-  }
> ++  if (in_unwind)
> ++    {
> ++      malloc_call_count++;
> ++    }
> ++  return real_malloc (sz);
> + }
> +
> + static void
> + do_backtrace (void)
> + {
> +-  unw_word_t ip, sp;
> +-  unw_cursor_t cursor;
> ++  unw_cursor_t  cursor;
> +   unw_context_t uc;
> +-  int ret;
> ++  int           ret;
> +
> +   in_unwind =3D 1;
> +   unw_getcontext (&uc);
> +   if (unw_init_local (&cursor, &uc) < 0)
> +-    panic ("unw_init_local failed!\n");
> ++    {
> ++      fprintf (stderr, "unw_init_local failed!\n");
> ++      exit (UNW_TEST_EXIT_HARD_ERROR);                                 =
         \
> ++    }
> +
> +   do
> +     {
> +-      unw_get_reg (&cursor, UNW_REG_IP, &ip);
> +-      unw_get_reg (&cursor, UNW_REG_SP, &sp);
> +-
> +       ret =3D unw_step (&cursor);
> +-      if (ret < 0)
> +-      {
> +-        ++num_errors;
> +-      }
> +     }
> +   while (ret > 0);
> +   in_unwind =3D 0;
> +@@ -99,12 +113,12 @@ foo1 (void)
> + int
> + main (void)
> + {
> +-  foo1();
> ++  foo1 ();
> +
> +-  if (num_errors > 0)
> ++  if (malloc_call_count > 0)
> +     {
> +-      fprintf (stderr, "FAILURE: detected %d errors\n", num_errors);
> +-      exit (-1);
> ++      fprintf (stderr, "FAILURE: malloc called %d times, expected 0\n",=
 malloc_call_count);
> ++      exit (UNW_TEST_EXIT_FAIL);
> +     }
> +-  return 0;
> ++  exit (UNW_TEST_EXIT_PASS);
> + }
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index adc34ac63..60f3f3adc 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -214,7 +214,7 @@ endif
> +
> + noinst_PROGRAMS =3D $(noinst_PROGRAMS_common) $(noinst_PROGRAMS_cdep) \
> +       $(noinst_PROGRAMS_arch)
> +-noinst_HEADERS =3D ident.h
> ++noinst_HEADERS =3D ident.h unw_test.h
> +
> + do_test_subst =3D sed -e 's,[@]TESTS[@],$(TESTS),g' \
> +                     -e 's,[@]XFAIL_TESTS[@],$(XFAIL_TESTS),g' \
> +diff --git a/tests/unw_test.h b/tests/unw_test.h
> +new file mode 100644
> +index 000000000..9ae86dce1
> +--- /dev/null
> ++++ b/tests/unw_test.h
> +@@ -0,0 +1,47 @@
> ++/**
> ++ * @file tests/unw_test.h
> ++ *
> ++ * Common unit test API for libunwind.
> ++ */
> ++/*
> ++ * This file is part of libunwind.
> ++ *   Copyright 2025 Stephen M. Webb <stephen.webb@bregmasoft.ca>
> ++ *
> ++ * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
> ++ * of this software and associated documentation files (the "Software")=
, to
> ++ * deal in the Software without restriction, including without limitati=
on the
> ++ * rights to use, copy, modify, merge, publish, distribute, sublicense,=
 and/or
> ++ * sell copies of the Software, and to permit persons to whom the Softw=
are is
> ++ * furnished to do so, subject to the following conditions:
> ++ *
> ++ * The above copyright notice and this permission notice shall be inclu=
ded in
> ++ * all copies or substantial portions of the Software.
> ++ *
> ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
> ++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
> ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
> ++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
> ++ * IN THE SOFTWARE.
> ++ */
> ++#ifndef LIBUNWIND_UNW_TEST_H
> ++#define LIBUNWIND_UNW_TEST_H 1
> ++
> ++/**
> ++ * Exit values for test programs.
> ++ * Based on https://www.gnu.org/software/automake/manual/html_node/Scri=
pts_002dbased-Testsuites.html
> ++ *
> ++ * These are used to interact with the test harness (eg. a TAP-based ha=
rness,
> ++ * CTest, or automake).
> ++ */
> ++enum {
> ++  UNW_TEST_EXIT_PASS        =3D  0,  /* Item under test is a PASS */
> ++  UNW_TEST_EXIT_FAIL        =3D  1,  /* Item under test is a FAIL */
> ++  UNW_TEST_EXIT_BAD_COMMAND =3D  2,  /* Test program is invoked with in=
valid arguments */
> ++  UNW_TEST_EXIT_SKIP        =3D 77,  /* Test should be skipped */
> ++  UNW_TEST_EXIT_HARD_ERROR  =3D 99   /* Test program itself has failed =
*/
> ++};
> ++
> ++#endif /* LIBUNWIND_UNW_TEST_H */
> ++
> diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.1.bb
> index b22cb30646e..caa110c6da4 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "https://github.com/libunwind/libunwind/rel=
eases/download/v${PV}/${BP}
>             file://0004-Rework-inline-aarch64-as-for-setcontext.patch \
>             file://0005-Handle-musl-on-PPC32.patch \
>             file://libatomic.patch \
> +           file://malloc.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006=
c33e6df79e6a6157"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215463): https://lists.openembedded.org/g/openembedde=
d-core/message/215463
> Mute This Topic: https://lists.openembedded.org/mt/112449328/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

