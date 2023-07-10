Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B3EEB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 15:41:11 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.43284.1689003663129745189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 08:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MhOYokTX;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.171, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso74950501fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689003661; x=1691595661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk3+y8+MtNabY7jLDoF1OQ0Xq1k6VISl/CyFBt5XGq0=;
        b=MhOYokTXATzbAzdQoqQFhXnEm3UUrsq2BtaoR4ul3TWjWZSXchnJU2OmeS6NdWxP56
         6ZHDdx00DR1U+UYDYLPjJOeT0wa9WeTMsVzXyrgPxlryabJ64twvY95ySLtovWekN0Qo
         9rx5RjJPqicaslFVzF0ZHP9HBtt3v3LnxyXhYheZBuHbdyBC1CGAmIyrSst9Cm35c5UD
         Tb33bcj/SYmbKBoxoC9hM4CIGdRpRSTtBveEv/yXjiCMb3wT10BPMwxgL9ORJK6OgvJa
         kbsuM6bPCbdOHGIW1QwtahFTr/3ipn0Oxbmt2tJgViEOkbDcLZWFz64DHH49+JPShQbL
         bAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689003661; x=1691595661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk3+y8+MtNabY7jLDoF1OQ0Xq1k6VISl/CyFBt5XGq0=;
        b=YM/9aQDLvm0PSNggbjMThPAfrsLSNgw44/MhO6ODSMdI3lfGKLyVnb1YY7ouH9LBGX
         s49R+j9UDxLJodLjVwibbfIaY3dzNDRnEitq608k5O9cMWcb8MfhhqgLXQQ2N16Rl5/d
         zCdj0FrAzLLJjJU1ILuOT8Zf5sO8u8zZh3zv/J99v4WUTDtrJJxfL0hEOpMlk7s7Sv1t
         NVVr9zVMQOMG7lAZ70Y9oo6wQQDwfhWK5ZrEfSXiK4jkUmgJ5oHBQoMisgS3oeN1gQA5
         PUT8hsII/S0tkKtz8vsSKW2+IbmWb3bOSM6Y+3tiOsVLbM1XnSGsClm8ofPAbvbQ4jbb
         00Fg==
X-Gm-Message-State: ABy/qLYvBrjfty2rF+jIGq+Eyink6hO0DLy4pTV9W0qUAD2FxnCtvgS9
	x/l/6zdoNuaMHkYF65TJgSNqkwIwdhOSkgblqpCdiA==
X-Google-Smtp-Source: APBJJlE6Wjc6njn2UsHSr0s66ELN3qoE2eGflmguuJZ2TjsXBW3xh1eWWeUigFVIZ2vi4qE6zUt0MltA6a0RRdxMt94=
X-Received: by 2002:a2e:9253:0:b0:2b6:da1e:d063 with SMTP id
 v19-20020a2e9253000000b002b6da1ed063mr9590883ljg.45.1689003660610; Mon, 10
 Jul 2023 08:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230710052832.185187-1-vkumbhar@mvista.com> <CAOSpxdb+wf9j7K4rmXSFHY_heS07-va5d2J_nACE3cAnHeEOBw@mail.gmail.com>
 <CAPun1rGQkUNZEvUucDSAaziTZOMwOW4BgSywcvR7OvJQA=32=Q@mail.gmail.com>
In-Reply-To: <CAPun1rGQkUNZEvUucDSAaziTZOMwOW4BgSywcvR7OvJQA=32=Q@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 10 Jul 2023 05:40:49 -1000
Message-ID: <CAOSpxdY-h4ynP-3EQN-y-Z9nkHUKU2Va=A00nSJ6Jd-qsDeaFQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: fix CVE-2023-28320 siglongjmp
 race condition may lead to crash
To: Vivek Kumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184083

On Mon, Jul 10, 2023 at 5:03=E2=80=AFAM Vivek Kumbhar <vkumbhar@mvista.com>=
 wrote:
>
> As it is a followup patch I have added it as fol1.
>
> If you want this as pre1, I will send v2 again.

What is confusing me is that this patch adds three files
(CVE-2023-28320-fol1.patch, CVE-2023-28320-pre1.patch,
CVE-2023-28320.patch) but then only adds two of them to SRC_URI.

So you should either drop adding CVE-2023-28320-pre1.patch, or add it
to SRC_URI.

Make sense?

Steve

