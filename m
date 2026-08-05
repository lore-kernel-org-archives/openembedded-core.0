Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0F7C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:23 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35941.1785918681011104808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S183TDGS;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11502; q=dns/txt;
  s=iport01; t=1785918681; x=1787128281;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AaWItv2+P+kQU3lGj6B5wm20guCYneWnlQR1Wp0fWiA=;
  b=S183TDGS7XpVKJbDm8bjnyFSYr7LIWQ4NiA+8u/bw5bt1vyTDb5Mnn1O
   oBM6c+KYI0aEfcVlS6vPc0KVzBBhKQQNDrCuKOwQgmpyNR2kTxuicLEeF
   5hcNO3rNU/hz5JH2ZeY6MjATQu0Q4DkSudKiIFFhs6FR2uXm6tapIWxlm
   iw4GaHky9xIoYg6707YCo3IJdONlMNWFyCQjBstdGOsdKdm3tDHFB7ZUL
   EjHdTrNUmd5BtRBOLL5pRhr+8h7P2lDgcmKSaA51ceoXmhcQAa2Kk8RwQ
   nzjlRoEcxCcKYXsbjVoBWZKcnsUHko84TMz+UXG4Te6OBQ5hKor7BeREU
   A==;
X-CSE-ConnectionGUID: b+DFdkF2TfSOaj+kY0FoDQ==
X-CSE-MsgGUID: J8OOHThWQhuAoea+Vpzo7Q==
X-IPAS-Result: =?us-ascii?q?A0AaAACA83Jq/9BK/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBghc/dF9CSYxyhzeCIQOeGxSBag8BAQEPRA0EAQGBcQEggnMCjWYCJ?=
 =?us-ascii?q?jQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMnC?=
 =?us-ascii?q?wEYAT0cAwECLysjCBEIgwIBgnQDEQa9WoF5M4EBgygBPwICQAFQ2y4BCxQBg?=
 =?us-ascii?q?TgBhT6IIV0YAYNdgR8nGxuBcoEVg2mBBYFcAgEBgSEDASGGXQSCIoEMgVqBJ?=
 =?us-ascii?q?oF+jVNIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBwWBHYEohG0jG?=
 =?us-ascii?q?TZ8gQlegS0qZRIXgQmCewKCem8LGA1IESw3FBkEPm4HjWggggg3ATEvASECC?=
 =?us-ascii?q?gEpAQEEKyGBMgIoEQwVCJJoDAoakAOCHoE4n1oKKIN1jCGVOhozhASBV5JAk?=
 =?us-ascii?q?lGZCI4KlTQ0aIRpgWg8gVlwFYMiCQkNNBkPVo1XCwuBFAECYYFohkDFYTw1A?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJAALIFSAQE?=
IronPort-Data: A9a23:NfRi76sY1siOAeHvOMcMMgHjPOfnVAJfMUV32f8akzHdYApBsoF/q
 tZmKW7TaP2NNmKmL9hxa4zipEtQsJXVxtFiHgJlrCBkQn8RgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Lb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8KVbL21N2
 6YkJgsqZxLAhNPu7rWXc7w57igjBJGD0II3s3x6iDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgd/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J43WHpQPxBvwS
 mTu3TTeJTEmNOOmySes9X+lxdHXjySkYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:RfUizaFB40D5NtVSpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:2DrWd2AIFyIOMRL6EyMk2GAYGe5/TnPm637SYEyJUUhuZITAHA==
X-Talos-MUID: 9a23:aJ3DTAvpkBKf1HR0g82npmFFE+dU45uXCF0klpgP+PecJysvAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="59439225"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:18 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 8B47B1800020D
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:18 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 50A34CC037D; Wed,  5 Aug 2026 14:01:17 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 3/8] curl: fix CVE-2026-8927
Date: Wed,  5 Aug 2026 14:00:58 +0530
Message-Id: <20260805083103.2633995-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242841

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream curl security fix backport for
CVE-2026-8927. The upstream fix commit is referenced in [1],
and the public curl advisory is referenced in [2]. The backported
commit link is also recorded in the embedded patch header.

[1] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567
[2] https://curl.se/docs/CVE-2026-8927.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-8927.patch             | 349 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
new file mode 100644
index 0000000000..653d908eb5
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
index 5bec405eb7..193366f657 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://CVE-2026-7168.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-8286.patch \
+    file://CVE-2026-8927.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


