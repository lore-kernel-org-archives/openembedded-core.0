Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B162C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.4582.1685500473221011245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tkbHf+EM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5289ce6be53so343224a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500472; x=1688092472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hcHKgwfqqDApVePUsmZIsl8hItzuqUUm2XIaptvO9c=;
        b=tkbHf+EMQrCFOAMcHMBeSfcV2dDOPMIYbipuMxLzZtlmKjL9lmk47iMZUon6G/aKXO
         n4jLozMhTWRnYg2ehtszDvHvPhYlbn4iOg0VgqcQ9uKq8EcdrrfkoTwQ40EM59o4R2L2
         wej5bmMbei/HRWmKoWLu3oADiVnqWfx+yliiSFYFMCY4i6tVyRAkSPK/+/5Tk0eseLSF
         atw6vaUlXEZs8m+SOqNQBieKWBwCNhxSTYW0QnCh5vOEM7dORBjHHYK5ueF+EaAaQ2bK
         yKzAwjkTzs5MNBDL2rRKlk06GkxkJXtoPmmHNPDgyTTBhcSjtq3d7cADlYkzlc3FOXL6
         KHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500472; x=1688092472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hcHKgwfqqDApVePUsmZIsl8hItzuqUUm2XIaptvO9c=;
        b=MDzKaE5umpxMelSmHoRV/AWyA5PBU5cd/v+WUlYKeo7mUo1aRwTc8GvI7pxaffPyWX
         ph5ptljTTwVkHkwt7OoJuuQOsyhOFOX+oOwRh0Ze8TS2L+Tf93Loj5zVmG0MUCTZGHL3
         LFsNl8fxvhJe1xlmr+Um/zTYxIRskHh1dreY3nTY70IXzfC7Uma0ydN6s+ZFe13el2lQ
         20l1JUH72M86WyCS8KG4KOTDDgJMl4z+axmtGUeHZs6GoY1R9BSZhQ5ELCCbRB+U97xF
         ga21ZfQNKVIgM32Ma4bR0mid/ysGQ+b3Sj0kDe63dAso4p2BqhJ4ThQMb4kfaECBS+IA
         PtPg==
X-Gm-Message-State: AC+VfDzIai9fW56cUWED7Q7nHdXGEXikDHD1ZXgstBIuTHAJdsB2fLD3
	G+XdpF/UUuwe7G/YSq0cUBAnDUb1QxLWpef/ITg=
X-Google-Smtp-Source: ACHHUZ5X4/8t8zr2HUAz3p6RcMpfbpoITTjx9zrO+jbhOAXbGCAaygbYIwZz2j1bwiifXqhPDRPf0A==
X-Received: by 2002:a17:90b:19c5:b0:246:9c75:351a with SMTP id nm5-20020a17090b19c500b002469c75351amr4656183pjb.12.1685500472196;
        Tue, 30 May 2023 19:34:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] curl: Fix CVE-2023-28320
Date: Tue, 30 May 2023 16:34:09 -1000
Message-Id: <c761d822be5ffc4a88600fbd7282c469b1e9902a.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181971

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Add patch to fix CVE-2023-28320

siglongjmp race condition

libcurl provides several different backends for resolving host names,
selectedat build time. If it is built to use the synchronous resolver,
it allows nameresolves to time-out slow operations using `alarm()` and
`siglongjmp()`.

When doing this, libcurl used a global buffer that was not mutex
protected anda multi-threaded application might therefore
crash or otherwise misbehave.

Link: https://curl.se/docs/CVE-2023-28320.html

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-28320.patch            | 83 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320.patch b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
new file mode 100644
index 0000000000..1e0fc7534a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320.patch
@@ -0,0 +1,83 @@
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
+CVE: CVE-2023-28320
+Upstream-Status: Backport [https://github.com/curl/curl/commit/13718030ad4b3209a7583b]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ lib/hostip.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/lib/hostip.c b/lib/hostip.c
+index 2381290fdd43e..e410cda69ae6e 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -70,12 +70,19 @@
+ #include <SystemConfiguration/SCDynamicStoreCopySpecific.h>
+ #endif
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
+@@ -254,11 +261,12 @@ void Curl_hostcache_prune(struct Curl_easy *data)
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
+@@ -832,7 +840,6 @@ enum resolve_t Curl_resolv(struct Curl_easy *data,
+ static
+ void alarmfunc(int sig)
+ {
+-  /* this is for "-ansi -Wall -pedantic" to stop complaining!   (rabe) */
+   (void)sig;
+   siglongjmp(curl_jmpenv, 1);
+ }
+@@ -912,6 +919,8 @@ enum resolve_t Curl_resolv_timeout(struct Curl_easy *data,
+      This should be the last thing we do before calling Curl_resolv(),
+      as otherwise we'd have to worry about variables that get modified
+      before we invoke Curl_resolv() (and thus use "volatile"). */
++  curl_simple_lock_lock(&curl_jmpenv_lock);
++
+   if(sigsetjmp(curl_jmpenv, 1)) {
+     /* this is coming from a siglongjmp() after an alarm signal */
+     failf(data, "name lookup timed out");
+@@ -980,6 +989,8 @@ enum resolve_t Curl_resolv_timeout(struct Curl_easy *data,
+ #endif
+ #endif /* HAVE_SIGACTION */
+ 
++  curl_simple_lock_unlock(&curl_jmpenv_lock);
++
+   /* switch back the alarm() to either zero or to what it was before minus
+      the time we spent until now! */
+   if(prev_alarm) {
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index e38bf14cc4..422c2bec0f 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-27535_and_CVE-2023-27538.patch \
            file://CVE-2023-27536.patch \
            file://CVE-2023-28319.patch \
+           file://CVE-2023-28320.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


