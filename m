Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D1EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 15:43:03 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.10762.1689176580006734532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 08:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=F45odDdU;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso895271166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689176578; x=1691768578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1w2SFUVPgiETCKMQhZ2C3cDZcCxeBtbY61ThVlmu3A=;
        b=F45odDdUWlZhMpnV1qBPpqH9yjAQ45+UsLNRAYoxXxelwhD1zX26OMLwMsN39E6doI
         cIqzl/1Emrbv9d5Gyi1+8tMU9gqDOFYorXskoOK2GQlHmLRRc5WzxcmTMzXIdElUkeKY
         A4623cjvUbwafHWsigW3NIO7itP/esYKvFpmkhL3oxHerHw3JWlfGWM721cVpe4ItsEQ
         sjwADMAihIXnADhvdGFBB1OupVvOcdrMhK0nJQt7vkVsc5jHcbOQbYe5HgPDpdq8LqHq
         hVeoDXZ+8UUIqbYVWKrs+idQybWy/axhUhZmLDlbaluS7ULdfj4SY5fcz1nTF/ig2n3n
         hbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689176578; x=1691768578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1w2SFUVPgiETCKMQhZ2C3cDZcCxeBtbY61ThVlmu3A=;
        b=YiJYxoKRm+zuz9I2ECHasbIi66L76aIlksCqBTFjRL4nWAQLHVq5g0o7YavdQU6qs8
         Lhx1B8g4KtgvDVkLbrYDoFBxjVYywC3j2qhOC8aj675cTQLZ1F+5f6M123Pzelnpk60Q
         BhjME44chqHWBXf1Fa3WnLbAOKTHAwOTCGY0ft/Fj813ZZKnxTsJBEX5kzQBG8M6HsYP
         /2tut4PLLjN733AjsPjVvQQ2hQk587EGCJ+zFILKnvPTY2HSEl2W60qIv9SUaGRiHySH
         /Mq/W8Cp5sYq++zMRhsE1fn/JAdauj2RLcmkzaNsqatfBZPq7a/YG+kJej96aN4PT6fX
         FouA==
X-Gm-Message-State: ABy/qLZpEjm49oKVbQRpk+gkXB3v/6i8sR62/Ai9Vqsbvde7HBtj/ad8
	CYSlt1NwYzxAfnYeQTSEzl8L90r7/GvJnZT0m1dvYg==
X-Google-Smtp-Source: APBJJlGpCflILtZee6XtfPjjpwMY/pjf+/pZ6s9+ETB07GnxbxilYmEdlJ05QVbtLcOMTaZji4k+twTEZ4uYGGGed70=
X-Received: by 2002:a17:907:3a86:b0:994:34a6:50cf with SMTP id
 fh6-20020a1709073a8600b0099434a650cfmr379556ejc.49.1689176578103; Wed, 12 Jul
 2023 08:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230712101649.978494-1-vkumbhar@mvista.com>
In-Reply-To: <20230712101649.978494-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 12 Jul 2023 05:42:47 -1000
Message-ID: <CAOSpxdZCQOAwX6-Bb5B9KrZQdvjWjaxkE6vtamTPKRFT0=wyVw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] curl: fix CVE-2023-28320 siglongjmp
 race condition may lead to crash
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 15:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184202

Hi Vivek,

Sorry I didn't notice this earlier, but we already have a fix for this
CVE in kirkstone:

https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3Dc=
761d822be5ffc4a88600fbd7282c469b1e9902a

However it seems from your work that a follow on patch is also
necessary to fix this issue completely.

Could you submit a v3 that takes into account the above commit?

Thanks,

Steve

On Wed, Jul 12, 2023 at 12:17=E2=80=AFAM vkumbhar <vkumbhar@mvista.com> wro=
te:
>
> Introduced by: https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f=
91908261268640e54f (curl-7_9_8)
> Fixed by: https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f=
683cd3a6fa5f2 (curl-8_1_0)
> Follow-up: https://github.com/curl/curl/commit/f446258f0269a62289cca02101=
57cb8558d0edc3 (curl-8_1_0)
> https://curl.se/docs/CVE-2023-28320.html
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../curl/curl/CVE-2023-28320-fol1.patch       | 197 ++++++++++++++++++
>  .../curl/curl/CVE-2023-28320.patch            |  86 ++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
>  3 files changed, 285 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.pa=
tch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch b/m=
eta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> new file mode 100644
> index 0000000000..eaa6fdc327
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
> @@ -0,0 +1,197 @@
> +From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 16 May 2023 23:40:42 +0200
> +Subject: [PATCH] hostip: include easy_lock.h before using
> + GLOBAL_INIT_IS_THREADSAFE
> +
> +Since that header file is the only place that define can be defined.
> +
> +Reported-by: Marc Deslauriers
> +
> +Follow-up to 13718030ad4b3209
> +
> +Closes #11121
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/f446258f0=
269a62289cca0210157cb8558d0edc3]
> +CVE: CVE-2023-28320
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + lib/easy_lock.h | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
> + lib/hostip.c    |  10 ++---
> + lib/hostip.h    |   9 ----
> + 3 files changed, 113 insertions(+), 15 deletions(-)
> + create mode 100644 lib/easy_lock.h
> +
> +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> +new file mode 100644
> +index 0000000..6399a39
> +--- /dev/null
> ++++ b/lib/easy_lock.h
> +@@ -0,0 +1,109 @@
> ++#ifndef HEADER_CURL_EASY_LOCK_H
> ++#define HEADER_CURL_EASY_LOCK_H
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ **********************************************************************=
*****/
> ++
> ++#include "curl_setup.h"
> ++
> ++#define GLOBAL_INIT_IS_THREADSAFE
> ++
> ++#if defined(_WIN32_WINNT) && _WIN32_WINNT >=3D 0x600
> ++
> ++#ifdef __MINGW32__
> ++#ifndef __MINGW64_VERSION_MAJOR
> ++#if (__MINGW32_MAJOR_VERSION < 5) || \
> ++    (__MINGW32_MAJOR_VERSION =3D=3D 5 && __MINGW32_MINOR_VERSION =3D=3D=
 0)
