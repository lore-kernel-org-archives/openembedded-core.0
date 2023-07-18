Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB43C001DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.9095.1689690386107417017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pvBZ7pwQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6687096c6ddso3669905b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690385; x=1692282385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R+rbH+UNrllwl1lzqKg/oSl+rjubnNGA4+rQeZJbNs=;
        b=pvBZ7pwQVp9IZpnjQyl8AMNb9LbAzriVra5MxYPL9E8WBM0T5dgNrCOOtY9Dnc7iHe
         HDTZ480Lbs66TRpsA1YAXezU3pua6ZMEoFERjrgWmLt5OsLKfpEgNPoideRDs9U2iyb+
         Z3Q80k4DhkAOZuYSPe81qDOvpoYc+nA7UmLp0DnvHKEsGKgZqwdVWop55C3TC/MwqQTX
         2sw9F7U+PNBADO4nTuHknVcOUxyMSABTGGJWsUh4MbWhvimhHNK7Dow/AYyAqMvxP5kz
         Q7knOMY8HkLANVxxacGwttJdmsVw1N1YJ2eCGRtg1FF3yayg15WfZu6VVyU4ic5T7bio
         X+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690385; x=1692282385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R+rbH+UNrllwl1lzqKg/oSl+rjubnNGA4+rQeZJbNs=;
        b=He7tfNmEsKhNpbi9DjSz50nx0svGPcF/hAu8cEr4K7xBuzIaT4a4jqQfDbmoW8wrp6
         hZDhMg+eR5oqbLJqowzyMzbgCTKuXiOh7wzkNhxYP7LTUiJuNL4xVWbYARi4q41hTzbz
         7qhrdthbCl5kuobqW2OddJ4fKx0F6CoWWqCyEYpIurY8JssgPKf8wI6sLDPfqC4Tg2Qy
         qITmtfTlp0A/vprvAOdxfx4gnPFthRDvn54K8O20lgBp9Gry/NjkEMKvpoquZs5ycYrb
         9GjnFXN41svh6sYyqgEiiKHVIvP6jEBs4bGfgn8himSdkKDqczk2WrrZxIUUlZtPRn4q
         qoQg==
X-Gm-Message-State: ABy/qLZq4HAmM6hz240kHC951SkWliQYcb/qjVW5tYSHq/2XLF+iiDgL
	EPo5olX1l9hsL1Gp7U9tB9Ahiy/MP2jzx7uxvX4=
X-Google-Smtp-Source: APBJJlGDr5Qfs8LFIK2RFSLtD6HWQu4Zfdd26+IIjhQEzkGWBeDCr/sydzYDiXVNiNrWZTr0BDY41w==
X-Received: by 2002:a05:6a21:6da2:b0:134:1d88:1d88 with SMTP id wl34-20020a056a216da200b001341d881d88mr10073408pzb.58.1689690385076;
        Tue, 18 Jul 2023 07:26:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/27] curl: Added CVE-2023-28320 Follow-up patch
Date: Tue, 18 Jul 2023 04:25:39 -1000
Message-Id: <f19c20c429395c1b4c62a6e0388ef51b830871c5.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184509

From: Vivek Kumbhar <vkumbhar@mvista.com>

