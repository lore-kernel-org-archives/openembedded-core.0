Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6801C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 11:33:03 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.47694.1685359980431421880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cx8T5xZZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d44b198baso2211913b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685359980; x=1687951980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy1vxEpJw+CHsHm2YoxREZ48ixyzCfTXLI2nfJSyqWY=;
        b=cx8T5xZZ7LGa14O3yRtIIra+ZPwQqtLZ0xcuK7z/532K/3gLnkfbq9TjXIsrt5e90h
         tKQk+jqWu6Q6n+tDA9x8GJ3QdpOypbJozT4yjB2bEkK4oz7UizgGm4vwJsnu1XVPxpNT
         U3MGo85y+NdvWsScPJ2drN7gRuQ8shS+bEKCQMfVW3GHhqWzy3YBB19zG4Ws1JsAtxv4
         +oteWgWAhtGvBM1nmL2VGOTF6fFjNqcpoRL/bMNujJ2HCu5R6HIiDovghXiTIM/cgcVY
         kG3lL0F7C+gveyh7k2+4rz9lYbtiwvQif7+J+i7+EbdJ/okQoO2tbuKeF/fbdMuJXAmM
         ynbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685359980; x=1687951980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy1vxEpJw+CHsHm2YoxREZ48ixyzCfTXLI2nfJSyqWY=;
        b=E4N+cdliNjiYhFW3Gbd/tBQYD+Wvq8r7smgcWEAEiVJmKcbulibLUs/wVX64GY6awf
         yMRC+t1RuFkiR90316El5ckCEmqQVDCxLIDLP+omGQQC1cTNmb5sCIOXnK/OCQkOVYJw
         zYlTJ1N1Oc+P8zeTfxG8mlFfiW5f2CSikbEUFww7EljFGdS+DpyWEt+xPh/HcxVnpAjI
         qiRk/FkXAG17TCH6fEqOYiZHhXzUJPI+dZrrrOgWPbZMY6AQCUlx9wo3OBd5GFUBAqIh
         XHnt5wO0eld3ndro4LaaTxM5SD2wXSjioxQP5+yzOV1Il8padmTqxIpDR3mFREyA1hLP
         QwPw==
X-Gm-Message-State: AC+VfDxekJcrxidKW7MtCEvrWvSSUSIeSAdjWAzszTHkjwfLoWy+x2Hu
	ClYAVZ2+x6bXgNdEy4Z/b2YSdWpOHIQ=
X-Google-Smtp-Source: ACHHUZ4nds0+OY3XkK1ksjlIOiXvUiS0TaOO2xBC9iMRBbrVGA6LvNuNn4HTaBeq6+pvCik1LXw/OA==
X-Received: by 2002:a05:6a00:846:b0:64d:5f41:1e88 with SMTP id q6-20020a056a00084600b0064d5f411e88mr9725637pfk.3.1685359979546;
        Mon, 29 May 2023 04:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:2235:3507:cad8:e3af:bc2])
        by smtp.gmail.com with ESMTPSA id a15-20020aa780cf000000b00640defda6d2sm6524228pfn.207.2023.05.29.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 04:32:59 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH 2/4] curl: Fix CVE-2023-28320
Date: Mon, 29 May 2023 17:02:44 +0530
Message-Id: <20230529113246.1353022-2-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529113246.1353022-1-bindudaniel1996@gmail.com>
References: <20230529113246.1353022-1-bindudaniel1996@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 11:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181866

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
2.25.1


