Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E8AC001B0
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 13:56:54 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.9119.1689256609181005905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 06:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=VNskNZks;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-262ef07be72so326852a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689256608; x=1691848608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wb22qf0c11C3Lh1844ydNl+ZhCRhEUJEfyCVecnuOFI=;
        b=VNskNZks/tD731phIu1me9GnvQeTFhgfjZtBKmt0CBXyAo/l0b++jSw/G2fXAzcyyH
         unsM24l8TENgR4Ijz/dDgotLUtUwCcyb3BSXmuj3aS9duthov53vgtK1fvrskrO/WCgQ
         Hs8LN0bncPJRhUko/z6l0mSnCrGlDJyr+LDOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689256608; x=1691848608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wb22qf0c11C3Lh1844ydNl+ZhCRhEUJEfyCVecnuOFI=;
        b=RERwX8A7HfLn6uVEsWQf+9fh3540COF9cMVwUua5JlLN7BjCX8cpKKH+DrqJwr2a64
         SISzAkJyvyGKIhMEbrdMPCNFD/oGuHNF+3HjgYcozlyI6o5XSSVHn6xk0lwH61pSapX5
         V6wd+uSQ/R87QXEjVLHXCFeLw0X+iUF0y2E3XXCw986rC6qDDp8zPn1q9VkPnjINRbIv
         1Q/oW38hUP0bE8uGa1AqvSgIQ1gNi9Tu/Ph3kG8NzrERnlA24UIDQSFAOHz6oYojuCS5
         w4apmgf86Gt7hY73UB4t/FJV9h+wqVqzu/GgT4DStRJb3gJa1hsruCvSVKYKyEZY227E
         HFOQ==
X-Gm-Message-State: ABy/qLYzqlOEawS0nRf9JWrtMlN+TBbSSG+8l587I75t1OWvOJ6vBAFv
	AsU9vG6NpWbSHdR4UzST6jmQsN1x6tfZrhwTCG0=
X-Google-Smtp-Source: APBJJlEZJHFQEsNv2a4IMIBme767SlbbGj9mVYLhES8asznsfaHRhTnx/ok4Q7S1tfcbgC4naE3dXw==
X-Received: by 2002:a17:90b:187:b0:263:f73a:b412 with SMTP id t7-20020a17090b018700b00263f73ab412mr703135pjs.49.1689256608007;
        Thu, 13 Jul 2023 06:56:48 -0700 (PDT)
Received: from localhost.localdomain ([116.74.188.14])
        by smtp.googlemail.com with ESMTPSA id e8-20020a17090a684800b00264044cca0fsm4792521pjm.1.2023.07.13.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 06:56:47 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH v3] curl: Added CVE-2023-28320 Follow-up patch
Date: Thu, 13 Jul 2023 19:26:38 +0530
Message-Id: <20230713135638.1111071-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 13:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184244

Introduced by: https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f91908261268640e54f (curl-7_9_8)
Fixed by: https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2 (curl-8_1_0)
Follow-up: https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3 (curl-8_1_0)

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
index 96280b31b2..550192d329 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
+           file://CVE-2023-28320-fol1.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


