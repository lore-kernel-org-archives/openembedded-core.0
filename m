Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6361EC982E0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1700.1789682900920910886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pOHuM5LE;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1214195e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682899; x=1790287699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IA6eCpEg/XTLjXbJSZPZ5WHJjdd31tOSTAGEPCGj8Fc=;
        b=pOHuM5LEDhOlreV3yB3Q2K8qoyjB0Zquh6BQ7/QZbQjPRFh4qfYmI+O5WJbMS0Plvs
         kBDyFgbgK08+SWyNAURIkXHVo9j0Uuij6v1HqmtS4bHw/64QEOVU1NKBOcTzd+y5/kii
         ohcOwNOxjnuto5azaJAdH2GJELH9Gudf1ivW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682899; x=1790287699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IA6eCpEg/XTLjXbJSZPZ5WHJjdd31tOSTAGEPCGj8Fc=;
        b=jaYfDuKXdkSt1JuidA3S73V0w3WeXk6e1ZUSwCgeUDyCsLTnn4AMGgTSQCtg4vHgMf
         N3PD1Op7ciExsOAOJHXn7cafMqs/A26ZA4INIgZnr5IH8TIeNjQoxF9UKuAfdcuc/vgt
         uIhNsqPv9I0ZfFzRuj9dbWa9LZolZ82kGtXHZKRFSsP6Qpi+MXMy2lA0dI9b0pYt49Qy
         FhV95Ar8ZZXLEyztgoSOdnCzoa3iIVohyc+z/fMng1hFyOR7XIMt1lcwW/955veDX75D
         GQ1iYDaJoNt18lEzaAXKkkg1pKYijhc/aKjbcw6RIOf3N2+T1W9U/8BQXRNHFx9+CF14
         jcoQ==
X-Gm-Message-State: AFuF++m1bt83buDqB+g9WN3WzekiRUztShmypyAot4UI+4T8wizgta86
	8/2OyjHrnwqaw6b05BRqTFbflkQOBJy54QPvu7YVepeJ2CYRfl2MZvayfh7nIIvVYIO2kmVXIjY
	EAL8Uc/U=
X-Gm-Gg: AYBFou2Mu/e68m4ytwal3mAhCxuSYUXCGq4ay1+czh76ag1uC988Ymfx1gf3CgebSDX
	w/MKbPaNTfD7BcN71xIFuZ+GUaWdpe2AW6Z+tJv2qxpMkfql0W1yXRqKrvUS49Hhl6mqbpSbCpM
	LJLqh08hHME8Oly7wRYhwOD+FURKLzA8t6tlYg4EIEPHFbkfsaUEW/SvyGiJHP/qemDmVUox5SU
	Xe7xvPM4yhPOAuYgk6hjopF3ynx3jFkIxKUxODq1IIugk0m2oV0nInkUv7BsfKfo2w8HYwbJqlv
	J1PjkvyVv5bSShlabs8KksZpuZu6MwayCl2CKWkWDeXik+443EC2jDfo4xBjVYM6YKz7f6JrlQ2
	qsNvsJg7pIWQtZ2ULB0PZRS0+vP7mI5B5b0bfDlZ6bkI34tvEuPKbjEdsZRNtxEBvaBbtCewSGp
	kPI/2u2X5Mz51D4M5ckiAwa52MQlZES75YoJAN8+7z29dFOzs+xkLcMbJgAs73YWNR8CfXrNyTb
	lNiuPbwwQM52uIk5FBb4NPO5F3D5mPZPaXHISYkHzOlLEEBPPPIox1U4S62nHZAglRUCOJNhDo=
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr2161675e9.20.1789682898987;
        Thu, 17 Sep 2026 15:08:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 55/79] curl: Fix for CVE-2026-9079
Date: Fri, 18 Sep 2026 00:06:40 +0200
Message-ID: <8837882db6db82cbfb7924973012c50cadc7daf5.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246150

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick patch from [1] mentioned in [2] taken from NVD report in [3].