> ++/* mingw >=3D 5.0.1 defines SRWLOCK, and slightly different from MS def=
ine */
> ++typedef PVOID SRWLOCK, *PSRWLOCK;
> ++#endif
> ++#endif
> ++#ifndef SRWLOCK_INIT
> ++#define SRWLOCK_INIT NULL
> ++#endif
> ++#endif /* __MINGW32__ */
> ++
> ++#define curl_simple_lock SRWLOCK
> ++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
> ++
> ++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
> ++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
> ++
> ++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
> ++#include <stdatomic.h>
> ++#if defined(HAVE_SCHED_YIELD)
> ++#include <sched.h>
> ++#endif
> ++
> ++#define curl_simple_lock atomic_int
> ++#define CURL_SIMPLE_LOCK_INIT 0
> ++
> ++/* a clang-thing */
> ++#ifndef __has_builtin
> ++#define __has_builtin(x) 0
> ++#endif
> ++
> ++#ifndef __INTEL_COMPILER
> ++/* The Intel compiler tries to look like GCC *and* clang *and* lies in =
its
> ++   __has_builtin() function, so override it. */
> ++
> ++/* if GCC on i386/x86_64 or if the built-in is present */
> ++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
> ++      (defined(__i386__) || defined(__x86_64__))) ||    \
> ++  __has_builtin(__builtin_ia32_pause)
> ++#define HAVE_BUILTIN_IA32_PAUSE
> ++#endif
> ++
> ++#endif
> ++
> ++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
> ++{
> ++  for(;;) {
> ++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire))
> ++      break;
> ++    /* Reduce cache coherency traffic */
> ++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
> ++      /* Reduce load (not mandatory) */
> ++#ifdef HAVE_BUILTIN_IA32_PAUSE
> ++      __builtin_ia32_pause();
> ++#elif defined(__aarch64__)
> ++      __asm__ volatile("yield" ::: "memory");
> ++#elif defined(HAVE_SCHED_YIELD)
> ++      sched_yield();
> ++#endif
> ++    }
> ++  }
> ++}
> ++
> ++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
> ++{
> ++  atomic_store_explicit(lock, false, memory_order_release);
> ++}
> ++
> ++#else
> ++
> ++#undef  GLOBAL_INIT_IS_THREADSAFE
> ++
> ++#endif
> ++
> ++#endif /* HEADER_CURL_EASY_LOCK_H */
> +diff --git a/lib/hostip.c b/lib/hostip.c
> +index 5231a74..d5bf881 100644
> +--- a/lib/hostip.c
> ++++ b/lib/hostip.c
> +@@ -68,6 +68,8 @@
> + #include "curl_memory.h"
> + #include "memdebug.h"
> +
> ++#include "easy_lock.h"
> ++
> + #if defined(CURLRES_SYNCH) &&                   \
> +   defined(HAVE_ALARM) &&                        \
> +   defined(SIGALRM) &&                           \
> +@@ -77,10 +79,6 @@
> + #define USE_ALARM_TIMEOUT
> + #endif
> +
> +-#ifdef USE_ALARM_TIMEOUT
> +-#include "easy_lock.h"
> +-#endif
> +-
> + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number +=
 zero */
