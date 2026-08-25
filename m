Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A955C61DC6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:50:46 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29685.1787683841542538592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UpcFuXfA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260825185043d83ac925be000207eb-nd4ins@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260825185043d83ac925be000207eb
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 20:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zz5UV5ZGaAoe0e4EwPofM4v8tWDjtfuvW1Kzed99tnQ=;
 b=UpcFuXfAkI6JRv+n4GvV2EGgofI8Pi2Rt11CJ7VcPOQ0fFVw+t1bKgBaUi/tZwKZmn7nzM
 f2wAsoDEgtsb+J486ViKIp6d4ggpYm59QxjP3Q9409yEiYRM1FFDqxa+SgDY+RU4WIUgy8Kt
 1nBXlUJTAvJ7xSdUvUGbrnlUWJ4t7qfzb/L5HbOkgUjSZx3CCShMRhIyFt+HtYygxgZMXWmL
 UO1vkgteJt0MLtOBcet2v8OLcMksjyoVxT1UfKpk76B5HArzeYLZYBReo6l/HnvLEqqacOgC
 UsfBeo2W2+Txv5pxJ8bIgmbsgHRh09hapACDmAbb3l9Vjh8+s4R1jmBQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH v2 5/5] curl: patch CVE-2026-9546
Date: Tue, 25 Aug 2026 20:50:22 +0200
Message-ID: <20260825185022.1020129-5-peter.marko@siemens.com>
In-Reply-To: <20260825185022.1020129-1-peter.marko@siemens.com>
References: <20260825185022.1020129-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244266

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Pick also a precondition patch (containing if clause to else which is
added by the actual patch).
Resolve conflicts in test makefiles caused by differences in available
test suites.

[1] https://curl.se/docs/CVE-2026-9546.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-9546-01.patch          | 227 ++++++++++++++++++
 .../curl/curl/CVE-2026-9546-02.patch          | 216 +++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 445 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9546-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9546-02.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9546-01.patch b/meta/recipes-support/curl/curl/CVE-2026-9546-01.patch
