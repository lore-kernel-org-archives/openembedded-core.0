Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C172EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 05:28:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.33362.1688966929480345911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 22:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=cYTPYPoa;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666ed230c81so3570620b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 22:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688966928; x=1691558928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QTNTcDaHZbWzPdCqxJcjBzqGyrMefkpmNYvSpIoJ0M=;
        b=cYTPYPoaOETBy0rq1HNg7CPvd9S4n6sQWVZn6NeHOazdsQKQvzT2//NsUrk+wbJhtt
         Cx+L4dkDyF8nqq4OjegDzNM9XD3kPhHpDtH0Gz9OsUrZ3DhQYSR3hcTYArU8Sr02Yi0I
         pu+PnPOBALeUzsIpn+BDiCzEUQAbc812YA/RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688966928; x=1691558928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QTNTcDaHZbWzPdCqxJcjBzqGyrMefkpmNYvSpIoJ0M=;
        b=jkpBJtjKMYF+xaYt3sh4qByJTCZLnui2nj5XByZNx9hzp6U0R64vE+d7VmAYwC4XXm
         fgqHCl0se1TnBZEbtvlZJ6cuQy1AQnEnaGwLpx5EgMykI4/GdfBmgS9JBLa2punrxDyY
         Yx1F+L2+1cLS1fscMg4j22/NeDA+mkTu4Wh2bZ4zlIwIzlJUkPMf4cW+Jcy6jtgz9w+v
         VTFjcF+T+yNtykig2xWPkyPbYa3WERNkeTMWHowm+dyFsQMhVOS+otwt8XPfhb0ojq4q
         QY18o8KWkJocr1MxSfV4e/i5QeqvaxbJGO36RN1MlKwSXyHU8yr11NwsrHXFwSkm0WA5
         gvgA==
X-Gm-Message-State: ABy/qLbH4l0wRLCPoxEusM9eFdQAuTX/hO7Mf1GWGQ/GO9/6Y2hMQ2tq
	Gmw4EdYJvhm9HYVmwSG+L8VeGC0XD4fNM9niJF4=
X-Google-Smtp-Source: APBJJlEl15myWMNwWIE4v8p+AbSxmwTwUi45RoMzAYzCgIBwtD+j64aL9nah+A3Iei7lmI6fYypFRw==
X-Received: by 2002:a05:6a20:5483:b0:127:3c6e:fc83 with SMTP id i3-20020a056a20548300b001273c6efc83mr15200941pzk.42.1688966927895;
        Sun, 09 Jul 2023 22:28:47 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.239.0])
        by smtp.googlemail.com with ESMTPSA id v3-20020a170902b7c300b001b80d399730sm7213524plz.242.2023.07.09.22.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 22:28:47 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] curl: fix CVE-2023-28320 siglongjmp race condition may lead to crash
Date: Mon, 10 Jul 2023 10:58:32 +0530
Message-Id: <20230710052832.185187-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 05:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184058

Introduced by: https://github.com/curl/curl/commit/3c49b405de4fbf1fd7127f91908261268640e54f (curl-7_9_8)
Fixed by: https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2 (curl-8_1_0)
Follow-up: https://github.com/curl/curl/commit/f446258f0269a62289cca0210157cb8558d0edc3 (curl-8_1_0)
https://curl.se/docs/CVE-2023-28320.html

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../curl/curl/CVE-2023-28320-fol1.patch       | 197 ++++++++++++++++++
 .../curl/curl/CVE-2023-28320-pre1.patch       | 197 ++++++++++++++++++
 .../curl/curl/CVE-2023-28320.patch            |  86 ++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 4 files changed, 482 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
