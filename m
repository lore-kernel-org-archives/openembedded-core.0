Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2369C54F4D
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43788.1785192964676718363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zjVz0xM3;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22744245e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192963; x=1785797763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDRwXh+9GSdxQhptiXPjjMTmMT4v7UkcE1NWmlun2Bs=;
        b=zjVz0xM3O4nCwn1+dZrMzSPVdRdoBYC+rFLj/UiJfF50u3J1cmO8vWcAPoSgFwQge7
         7TX8nxZTcZLRz9ty1x2iRxBHhLVAUG9PHmL2fJR0WgeiAQyqA3fzpJSBATRgnWUwfeZr
         rQAbvfrEYCimujPu61u99af7PtogQT9AIL0XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192963; x=1785797763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sDRwXh+9GSdxQhptiXPjjMTmMT4v7UkcE1NWmlun2Bs=;
        b=L9JxzHCOsyGwKGkxfQmoKi+knyvenImGr5yBzbco1tco6wUAF3rJvtv9K31/kvl+qc
         eOrTLihPZiMkDU4VGBKmDipr8hExYhzN5pcwRj0xTF55HSQqr3WAsO1ejyZ1YgDsxYVX
         92FssH5HV1jPRsC7MSK8fnKaziD1w8s0EVVG3ZywIwTFv69DECDm1wxs/lpT1a86g90a
         LdoyLYP1O/L+2ns0tmDxwqgwXpyI8HPhV7r9LBmxcdopwMHaEguz8JS/ZA7bLUCqbzPU
         hRtoA+WrGtb6T5X4B8M4PufoLm2gRrqiZOqiSQNjFIEw+DxXj2aroVVacrePLYSl87w3
         eEbw==
X-Gm-Message-State: AOJu0YyuljTvrnhN2IGSLyJRs/HcmbYXnOMAkoCMFmUuiPkpSkTu/Vb4
	K1v5yD7xBCPhT17ofkKlhP6pHbh0sl9Zao1QNmMYuhL2KRjeqg24Au2VZgaoWLMKBPUziCLwmep
	NdOmsgnQ=
X-Gm-Gg: AR+sD10eC7EnwzE1Q3rjWW+GwynlMBDFsRJEIzwQ7IRW0LQ1Is715VlfpZa+oTmD++q
	BIzPJNYNEmS8V/y7dkVfRLEU7FXbxT1AA4DsW7Ozy6uWYS97za7A8Fa/uabA/D8jrrQ6jheNOf+
	VeucZq/XlcUY6WIFD+/JYGiXtfbJvlw6IK5/FFDyaUpvOujPh8mv8qAOOn9Sx/XOYap/ZNTspFe
	P/gvgRQF/3s7eZo4R5vFerFDBMxWRWOXowVc2TbaBv1Zd9Si+zLSIHtXzcCymD0oyXi+7jBM/d/
	gD4Rr8tcMtGu/IxHiTwkgiOTBV+SQtFxgV4wURV51NA829Ww6O8rKdqmrfttMEdbN89nNLX2OAh
	6T9pGWTaQLwOG4J/g4x6lLe2au/XPYRWkLTriPiHtXp1EpELBFe+E8WhpBvYgJul5ksUHd2PVeN
	8TIHYfeeCYf3SriLYWIcOSHBNxIlZAOxDogLoo5uLYWik930yTCIyirjYoajy7UXtlm8gyRhBqm
	Ne2ZA==
X-Received: by 2002:a05:600c:19c8:b0:495:7888:281c with SMTP id 5b1f17b1804b1-496b5689b16mr135240735e9.0.1785192962789;
        Mon, 27 Jul 2026 15:56:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/36] curl: fix CVE-2026-7168
