Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9976AC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2998.1787945914766506124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XzwDPLfR;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso7571695e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945913; x=1788550713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v/1wAoBi59B5Gr+gvBOwDko9GSRtB+6JNjUMmno/yAo=;
        b=XzwDPLfRzn2VkN0crkCWcb/9zTjp+qTnRMpnMbZ8GkxvPyqmAMJGLtdeo0v0RqzgHj
         yZKbmGYCDHvqgUlVCiN64AgNuCHPqgUEv96jX+kWzFKBbsYHsEtnvEh/UM+AbiAyID8B
         k2dq2rVs8eIsWKSl94bdBC3JDiQJC/IwgirBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945913; x=1788550713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v/1wAoBi59B5Gr+gvBOwDko9GSRtB+6JNjUMmno/yAo=;
        b=Xn5zwGaeGp1q3N5szn4YKueSa1bLZrcPq2Pg/samF9xrxsVa9ttsWmUg+ogQro6RhL
         8gc6qVhikRutNwBgnIy65fqOPxvJk7C/fypo+NsIa4K2Ov0kq6BMvEGX6sfMV1z1YuEc
         hxMjZUlWsfg7el3u7oMYsTBHGQE9Km9oQy4gvBJbXt1vRySIoetgymlrsbAzjMo8f9Sw
         /EOieGnPHqIzW/pWBgfJ0YQNi5nf14FmYCVahfZ8dun1eO0hjV3/0SuBqbioUsY3XFNP
         BO6AVWHG0wL8WeYnuCOXpQ1hELrtmHocSHKbV14X0XRX+jxslssKkk89D8Lb9PQQVR9F
         XS5g==
X-Gm-Message-State: AFuF++m+ucTt0uGtv3BoAfVSDch5ALeX/el0M7+TU23VSNdAaV/L7Ax5
	90cggw97GqvWqISDwntaWPrgimaLkbXJEtd8IGYyUpbA90MpCj2us7Ie7fXbVoeWkNWxnMwUwk2
	On+bVEdQ=
X-Gm-Gg: AR+sD11i7Z8vBkSQUum6wVV/SbbZL1Ud7iXt/r7Vs5mSK+54jZrfUMKP6Ai7awXFyNp
	rhj5j9lp6LMS/WgiUJFE2Lwle2FZgxqqLZwQ7H+6+7hGzjGq1FhiuV0AROKJeb+kyU/V0uqkDIc
	eM9WZUwfNl+D490eknPgbmaxoNv8XvK92/35WEBjcJcp0ISKH4xxJ2yQQXein0vbs8M3QKEn3Lh
	zXT0SygqeHNgE5T8WpLLzM8C836veAaHy7idrcrDFGbG9rCxcHBOJL26zW4q//Rm89AiR4POgiT
	Syobi/ISzlhyLfmsEbgWpd6IgBsOT6is3WKURxxgjGc9M20TnetkePi9cWE2boojfMiQb27SMMh
	r3TSsdK2jpMrrZYFFttNhNu5lFlgMM0b2VnUKe7Lsx+EXbQkPxYEtShJhTziOhHtNRRtS4XrnuE
	NGipAOS/zNCsSkL1Yfbyhbert6bOCzqpqqO0EwUw0Th9Wx3g6lKJVZNrj0v8LC8LFV2r8AdbslT
	WSUKAzXp+942iG8sc27EpVQdeH0358hpaZPHg3bAm2Uh4kQnqy3by3PeuMAR9lB
X-Received: by 2002:a05:600c:1f91:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49b91c1c784mr134929755e9.2.1787945912837;
        Fri, 28 Aug 2026 12:38:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 50/56] curl: fix CVE-2026-8927
Date: Fri, 28 Aug 2026 21:36:00 +0200
Message-ID: <0171c937b1793d277493d0f7e76a8059cb98a811.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244611

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream curl security fix backport for
CVE-2026-8927. The upstream fix commit is referenced in [1],
and the public curl advisory is referenced in [2]. The backported
commit link is also recorded in the embedded patch header.