> +
> + /*
> +@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
> + /* Beware this is a global and unique instance. This is used to store t=
he
> +    return address that we can jump back to from inside a signal handler=
. This
> +    is not thread-safe stuff. */
> +-sigjmp_buf curl_jmpenv;
> +-curl_simple_lock curl_jmpenv_lock;
> ++static sigjmp_buf curl_jmpenv;
> ++static curl_simple_lock curl_jmpenv_lock;
> + #endif
> +
> + /* lookup address, returns entry if found and not stale */
> +diff --git a/lib/hostip.h b/lib/hostip.h
> +index baf1e58..d7f73d9 100644
> +--- a/lib/hostip.h
> ++++ b/lib/hostip.h
> +@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_addrin=
fo *addr,
> + #define CURL_INADDR_NONE INADDR_NONE
> + #endif
> +
> +-#ifdef HAVE_SIGSETJMP
> +-/* Forward-declaration of variable defined in hostip.c. Beware this
> +- * is a global and unique instance. This is used to store the return
> +- * address that we can jump back to from inside a signal handler.
> +- * This is not thread-safe stuff.
> +- */
> +-extern sigjmp_buf curl_jmpenv;
> +-#endif
> +-
> + /*
> +  * Function provided by the resolver backend to set DNS servers to use.
> +  */
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-28320.patch
> new file mode 100644
> index 0000000000..0c9b67440a
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
> @@ -0,0 +1,86 @@
> +From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00 2001
> +From: Harry Sintonen <sintonen@iki.fi>
> +Date: Tue, 25 Apr 2023 09:22:26 +0200
> +Subject: [PATCH] hostip: add locks around use of global buffer for alarm=
()
> +
> +When building with the sync name resolver and timeout ability we now
> +require thread-safety to be present to enable it.
> +
> +Closes #11030
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/13718030a=
d4b3209a7583b4f27f683cd3a6fa5f2]
> +CVE: CVE-2023-28320
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + lib/hostip.c | 19 +++++++++++++++----
> + 1 file changed, 15 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/hostip.c b/lib/hostip.c
> +index f5bb634..5231a74 100644
> +--- a/lib/hostip.c
> ++++ b/lib/hostip.c
> +@@ -68,12 +68,19 @@
> + #include "curl_memory.h"
> + #include "memdebug.h"
> +
> +-#if defined(CURLRES_SYNCH) && \
> +-    defined(HAVE_ALARM) && defined(SIGALRM) && defined(HAVE_SIGSETJMP)
> ++#if defined(CURLRES_SYNCH) &&                   \
> ++  defined(HAVE_ALARM) &&                        \
> ++  defined(SIGALRM) &&                           \
> ++  defined(HAVE_SIGSETJMP) &&                    \
> ++  defined(GLOBAL_INIT_IS_THREADSAFE)
> + /* alarm-based timeouts can only be used with all the dependencies sati=
sfied */
> + #define USE_ALARM_TIMEOUT
> + #endif
> +
> ++#ifdef USE_ALARM_TIMEOUT
> ++#include "easy_lock.h"
> ++#endif
> ++
> + #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number +=
 zero */
> +
> + /*
> +@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_easy *data)
> +     Curl_share_unlock(data, CURL_LOCK_DATA_DNS);
> + }
> +
> +-#ifdef HAVE_SIGSETJMP
> ++#ifdef USE_ALARM_TIMEOUT
> + /* Beware this is a global and unique instance. This is used to store t=
he
> +    return address that we can jump back to from inside a signal handler=
. This
> +    is not thread-safe stuff. */
> + sigjmp_buf curl_jmpenv;
> ++curl_simple_lock curl_jmpenv_lock;
> + #endif
> +
> + /* lookup address, returns entry if found and not stale */
> +@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connectdata *conn,
> + static
> + RETSIGTYPE alarmfunc(int sig)
> + {
> +-  /* this is for "-ansi -Wall -pedantic" to stop complaining!   (rabe) =
*/
> +   (void)sig;
> +   siglongjmp(curl_jmpenv, 1);
> + }
> +@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struct connectdat=
a *conn,
> +      This should be the last thing we do before calling Curl_resolv(),
> +      as otherwise we'd have to worry about variables that get modified
> +      before we invoke Curl_resolv() (and thus use "volatile"). */
> ++  curl_simple_lock_lock(&curl_jmpenv_lock);
> ++
> +   if(sigsetjmp(curl_jmpenv, 1)) {
> +     /* this is coming from a siglongjmp() after an alarm signal */
> +     failf(data, "name lookup timed out");
> +@@ -763,6 +772,8 @@ clean_up:
> + #endif
> + #endif /* HAVE_SIGACTION */
> +
> ++  curl_simple_lock_unlock(&curl_jmpenv_lock);
> ++
> +   /* switch back the alarm() to either zero or to what it was before mi=
nus
> +      the time we spent until now! */
> +   if(prev_alarm) {
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 13ec117099..ce81df0f05 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -50,6 +50,8 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2023-27535-pre1.patch \
>             file://CVE-2023-27535.patch \
>             file://CVE-2023-27536.patch \
> +           file://CVE-2023-28320.patch \
> +           file://CVE-2023-28320-fol1.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184171): https://lists.openembedded.org/g/openembedde=
d-core/message/184171
> Mute This Topic: https://lists.openembedded.org/mt/100096862/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

