Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0B6C54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 09:27:52 +0000 (UTC)
Received: from naesa04.arrow.com (naesa04.arrow.com [216.150.161.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7731.1785403669852006730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 02:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=V+TT0Rl9;
 spf=pass (domain: einfochips.com, ip: 216.150.161.24, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=9511; q=dns/txt;
  s=NAESA-Selector1; t=1785403670; x=1816939670;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ms8C1OuAbA+OyzfXmCNpNV4hE4eUhZiE3hxFah3Co4k=;
  b=V+TT0Rl9q77v2TzJ4XtorCp1imnDNdQCQhS0Fv3G9vihkluSczKhdxkg
   OXEhGNxmwoBy011HsAeJkD75du1V4+vWICVGiHGAx2CwDry+WPVehdRXv
   kOENXWkduHoytgjrbfZ8lM9j7hSbRliu9rbqwdnCD/r5A4O6q2fcJBNGP
   eZtQC8tiBbWfUawUKC4WzXEBBTtIkb3QWu5vObbeV0rwqmGmD8YhQpGkM
   /Rd06ZeKqpssfiF+CUROfXFL3tGNLjvXqOIMkThbETMvaxg5OZX1+uxUp
   l7/r518QsaLp1ZwZAs8tXiT6DQ/vDVKoy9XhRd8qcuPVlQaD2UAttK5Km
   g==;
X-CSE-ConnectionGUID: Un4Cd9Q8RWuDO6St0QKoXQ==
X-CSE-MsgGUID: to1zYcxfS7aSu4NrQt/Wng==
X-IronPort-AV: E=Sophos;i="6.25,194,1779170400"; 
   d="scan'208";a="118742959"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa04out.arrow.com with ESMTP; 30 Jul 2026 03:27:48 -0600
From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][Wrynose][PATCH] curl: Fix for CVE-2026-9079
Date: Thu, 30 Jul 2026 14:57:28 +0530
Message-ID: <20260730092746.1991111-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 09:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242331

Pick patch from [1] mentioned in [2] taken from NVD report in [3].

[1] https://github.com/curl/curl/commit/88c7e16cceec816a2df45c89
[2] https://curl.se/docs/CVE-2026-9079.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-9079

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../curl/curl/CVE-2026-9079.patch             | 289 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 290 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9079.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9079.patch b/meta/recipes-support/curl/curl/CVE-2026-9079.patch
new file mode 100644
index 0000000000..9ede69c769
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9079.patch
@@ -0,0 +1,289 @@
+From 4a73a6ac6d55d028797d2492a8bfeb1af1a76647 Mon Sep 17 00:00:00 2001
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
+ lib/setopt.c               |  14 ++--
+ tests/data/Makefile.am     |   2 +-
+ tests/data/test1648        |  63 +++++++++++++++++
+ tests/libtest/Makefile.inc |   1 +
+ tests/libtest/lib1648.c    | 135 +++++++++++++++++++++++++++++++++++++
+ 5 files changed, 207 insertions(+), 8 deletions(-)
+ create mode 100644 tests/data/test1648
+ create mode 100644 tests/libtest/lib1648.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 84f3e02b7b..a75523dcd8 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -1679,16 +1679,16 @@ static CURLcode setopt_cptr_proxy(struct Curl_easy *data, CURLoption option,
+     result = setstropt_userpwd(ptr, &u, &p);
+ 
+     /* URL decode the components */
+-    if(!result && u) {
+-      Curl_safefree(s->str[STRING_PROXYUSERNAME]);
+-      result = Curl_urldecode(u, 0, &s->str[STRING_PROXYUSERNAME], NULL,
+-                              REJECT_ZERO);
++    if(!result) {
++      Curl_safefree(s->str[STRING_PROXYUSERNAME]);
++      Curl_safefree(s->str[STRING_PROXYPASSWORD]);
++      if(u)
++        result = Curl_urldecode(u, 0, &s->str[STRING_PROXYUSERNAME], NULL,
++                                REJECT_ZERO);
+     }
+-    if(!result && p) {
+-      Curl_safefree(s->str[STRING_PROXYPASSWORD]);
++    if(!result && p)
+       result = Curl_urldecode(p, 0, &s->str[STRING_PROXYPASSWORD], NULL,
+                               REJECT_ZERO);
+-    }
+     curlx_free(u);
+     curlx_free(p);
+     break;
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 1b76b01a8c..c92dea0441 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -218,7 +218,7 @@ test1620 test1621 test1622 test1623 test1624 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 test1636 test1637 \
+ \
+-test1640 test1641 test1642 test1643 \
++test1640 test1641 test1642 test1643 test1648 \
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
+index 2f77c16975..ad6fe9aa6c 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -100,6 +100,7 @@ TESTS_C = \
+   lib1582.c \
+   lib1591.c lib1592.c lib1593.c lib1594.c                     lib1597.c \
+   lib1598.c lib1599.c \
++  lib1648.c \
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
index 6ad0daa59d..825579c211 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
+    file://CVE-2026-9079.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