[1] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567
[2] https://curl.se/docs/CVE-2026-8927.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-8927.patch             | 349 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
new file mode 100644
index 00000000000..653d908eb5d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
@@ -0,0 +1,349 @@
+From c3e9c57b5cd128f33250caf86184e23dc1e8c4e5 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 30 Jul 2026 04:29:18 -0700
+Subject: [PATCH] url: detect proxy changes read from environment
+
+When a proxy is set from an environment variable, detect if that proxy
+is not the same as previously and flush state.
+
+Verified by test1647: verify changing proxy with env variables and make
+sure Digest state is flushed in the second use
+
+Closes #21666
+
+CVE: CVE-2026-8927
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567]
+
+Backport Changes:
+- Kept Wrynose test registry ordering and added only the new upstream
+  test1647/lib1647 regression test entries.
+- Added the explicit vauth/vauth.h include because Wrynose's url.c did
+  not already include the Digest cleanup prototype used by this fix.
+- Placed the env proxy comparison before parse_proxy() because Wrynose
+  frees the temporary proxy string immediately after parse_proxy() copies
+  it.
+
+(cherry picked from commit 5c225384b8d52c67ce8259c6e4203bc57aacb567)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c                  |  12 ++++
+ lib/urldata.h              |   1 +
+ tests/data/Makefile.am     |   2 +-
+ tests/data/test1647        | 103 +++++++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |   1 +
+ tests/libtest/lib1647.c    | 120 +++++++++++++++++++++++++++++++++++++
+ 6 files changed, 238 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test1647
+ create mode 100644 tests/libtest/lib1647.c
+
+diff --git a/lib/url.c b/lib/url.c
+index 6c1375f8e3..1cd3955e64 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -99,6 +99,7 @@
+ #include "headers.h"
+ #include "curlx/strerr.h"
+ #include "curlx/strparse.h"
++#include "vauth/vauth.h"
+ 
+ /* And now for the protocols */
+ #include "ftp.h"
+@@ -326,6 +327,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_freeset(data);
+   Curl_headers_cleanup(data);
+   Curl_netrc_cleanup(&data->state.netrc);
++#ifndef CURL_DISABLE_DIGEST_AUTH
++  curlx_free(data->state.envproxy);
++#endif
+   curlx_free(data);
+   return CURLE_OK;
+ }
+@@ -2354,6 +2358,14 @@ static CURLcode create_conn_helper_init_proxy(struct Curl_easy *data,
+   if(proxy || socksproxy) {
+     long ptype = conn->http_proxy.proxytype;
+     if(proxy) {
++#ifndef CURL_DISABLE_DIGEST_AUTH
++      if(!Curl_safecmp(data->state.envproxy, proxy)) {
++        /* proxy changed */
++        Curl_auth_digest_cleanup(&data->state.proxydigest);
++        curlx_free(data->state.envproxy);
++        data->state.envproxy = curlx_strdup(proxy);
++      }
++#endif
+       result = parse_proxy(data, conn, proxy, ptype);
+       Curl_safefree(proxy); /* parse_proxy copies the proxy string */
+       if(result)
+diff --git a/lib/urldata.h b/lib/urldata.h
+index d71337c8f6..65005c4b34 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -959,6 +959,7 @@ struct UrlState {
+   void (*prev_signal)(int sig);
+ #endif
+ #ifndef CURL_DISABLE_DIGEST_AUTH
++  char *envproxy; /* last proxy string used for proxy-related state */
+   struct digestdata digest;      /* state data for host Digest auth */
+   struct digestdata proxydigest; /* state data for proxy Digest auth */
+ #endif
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 1e84b26820..bcee03b938 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -218,7 +218,7 @@ test1620 test1621 test1622 test1623 test1624 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 test1636 test1637 \
+ \
+-test1640 test1641 test1642 test1643 \
++test1640 test1641 test1642 test1643 test1647 \
+ \
+ test1650 test1651 test1652 test1653 test1654 test1655 test1656 test1657 \
+ test1658 \
+diff --git a/tests/data/test1647 b/tests/data/test1647
+new file mode 100644
+index 0000000000..a87487fa9f
+--- /dev/null
++++ b/tests/data/test1647
+@@ -0,0 +1,103 @@
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
++<data crlf="headers" nocheck="yes">
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
++<connect crlf="headers">
++HTTP/1.1 401 OK
++Content-Length: 21
++Server: no
++
++Denied access. Leave
++</connect>
++
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++https-proxy
++https
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
++Debug
++</features>
++<setenv>
++http_proxy=%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPROXYPORT
++CURL_ENTROPY=99376
++</setenv>
++<name>
++HTTP proxy auth Digest, then change proxy with env var and do it again
++</name>
++<command>
++http://test.remote.example.com/path/%TESTNUMBER https://another.example.com:%HTTPSPORT/ daniel:monkey123 another:bump456
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://test.remote.example.com/path/%TESTNUMBER HTTP/1.1
++Host: test.remote.example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/%TESTNUMBER HTTP/1.1
++Host: test.remote.example.com
++Proxy-Authorization: Digest username="daniel", realm="weirdorealm", nonce="12345", uri="/path/%TESTNUMBER", response="7a1672891aff03248887b1a6674b8096"
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++
++<proxy crlf="headers">
++CONNECT another.example.com:%HTTPSPORT HTTP/1.1
++Host: another.example.com:%HTTPSPORT
++Proxy-Connection: Keep-Alive
++
++</proxy>
++
++# CONNECT fails
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 96b82bc059..e938b87bc5 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -100,6 +100,7 @@ TESTS_C = \
+   lib1582.c lib1588.c \
+   lib1591.c lib1592.c lib1593.c lib1594.c                     lib1597.c \
+   lib1598.c lib1599.c \
++  lib1647.c \
+   lib1662.c \
+   lib1900.c lib1901.c lib1902.c lib1903.c lib1905.c lib1906.c lib1907.c \
+   lib1908.c           lib1910.c lib1911.c lib1912.c lib1913.c \
+diff --git a/tests/libtest/lib1647.c b/tests/libtest/lib1647.c
+new file mode 100644
+index 0000000000..8060e1bfe9
+--- /dev/null
++++ b/tests/libtest/lib1647.c
+@@ -0,0 +1,120 @@
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
++ * argv1 = the first URL
++ * argv2 = URL2
++ * argv3 = credentials 1
++ * argv4 = credentials 2
++ */
++
++#include "first.h"
++
++/* this is meant to pick up the proxy from the environment variable */
++static CURLcode init1647(CURL *curl, const char *url, const char *userpwd)
++{
++  CURLcode result = CURLE_OK;
++
++  res_easy_setopt(curl, CURLOPT_URL, url);
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
++  res_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY_SSL_VERIFYPEER, 0L);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY_SSL_VERIFYHOST, 0L);
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
++static CURLcode run1647(CURL *curl, const char *url, const char *userpwd)
++{
++  CURLcode result = CURLE_OK;
++
++  result = init1647(curl, url, userpwd);
++  if(result)
++    return result;
++
++  return curl_easy_perform(curl);
++}
++
++static CURLcode test_lib1647(const char *URL)
++{
++  CURLcode result = CURLE_OK;
++  CURL *curl = NULL;
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
++  start_test_timing();
++
++  curl_mprintf("--- First get '%s'\n", URL);
++  result = run1647(curl, URL, libtest_arg3);
++  if(result)
++    goto test_cleanup;
++
++  curl_mprintf("--- Then get '%s'\n", libtest_arg2);
++  result = run1647(curl, libtest_arg2, libtest_arg4);
++
++test_cleanup:
++
++  /* proper cleanup sequence - type PB */
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  return result;
++}
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 5bec405eb76..193366f657c 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://CVE-2026-7168.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-8286.patch \
+    file://CVE-2026-8927.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