> On Mon, Jul 10, 2023 at 8:01=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
>>
>> On Sun, Jul 9, 2023 at 7:28=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> wr=
ote:
>> >
>> > Introduced by: https://github.com/curl/curl/commit/3c49b405de4fbf1fd71=
27f91908261268640e54f (curl-7_9_8)
>> > Fixed by: https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f=
27f683cd3a6fa5f2 (curl-8_1_0)
>> > Follow-up: https://github.com/curl/curl/commit/f446258f0269a62289cca02=
10157cb8558d0edc3 (curl-8_1_0)
>> > https://curl.se/docs/CVE-2023-28320.html
>> >
>> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
>> > ---
>> >  .../curl/curl/CVE-2023-28320-fol1.patch       | 197 +++++++++++++++++=
+
>> >  .../curl/curl/CVE-2023-28320-pre1.patch       | 197 +++++++++++++++++=
+
>> >  .../curl/curl/CVE-2023-28320.patch            |  86 ++++++++
>> >  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
>> >  4 files changed, 482 insertions(+)
>> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1=
.patch
>> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-pre1=
.patch
>> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patc=
h
>> >
>> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch =
b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
>> > new file mode 100644
>> > index 0000000000..eaa6fdc327
>> > --- /dev/null
>> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
>> > @@ -0,0 +1,197 @@
>> > +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 200=
1
>> > +From: Daniel Stenberg <daniel@haxx.se>
>> > +Date: Tue, 16 May 2023 23:40:42 +0200
>> > +Subject: [PATCH] hostip: include easy_lock.h before using
>> > + GLOBAL_INIT_IS_THREADSAFE
>> > +
>> > +Since that header file is the only place that define can be defined.
>> > +
>> > +Reported-by: Marc Deslauriers
>> > +
>> > +Follow-up to 13718030ad4b3209
>> > +
>> > +Closes #11121
>> > +
>> > +Upstream-Status: Backport [https://github.com/curl/curl/commit/f44625=
8f0269a62289cca0210157cb8558d0edc3]
>> > +CVE: CVE-2023-28320
>> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
>> > +---
>> > + lib/easy_lock.h | 109 ++++++++++++++++++++++++++++++++++++++++++++++=
++
>> > + lib/hostip.c    |  10 ++---
>> > + lib/hostip.h    |   9 ----
>> > + 3 files changed, 113 insertions(+), 15 deletions(-)
>> > + create mode 100644 lib/easy_lock.h
>> > +
>> > +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
>> > +new file mode 100644
>> > +index 0000000..6399a39
>> > +--- /dev/null
>> > ++++ b/lib/easy_lock.h
>> > +@@ -0,0 +1,109 @@
>> > ++#ifndef HEADER_CURL_EASY_LOCK_H
>> > ++#define HEADER_CURL_EASY_LOCK_H
>> > ++/*******************************************************************=
********
>> > ++ *                                  _   _ ____  _
>> > ++ *  Project                     ___| | | |  _ \| |
>> > ++ *                             / __| | | | |_) | |
>> > ++ *                            | (__| |_| |  _ <| |___
>> > ++ *                             \___|\___/|_| \_\_____|
>> > ++ *
>> > ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
>> > ++ *
>> > ++ * This software is licensed as described in the file COPYING, which
>> > ++ * you should have received as part of this distribution. The terms
>> > ++ * are also available at https://curl.se/docs/copyright.html.
>> > ++ *
>> > ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell
>> > ++ * copies of the Software, and permit persons to whom the Software i=
s
>> > ++ * furnished to do so, under the terms of the COPYING file.
>> > ++ *
>> > ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANT=
Y OF ANY
>> > ++ * KIND, either express or implied.
>> > ++ *
>> > ++ * SPDX-License-Identifier: curl
>> > ++ *
>> > ++ *******************************************************************=
********/
>> > ++
>> > ++#include "curl_setup.h"
>> > ++
>> > ++#define GLOBAL_INIT_IS_THREADSAFE
>> > ++
>> > ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
>> > ++
>> > ++#ifdef __MINGW32__
>> > ++#ifndef __MINGW64_VERSION_MAJOR
>> > ++#if (__MINGW32_MAJOR_VERSION < 5) || \
>> > ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =3D=
=3D 0)
>> > ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from MS =
define */
>> > ++typedef PVOID SRWLOCK, *PSRWLOCK;
>> > ++#endif
>> > ++#endif
>> > ++#ifndef SRWLOCK_INIT
>> > ++#define SRWLOCK_INIT NULL
>> > ++#endif
>> > ++#endif /* __MINGW32__ */
>> > ++
>> > ++#define curl_simple_lock SRWLOCK
>> > ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
>> > ++
>> > ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
>> > ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
>> > ++
>> > ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
>> > ++#include <stdatomic.h>
>> > ++#if defined(HAVE_SCHED_YIELD)
>> > ++#include <sched.h>
>> > ++#endif
>> > ++
>> > ++#define curl_simple_lock atomic_int
>> > ++#define CURL_SIMPLE_LOCK_INIT 0
>> > ++
>> > ++/* a clang-thing */
>> > ++#ifndef __has_builtin
>> > ++#define __has_builtin(x) 0
>> > ++#endif
>> > ++
>> > ++#ifndef __INTEL_COMPILER
>> > ++/* The Intel compiler tries to look like GCC *and* clang *and* lies =
in its
>> > ++   __has_builtin() function, so override it. */
>> > ++
>> > ++/* if GCC on i386/x86_64 or if the built-in is present */
>> > ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
>> > ++      (defined(__i386__) || defined(__x86_64__))) ||    \
>> > ++  __has_builtin(__builtin_ia32_pause)
>> > ++#define HAVE_BUILTIN_IA32_PAUSE
>> > ++#endif
>> > ++
>> > ++#endif
>> > ++
>> > ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
>> > ++{
>> > ++  for(;;) {
>> > ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire))
>> > ++      break;
>> > ++    /* Reduce cache coherency traffic */
>> > ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
>> > ++      /* Reduce load (not mandatory) */
>> > ++#ifdef HAVE_BUILTIN_IA32_PAUSE
>> > ++      __builtin_ia32_pause();
>> > ++#elif defined(__aarch64__)
>> > ++      __asm__ volatile("yield" ::: "memory");
>> > ++#elif defined(HAVE_SCHED_YIELD)
>> > ++      sched_yield();
>> > ++#endif
>> > ++    }
>> > ++  }
>> > ++}
>> > ++
>> > ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
>> > ++{
>> > ++  atomic_store_explicit(lock, false, memory_order_release);
>> > ++}
>> > ++
>> > ++#else
>> > ++
>> > ++#undef  GLOBAL_INIT_IS_THREADSAFE
>> > ++
>> > ++#endif
>> > ++
>> > ++#endif /* HEADER_CURL_EASY_LOCK_H */
>> > +diff --git a/lib/hostip.c b/lib/hostip.c
>> > +index 5231a74..d5bf881 100644
>> > +--- a/lib/hostip.c
>> > ++++ b/lib/hostip.c
>> > +@@ -68,6 +68,8 @@
>> > + #include "curl_memory.h"
>> > + #include "memdebug.h"
>> > +
>> > ++#include "easy_lock.h"
>> > ++
>> > + #if defined(CURLRES_SYNCH) &&                   \
>> > +   defined(HAVE_ALARM) &&                        \
>> > +   defined(SIGALRM) &&                           \
>> > +@@ -77,10 +79,6 @@
>> > + #define USE_ALARM_TIMEOUT
>> > + #endif
>> > +
>> > +-#ifdef USE_ALARM_TIMEOUT
>> > +-#include "easy_lock.h"
>> > +-#endif
>> > +-
>> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port numbe=
r + zero */
>> > +
>> > + /*
>> > +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
>> > + /* Beware this is a global and unique instance. This is used to stor=
e the
>> > +    return address that we can jump back to from inside a signal hand=
ler. This
>> > +    is not thread-safe stuff. */
>> > +-sigjmp_buf curl_jmpenv;
>> > +-curl_simple_lock curl_jmpenv_lock;
>> > ++static sigjmp_buf curl_jmpenv;
>> > ++static curl_simple_lock curl_jmpenv_lock;
>> > + #endif
>> > +
>> > + /* lookup address, returns entry if found and not stale */
>> > +diff --git a/lib/hostip.h b/lib/hostip.h
>> > +index baf1e58..d7f73d9 100644
>> > +--- a/lib/hostip.h
>> > ++++ b/lib/hostip.h
>> > +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_add=
rinfo *addr,
>> > + #define CURL_INADDR_NONE INADDR_NONE
>> > + #endif
>> > +
>> > +-#ifdef HAVE_SIGSETJMP
>> > +-/* Forward-declaration of variable defined in hostip.c. Beware this
>> > +- * is a global and unique instance. This is used to store the return
>> > +- * address that we can jump back to from inside a signal handler.
>> > +- * This is not thread-safe stuff.
>> > +- */
>> > +-extern sigjmp_buf curl_jmpenv;
>> > +-#endif
>> > +-
>> > + /*
>> > +  * Function provided by the resolver backend to set DNS servers to u=
se.
>> > +  */
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch =
b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
>> > new file mode 100644
>> > index 0000000000..eaa6fdc327
>> > --- /dev/null
>> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
>> > @@ -0,0 +1,197 @@
>> > +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 200=
1
>> > +From: Daniel Stenberg <daniel@haxx.se>
>> > +Date: Tue, 16 May 2023 23:40:42 +0200
>> > +Subject: [PATCH] hostip: include easy_lock.h before using
>> > + GLOBAL_INIT_IS_THREADSAFE
>> > +
>> > +Since that header file is the only place that define can be defined.
>> > +
>> > +Reported-by: Marc Deslauriers
>> > +
>> > +Follow-up to 13718030ad4b3209
>> > +
>> > +Closes #11121
>> > +
>> > +Upstream-Status: Backport [https://github.com/curl/curl/commit/f44625=
8f0269a62289cca0210157cb8558d0edc3]
>> > +CVE: CVE-2023-28320
>> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
>> > +---
>> > + lib/easy_lock.h | 109 ++++++++++++++++++++++++++++++++++++++++++++++=
++
>> > + lib/hostip.c    |  10 ++---
>> > + lib/hostip.h    |   9 ----
>> > + 3 files changed, 113 insertions(+), 15 deletions(-)
>> > + create mode 100644 lib/easy_lock.h
>> > +
>> > +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
>> > +new file mode 100644
>> > +index 0000000..6399a39
>> > +--- /dev/null
>> > ++++ b/lib/easy_lock.h
>> > +@@ -0,0 +1,109 @@
>> > ++#ifndef HEADER_CURL_EASY_LOCK_H
>> > ++#define HEADER_CURL_EASY_LOCK_H
>> > ++/*******************************************************************=
********
>> > ++ *                                  _   _ ____  _
>> > ++ *  Project                     ___| | | |  _ \| |
>> > ++ *                             / __| | | | |_) | |
>> > ++ *                            | (__| |_| |  _ <| |___
>> > ++ *                             \___|\___/|_| \_\_____|
>> > ++ *
>> > ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
>> > ++ *
>> > ++ * This software is licensed as described in the file COPYING, which
>> > ++ * you should have received as part of this distribution. The terms
>> > ++ * are also available at https://curl.se/docs/copyright.html.
>> > ++ *
>> > ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell
>> > ++ * copies of the Software, and permit persons to whom the Software i=
s
>> > ++ * furnished to do so, under the terms of the COPYING file.
>> > ++ *
>> > ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANT=
Y OF ANY
>> > ++ * KIND, either express or implied.
>> > ++ *
>> > ++ * SPDX-License-Identifier: curl
>> > ++ *
>> > ++ *******************************************************************=
********/
>> > ++
>> > ++#include "curl_setup.h"
>> > ++
>> > ++#define GLOBAL_INIT_IS_THREADSAFE
>> > ++
>> > ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
>> > ++
>> > ++#ifdef __MINGW32__
>> > ++#ifndef __MINGW64_VERSION_MAJOR
>> > ++#if (__MINGW32_MAJOR_VERSION < 5) || \
>> > ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =3D=
=3D 0)
>> > ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from MS =
define */
>> > ++typedef PVOID SRWLOCK, *PSRWLOCK;
>> > ++#endif
>> > ++#endif
>> > ++#ifndef SRWLOCK_INIT
>> > ++#define SRWLOCK_INIT NULL
>> > ++#endif
>> > ++#endif /* __MINGW32__ */
>> > ++
>> > ++#define curl_simple_lock SRWLOCK
>> > ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
>> > ++
>> > ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
>> > ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
>> > ++
>> > ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
>> > ++#include <stdatomic.h>
>> > ++#if defined(HAVE_SCHED_YIELD)
>> > ++#include <sched.h>
>> > ++#endif
>> > ++
>> > ++#define curl_simple_lock atomic_int
>> > ++#define CURL_SIMPLE_LOCK_INIT 0
>> > ++
>> > ++/* a clang-thing */
>> > ++#ifndef __has_builtin
>> > ++#define __has_builtin(x) 0
>> > ++#endif
>> > ++
>> > ++#ifndef __INTEL_COMPILER
>> > ++/* The Intel compiler tries to look like GCC *and* clang *and* lies =
in its
>> > ++   __has_builtin() function, so override it. */
>> > ++
>> > ++/* if GCC on i386/x86_64 or if the built-in is present */
>> > ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
>> > ++      (defined(__i386__) || defined(__x86_64__))) ||    \
>> > ++  __has_builtin(__builtin_ia32_pause)
>> > ++#define HAVE_BUILTIN_IA32_PAUSE
>> > ++#endif
>> > ++
>> > ++#endif
>> > ++
>> > ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
>> > ++{
>> > ++  for(;;) {
>> > ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire))
>> > ++      break;
>> > ++    /* Reduce cache coherency traffic */
>> > ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
>> > ++      /* Reduce load (not mandatory) */
>> > ++#ifdef HAVE_BUILTIN_IA32_PAUSE
>> > ++      __builtin_ia32_pause();
>> > ++#elif defined(__aarch64__)
>> > ++      __asm__ volatile("yield" ::: "memory");
>> > ++#elif defined(HAVE_SCHED_YIELD)
>> > ++      sched_yield();
>> > ++#endif
>> > ++    }
>> > ++  }
>> > ++}
>> > ++
>> > ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
>> > ++{
>> > ++  atomic_store_explicit(lock, false, memory_order_release);
>> > ++}
>> > ++
>> > ++#else
>> > ++
>> > ++#undef  GLOBAL_INIT_IS_THREADSAFE
>> > ++
>> > ++#endif
>> > ++
>> > ++#endif /* HEADER_CURL_EASY_LOCK_H */
>> > +diff --git a/lib/hostip.c b/lib/hostip.c
>> > +index 5231a74..d5bf881 100644
>> > +--- a/lib/hostip.c
>> > ++++ b/lib/hostip.c
>> > +@@ -68,6 +68,8 @@
>> > + #include "curl_memory.h"
>> > + #include "memdebug.h"
>> > +
>> > ++#include "easy_lock.h"
>> > ++
>> > + #if defined(CURLRES_SYNCH) &&                   \
>> > +   defined(HAVE_ALARM) &&                        \
>> > +   defined(SIGALRM) &&                           \
>> > +@@ -77,10 +79,6 @@
>> > + #define USE_ALARM_TIMEOUT
>> > + #endif
>> > +
>> > +-#ifdef USE_ALARM_TIMEOUT
>> > +-#include "easy_lock.h"
>> > +-#endif
>> > +-
>> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port numbe=
r + zero */
>> > +
>> > + /*
>> > +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
>> > + /* Beware this is a global and unique instance. This is used to stor=
e the
>> > +    return address that we can jump back to from inside a signal hand=
ler. This
>> > +    is not thread-safe stuff. */
>> > +-sigjmp_buf curl_jmpenv;
>> > +-curl_simple_lock curl_jmpenv_lock;
>> > ++static sigjmp_buf curl_jmpenv;
>> > ++static curl_simple_lock curl_jmpenv_lock;
>> > + #endif
>> > +
>> > + /* lookup address, returns entry if found and not stale */
>> > +diff --git a/lib/hostip.h b/lib/hostip.h
>> > +index baf1e58..d7f73d9 100644
>> > +--- a/lib/hostip.h
>> > ++++ b/lib/hostip.h
>> > +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_add=
rinfo *addr,
>> > + #define CURL_INADDR_NONE INADDR_NONE
>> > + #endif
>> > +
>> > +-#ifdef HAVE_SIGSETJMP
>> > +-/* Forward-declaration of variable defined in hostip.c. Beware this
>> > +- * is a global and unique instance. This is used to store the return
>> > +- * address that we can jump back to from inside a signal handler.
>> > +- * This is not thread-safe stuff.
>> > +- */
>> > +-extern sigjmp_buf curl_jmpenv;
>> > +-#endif
>> > +-
>> > + /*
>> > +  * Function provided by the resolver backend to set DNS servers to u=
se.
>> > +  */
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch b/met=
a/recipes-support/curl/curl/CVE-2023-28320.patch
>> > new file mode 100644
>> > index 0000000000..0c9b67440a
>> > --- /dev/null
>> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
>> > @@ -0,0 +1,86 @@
>> > +From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00 200=
1
>> > +From: Harry Sintonen <sintonen@iki.fi>
>> > +Date: Tue, 25 Apr 2023 09:22:26 +0200
>> > +Subject: [PATCH] hostip: add locks around use of global buffer for al=
arm()
>> > +
>> > +When building with the sync name resolver and timeout ability we now
>> > +require thread-safety to be present to enable it.
>> > +
>> > +Closes #11030
>> > +
>> > +Upstream-Status: Backport [https://github.com/curl/curl/commit/137180=
30ad4b3209a7583b4f27f683cd3a6fa5f2]
>> > +CVE: CVE-2023-28320
>> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
>> > +---
>> > + lib/hostip.c | 19 +++++++++++++++----
>> > + 1 file changed, 15 insertions(+), 4 deletions(-)
>> > +
>> > +diff --git a/lib/hostip.c b/lib/hostip.c
>> > +index f5bb634..5231a74 100644
>> > +--- a/lib/hostip.c
>> > ++++ b/lib/hostip.c
>> > +@@ -68,12 +68,19 @@
>> > + #include "curl_memory.h"
>> > + #include "memdebug.h"
>> > +
>> > +-#if defined(CURLRES_SYNCH) && \
>> > +-    defined(HAVE_ALARM) && defined(SIGALRM) && defined(HAVE_SIGSETJM=
P)
>> > ++#if defined(CURLRES_SYNCH) &&                   \
>> > ++  defined(HAVE_ALARM) &&                        \
>> > ++  defined(SIGALRM) &&                           \
>> > ++  defined(HAVE_SIGSETJMP) &&                    \
>> > ++  defined(GLOBAL_INIT_IS_THREADSAFE)
>> > + /* alarm-based timeouts can only be used with all the dependencies s=
atisfied */
>> > + #define USE_ALARM_TIMEOUT
>> > + #endif
>> > +
>> > ++#ifdef USE_ALARM_TIMEOUT
>> > ++#include "easy_lock.h"
>> > ++#endif
>> > ++
>> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port numbe=
r + zero */
>> > +
>> > + /*
>> > +@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_easy *dat=
a)
>> > +     Curl_share_unlock(data, CURL_LOCK_DATA_DNS);
>> > + }
>> > +
>> > +-#ifdef HAVE_SIGSETJMP
>> > ++#ifdef USE_ALARM_TIMEOUT
>> > + /* Beware this is a global and unique instance. This is used to stor=
e the
>> > +    return address that we can jump back to from inside a signal hand=
ler. This
>> > +    is not thread-safe stuff. */
>> > + sigjmp_buf curl_jmpenv;
>> > ++curl_simple_lock curl_jmpenv_lock;
>> > + #endif
>> > +
>> > + /* lookup address, returns entry if found and not stale */
>> > +@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connectdata *co=
nn,
>> > + static
>> > + RETSIGTYPE alarmfunc(int sig)
>> > + {
>> > +-  /* this is for "-ansi -Wall -pedantic" to stop complaining!   (rab=
e) */
>> > +   (void)sig;
>> > +   siglongjmp(curl_jmpenv, 1);
>> > + }
>> > +@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struct connect=
data *conn,
>> > +      This should be the last thing we do before calling Curl_resolv(=
),
>> > +      as otherwise we'd have to worry about variables that get modifi=
ed
>> > +      before we invoke Curl_resolv() (and thus use "volatile"). */
>> > ++  curl_simple_lock_lock(&curl_jmpenv_lock);
>> > ++
>> > +   if(sigsetjmp(curl_jmpenv, 1)) {
>> > +     /* this is coming from a siglongjmp() after an alarm signal */
>> > +     failf(data, "name lookup timed out");
>> > +@@ -763,6 +772,8 @@ clean_up:
>> > + #endif
>> > + #endif /* HAVE_SIGACTION */
>> > +
>> > ++  curl_simple_lock_unlock(&curl_jmpenv_lock);
>> > ++
>> > +   /* switch back the alarm() to either zero or to what it was before=
 minus
>> > +      the time we spent until now! */
>> > +   if(prev_alarm) {
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-s=
upport/curl/curl_7.69.1.bb
>> > index 13ec117099..ce81df0f05 100644
>> > --- a/meta/recipes-support/curl/curl_7.69.1.bb
>> > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
>> > @@ -50,6 +50,8 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV=
}.tar.bz2 \
>> >             file://CVE-2023-27535-pre1.patch \
>> >             file://CVE-2023-27535.patch \
>> >             file://CVE-2023-27536.patch \
>>
>> Shouldn't you be adding CVE-2023-28320-pre1.patch here?
>>
>> Steve
>>
>> > +           file://CVE-2023-28320.patch \
>> > +           file://CVE-2023-28320-fol1.patch \
>> >  "
>> >
>> >  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#184058): https://lists.openembedded.org/g/openembe=
dded-core/message/184058
>> > Mute This Topic: https://lists.openembedded.org/mt/100053064/3620601
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