new file mode 100644
index 0000000000..9cd1a20166
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9546-01.patch
@@ -0,0 +1,227 @@
+From fa057ea3dedb04f93672ec95ee964f1f02ec0ecf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 15 Apr 2026 08:11:33 +0200
+Subject: [PATCH] transfer: clear the old autoreferer
+
+Verify in test 2505
+
+Closes #21322
+
+CVE: CVE-2026-9546
+Upstream-Status: Backport [https://github.com/curl/curl/commit/fa057ea3dedb04f93672ec95ee964f1f02ec0ecf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/setopt.c               |  1 -
+ lib/transfer.c             |  5 +++
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test2505        | 67 +++++++++++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |  2 +-
+ tests/libtest/lib2505.c    | 71 ++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 145 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test2505
+ create mode 100644 tests/libtest/lib2505.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index dae4218b70..e832ef1afd 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -2015,7 +2015,6 @@ static CURLcode setopt_cptr(struct Curl_easy *data, CURLoption option,
+      * String to set in the HTTP Referer: field.
+      */
+     result = Curl_setstropt(&s->str[STRING_SET_REFERER], ptr);
+-    Curl_bufref_set(&data->state.referer, s->str[STRING_SET_REFERER], 0, NULL);
+     break;
+ 
+   case CURLOPT_USERAGENT:
+diff --git a/lib/transfer.c b/lib/transfer.c
+index a2fce9331b..fd1a903dab 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -535,6 +535,11 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+   data->state.authproxy.want = data->set.proxyauth;
+   Curl_safefree(data->info.wouldredirect);
+   Curl_data_priority_clear_state(data);
++  if(data->set.http_auto_referer)
++    Curl_bufref_free(&data->state.referer);
++  if(data->set.str[STRING_SET_REFERER])
++    Curl_bufref_set(&data->state.referer, data->set.str[STRING_SET_REFERER],
++                    0, NULL);
+ 
+   if(data->state.httpreq == HTTPREQ_PUT)
+     data->state.infilesize = data->set.filesize;
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 1e84b26820..238da5331c 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -265,7 +265,7 @@ test2309 \
+ \
+ test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407 \
+ \
+-test2500 test2501 test2502 test2503 test2504 test2506 \
++test2500 test2501 test2502 test2503 test2504 test 2505 test2506 \
+ \
+ test2600 test2601 test2602 test2603 test2604 test2605 \
+ \
+diff --git a/tests/data/test2505 b/tests/data/test2505
+new file mode 100644
+index 0000000000..8fac590b37
+--- /dev/null
++++ b/tests/data/test2505
+@@ -0,0 +1,67 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++referer
++autoreferer
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: server.example.com
++Content-Length: 47
++Location: %TESTNUMBER0002
++
++file contents should appear once for each file
++</data>
++
++<data2 crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: server.example.com
++Content-Length: 47
++
++file contents should appear once for each file
++</data2>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++verify CURLOPT_AUTOREFERER switched off
++</name>
++<command>
++http://%HOSTIP:%HTTPPORT
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++
++GET /%TESTNUMBER0002 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++Referer: http://%HOSTIP:%HTTPPORT/
++
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 249c6fda87..bdf8a1dbea 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -113,7 +113,7 @@ TESTS_C = \
+   lib2023.c lib2032.c lib2082.c \
+   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c \
+   lib2402.c           lib2404.c lib2405.c \
+-  lib2502.c lib2504.c lib2506.c \
++  lib2502.c lib2504.c lib2505.c lib2506.c \
+   lib2700.c \
+   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
+   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
+diff --git a/tests/libtest/lib2505.c b/tests/libtest/lib2505.c
+new file mode 100644
+index 0000000000..c170259874
+--- /dev/null
++++ b/tests/libtest/lib2505.c
+@@ -0,0 +1,71 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
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
++#include "first.h"
++
++#include "testtrace.h"
++
++static size_t sink2505(char *ptr, size_t size, size_t nmemb, void *ud)
++{
++  (void)ptr;
++  (void)ud;
++  return size * nmemb;
++}
++
++static CURLcode test_lib2505(const char *URL)
++{
++  CURL *curl;
++  CURLcode result = CURLE_OUT_OF_MEMORY;
++
++  if(curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
++    curl_mfprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  curl = curl_easy_init();
++  if(!curl) {
++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
++    curl_global_cleanup();
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2505);
++  test_setopt(curl, CURLOPT_AUTOREFERER, 1L);
++  test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
++  test_setopt(curl, CURLOPT_URL, URL);
++
++  result = curl_easy_perform(curl);
++  curl_mprintf("req1=%d\n", (int)result);
++
++  test_setopt(curl, CURLOPT_FOLLOWLOCATION, 0L);
++  test_setopt(curl, CURLOPT_URL, URL);
++
++  result = curl_easy_perform(curl);
++  curl_mprintf("req2=%d\n", (int)result);
++
++test_cleanup:
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl/CVE-2026-9546-02.patch b/meta/recipes-support/curl/curl/CVE-2026-9546-02.patch
new file mode 100644
index 0000000000..4306b508d1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9546-02.patch
@@ -0,0 +1,216 @@
+From 862e8a74a84478d82973471b4f49dc2746c1780e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 25 May 2026 16:43:00 +0200
+Subject: [PATCH] transfer: clear referer when set to NULL
+
+Verify in test 1649
+
+Closes #21741
+
+CVE: CVE-2026-9546
+Upstream-Status: Backport [https://github.com/curl/curl/commit/862e8a74a84478d82973471b4f49dc2746c1780e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/transfer.c             |  2 +
+ tests/data/Makefile.am     |  1 +
+ tests/data/test1649        | 55 +++++++++++++++++++++++
+ tests/libtest/Makefile.inc |  1 +
+ tests/libtest/lib1649.c    | 90 ++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 149 insertions(+)
+ create mode 100644 tests/data/test1649
+ create mode 100644 tests/libtest/lib1649.c
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 721ad8d9ce..49930518ee 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -540,6 +540,8 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+   if(data->set.str[STRING_SET_REFERER])
+     Curl_bufref_set(&data->state.referer, data->set.str[STRING_SET_REFERER],
+                     0, NULL);
++  else
++    Curl_bufref_free(&data->state.referer);
+ 
+   if(data->state.httpreq == HTTPREQ_PUT)
+     data->state.infilesize = data->set.filesize;
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 238da5331c..e8feaf3533 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -217,6 +217,7 @@ test1614 test1615 test1616 test1617 \
+ test1620 test1621 test1622 test1623 test1624 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 test1636 test1637 \
++test1649 \
+ \
+ test1640 test1641 test1642 test1643 \
+ \
+diff --git a/tests/data/test1649 b/tests/data/test1649
+new file mode 100644
+index 0000000000..d2fd7799bd
+--- /dev/null
++++ b/tests/data/test1649
+@@ -0,0 +1,55 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++Referer
++</keywords>
++</info>
++
++# Server-side
++<reply>
++
++# this is returned first since we get no proxy-auth
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Content-Length: 6
++
++hello
++</data>
++
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++Set referer first then NULL it
++</name>
++<command>
++http://%HOSTIP:%HTTPPORT
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++Referer: https://secret.example.com/
++
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++
++</protocol>
++
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index ad86411a7f..d9a94a1e71 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -100,6 +100,7 @@ TESTS_C = \
+   lib1582.c lib1588.c \
+   lib1591.c lib1592.c lib1593.c lib1594.c                     lib1597.c \
+   lib1598.c lib1599.c \
++  lib1649.c \
+   lib1662.c \
+   lib1900.c lib1901.c lib1902.c lib1903.c lib1905.c lib1906.c lib1907.c \
+   lib1908.c           lib1910.c lib1911.c lib1912.c lib1913.c \
+diff --git a/tests/libtest/lib1649.c b/tests/libtest/lib1649.c
+new file mode 100644
+index 0000000000..2dd66c0231
+--- /dev/null
++++ b/tests/libtest/lib1649.c
+@@ -0,0 +1,90 @@
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
++#include "first.h"
++
++/* this is meant to pick up the proxy from the environment variable */
++static CURLcode init1649(CURL *curl, const char *url)
++{
++  CURLcode result = CURLE_OK;
++
++  res_easy_setopt(curl, CURLOPT_URL, url);
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
++static CURLcode run1649(CURL *curl, const char *url)
++{
++  CURLcode result = CURLE_OK;
++
++  result = init1649(curl, url);
++  if(result)
++    return result;
++
++  return curl_easy_perform(curl);
++}
++
++static CURLcode test_lib1649(const char *URL)
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
++  easy_setopt(curl, CURLOPT_REFERER, "https://secret.example.com/");
++
++  result = run1649(curl, URL);
++  if(result)
++    goto test_cleanup;
++
++  /* reset it */
++  easy_setopt(curl, CURLOPT_REFERER, NULL);
++
++  result = run1649(curl, URL);
++
++test_cleanup:
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index e228618cc3..73d4394ca9 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -30,6 +30,8 @@ SRC_URI = " \
     file://CVE-2026-9080.patch \
     file://CVE-2026-9545-01.patch \
     file://CVE-2026-9545-02.patch \
+    file://CVE-2026-9546-01.patch \
+    file://CVE-2026-9546-02.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