new file mode 100644
index 0000000000..eaa6fdc327
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
+index 5231a74..d5bf881 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -68,6 +68,8 @@
+ #include "curl_memory.h"
+ #include "memdebug.h"
+ 
++#include "easy_lock.h"
++
+ #if defined(CURLRES_SYNCH) &&                   \
+   defined(HAVE_ALARM) &&                        \
+   defined(SIGALRM) &&                           \
+@@ -77,10 +79,6 @@
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
+@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
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
+index baf1e58..d7f73d9 100644
+--- a/lib/hostip.h
++++ b/lib/hostip.h
+@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_addrinfo *addr,
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
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
new file mode 100644
index 0000000000..eaa6fdc327
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320-pre1.patch
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
+index 5231a74..d5bf881 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -68,6 +68,8 @@
+ #include "curl_memory.h"
+ #include "memdebug.h"
+ 
++#include "easy_lock.h"
++
+ #if defined(CURLRES_SYNCH) &&                   \
+   defined(HAVE_ALARM) &&                        \
+   defined(SIGALRM) &&                           \
+@@ -77,10 +79,6 @@
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
+@@ -259,8 +257,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
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
+index baf1e58..d7f73d9 100644
+--- a/lib/hostip.h
++++ b/lib/hostip.h
+@@ -196,15 +196,6 @@ Curl_cache_addr(struct Curl_easy *data, Curl_addrinfo *addr,
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
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
new file mode 100644
index 0000000000..0c9b67440a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
@@ -0,0 +1,86 @@
+From 13718030ad4b3209a7583b4f27f683cd3a6fa5f2 Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Tue, 25 Apr 2023 09:22:26 +0200
+Subject: [PATCH] hostip: add locks around use of global buffer for alarm()
+
+When building with the sync name resolver and timeout ability we now
+require thread-safety to be present to enable it.
+
+Closes #11030
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/13718030ad4b3209a7583b4f27f683cd3a6fa5f2]
+CVE: CVE-2023-28320
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/hostip.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/lib/hostip.c b/lib/hostip.c
+index f5bb634..5231a74 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -68,12 +68,19 @@
+ #include "curl_memory.h"
+ #include "memdebug.h"
+ 
+-#if defined(CURLRES_SYNCH) && \
+-    defined(HAVE_ALARM) && defined(SIGALRM) && defined(HAVE_SIGSETJMP)
++#if defined(CURLRES_SYNCH) &&                   \
++  defined(HAVE_ALARM) &&                        \
++  defined(SIGALRM) &&                           \
++  defined(HAVE_SIGSETJMP) &&                    \
++  defined(GLOBAL_INIT_IS_THREADSAFE)
+ /* alarm-based timeouts can only be used with all the dependencies satisfied */
+ #define USE_ALARM_TIMEOUT
+ #endif
+ 
++#ifdef USE_ALARM_TIMEOUT
++#include "easy_lock.h"
++#endif
++
+ #define MAX_HOSTCACHE_LEN (255 + 7) /* max FQDN + colon + port number + zero */
+ 
+ /*
+@@ -248,11 +255,12 @@ void Curl_hostcache_prune(struct Curl_easy *data)
+     Curl_share_unlock(data, CURL_LOCK_DATA_DNS);
+ }
+ 
+-#ifdef HAVE_SIGSETJMP
++#ifdef USE_ALARM_TIMEOUT
+ /* Beware this is a global and unique instance. This is used to store the
+    return address that we can jump back to from inside a signal handler. This
+    is not thread-safe stuff. */
+ sigjmp_buf curl_jmpenv;
++curl_simple_lock curl_jmpenv_lock;
+ #endif
+ 
+ /* lookup address, returns entry if found and not stale */
+@@ -614,7 +622,6 @@ enum resolve_t Curl_resolv(struct connectdata *conn,
+ static
+ RETSIGTYPE alarmfunc(int sig)
+ {
+-  /* this is for "-ansi -Wall -pedantic" to stop complaining!   (rabe) */
+   (void)sig;
+   siglongjmp(curl_jmpenv, 1);
+ }
+@@ -695,6 +702,8 @@ enum resolve_t Curl_resolv_timeout(struct connectdata *conn,
+      This should be the last thing we do before calling Curl_resolv(),
+      as otherwise we'd have to worry about variables that get modified
+      before we invoke Curl_resolv() (and thus use "volatile"). */
++  curl_simple_lock_lock(&curl_jmpenv_lock);
++
+   if(sigsetjmp(curl_jmpenv, 1)) {
+     /* this is coming from a siglongjmp() after an alarm signal */
+     failf(data, "name lookup timed out");
+@@ -763,6 +772,8 @@ clean_up:
+ #endif
+ #endif /* HAVE_SIGACTION */
+ 
++  curl_simple_lock_unlock(&curl_jmpenv_lock);
++
+   /* switch back the alarm() to either zero or to what it was before minus
+      the time we spent until now! */
+   if(prev_alarm) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 13ec117099..ce81df0f05 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -50,6 +50,8 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-27535-pre1.patch \
            file://CVE-2023-27535.patch \
            file://CVE-2023-27536.patch \
+           file://CVE-2023-28320.patch \
+           file://CVE-2023-28320-fol1.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


