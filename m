Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E151E7F133
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.3545.1695764608330580698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NFVsLDHU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c60a514f3aso55042075ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764607; x=1696369407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kDIuwyuzTBKZo171AaNDE/IpCTCRUbYF5kFYX8/L4k=;
        b=NFVsLDHUfYdIQwDmdx78W+rp2i6ZBzGpnfey3nvgWw2e4i9f1bYjVpulxVJVFC8bdq
         RvPt2AmYmxty8xugRT2mV1URAUMvqBY0be2yNMRhdj65PFCp2MDk/AvrTK64tLPdKlGQ
         VyX1WepWEtjTzio6LElV7WVermCZ5dlSApa8lCGOb15xQ5ifUrs//p+07Pk71upizZRq
         RZEoo82TKTc0qMzZ0SFz1HS9YR3K0bvxFCnksDnXR8YBuWsd4b5iyhmh1BvA9oMnqeNT
         +jp+25AvXznXy7fw5MHumhSyzMVqMaL8ecKg16eZysDZuqnHOAQqPwyoLp9XJXnmgmfB
         W3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764607; x=1696369407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kDIuwyuzTBKZo171AaNDE/IpCTCRUbYF5kFYX8/L4k=;
        b=UpJlELF0CaQVgtJB472Cd4TUpt31WKfxPbdsJuhxQOG+FYThlBO6i8S9MisH/56muY
         dl2K7tpGljgLl9FG+Ry6W7Qy/dHwrxA9X2ATvtv3Rvnd2aNbbSXM7DS78aRGXwbKBxHi
         iz9W2gvib/m9eQUoM3m1xzZdpy+JP81ngDctUEDVx/PgpOHAjoxa3DEMFsVTcRFzpTit
         +es9o524ww4wsRgN7hJNisEpMX1CrVk5LvKG4yj41qGzbbFWMaP7NnBN3u+3Cfi/1d+K
         SV55N6PECHK9q2sV4fryxvUlRQA9MA1XHAb5ap2wAsXpXhF1WAijwgOjbMqXbEcYyk7s
         wsPA==
X-Gm-Message-State: AOJu0YwPRzjKe5ftbyW9t8LrVOkn4UDkhhKeG4li9cUMbXVO2Nhc/HS2
	PfSMwKDWKavtkI7FgS8lJ08mGmoj2MroXfNZFBY=
X-Google-Smtp-Source: AGHT+IGITIwUPH0LufDJaxgjSMfo/xSWoZzwXlzdRZ4RjLRj2RdW/e/JGb+i/6/C9LBAA8VEEkGELQ==
X-Received: by 2002:a17:902:6b88:b0:1c0:c4be:62ca with SMTP id p8-20020a1709026b8800b001c0c4be62camr19122plk.17.1695764607376;
        Tue, 26 Sep 2023 14:43:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/10] curl: Add CVE-2023-28320 follow-up fix
Date: Tue, 26 Sep 2023 11:43:10 -1000
Message-Id: <5d6d4768693f9baa9b801e87d4d2aed0d9792613.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188269

From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-28320
https://security-tracker.debian.org/tracker/CVE-2023-28320

Upstream Patch:
Introduced by: https://github.com/curl/curl/commit/3c49b405de4f (curl-7_9_8)
Fixed by: https://github.com/curl/curl/commit/13718030ad4b (curl-8_1_0)
Follow-up: https://github.com/curl/curl/commit/f446258f0269 (curl-8_1_0)

Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-28320-fol1.patch       | 80 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
new file mode 100644
index 0000000000..3c06d8c518
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
@@ -0,0 +1,80 @@
+From e442feb37ba25c80b8480b908d1c570fd9f41c5e Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2023-28320
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f446258f0269]
+
+(cherry picked from commit f446258f0269a62289cca0210157cb8558d0edc3)
+Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
+
+---
+ lib/hostip.c | 10 ++++------
+ lib/hostip.h |  9 ---------
+ 2 files changed, 4 insertions(+), 15 deletions(-)
+
+diff --git a/lib/hostip.c b/lib/hostip.c
+index d6906a2e8..2d26b5628 100644
+--- a/lib/hostip.c
++++ b/lib/hostip.c
+@@ -70,6 +70,8 @@
+ #include <SystemConfiguration/SCDynamicStoreCopySpecific.h>
+ #endif
+ 
++#include "easy_lock.h"
++
+ #if defined(CURLRES_SYNCH) &&                   \
+   defined(HAVE_ALARM) &&                        \
+   defined(SIGALRM) &&                           \
+@@ -79,10 +81,6 @@
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
+@@ -265,8 +263,8 @@ void Curl_hostcache_prune(struct Curl_easy *data)
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
+index 4b5481f65..0dd19e87c 100644
+--- a/lib/hostip.h
++++ b/lib/hostip.h
+@@ -186,15 +186,6 @@ Curl_cache_addr(struct Curl_easy *data, struct Curl_addrinfo *addr,
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
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index bcfe4a6088..708f622fe1 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2023-28320.patch \
     file://CVE-2023-28321.patch \
     file://CVE-2023-32001.patch \
+    file://CVE-2023-28320-fol1.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.34.1


