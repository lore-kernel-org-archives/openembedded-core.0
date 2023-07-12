Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26A7EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 10:14:11 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4043.1689156849433311242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 03:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=PFjw8ALr;
 spf=pass (domain: mvista.com, ip: 209.85.167.51, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso10887203e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689156847; x=1691748847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mDi3AmUSPjcQlGJKM2ZMLQXj4fPVDA1uXuG4pbCQ5j8=;
        b=PFjw8ALr8zdb2Q0bilHN7ObQ01mBzh9hhx9arwA8ZbhHg1muVtLx1zQ5RFElLaGOFt
         S+4wGrKE4LilZCiaVNcQeqptIYCtyjTZhp+NOiKwhaXnG2LcveGvo+EvQ1GbHV9kJ93u
         YmbiG+C6J57wYhnqPJYXuM4vvkAExMY7iukwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689156847; x=1691748847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDi3AmUSPjcQlGJKM2ZMLQXj4fPVDA1uXuG4pbCQ5j8=;
        b=kIjG5Tr+e41YCPq++ss6oU0j0HGpL5n+1ELRwPl+1H1KxTG1kAoUitmVtXiysEQywq
         Kt/gNUnZ7su/VVSf1Yc4zfcWMQrVVyVSjaNkIggpw6+wMofrSV4ea6vNNNtXEAeGOJ16
         ALen4mXJGDNRNuz3xOD88POhmiEA/rESZNkjCcVtE4z2UGSpJsk7gR3FMGE3CrFSfomN
         cBZyzJw36+5riqMKUBnD/PwKqGbLYaI6mlouCw8ZSbpiolQeeVgnD1HDLL09F31WlEh7
         2w+weN9nmf79sQY+JB2piQEobcbGTrtVwZBHdRxCQe7xo7W+z7zb2Aj6zpAGsthvrjjl
         KeIw==
X-Gm-Message-State: ABy/qLZymcwCyd60Bd8LwgXspmBPbI5KUszzMo+wA8yP10XFPhrK8Yis
	YfW6tzsAandhTy6vYVXx345aE0Dm51OzwWMxfs+fZagm8LLnbsPk
X-Google-Smtp-Source: APBJJlGCKL4ndfodX3Gv0jJjWfl7xL2uw8xwSoru3YAv6Y5DitrNRttGZFRoRwEF5jsaBJwqlVLskjptLenMaV84Kh4=
X-Received: by 2002:ac2:5f52:0:b0:4f9:567b:c35d with SMTP id
 18-20020ac25f52000000b004f9567bc35dmr13797468lfz.55.1689156847134; Wed, 12
 Jul 2023 03:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230710052832.185187-1-vkumbhar@mvista.com> <CAOSpxdb+wf9j7K4rmXSFHY_heS07-va5d2J_nACE3cAnHeEOBw@mail.gmail.com>
 <CAPun1rGQkUNZEvUucDSAaziTZOMwOW4BgSywcvR7OvJQA=32=Q@mail.gmail.com> <CAOSpxdY-h4ynP-3EQN-y-Z9nkHUKU2Va=A00nSJ6Jd-qsDeaFQ@mail.gmail.com>
In-Reply-To: <CAOSpxdY-h4ynP-3EQN-y-Z9nkHUKU2Va=A00nSJ6Jd-qsDeaFQ@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Wed, 12 Jul 2023 15:43:55 +0530
Message-ID: <CAPun1rGNJNH7aUoKGqNdEKVTS46STZ+++gq7fToTCN6riAGvDA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: fix CVE-2023-28320 siglongjmp
 race condition may lead to crash
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d804e70600477921"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184170

--000000000000d804e70600477921
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Corrected, v2 has been sent for review.

Kind regards,
Vivek

On Mon, Jul 10, 2023 at 9:11=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Mon, Jul 10, 2023 at 5:03=E2=80=AFAM Vivek Kumbhar <vkumbhar@mvista.co=
m> wrote:
> >
> > As it is a followup patch I have added it as fol1.
> >
> > If you want this as pre1, I will send v2 again.
>
> What is confusing me is that this patch adds three files
> (CVE-2023-28320-fol1.patch, CVE-2023-28320-pre1.patch,
> CVE-2023-28320.patch) but then only adds two of them to SRC_URI.
>
> So you should either drop adding CVE-2023-28320-pre1.patch, or add it
> to SRC_URI.
>
> Make sense?
>
> Steve
>
> > On Mon, Jul 10, 2023 at 8:01=E2=80=AFPM Steve Sakoman <steve@sakoman.co=
m> wrote:
> >>
> >> On Sun, Jul 9, 2023 at 7:28=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> =
wrote:
> >> >
> >> > Introduced by:
> https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f91908261268640e=
54f
> (curl-7_9_8)
> >> > Fixed by:
> https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa=
5f2
> (curl-8_1_0)
> >> > Follow-up:
> https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0e=
dc3
> (curl-8_1_0)
> >> > https://curl.se/docs/CVE-2023-28320.html
> >> >
> >> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> >> > ---
> >> >  .../curl/curl/CVE-2023-28320-fol1.patch       | 197
> ++++++++++++++++++
> >> >  .../curl/curl/CVE-2023-28320-pre1.patch       | 197
> ++++++++++++++++++
> >> >  .../curl/curl/CVE-2023-28320.patch            |  86 ++++++++
> >> >  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
> >> >  4 files changed, 482 insertions(+)
> >> >  create mode 100644
> meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> >> >  create mode 100644
> meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> >> >  create mode 100644
> meta/recipes-support/curl/curl/CVE-2023-28320.patch
> >> >
> >> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patc=
h
> b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> >> > new file mode 100644
> >> > index 0000000000..eaa6fdc327
> >> > --- /dev/null
> >> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> >> > @@ -0,0 +1,197 @@
> >> > +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00
> 2001
> >> > +From: Daniel Stenberg <daniel@haxx.se>
> >> > +Date: Tue, 16 May 2023 23:40:42 +0200
> >> > +Subject: [PATCH] hostip: include easy_lock.h before using
> >> > + GLOBAL_INIT_IS_THREADSAFE
> >> > +
> >> > +Since that header file is the only place that define can be defined=
.
> >> > +
> >> > +Reported-by: Marc Deslauriers
> >> > +
> >> > +Follow-up to 13718030ad4b3209
> >> > +
> >> > +Closes #11121
> >> > +
> >> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0e=
dc3
> ]
> >> > +CVE: CVE-2023-28320
> >> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> >> > +---
> >> > + lib/easy_lock.h | 109
> ++++++++++++++++++++++++++++++++++++++++++++++++
> >> > + lib/hostip.c    |  10 ++---
> >> > + lib/hostip.h    |   9 ----
> >> > + 3 files changed, 113 insertions(+), 15 deletions(-)
> >> > + create mode 100644 lib/easy_lock.h
> >> > +
> >> > +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> >> > +new file mode 100644
> >> > +index 0000000..6399a39
> >> > +--- /dev/null
> >> > ++++ b/lib/easy_lock.h
> >> > +@@ -0,0 +1,109 @@
> >> > ++#ifndef HEADER_CURL_EASY_LOCK_H
> >> > ++#define HEADER_CURL_EASY_LOCK_H
> >> >
> ++/**********************************************************************=
*****
> >> > ++ *                                  _   _ ____  _
> >> > ++ *  Project                     ___| | | |  _ \| |
> >> > ++ *                             / __| | | | |_) | |
> >> > ++ *                            | (__| |_| |  _ <| |___
> >> > ++ *                             \___|\___/|_| \_\_____|
> >> > ++ *
> >> > ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> >> > ++ *
> >> > ++ * This software is licensed as described in the file COPYING, whi=
ch
> >> > ++ * you should have received as part of this distribution. The term=
s
> >> > ++ * are also available at https://curl.se/docs/copyright.html.
> >> > ++ *
> >> > ++ * You may opt to use, copy, modify, merge, publish, distribute
> and/or sell
> >> > ++ * copies of the Software, and permit persons to whom the Software
> is
> >> > ++ * furnished to do so, under the terms of the COPYING file.
> >> > ++ *
> >> > ++ * This software is distributed on an "AS IS" basis, WITHOUT
> WARRANTY OF ANY
> >> > ++ * KIND, either express or implied.
> >> > ++ *
> >> > ++ * SPDX-License-Identifier: curl
> >> > ++ *
> >> > ++
> *************************************************************************=
**/
> >> > ++
> >> > ++#include "curl_setup.h"
> >> > ++
> >> > ++#define GLOBAL_INIT_IS_THREADSAFE
> >> > ++
> >> > ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
> >> > ++
> >> > ++#ifdef __MINGW32__
> >> > ++#ifndef __MINGW64_VERSION_MAJOR
> >> > ++#if (__MINGW32_MAJOR_VERSION < 5) || \
> >> > ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =
=3D=3D 0)
> >> > ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from M=
S
> define */
> >> > ++typedef PVOID SRWLOCK, *PSRWLOCK;
> >> > ++#endif
> >> > ++#endif
> >> > ++#ifndef SRWLOCK_INIT
> >> > ++#define SRWLOCK_INIT NULL
> >> > ++#endif
> >> > ++#endif /* __MINGW32__ */
> >> > ++
> >> > ++#define curl_simple_lock SRWLOCK
> >> > ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
> >> > ++
> >> > ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
> >> > ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
> >> > ++
> >> > ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
> >> > ++#include <stdatomic.h>
> >> > ++#if defined(HAVE_SCHED_YIELD)
> >> > ++#include <sched.h>
> >> > ++#endif
> >> > ++
> >> > ++#define curl_simple_lock atomic_int
> >> > ++#define CURL_SIMPLE_LOCK_INIT 0
> >> > ++
> >> > ++/* a clang-thing */
> >> > ++#ifndef __has_builtin
> >> > ++#define __has_builtin(x) 0
> >> > ++#endif
> >> > ++
> >> > ++#ifndef __INTEL_COMPILER
> >> > ++/* The Intel compiler tries to look like GCC *and* clang *and* lie=
s
> in its
> >> > ++   __has_builtin() function, so override it. */
> >> > ++
> >> > ++/* if GCC on i386/x86_64 or if the built-in is present */
> >> > ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
> >> > ++      (defined(__i386__) || defined(__x86_64__))) ||    \
> >> > ++  __has_builtin(__builtin_ia32_pause)
> >> > ++#define HAVE_BUILTIN_IA32_PAUSE
> >> > ++#endif
> >> > ++
> >> > ++#endif
> >> > ++
> >> > ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
> >> > ++{
> >> > ++  for(;;) {
> >> > ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire)=
)
> >> > ++      break;
> >> > ++    /* Reduce cache coherency traffic */
> >> > ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
> >> > ++      /* Reduce load (not mandatory) */
> >> > ++#ifdef HAVE_BUILTIN_IA32_PAUSE
> >> > ++      __builtin_ia32_pause();
> >> > ++#elif defined(__aarch64__)
> >> > ++      __asm__ volatile("yield" ::: "memory");
> >> > ++#elif defined(HAVE_SCHED_YIELD)
> >> > ++      sched_yield();
> >> > ++#endif
> >> > ++    }
> >> > ++  }
> >> > ++}
> >> > ++
> >> > ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
> >> > ++{
> >> > ++  atomic_store_explicit(lock, false, memory_order_release);
> >> > ++}
> >> > ++
> >> > ++#else
> >> > ++
> >> > ++#undef  GLOBAL_INIT_IS_THREADSAFE
> >> > ++
> >> > ++#endif
> >> > ++
> >> > ++#endif /* HEADER_CURL_EASY_LOCK_H */
> >> > +diff --git a/lib/hostip.c b/lib/hostip.c
> >> > +index 5231a74..d5bf881 100644
> >> > +--- a/lib/hostip.c
> >> > ++++ b/lib/hostip.c
> >> > +@@ -68,6 +68,8 @@
> >> > + #include "curl_memory.h"
> >> > + #include "memdebug.h"
> >> > +
> >> > ++#include "easy_lock.h"
> >> > ++
> >> > + #if defined(CURLRES_SYNCH) &&                   \
> >> > +   defined(HAVE_ALARM) &&                        \
> >> > +   defined(SIGALRM) &&                           \
> >> > +@@ -77,10 +79,6 @@
> >> > + #define USE_ALARM_TIMEOUT
> >> > + #endif
> >> > +
> >> > +-#ifdef USE_ALARM_TIMEOUT
> >> > +-#include "easy_lock.h"
> >> > +-#endif
> >> > +-
> >> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port
> number + zero */
> >> > +
> >> > + /*
> >> > +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *dat=
a)
> >> > + /* Beware this is a global and unique instance. This is used to
> store the
> >> > +    return address that we can jump back to from inside a signal
> handler. This
> >> > +    is not thread-safe stuff. */
> >> > +-sigjmp_buf curl_jmpenv;
> >> > +-curl_simple_lock curl_jmpenv_lock;
> >> > ++static sigjmp_buf curl_jmpenv;
> >> > ++static curl_simple_lock curl_jmpenv_lock;
> >> > + #endif
> >> > +
> >> > + /* lookup address, returns entry if found and not stale */
> >> > +diff --git a/lib/hostip.h b/lib/hostip.h
> >> > +index baf1e58..d7f73d9 100644
> >> > +--- a/lib/hostip.h
> >> > ++++ b/lib/hostip.h
> >> > +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data,
> Curl_addrinfo *addr,
> >> > + #define CURL_INADDR_NONE INADDR_NONE
> >> > + #endif
> >> > +
> >> > +-#ifdef HAVE_SIGSETJMP
> >> > +-/* Forward-declaration of variable defined in hostip.c. Beware thi=
s
> >> > +- * is a global and unique instance. This is used to store the retu=
rn
> >> > +- * address that we can jump back to from inside a signal handler.
> >> > +- * This is not thread-safe stuff.
> >> > +- */
> >> > +-extern sigjmp_buf curl_jmpenv;
> >> > +-#endif
> >> > +-
> >> > + /*
> >> > +  * Function provided by the resolver backend to set DNS servers to
> use.
> >> > +  */
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patc=
h
> b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> >> > new file mode 100644
> >> > index 0000000000..eaa6fdc327
> >> > --- /dev/null
> >> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
> >> > @@ -0,0 +1,197 @@
> >> > +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00
> 2001
> >> > +From: Daniel Stenberg <daniel@haxx.se>
> >> > +Date: Tue, 16 May 2023 23:40:42 +0200
> >> > +Subject: [PATCH] hostip: include easy_lock.h before using
> >> > + GLOBAL_INIT_IS_THREADSAFE
> >> > +
> >> > +Since that header file is the only place that define can be defined=
.
> >> > +
> >> > +Reported-by: Marc Deslauriers
> >> > +
> >> > +Follow-up to 13718030ad4b3209
> >> > +
> >> > +Closes #11121
> >> > +
> >> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0e=
dc3
> ]
> >> > +CVE: CVE-2023-28320
> >> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> >> > +---
> >> > + lib/easy_lock.h | 109
> ++++++++++++++++++++++++++++++++++++++++++++++++
> >> > + lib/hostip.c    |  10 ++---
> >> > + lib/hostip.h    |   9 ----
> >> > + 3 files changed, 113 insertions(+), 15 deletions(-)
> >> > + create mode 100644 lib/easy_lock.h
> >> > +
> >> > +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> >> > +new file mode 100644
> >> > +index 0000000..6399a39
> >> > +--- /dev/null
> >> > ++++ b/lib/easy_lock.h
> >> > +@@ -0,0 +1,109 @@
> >> > ++#ifndef HEADER_CURL_EASY_LOCK_H
> >> > ++#define HEADER_CURL_EASY_LOCK_H
> >> >
> ++/**********************************************************************=
*****
> >> > ++ *                                  _   _ ____  _
> >> > ++ *  Project                     ___| | | |  _ \| |
> >> > ++ *                             / __| | | | |_) | |
> >> > ++ *                            | (__| |_| |  _ <| |___
> >> > ++ *                             \___|\___/|_| \_\_____|
> >> > ++ *
> >> > ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> >> > ++ *
> >> > ++ * This software is licensed as described in the file COPYING, whi=
ch
> >> > ++ * you should have received as part of this distribution. The term=
s
> >> > ++ * are also available at https://curl.se/docs/copyright.html.
> >> > ++ *
> >> > ++ * You may opt to use, copy, modify, merge, publish, distribute
> and/or sell
> >> > ++ * copies of the Software, and permit persons to whom the Software
> is
> >> > ++ * furnished to do so, under the terms of the COPYING file.
> >> > ++ *
> >> > ++ * This software is distributed on an "AS IS" basis, WITHOUT
> WARRANTY OF ANY
> >> > ++ * KIND, either express or implied.
> >> > ++ *
> >> > ++ * SPDX-License-Identifier: curl
> >> > ++ *
> >> > ++
> *************************************************************************=
**/
> >> > ++
> >> > ++#include "curl_setup.h"
> >> > ++
> >> > ++#define GLOBAL_INIT_IS_THREADSAFE
> >> > ++
> >> > ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
> >> > ++
> >> > ++#ifdef __MINGW32__
> >> > ++#ifndef __MINGW64_VERSION_MAJOR
> >> > ++#if (__MINGW32_MAJOR_VERSION < 5) || \
> >> > ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =
=3D=3D 0)
> >> > ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from M=
S
> define */
> >> > ++typedef PVOID SRWLOCK, *PSRWLOCK;
> >> > ++#endif
> >> > ++#endif
> >> > ++#ifndef SRWLOCK_INIT
> >> > ++#define SRWLOCK_INIT NULL
> >> > ++#endif
> >> > ++#endif /* __MINGW32__ */
> >> > ++
> >> > ++#define curl_simple_lock SRWLOCK
> >> > ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
> >> > ++
> >> > ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
> >> > ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
> >> > ++
> >> > ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
> >> > ++#include <stdatomic.h>
> >> > ++#if defined(HAVE_SCHED_YIELD)
> >> > ++#include <sched.h>
> >> > ++#endif
> >> > ++
> >> > ++#define curl_simple_lock atomic_int
> >> > ++#define CURL_SIMPLE_LOCK_INIT 0
> >> > ++
> >> > ++/* a clang-thing */
> >> > ++#ifndef __has_builtin
> >> > ++#define __has_builtin(x) 0
> >> > ++#endif
> >> > ++
> >> > ++#ifndef __INTEL_COMPILER
> >> > ++/* The Intel compiler tries to look like GCC *and* clang *and* lie=
s
> in its
> >> > ++   __has_builtin() function, so override it. */
> >> > ++
> >> > ++/* if GCC on i386/x86_64 or if the built-in is present */
> >> > ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
> >> > ++      (defined(__i386__) || defined(__x86_64__))) ||    \
> >> > ++  __has_builtin(__builtin_ia32_pause)
> >> > ++#define HAVE_BUILTIN_IA32_PAUSE
> >> > ++#endif
> >> > ++
> >> > ++#endif
> >> > ++
> >> > ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
> >> > ++{
> >> > ++  for(;;) {
> >> > ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire)=
)
> >> > ++      break;
> >> > ++    /* Reduce cache coherency traffic */
> >> > ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
> >> > ++      /* Reduce load (not mandatory) */
> >> > ++#ifdef HAVE_BUILTIN_IA32_PAUSE
> >> > ++      __builtin_ia32_pause();
> >> > ++#elif defined(__aarch64__)
> >> > ++      __asm__ volatile("yield" ::: "memory");
> >> > ++#elif defined(HAVE_SCHED_YIELD)
> >> > ++      sched_yield();
> >> > ++#endif
> >> > ++    }
> >> > ++  }
> >> > ++}
> >> > ++
> >> > ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
> >> > ++{
> >> > ++  atomic_store_explicit(lock, false, memory_order_release);
> >> > ++}
> >> > ++
> >> > ++#else
> >> > ++
> >> > ++#undef  GLOBAL_INIT_IS_THREADSAFE
> >> > ++
> >> > ++#endif
> >> > ++
> >> > ++#endif /* HEADER_CURL_EASY_LOCK_H */
> >> > +diff --git a/lib/hostip.c b/lib/hostip.c
> >> > +index 5231a74..d5bf881 100644
> >> > +--- a/lib/hostip.c
> >> > ++++ b/lib/hostip.c
> >> > +@@ -68,6 +68,8 @@
> >> > + #include "curl_memory.h"
> >> > + #include "memdebug.h"
> >> > +
> >> > ++#include "easy_lock.h"
> >> > ++
> >> > + #if defined(CURLRES_SYNCH) &&                   \
> >> > +   defined(HAVE_ALARM) &&                        \
> >> > +   defined(SIGALRM) &&                           \
> >> > +@@ -77,10 +79,6 @@
> >> > + #define USE_ALARM_TIMEOUT
> >> > + #endif
> >> > +
> >> > +-#ifdef USE_ALARM_TIMEOUT
> >> > +-#include "easy_lock.h"
> >> > +-#endif
> >> > +-
> >> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port
> number + zero */
> >> > +
> >> > + /*
> >> > +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *dat=
a)
> >> > + /* Beware this is a global and unique instance. This is used to
> store the
> >> > +    return address that we can jump back to from inside a signal
> handler. This
> >> > +    is not thread-safe stuff. */
> >> > +-sigjmp_buf curl_jmpenv;
> >> > +-curl_simple_lock curl_jmpenv_lock;
> >> > ++static sigjmp_buf curl_jmpenv;
> >> > ++static curl_simple_lock curl_jmpenv_lock;
> >> > + #endif
> >> > +
> >> > + /* lookup address, returns entry if found and not stale */
> >> > +diff --git a/lib/hostip.h b/lib/hostip.h
> >> > +index baf1e58..d7f73d9 100644
> >> > +--- a/lib/hostip.h
> >> > ++++ b/lib/hostip.h
> >> > +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data,
> Curl_addrinfo *addr,
> >> > + #define CURL_INADDR_NONE INADDR_NONE
> >> > + #endif
> >> > +
> >> > +-#ifdef HAVE_SIGSETJMP
> >> > +-/* Forward-declaration of variable defined in hostip.c. Beware thi=
s
> >> > +- * is a global and unique instance. This is used to store the retu=
rn
> >> > +- * address that we can jump back to from inside a signal handler.
> >> > +- * This is not thread-safe stuff.
> >> > +- */
> >> > +-extern sigjmp_buf curl_jmpenv;
> >> > +-#endif
> >> > +-
> >> > + /*
> >> > +  * Function provided by the resolver backend to set DNS servers to
> use.
> >> > +  */
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> >> > new file mode 100644
> >> > index 0000000000..0c9b67440a
> >> > --- /dev/null
> >> > +++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> >> > @@ -0,0 +1,86 @@
> >> > +From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00
> 2001
> >> > +From: Harry Sintonen <sintonen@iki.fi>
> >> > +Date: Tue, 25 Apr 2023 09:22:26 +0200
> >> > +Subject: [PATCH] hostip: add locks around use of global buffer for
> alarm()
> >> > +
> >> > +When building with the sync name resolver and timeout ability we no=
w
> >> > +require thread-safety to be present to enable it.
> >> > +
> >> > +Closes #11030
> >> > +
> >> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa=
5f2
> ]
> >> > +CVE: CVE-2023-28320
> >> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> >> > +---
> >> > + lib/hostip.c | 19 +++++++++++++++----
> >> > + 1 file changed, 15 insertions(+), 4 deletions(-)
> >> > +
> >> > +diff --git a/lib/hostip.c b/lib/hostip.c
> >> > +index f5bb634..5231a74 100644
> >> > +--- a/lib/hostip.c
> >> > ++++ b/lib/hostip.c
> >> > +@@ -68,12 +68,19 @@
> >> > + #include "curl_memory.h"
> >> > + #include "memdebug.h"
> >> > +
> >> > +-#if defined(CURLRES_SYNCH) && \
> >> > +-    defined(HAVE_ALARM) && defined(SIGALRM) &&
> defined(HAVE_SIGSETJMP)
> >> > ++#if defined(CURLRES_SYNCH) &&                   \
> >> > ++  defined(HAVE_ALARM) &&                        \
> >> > ++  defined(SIGALRM) &&                           \
> >> > ++  defined(HAVE_SIGSETJMP) &&                    \
> >> > ++  defined(GLOBAL_INIT_IS_THREADSAFE)
> >> > + /* alarm-based timeouts can only be used with all the dependencies
> satisfied */
> >> > + #define USE_ALARM_TIMEOUT
> >> > + #endif
> >> > +
> >> > ++#ifdef USE_ALARM_TIMEOUT
> >> > ++#include "easy_lock.h"
> >> > ++#endif
> >> > ++
> >> > + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port
> number + zero */
> >> > +
> >> > + /*
> >> > +@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_easy
> *data)
> >> > +     Curl_share_unlock(data, CURL_LOCK_DATA_DNS);
> >> > + }
> >> > +
> >> > +-#ifdef HAVE_SIGSETJMP
> >> > ++#ifdef USE_ALARM_TIMEOUT
> >> > + /* Beware this is a global and unique instance. This is used to
> store the
> >> > +    return address that we can jump back to from inside a signal
> handler. This
> >> > +    is not thread-safe stuff. */
> >> > + sigjmp_buf curl_jmpenv;
> >> > ++curl_simple_lock curl_jmpenv_lock;
> >> > + #endif
> >> > +
> >> > + /* lookup address, returns entry if found and not stale */
> >> > +@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connectdata
> *conn,
> >> > + static
> >> > + RETSIGTYPE alarmfunc(int sig)
> >> > + {
> >> > +-  /* this is for "-ansi -Wall -pedantic" to stop complaining!
>  (rabe) */
> >> > +   (void)sig;
> >> > +   siglongjmp(curl_jmpenv, 1);
> >> > + }
> >> > +@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struct
> connectdata *conn,
> >> > +      This should be the last thing we do before calling
> Curl_resolv(),
> >> > +      as otherwise we'd have to worry about variables that get
> modified
> >> > +      before we invoke Curl_resolv() (and thus use "volatile"). */
> >> > ++  curl_simple_lock_lock(&curl_jmpenv_lock);
> >> > ++
> >> > +   if(sigsetjmp(curl_jmpenv, 1)) {
> >> > +     /* this is coming from a siglongjmp() after an alarm signal */
> >> > +     failf(data, "name lookup timed out");
> >> > +@@ -763,6 +772,8 @@ clean_up:
> >> > + #endif
> >> > + #endif /* HAVE_SIGACTION */
> >> > +
> >> > ++  curl_simple_lock_unlock(&curl_jmpenv_lock);
> >> > ++
> >> > +   /* switch back the alarm() to either zero or to what it was
> before minus
> >> > +      the time we spent until now! */
> >> > +   if(prev_alarm) {
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb
> b/meta/recipes-support/curl/curl_7.69.1.bb
> >> > index 13ec117099..ce81df0f05 100644
> >> > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> >> > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> >> > @@ -50,6 +50,8 @@ SRC_URI =3D "
> https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> >> >             file://CVE-2023-27535-pre1.patch \
> >> >             file://CVE-2023-27535.patch \
> >> >             file://CVE-2023-27536.patch \
> >>
> >> Shouldn't you be adding CVE-2023-28320-pre1.patch here?
> >>
> >> Steve
> >>
> >> > +           file://CVE-2023-28320.patch \
> >> > +           file://CVE-2023-28320-fol1.patch \
> >> >  "
> >> >
> >> >  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> >> > --
> >> > 2.25.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#184058):
> https://lists.openembedded.org/g/openembedded-core/message/184058
> >> > Mute This Topic: https://lists.openembedded.org/mt/100053064/3620601
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [steve@sakoman.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--000000000000d804e70600477921
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Corrected, v2 has been sent for review.<div><br></div><div=
>Kind=C2=A0regards,</div><div>Vivek</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 10, 2023 at 9:11=E2=80=
=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, Jul 10, 2023 at 5:03=E2=80=AFAM Vivek Kumbhar &lt;<a href=3D"mai=
lto:vkumbhar@mvista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; As it is a followup patch I have added it as fol1.<br>
&gt;<br>
&gt; If you want this as pre1, I will send v2 again.<br>
<br>
What is confusing me is that this patch adds three files<br>
(CVE-2023-28320-fol1.patch, CVE-2023-28320-pre1.patch,<br>
CVE-2023-28320.patch) but then only adds two of them to SRC_URI.<br>
<br>
So you should either drop adding CVE-2023-28320-pre1.patch, or add it<br>
to SRC_URI.<br>
<br>
Make sense?<br>
<br>
Steve<br>
<br>
&gt; On Mon, Jul 10, 2023 at 8:01=E2=80=AFPM Steve Sakoman &lt;<a href=3D"m=
ailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Jul 9, 2023 at 7:28=E2=80=AFPM vkumbhar &lt;<a href=3D"mai=
lto:vkumbhar@mvista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Introduced by: <a href=3D"https://github.com/curl/curl/commit=
/3c49b405de4fbf1fd7127f91908261268640e54f" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f919082612686=
40e54f</a> (curl-7_9_8)<br>
&gt;&gt; &gt; Fixed by: <a href=3D"https://github.com/curl/curl/commit/1371=
8030ad4b3209a7583b4f27f683cd3a6fa5f2" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f=
2</a> (curl-8_1_0)<br>
&gt;&gt; &gt; Follow-up: <a href=3D"https://github.com/curl/curl/commit/f44=
6258f0269a62289cca0210157cb8558d0edc3" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0ed=
c3</a> (curl-8_1_0)<br>
&gt;&gt; &gt; <a href=3D"https://curl.se/docs/CVE-2023-28320.html" rel=3D"n=
oreferrer" target=3D"_blank">https://curl.se/docs/CVE-2023-28320.html</a><b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@m=
vista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../curl/curl/CVE-2023-28320-fol1.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 197 ++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 .../curl/curl/CVE-2023-28320-pre1.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 197 ++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 .../curl/curl/CVE-2023-28320.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 86 ++++++++<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.69.1=
.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;=C2=A0 4 files changed, 482 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2=
023-28320-fol1.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2=
023-28320-pre1.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2=
023-28320.patch<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fo=
l1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..eaa6fdc327<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patc=
h<br>
&gt;&gt; &gt; @@ -0,0 +1,197 @@<br>
&gt;&gt; &gt; +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" =
target=3D"_blank">daniel@haxx.se</a>&gt;<br>
&gt;&gt; &gt; +Date: Tue, 16 May 2023 23:40:42 +0200<br>
&gt;&gt; &gt; +Subject: [PATCH] hostip: include easy_lock.h before using<br=
>
&gt;&gt; &gt; + GLOBAL_INIT_IS_THREADSAFE<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Since that header file is the only place that define can be =
defined.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Reported-by: Marc Deslauriers<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Follow-up to 13718030ad4b3209<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Closes #11121<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/cur=
l/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/curl/curl/commit/f446258f0269a62289cca=
0210157cb8558d0edc3</a>]<br>
&gt;&gt; &gt; +CVE: CVE-2023-28320<br>
&gt;&gt; &gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@=
mvista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + lib/easy_lock.h | 109 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
&gt;&gt; &gt; + lib/hostip.c=C2=A0 =C2=A0 |=C2=A0 10 ++---<br>
&gt;&gt; &gt; + lib/hostip.h=C2=A0 =C2=A0 |=C2=A0 =C2=A09 ----<br>
&gt;&gt; &gt; + 3 files changed, 113 insertions(+), 15 deletions(-)<br>
&gt;&gt; &gt; + create mode 100644 lib/easy_lock.h<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/lib/easy_lock.h b/lib/easy_lock.h<br>
&gt;&gt; &gt; +new file mode 100644<br>
&gt;&gt; &gt; +index 0000000..6399a39<br>
&gt;&gt; &gt; +--- /dev/null<br>
&gt;&gt; &gt; ++++ b/lib/easy_lock.h<br>
&gt;&gt; &gt; +@@ -0,0 +1,109 @@<br>
&gt;&gt; &gt; ++#ifndef HEADER_CURL_EASY_LOCK_H<br>
&gt;&gt; &gt; ++#define HEADER_CURL_EASY_LOCK_H<br>
&gt;&gt; &gt; ++/**********************************************************=
*****************<br>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=
=A0_ ____=C2=A0 _<br>
&gt;&gt; &gt; ++ *=C2=A0 Project=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0___| | | |=C2=A0 _ \| |<br>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ __| | | | |_) | |<br>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (__| |_| |=C2=A0 _ &lt;| |___<b=
r>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\___|\___/|_| \_\_____|<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * Copyright (C) Daniel Stenberg, &lt;<a href=3D"mailto:dan=
iel@haxx.se" target=3D"_blank">daniel@haxx.se</a>&gt;, et al.<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * This software is licensed as described in the file COPYI=
NG, which<br>
&gt;&gt; &gt; ++ * you should have received as part of this distribution. T=
he terms<br>
&gt;&gt; &gt; ++ * are also available at <a href=3D"https://curl.se/docs/co=
pyright.html" rel=3D"noreferrer" target=3D"_blank">https://curl.se/docs/cop=
yright.html</a>.<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * You may opt to use, copy, modify, merge, publish, distri=
bute and/or sell<br>
&gt;&gt; &gt; ++ * copies of the Software, and permit persons to whom the S=
oftware is<br>
&gt;&gt; &gt; ++ * furnished to do so, under the terms of the COPYING file.=
<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * This software is distributed on an &quot;AS IS&quot; bas=
is, WITHOUT WARRANTY OF ANY<br>
&gt;&gt; &gt; ++ * KIND, either express or implied.<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * SPDX-License-Identifier: curl<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ **********************************************************=
*****************/<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#include &quot;curl_setup.h&quot;<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define GLOBAL_INIT_IS_THREADSAFE<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#if defined(_WIN32_WINNT) &amp;&amp; _WIN32_WINNT &gt;=3D 0=
x600<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#ifdef __MINGW32__<br>
&gt;&gt; &gt; ++#ifndef __MINGW64_VERSION_MAJOR<br>
&gt;&gt; &gt; ++#if (__MINGW32_MAJOR_VERSION &lt; 5) || \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 (__MINGW32_MAJOR_VERSION =3D=3D 5 &amp;&amp; =
__MINGW32_MINOR_VERSION =3D=3D 0)<br>
&gt;&gt; &gt; ++/* mingw &gt;=3D 5.0.1 defines SRWLOCK, and slightly differ=
ent from MS define */<br>
&gt;&gt; &gt; ++typedef PVOID SRWLOCK, *PSRWLOCK;<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++#ifndef SRWLOCK_INIT<br>
&gt;&gt; &gt; ++#define SRWLOCK_INIT NULL<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++#endif /* __MINGW32__ */<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define curl_simple_lock SRWLOCK<br>
&gt;&gt; &gt; ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)=
<br>
&gt;&gt; &gt; ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(=
m)<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#elif defined(HAVE_ATOMIC) &amp;&amp; defined(HAVE_STDATOMI=
C_H)<br>
&gt;&gt; &gt; ++#include &lt;stdatomic.h&gt;<br>
&gt;&gt; &gt; ++#if defined(HAVE_SCHED_YIELD)<br>
&gt;&gt; &gt; ++#include &lt;sched.h&gt;<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define curl_simple_lock atomic_int<br>
&gt;&gt; &gt; ++#define CURL_SIMPLE_LOCK_INIT 0<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++/* a clang-thing */<br>
&gt;&gt; &gt; ++#ifndef __has_builtin<br>
&gt;&gt; &gt; ++#define __has_builtin(x) 0<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#ifndef __INTEL_COMPILER<br>
&gt;&gt; &gt; ++/* The Intel compiler tries to look like GCC *and* clang *a=
nd* lies in its<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0__has_builtin() function, so override it. */<b=
r>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++/* if GCC on i386/x86_64 or if the built-in is present */<b=
r>
&gt;&gt; &gt; ++#if ( (defined(__GNUC__) &amp;&amp; !defined(__clang__)) &a=
mp;&amp;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 (defined(__i386__) || defined(__x86_64=
__))) ||=C2=A0 =C2=A0 \<br>
&gt;&gt; &gt; ++=C2=A0 __has_builtin(__builtin_ia32_pause)<br>
&gt;&gt; &gt; ++#define HAVE_BUILTIN_IA32_PAUSE<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++static inline void curl_simple_lock_lock(curl_simple_lock *=
lock)<br>
&gt;&gt; &gt; ++{<br>
&gt;&gt; &gt; ++=C2=A0 for(;;) {<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 if(!atomic_exchange_explicit(lock, true, memo=
ry_order_acquire))<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 /* Reduce cache coherency traffic */<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 while(atomic_load_explicit(lock, memory_order=
_relaxed)) {<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* Reduce load (not mandatory) */<br>
&gt;&gt; &gt; ++#ifdef HAVE_BUILTIN_IA32_PAUSE<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 __builtin_ia32_pause();<br>
&gt;&gt; &gt; ++#elif defined(__aarch64__)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 __asm__ volatile(&quot;yield&quot; :::=
 &quot;memory&quot;);<br>
&gt;&gt; &gt; ++#elif defined(HAVE_SCHED_YIELD)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 sched_yield();<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; ++=C2=A0 }<br>
&gt;&gt; &gt; ++}<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++static inline void curl_simple_lock_unlock(curl_simple_lock=
 *lock)<br>
&gt;&gt; &gt; ++{<br>
&gt;&gt; &gt; ++=C2=A0 atomic_store_explicit(lock, false, memory_order_rele=
ase);<br>
&gt;&gt; &gt; ++}<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#else<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#undef=C2=A0 GLOBAL_INIT_IS_THREADSAFE<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#endif /* HEADER_CURL_EASY_LOCK_H */<br>
&gt;&gt; &gt; +diff --git a/lib/hostip.c b/lib/hostip.c<br>
&gt;&gt; &gt; +index 5231a74..d5bf881 100644<br>
&gt;&gt; &gt; +--- a/lib/hostip.c<br>
&gt;&gt; &gt; ++++ b/lib/hostip.c<br>
&gt;&gt; &gt; +@@ -68,6 +68,8 @@<br>
&gt;&gt; &gt; + #include &quot;curl_memory.h&quot;<br>
&gt;&gt; &gt; + #include &quot;memdebug.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; ++#include &quot;easy_lock.h&quot;<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; + #if defined(CURLRES_SYNCH) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0defined(HAVE_ALARM) &amp;&amp;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0defined(SIGALRM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt;&gt; &gt; +@@ -77,10 +79,6 @@<br>
&gt;&gt; &gt; + #define USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-#ifdef USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; +-#include &quot;easy_lock.h&quot;<br>
&gt;&gt; &gt; +-#endif<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + p=
ort number + zero */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + /*<br>
&gt;&gt; &gt; +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_ea=
sy *data)<br>
&gt;&gt; &gt; + /* Beware this is a global and unique instance. This is use=
d to store the<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return address that we can jump back to from i=
nside a signal handler. This<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 is not thread-safe stuff. */<br>
&gt;&gt; &gt; +-sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; +-curl_simple_lock curl_jmpenv_lock;<br>
&gt;&gt; &gt; ++static sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; ++static curl_simple_lock curl_jmpenv_lock;<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + /* lookup address, returns entry if found and not stale */<=
br>
&gt;&gt; &gt; +diff --git a/lib/hostip.h b/lib/hostip.h<br>
&gt;&gt; &gt; +index baf1e58..d7f73d9 100644<br>
&gt;&gt; &gt; +--- a/lib/hostip.h<br>
&gt;&gt; &gt; ++++ b/lib/hostip.h<br>
&gt;&gt; &gt; +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data,=
 Curl_addrinfo *addr,<br>
&gt;&gt; &gt; + #define CURL_INADDR_NONE INADDR_NONE<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-#ifdef HAVE_SIGSETJMP<br>
&gt;&gt; &gt; +-/* Forward-declaration of variable defined in hostip.c. Bew=
are this<br>
&gt;&gt; &gt; +- * is a global and unique instance. This is used to store t=
he return<br>
&gt;&gt; &gt; +- * address that we can jump back to from inside a signal ha=
ndler.<br>
&gt;&gt; &gt; +- * This is not thread-safe stuff.<br>
&gt;&gt; &gt; +- */<br>
&gt;&gt; &gt; +-extern sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; +-#endif<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; + /*<br>
&gt;&gt; &gt; +=C2=A0 * Function provided by the resolver backend to set DN=
S servers to use.<br>
&gt;&gt; &gt; +=C2=A0 */<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-pr=
e1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..eaa6fdc327<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patc=
h<br>
&gt;&gt; &gt; @@ -0,0 +1,197 @@<br>
&gt;&gt; &gt; +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" =
target=3D"_blank">daniel@haxx.se</a>&gt;<br>
&gt;&gt; &gt; +Date: Tue, 16 May 2023 23:40:42 +0200<br>
&gt;&gt; &gt; +Subject: [PATCH] hostip: include easy_lock.h before using<br=
>
&gt;&gt; &gt; + GLOBAL_INIT_IS_THREADSAFE<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Since that header file is the only place that define can be =
defined.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Reported-by: Marc Deslauriers<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Follow-up to 13718030ad4b3209<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Closes #11121<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/cur=
l/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/curl/curl/commit/f446258f0269a62289cca=
0210157cb8558d0edc3</a>]<br>
&gt;&gt; &gt; +CVE: CVE-2023-28320<br>
&gt;&gt; &gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@=
mvista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + lib/easy_lock.h | 109 +++++++++++++++++++++++++++++++++++++=
+++++++++++<br>
&gt;&gt; &gt; + lib/hostip.c=C2=A0 =C2=A0 |=C2=A0 10 ++---<br>
&gt;&gt; &gt; + lib/hostip.h=C2=A0 =C2=A0 |=C2=A0 =C2=A09 ----<br>
&gt;&gt; &gt; + 3 files changed, 113 insertions(+), 15 deletions(-)<br>
&gt;&gt; &gt; + create mode 100644 lib/easy_lock.h<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/lib/easy_lock.h b/lib/easy_lock.h<br>
&gt;&gt; &gt; +new file mode 100644<br>
&gt;&gt; &gt; +index 0000000..6399a39<br>
&gt;&gt; &gt; +--- /dev/null<br>
&gt;&gt; &gt; ++++ b/lib/easy_lock.h<br>
&gt;&gt; &gt; +@@ -0,0 +1,109 @@<br>
&gt;&gt; &gt; ++#ifndef HEADER_CURL_EASY_LOCK_H<br>
&gt;&gt; &gt; ++#define HEADER_CURL_EASY_LOCK_H<br>
&gt;&gt; &gt; ++/**********************************************************=
*****************<br>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=
=A0_ ____=C2=A0 _<br>
&gt;&gt; &gt; ++ *=C2=A0 Project=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0___| | | |=C2=A0 _ \| |<br>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ __| | | | |_) | |<br>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (__| |_| |=C2=A0 _ &lt;| |___<b=
r>
&gt;&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\___|\___/|_| \_\_____|<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * Copyright (C) Daniel Stenberg, &lt;<a href=3D"mailto:dan=
iel@haxx.se" target=3D"_blank">daniel@haxx.se</a>&gt;, et al.<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * This software is licensed as described in the file COPYI=
NG, which<br>
&gt;&gt; &gt; ++ * you should have received as part of this distribution. T=
he terms<br>
&gt;&gt; &gt; ++ * are also available at <a href=3D"https://curl.se/docs/co=
pyright.html" rel=3D"noreferrer" target=3D"_blank">https://curl.se/docs/cop=
yright.html</a>.<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * You may opt to use, copy, modify, merge, publish, distri=
bute and/or sell<br>
&gt;&gt; &gt; ++ * copies of the Software, and permit persons to whom the S=
oftware is<br>
&gt;&gt; &gt; ++ * furnished to do so, under the terms of the COPYING file.=
<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * This software is distributed on an &quot;AS IS&quot; bas=
is, WITHOUT WARRANTY OF ANY<br>
&gt;&gt; &gt; ++ * KIND, either express or implied.<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ * SPDX-License-Identifier: curl<br>
&gt;&gt; &gt; ++ *<br>
&gt;&gt; &gt; ++ **********************************************************=
*****************/<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#include &quot;curl_setup.h&quot;<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define GLOBAL_INIT_IS_THREADSAFE<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#if defined(_WIN32_WINNT) &amp;&amp; _WIN32_WINNT &gt;=3D 0=
x600<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#ifdef __MINGW32__<br>
&gt;&gt; &gt; ++#ifndef __MINGW64_VERSION_MAJOR<br>
&gt;&gt; &gt; ++#if (__MINGW32_MAJOR_VERSION &lt; 5) || \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 (__MINGW32_MAJOR_VERSION =3D=3D 5 &amp;&amp; =
__MINGW32_MINOR_VERSION =3D=3D 0)<br>
&gt;&gt; &gt; ++/* mingw &gt;=3D 5.0.1 defines SRWLOCK, and slightly differ=
ent from MS define */<br>
&gt;&gt; &gt; ++typedef PVOID SRWLOCK, *PSRWLOCK;<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++#ifndef SRWLOCK_INIT<br>
&gt;&gt; &gt; ++#define SRWLOCK_INIT NULL<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++#endif /* __MINGW32__ */<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define curl_simple_lock SRWLOCK<br>
&gt;&gt; &gt; ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)=
<br>
&gt;&gt; &gt; ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(=
m)<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#elif defined(HAVE_ATOMIC) &amp;&amp; defined(HAVE_STDATOMI=
C_H)<br>
&gt;&gt; &gt; ++#include &lt;stdatomic.h&gt;<br>
&gt;&gt; &gt; ++#if defined(HAVE_SCHED_YIELD)<br>
&gt;&gt; &gt; ++#include &lt;sched.h&gt;<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#define curl_simple_lock atomic_int<br>
&gt;&gt; &gt; ++#define CURL_SIMPLE_LOCK_INIT 0<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++/* a clang-thing */<br>
&gt;&gt; &gt; ++#ifndef __has_builtin<br>
&gt;&gt; &gt; ++#define __has_builtin(x) 0<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#ifndef __INTEL_COMPILER<br>
&gt;&gt; &gt; ++/* The Intel compiler tries to look like GCC *and* clang *a=
nd* lies in its<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0__has_builtin() function, so override it. */<b=
r>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++/* if GCC on i386/x86_64 or if the built-in is present */<b=
r>
&gt;&gt; &gt; ++#if ( (defined(__GNUC__) &amp;&amp; !defined(__clang__)) &a=
mp;&amp;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 (defined(__i386__) || defined(__x86_64=
__))) ||=C2=A0 =C2=A0 \<br>
&gt;&gt; &gt; ++=C2=A0 __has_builtin(__builtin_ia32_pause)<br>
&gt;&gt; &gt; ++#define HAVE_BUILTIN_IA32_PAUSE<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++static inline void curl_simple_lock_lock(curl_simple_lock *=
lock)<br>
&gt;&gt; &gt; ++{<br>
&gt;&gt; &gt; ++=C2=A0 for(;;) {<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 if(!atomic_exchange_explicit(lock, true, memo=
ry_order_acquire))<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 /* Reduce cache coherency traffic */<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 while(atomic_load_explicit(lock, memory_order=
_relaxed)) {<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* Reduce load (not mandatory) */<br>
&gt;&gt; &gt; ++#ifdef HAVE_BUILTIN_IA32_PAUSE<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 __builtin_ia32_pause();<br>
&gt;&gt; &gt; ++#elif defined(__aarch64__)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 __asm__ volatile(&quot;yield&quot; :::=
 &quot;memory&quot;);<br>
&gt;&gt; &gt; ++#elif defined(HAVE_SCHED_YIELD)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 sched_yield();<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; ++=C2=A0 }<br>
&gt;&gt; &gt; ++}<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++static inline void curl_simple_lock_unlock(curl_simple_lock=
 *lock)<br>
&gt;&gt; &gt; ++{<br>
&gt;&gt; &gt; ++=C2=A0 atomic_store_explicit(lock, false, memory_order_rele=
ase);<br>
&gt;&gt; &gt; ++}<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#else<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#undef=C2=A0 GLOBAL_INIT_IS_THREADSAFE<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++#endif /* HEADER_CURL_EASY_LOCK_H */<br>
&gt;&gt; &gt; +diff --git a/lib/hostip.c b/lib/hostip.c<br>
&gt;&gt; &gt; +index 5231a74..d5bf881 100644<br>
&gt;&gt; &gt; +--- a/lib/hostip.c<br>
&gt;&gt; &gt; ++++ b/lib/hostip.c<br>
&gt;&gt; &gt; +@@ -68,6 +68,8 @@<br>
&gt;&gt; &gt; + #include &quot;curl_memory.h&quot;<br>
&gt;&gt; &gt; + #include &quot;memdebug.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; ++#include &quot;easy_lock.h&quot;<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; + #if defined(CURLRES_SYNCH) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0defined(HAVE_ALARM) &amp;&amp;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0defined(SIGALRM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt;&gt; &gt; +@@ -77,10 +79,6 @@<br>
&gt;&gt; &gt; + #define USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-#ifdef USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; +-#include &quot;easy_lock.h&quot;<br>
&gt;&gt; &gt; +-#endif<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + p=
ort number + zero */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + /*<br>
&gt;&gt; &gt; +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_ea=
sy *data)<br>
&gt;&gt; &gt; + /* Beware this is a global and unique instance. This is use=
d to store the<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return address that we can jump back to from i=
nside a signal handler. This<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 is not thread-safe stuff. */<br>
&gt;&gt; &gt; +-sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; +-curl_simple_lock curl_jmpenv_lock;<br>
&gt;&gt; &gt; ++static sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; ++static curl_simple_lock curl_jmpenv_lock;<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + /* lookup address, returns entry if found and not stale */<=
br>
&gt;&gt; &gt; +diff --git a/lib/hostip.h b/lib/hostip.h<br>
&gt;&gt; &gt; +index baf1e58..d7f73d9 100644<br>
&gt;&gt; &gt; +--- a/lib/hostip.h<br>
&gt;&gt; &gt; ++++ b/lib/hostip.h<br>
&gt;&gt; &gt; +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data,=
 Curl_addrinfo *addr,<br>
&gt;&gt; &gt; + #define CURL_INADDR_NONE INADDR_NONE<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-#ifdef HAVE_SIGSETJMP<br>
&gt;&gt; &gt; +-/* Forward-declaration of variable defined in hostip.c. Bew=
are this<br>
&gt;&gt; &gt; +- * is a global and unique instance. This is used to store t=
he return<br>
&gt;&gt; &gt; +- * address that we can jump back to from inside a signal ha=
ndler.<br>
&gt;&gt; &gt; +- * This is not thread-safe stuff.<br>
&gt;&gt; &gt; +- */<br>
&gt;&gt; &gt; +-extern sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; +-#endif<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; + /*<br>
&gt;&gt; &gt; +=C2=A0 * Function provided by the resolver backend to set DN=
S servers to use.<br>
&gt;&gt; &gt; +=C2=A0 */<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.pa=
tch b/meta/recipes-support/curl/curl/CVE-2023-28320.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..0c9b67440a<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,86 @@<br>
&gt;&gt; &gt; +From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From: Harry Sintonen &lt;<a href=3D"mailto:sintonen@iki.fi" =
target=3D"_blank">sintonen@iki.fi</a>&gt;<br>
&gt;&gt; &gt; +Date: Tue, 25 Apr 2023 09:22:26 +0200<br>
&gt;&gt; &gt; +Subject: [PATCH] hostip: add locks around use of global buff=
er for alarm()<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +When building with the sync name resolver and timeout abilit=
y we now<br>
&gt;&gt; &gt; +require thread-safety to be present to enable it.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Closes #11030<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/cur=
l/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/curl/curl/commit/13718030ad4b3209a7583=
b4f27f683cd3a6fa5f2</a>]<br>
&gt;&gt; &gt; +CVE: CVE-2023-28320<br>
&gt;&gt; &gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@=
mvista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + lib/hostip.c | 19 +++++++++++++++----<br>
&gt;&gt; &gt; + 1 file changed, 15 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/lib/hostip.c b/lib/hostip.c<br>
&gt;&gt; &gt; +index f5bb634..5231a74 100644<br>
&gt;&gt; &gt; +--- a/lib/hostip.c<br>
&gt;&gt; &gt; ++++ b/lib/hostip.c<br>
&gt;&gt; &gt; +@@ -68,12 +68,19 @@<br>
&gt;&gt; &gt; + #include &quot;curl_memory.h&quot;<br>
&gt;&gt; &gt; + #include &quot;memdebug.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-#if defined(CURLRES_SYNCH) &amp;&amp; \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 defined(HAVE_ALARM) &amp;&amp; defined(SIGALR=
M) &amp;&amp; defined(HAVE_SIGSETJMP)<br>
&gt;&gt; &gt; ++#if defined(CURLRES_SYNCH) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt; ++=C2=A0 defined(HAVE_ALARM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; &gt; ++=C2=A0 defined(SIGALRM) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt; &gt; ++=C2=A0 defined(HAVE_SIGSETJMP) &amp;&amp;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; &gt; ++=C2=A0 defined(GLOBAL_INIT_IS_THREADSAFE)<br>
&gt;&gt; &gt; + /* alarm-based timeouts can only be used with all the depen=
dencies satisfied */<br>
&gt;&gt; &gt; + #define USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; ++#ifdef USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; ++#include &quot;easy_lock.h&quot;<br>
&gt;&gt; &gt; ++#endif<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + p=
ort number + zero */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + /*<br>
&gt;&gt; &gt; +@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_=
easy *data)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Curl_share_unlock(data, CURL_LOCK_DATA_D=
NS);<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-#ifdef HAVE_SIGSETJMP<br>
&gt;&gt; &gt; ++#ifdef USE_ALARM_TIMEOUT<br>
&gt;&gt; &gt; + /* Beware this is a global and unique instance. This is use=
d to store the<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return address that we can jump back to from i=
nside a signal handler. This<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 is not thread-safe stuff. */<br>
&gt;&gt; &gt; + sigjmp_buf curl_jmpenv;<br>
&gt;&gt; &gt; ++curl_simple_lock curl_jmpenv_lock;<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + /* lookup address, returns entry if found and not stale */<=
br>
&gt;&gt; &gt; +@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connec=
tdata *conn,<br>
&gt;&gt; &gt; + static<br>
&gt;&gt; &gt; + RETSIGTYPE alarmfunc(int sig)<br>
&gt;&gt; &gt; + {<br>
&gt;&gt; &gt; +-=C2=A0 /* this is for &quot;-ansi -Wall -pedantic&quot; to =
stop complaining!=C2=A0 =C2=A0(rabe) */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0(void)sig;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0siglongjmp(curl_jmpenv, 1);<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt; +@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struc=
t connectdata *conn,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 This should be the last thing we do bef=
ore calling Curl_resolv(),<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 as otherwise we&#39;d have to worry abo=
ut variables that get modified<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 before we invoke Curl_resolv() (and thu=
s use &quot;volatile&quot;). */<br>
&gt;&gt; &gt; ++=C2=A0 curl_simple_lock_lock(&amp;curl_jmpenv_lock);<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0if(sigsetjmp(curl_jmpenv, 1)) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* this is coming from a siglongjmp() af=
ter an alarm signal */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0failf(data, &quot;name lookup timed out&=
quot;);<br>
&gt;&gt; &gt; +@@ -763,6 +772,8 @@ clean_up:<br>
&gt;&gt; &gt; + #endif<br>
&gt;&gt; &gt; + #endif /* HAVE_SIGACTION */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; ++=C2=A0 curl_simple_lock_unlock(&amp;curl_jmpenv_lock);<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0/* switch back the alarm() to either zero or to=
 what it was before minus<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 the time we spent until now! */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0if(prev_alarm) {<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl=
_7.69.1.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a> b/meta/=
recipes-support/curl/<a href=3D"http://curl_7.69.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">curl_7.69.1.bb</a><br>
&gt;&gt; &gt; index 13ec117099..ce81df0f05 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1=
.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.69.1=
.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.69.1.bb</a><br>
&gt;&gt; &gt; @@ -50,6 +50,8 @@ SRC_URI =3D &quot;<a href=3D"https://curl.h=
axx.se/download/curl-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank=
">https://curl.haxx.se/download/curl-${PV}.tar.bz2</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
3-27535-pre1.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
3-27535.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
3-27536.patch \<br>
&gt;&gt;<br>
&gt;&gt; Shouldn&#39;t you be adding CVE-2023-28320-pre1.patch here?<br>
&gt;&gt;<br>
&gt;&gt; Steve<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-283=
20.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-283=
20-fol1.patch \<br>
&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI[md5sum] =3D &quot;ec5fc263f898a3dfef08e805f1ecc=
a42&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.25.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#184058): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/184058" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/184058</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/100053064/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/mt/100053064/3620601</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoma=
n.com" target=3D"_blank">steve@sakoman.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000d804e70600477921--