Introduced by: https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f91908261268640e54f (curl-7_9_8)
Fixed by: https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2 (curl-8_1_0)
Follow-up: https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3 (curl-8_1_0)

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-28320-fol1.patch       | 197 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
new file mode 100644
index 0000000000..2ba74aaaa9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
@@ -0,0 +1,197 @@
+From f446258f0269a62289cca0210157cb8558d0edc3 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 16 May 2023 23:40:42 +0200
+Subject: [PATCH] hostip: include easy_lock.h before using
+ GLOBAL_INIT_IS_THREADSAFE
+
+Since that header file is the only place that define can be defined.
+
+Reported-by: Marc Deslauriers
+
+Follow-up to 13718030ad4b3209
+
+Closes #11121
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3]
+CVE: CVE-2023-28320
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/easy_lock.h | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
+ lib/hostip.c    |  10 ++---
+ lib/hostip.h    |   9 ----
+ 3 files changed, 113 insertions(+), 15 deletions(-)
+ create mode 100644 lib/easy_lock.h
+
+diff --git a/lib/easy_lock.h b/lib/easy_lock.h
+new file mode 100644
+index 0000000..6399a39
+--- /dev/null
++++ b/lib/easy_lock.h
+@@ -0,0 +1,109 @@
++#ifndef HEADER_CURL_EASY_LOCK_H
++#define HEADER_CURL_EASY_LOCK_H
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++
++#include "curl_setup.h"
++
++#define GLOBAL_INIT_IS_THREADSAFE
++
++#if defined(_WIN32_WINNT) && _WIN32_WINNT >= 0x600
++
++#ifdef __MINGW32__
++#ifndef __MINGW64_VERSION_MAJOR
++#if (__MINGW32_MAJOR_VERSION < 5) || \
++    (__MINGW32_MAJOR_VERSION == 5 && __MINGW32_MINOR_VERSION == 0)
++/* mingw >= 5.0.1 defines SRWLOCK, and slightly different from MS define */
++typedef PVOID SRWLOCK, *PSRWLOCK;
++#endif
++#endif
++#ifndef SRWLOCK_INIT
++#define SRWLOCK_INIT NULL
++#endif
++#endif /* __MINGW32__ */
++
++#define curl_simple_lock SRWLOCK
++#define CURL_SIMPLE_LOCK_INIT SRWLOCK_INIT
++
++#define curl_simple_lock_lock(m) AcquireSRWLockExclusive(m)
++#define curl_simple_lock_unlock(m) ReleaseSRWLockExclusive(m)
++
++#elif defined(HAVE_ATOMIC) && defined(HAVE_STDATOMIC_H)
++#include <stdatomic.h>
++#if defined(HAVE_SCHED_YIELD)
++#include <sched.h>
++#endif
++
++#define curl_simple_lock atomic_int
++#define CURL_SIMPLE_LOCK_INIT 0
++
++/* a clang-thing */
++#ifndef __has_builtin
++#define __has_builtin(x) 0
++#endif
++
++#ifndef __INTEL_COMPILER
++/* The Intel compiler tries to look like GCC *and* clang *and* lies in its
++   __has_builtin() function, so override it. */
++
++/* if GCC on i386/x86_64 or if the built-in is present */
++#if ( (defined(__GNUC__) && !defined(__clang__)) &&     \
++      (defined(__i386__) || defined(__x86_64__))) ||    \
++  __has_builtin(__builtin_ia32_pause)
++#define HAVE_BUILTIN_IA32_PAUSE
++#endif
++
++#endif
++
++static inline void curl_simple_lock_lock(curl_simple_lock *lock)
++{
++  for(;;) {
++    if(!atomic_exchange_explicit(lock, true, memory_order_acquire))
++      break;
++    /* Reduce cache coherency traffic */
++    while(atomic_load_explicit(lock, memory_order_relaxed)) {
++      /* Reduce load (not mandatory) */
++#ifdef HAVE_BUILTIN_IA32_PAUSE
++      __builtin_ia32_pause();
++#elif defined(__aarch64__)
++      __asm__ volatile("yield" ::: "memory");
++#elif defined(HAVE_SCHED_YIELD)
++      sched_yield();
++#endif
++    }
++  }
++}
++
++static inline void curl_simple_lock_unlock(curl_simple_lock *lock)
++{
++  atomic_store_explicit(lock, false, memory_order_release);
++}
++
++#else
++
++#undef  GLOBAL_INIT_IS_THREADSAFE
++
++#endif
++
++#endif /* HEADER_CURL_EASY_LOCK_H */
+diff --git a/lib/hostip.c b/lib/hostip.c
+index e15c17a..c2e0962 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -72,6 +72,8 @@
+ #include <SystemConfiguration/SCDynamicStoreCopySpecific.h>
+ #endif
+
++#include "easy_lock.h"
++
+ #if defined(CURLRES_SYNCH) &&                   \
+   defined(HAVE_ALARM) &&                        \
+   defined(SIGALRM) &&                           \
+@@ -81,10 +83,6 @@
+ #define USE_ALARM_TIMEOUT
+ #endif
+
+-#ifdef USE_ALARM_TIMEOUT
+-#include "easy_lock.h"
+-#endif
+-
+ #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number + zero */
+
+ /*
+@@ -260,8 +258,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
+ /* Beware this is a global and unique instance. This is used to store the
+    return address that we can jump back to from inside a signal handler. This
+    is not thread-safe stuff. */
+-sigjmp_buf curl_jmpenv;
+-curl_simple_lock curl_jmpenv_lock;
++static sigjmp_buf curl_jmpenv;
++static curl_simple_lock curl_jmpenv_lock;
+ #endif
+
+ /* lookup address, returns entry if found and not stale */
+diff --git a/lib/hostip.h b/lib/hostip.h
+index 1db5981..a46bdc6 100644
+--- a/lib/hostip.h
++++ b/lib/hostip.h
+@@ -189,15 +189,6 @@ Curl_cache_addr(struct Curl_easy *data, struct Curl_addrinfo *addr,
+ #define CURL_INADDR_NONE INADDR_NONE
+ #endif
+
+-#ifdef HAVE_SIGSETJMP
+-/* Forward-declaration of variable defined in hostip.c. Beware this
+- * is a global and unique instance. This is used to store the return
+- * address that we can jump back to from inside a signal handler.
+- * This is not thread-safe stuff.
+- */
+-extern sigjmp_buf curl_jmpenv;
+-#endif
+-
+ /*
+  * Function provided by the resolver backend to set DNS servers to use.
+  */
+--
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 96280b31b2..7f18ef7ee6 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-27536.patch \
            file://CVE-2023-28319.patch \
            file://CVE-2023-28320.patch \
+           file://CVE-2023-28320-fol1.patch \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
-- 
2.34.1