[1] https://github.com/curl/curl/commit/88c7e16cceec816a2df45c89
[2] https://curl.se/docs/CVE-2026-9079.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-9079

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-9079.patch             | 289 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 290 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9079.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9079.patch b/meta/recipes-support/curl/curl/CVE-2026-9079.patch
new file mode 100644
index 00000000000..c62914d586b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9079.patch
@@ -0,0 +1,289 @@
+From a9140d59cfb67394656d400e0f5f511d3b312b09 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 20 May 2026 13:39:25 +0200
+Subject: [PATCH] setopt: clear proxy auth properly on NULL
+
+Verify NULLed proxy credentials with test1648
+
+Closes #21696
+
+CVE: CVE-2026-9079
+Upstream-Status: Backport [https://github.com/curl/curl/commit/88c7e16cceec816a2df45c89]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ lib/setopt.c               |  12 ++--
+ tests/data/Makefile.am     |   2 +-
+ tests/data/test1648        |  63 +++++++++++++++++
+ tests/libtest/Makefile.inc |   2 +-
+ tests/libtest/lib1648.c    | 135 +++++++++++++++++++++++++++++++++++++
+ 5 files changed, 206 insertions(+), 8 deletions(-)
+ create mode 100644 tests/data/test1648
+ create mode 100644 tests/libtest/lib1648.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index a7f8a7071f..02e9a23094 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -1694,16 +1694,16 @@ static CURLcode setopt_cptr_proxy(struct Curl_easy *data, CURLoption option,
+     result = setstropt_userpwd(ptr, &u, &p);
+ 
+     /* URL decode the components */
+-    if(!result && u) {
++    if(!result) {
+       Curl_safefree(s->str[STRING_PROXYUSERNAME]);
+-      result = Curl_urldecode(u, 0, &s->str[STRING_PROXYUSERNAME], NULL,
+-                              REJECT_ZERO);
+-    }
+-    if(!result && p) {
+       Curl_safefree(s->str[STRING_PROXYPASSWORD]);
++      if(u)
++        result = Curl_urldecode(u, 0, &s->str[STRING_PROXYUSERNAME], NULL,
++                                REJECT_ZERO);
++    }
++    if(!result && p)
+       result = Curl_urldecode(p, 0, &s->str[STRING_PROXYPASSWORD], NULL,
+                               REJECT_ZERO);
+-    }
+     curlx_free(u);
+     curlx_free(p);
+     break;
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index f9d20a9cc8..2c74a975df 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -218,7 +218,7 @@ test1620 test1621 test1622 test1623 test1624 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 test1636 test1637 \
+ \
+-test1640 test1641 test1642 test1643 test1647 \
++test1640 test1641 test1642 test1643 test1647 test1648 \
+ \
+ test1650 test1651 test1652 test1653 test1654 test1655 test1656 test1657 \
+ test1658 \
+diff --git a/tests/data/test1648 b/tests/data/test1648
+new file mode 100644
+index 0000000000..623f3c9a81
+--- /dev/null
++++ b/tests/data/test1648
+@@ -0,0 +1,63 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++HTTP proxy
++HTTP proxy auth
++</keywords>
++</info>
++
++# Server-side
++<reply>
++
++# this is returned first since we get no proxy-auth
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++And you should ignore this data.
++</data>
++
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
++proxy
++</features>
++<name>
++HTTP proxy with auth, change proxy, clear auth
++</name>
++<command>
++%HOSTIP %HTTPPORT
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://example.com/ HTTP/1.1
++Host: example.com
++Proxy-Authorization: Basic %b64[victim:secret]b64%
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://example.com/ HTTP/1.1
++Host: example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index e938b87bc5..0803825e45 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -100,7 +100,7 @@ TESTS_C = \
+   lib1582.c lib1588.c \
+   lib1591.c lib1592.c lib1593.c lib1594.c                     lib1597.c \
+   lib1598.c lib1599.c \
+-  lib1647.c \
++  lib1647.c lib1648.c \
+   lib1662.c \
+   lib1900.c lib1901.c lib1902.c lib1903.c lib1905.c lib1906.c lib1907.c \
+   lib1908.c           lib1910.c lib1911.c lib1912.c lib1913.c \
+diff --git a/tests/libtest/lib1648.c b/tests/libtest/lib1648.c
+new file mode 100644
+index 0000000000..e97b2bdc88
+--- /dev/null
++++ b/tests/libtest/lib1648.c
+@@ -0,0 +1,135 @@
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
++ * URL = host
++ * arg2 = port
++ */
++
++#include "first.h"
++
++/* this is meant to pick up the proxy from the environment variable */
++static CURLcode init1648(CURL *curl, const char *url, const char *proxy)
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
++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
++  if(result)
++    goto init_failed;
++
++  return CURLE_OK; /* success */
++
++init_failed:
++  return result; /* failure */
++}
++
++static CURLcode run1648(CURL *curl, const char *url, const char *userpwd)
++{
++  CURLcode result = CURLE_OK;
++
++  result = init1648(curl, url, userpwd);
++  if(result)
++    return result;
++
++  return curl_easy_perform(curl);
++}
++
++#define GET_THIS "http://example.com/"
++
++/*
++ * First get the URL over 'firstproxy' with auth.
++ * Then clear the auth and get the URL again over 'secondproxy'.
++ */
++static CURLcode test_lib1648(const char *hostip)
++{
++  CURLcode result = CURLE_OK;
++  CURL *curl = NULL;
++  struct curl_slist *host = NULL;
++  struct curl_slist *host2 = NULL;
++  char proxy1_resolve[128];
++  char proxy2_resolve[128];
++  char proxy1_connect[128];
++  char proxy2_connect[128];
++
++  curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),
++                 "firstproxy:%s:%s", libtest_arg2, hostip);
++  curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),
++                 "secondproxy:%s:%s", libtest_arg2, hostip);
++
++  /* we connect to the fake host name but the right port number */
++  curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),
++                 "firstproxy:%s", libtest_arg2);
++  curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),
++                 "secondproxy:%s", libtest_arg2);
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
++  easy_setopt(curl, CURLOPT_PROXYUSERPWD, "victim:secret");
++
++  curl_mprintf("--- First get over %s\n", proxy1_connect);
++  result = run1648(curl, GET_THIS, proxy1_connect);
++  if(result)
++    goto test_cleanup;
++
++  easy_setopt(curl, CURLOPT_PROXYUSERPWD, NULL);
++
++  curl_mprintf("--- Then over '%s'\n", proxy2_connect);
++  result = run1648(curl, GET_THIS, proxy2_connect);
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 3695f8d083d..cd56e2aaaf3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2026-9080.patch \
     file://CVE-2026-9545-01.patch \
     file://CVE-2026-9545-02.patch \
+    file://CVE-2026-9079.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