Date: Tue, 28 Jul 2026 00:55:15 +0200
Message-ID: <d6e0ac1e6bfa93ce50996b408644acc38a1ce26f.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242109

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for proxy Digest state reuse across proxy
switches described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507
[2] https://curl.se/docs/CVE-2026-7168.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-7168

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-7168.patch             | 376 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 377 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
new file mode 100644
index 00000000000..d547c849266
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
@@ -0,0 +1,376 @@
+From c1cfdf59acbaf9504c4578d4cf56cdd7c8594507 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Apr 2026 09:14:51 +0200
+Subject: [PATCH] setopt: clear proxy auth properties when switching
+
+Verify with test 1588
+
+Closes #21453
+
+CVE: CVE-2026-7168
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507]
+
+Backport Changes:
+- Adapted setproxy() insertion and test-list placement to the curl 8.19.0 wrynose layout.
+
+(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/setopt.c               |  17 ++++-
+ lib/vauth/vauth.h          |   1 +
+ tests/data/Makefile.am     |   2 +-
+ tests/data/test1588        | 106 ++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |   2 +-
+ tests/libtest/lib1588.c    | 150 +++++++++++++++++++++++++++++++++++++
+ 6 files changed, 275 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1588
+ create mode 100644 tests/libtest/lib1588.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 84f3e02..d12ffb6 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -49,6 +49,7 @@
+ #include "curlx/strdup.h"
+ #include "escape.h"
+ #include "bufref.h"
++#include "vauth/vauth.h"
+
+ static CURLcode setopt_set_timeout_sec(timediff_t *ptimeout_ms, long secs)
+ {
+@@ -1664,6 +1665,20 @@ static CURLcode cookiefile(struct Curl_easy *data, const char *ptr)
+ #endif
+
+ #ifndef CURL_DISABLE_PROXY
++
++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
++{
++  if((data->set.str[STRING_PROXY] && proxy) &&
++     /* there was one set, is this a new one? */
++     !strcmp(data->set.str[STRING_PROXY], proxy))
++    return CURLE_OK; /* same one as before */
++
++  Curl_auth_digest_cleanup(&data->state.proxydigest);
++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
++}
++
++
+ static CURLcode setopt_cptr_proxy(struct Curl_easy *data, CURLoption option,
+                                   const char *ptr)
+ {
+@@ -1759,7 +1771,7 @@ static CURLcode setopt_cptr_proxy(struct Curl_easy *data, CURLoption option,
+      * Setting it to NULL, means no proxy but allows the environment variables
+      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
+      */
+-    return Curl_setstropt(&s->str[STRING_PROXY], ptr);
++    return setproxy(data, ptr);
+   case CURLOPT_PRE_PROXY:
+     /*
+      * Set proxy server:port to use as SOCKS proxy.
+diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
+index 3e66c89..20ee51e 100644
+--- a/lib/vauth/vauth.h
++++ b/lib/vauth/vauth.h
+@@ -117,6 +117,7 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+ /* This is used to clean up the digest specific data */
+ void Curl_auth_digest_cleanup(struct digestdata *digest);
+ #else
++#define Curl_auth_digest_cleanup(x)
+ #define Curl_auth_is_digest_supported()       FALSE
+ #endif /* !CURL_DISABLE_DIGEST_AUTH */
+
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 1b76b01..1e84b26 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -208,7 +208,7 @@ test1548 test1549 test1550 test1551 test1552 test1553 test1554 test1555 \
+ test1556 test1557 test1558 test1559 test1560 test1561 test1562 test1563 \
+ test1564 test1565 test1566 test1567 test1568 test1569 test1570 test1571 \
+ test1572 test1573 test1574 test1575 test1576 test1577 test1578 test1579 \
+-test1580 test1581 test1582 test1583 test1584 test1585 \
++test1580 test1581 test1582 test1583 test1584 test1585 test1588 \
+ \
+ test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597 \
+ test1598 test1599 test1600 test1601 test1602 test1603 test1604 test1605 \
+diff --git a/tests/data/test1588 b/tests/data/test1588
+new file mode 100644
+index 0000000..753e98c
+--- /dev/null
++++ b/tests/data/test1588
+@@ -0,0 +1,106 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++HTTP proxy
++HTTP proxy Digest auth
++multi
++</keywords>
++</info>
++
++# Server-side
++<reply>
++
++# this is returned first since we get no proxy-auth
++<data crlf="headers">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++And you should ignore this data.
++</data>
++
++# then this is returned when we get proxy-auth
++<data1000 crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++</data1000>
++
++<datacheck crlf="headers">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++# tool is what to use instead of 'curl'
++<tool>
++lib%TESTNUMBER
++</tool>
++<features>
++!SSPI
++crypto
++proxy
++digest
++</features>
++<name>
++HTTP proxy auth Digest, then change proxy and do it again
++</name>
++<command>
++http://test.remote.example.com/path/%TESTNUMBER %HOSTIP %HTTPPORT silly:person custom.set.host.name
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Proxy-Authorization: Digest username="silly", realm="weirdorealm", nonce="12345", uri="/path/1588", response="d0b2f000c7e3fca24452b5810713404a"
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Proxy-Authorization: Digest username="silly", realm="weirdorealm", nonce="12345", uri="/path/1588", response="d0b2f000c7e3fca24452b5810713404a"
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 2f77c16..96b82bc 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -97,7 +97,7 @@ TESTS_C = \
+   lib1559.c lib1560.c                               lib1564.c lib1565.c \
+   lib1567.c lib1568.c lib1569.c           lib1571.c \
+   lib1576.c \
+-  lib1582.c \
++  lib1582.c lib1588.c \
+   lib1591.c lib1592.c lib1593.c lib1594.c                     lib1597.c \
+   lib1598.c lib1599.c \
+   lib1662.c \
+diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
+new file mode 100644
+index 0000000..9b12f36
+--- /dev/null
++++ b/tests/libtest/lib1588.c
+@@ -0,0 +1,150 @@
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
++/*
++ * argv1 = URL
++ * argv2 = proxy host
++ * argv3 = proxy port
++ * argv4 = proxyuser:password
++ */
++
++#include "first.h"
++
++static CURLcode init1588(CURL *curl, const char *url,
++                         const char *userpwd, const char *proxy)
++{
++  CURLcode result = CURLE_OK;
++
++  res_easy_setopt(curl, CURLOPT_URL, url);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY, proxy);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
++  if(result)
++    goto init_failed;
++#if 0
++  res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
++  if(result)
++    goto init_failed;
++#endif
++
++  res_easy_setopt(curl, CURLOPT_HEADER, 1L);
++  if(result)
++    goto init_failed;
++
++  return CURLE_OK; /* success */
++
++init_failed:
++  return result; /* failure */
++}
++
++static CURLcode run1588(CURL *curl, const char *url, const char *userpwd,
++                        const char *proxy)
++{
++  CURLcode result = CURLE_OK;
++
++  result = init1588(curl, url, userpwd, proxy);
++  if(result)
++    return result;
++
++  return curl_easy_perform(curl);
++}
++
++static CURLcode test_lib1588(const char *URL)
++{
++  CURLcode result = CURLE_OK;
++  CURL *curl = NULL;
++  const char *proxyuserpws = libtest_arg4;
++  struct curl_slist *host = NULL;
++  struct curl_slist *host2 = NULL;
++  char proxy1_resolve[128];
++  char proxy2_resolve[128];
++  char proxy1_connect[128];
++  char proxy2_connect[128];
++
++  if(test_argc < 3)
++    return TEST_ERR_MAJOR_BAD;
++
++  curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),
++                 "firstproxy:%s:%s", libtest_arg3, libtest_arg2);
++  curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),
++                 "secondproxy:%s:%s", libtest_arg3, libtest_arg2);
++
++  /* we connect to the fake host name but the right port number */
++  curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),
++                 "firstproxy:%s", libtest_arg3);
++  curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),
++                 "secondproxy:%s", libtest_arg3);
++
++  res_global_init(CURL_GLOBAL_ALL);
++  if(result)
++    return result;
++
++  curl = curl_easy_init();
++  if(!curl) {
++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
++    curl_global_cleanup();
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  host = curl_slist_append(NULL, proxy1_resolve);
++  if(!host)
++    goto test_cleanup;
++  host2 = curl_slist_append(host, proxy2_resolve);
++  if(!host2)
++    goto test_cleanup;
++  host = host2;
++
++  start_test_timing();
++
++  easy_setopt(curl, CURLOPT_RESOLVE, host);
++
++  result = run1588(curl, URL, proxyuserpws, proxy1_connect);
++  if(result)
++    goto test_cleanup;
++
++  curl_mfprintf(stderr, "lib1588: now we do the request again\n");
++
++  result = run1588(curl, URL, proxyuserpws, proxy2_connect);
++
++test_cleanup:
++
++  /* proper cleanup sequence - type PB */
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  curl_slist_free_all(host);
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 6ad0daa59d4..bdd6e730199 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
+    file://CVE-2026-7168.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

