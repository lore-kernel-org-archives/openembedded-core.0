Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3819C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10411.1787155073264644767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WixiPMUb;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47362928f65so1096015f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155071; x=1787759871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hd6MCsFibaoLQSIU7ZNJx1qcPwJuNl3WjNl09dDfOw0=;
        b=WixiPMUbL9OH0kf2D2al6KyzjdeDLp4OcdAUYx+mawOx0l2dDLACKnX8+K7fkUTGPY
         209qECmNWHaeBIDmcvQvGwmUypFShbnkW++QKX5ncpJ5fCbZpqJLjnOsOVBvSMFVpkQ5
         /BoQ5Vqdzu62oEzxW8yw5hSr/kTZT81wkzNOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155071; x=1787759871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hd6MCsFibaoLQSIU7ZNJx1qcPwJuNl3WjNl09dDfOw0=;
        b=MZqe5vWEHzLoWVHMjb3TZKnC+V7z4sqjh7wur52yA+Xt1jYSBwV0zgbJq1NGSoCT2b
         GZbreOmHvc4Wq+o+IdZersVyWREVaOjiwpq1AxtQBSNnm4xiS8HyRoNcSgVgheZM7b1Y
         mt63CpFuVinhN7fAIpAof3bMQ70fcI9gZ/Va74kQIs6eV/DNPa3SzVSpo0fCjVpnmFVQ
         0ljX52ORf2Uus+50GhIlQDWep7ez1bwlUqIMKfpz9PXy7DdBVeBev+DGCP89wyLIugrv
         CXJzgHZk/zZ0QlzJShdSzjmiH7W/M39heRx6PI+Zd8+09ihQLeCILxcvO6vI6X0Rbiah
         w8aw==
X-Gm-Message-State: AFuF++kdRxZjAImBFfcCSVbFvHH1eOrJVhHrNdXOhTMNtxPV6NQFAZwR
	B0ULyIdWFlYoLgh7XzlZFdISVIknSTlZsHW+B4u7FC/+d6MJHLnV3g1oKd2N9g2moYdXT/qjcwe
	ogwVEJZ4=
X-Gm-Gg: AR+sD11Qo9KUNcPmPQ0hvx2XAegPWoebbRIcr6RIaCk3QWzY5WwBhQawOAca7l89x0/
	ZoNLmPrh6f8a5eDp/6KHiWuiaSjA5/0RvaCxxiUA4303GMetT42lma6s+oUDnuyz2zgEeRdej1v
	QlpcovGdo5CPtBs1cI8fU6bjSfShkZfAVazyVbjox7fsIoTFdXCMaK92gfuvn7LTP2RGSAGe2D0
	LYSbXQHvWRfJl+T43Bk/6OxOdGke3f4sfm4ASZe3Gfs7vJRJMYnbVBQcqghwGhN07Ri/F2+ultf
	hD5R16Z0jgkWVVIL63v3Vq3nti6y+06BxzYQp3Z7RE2ARAHm+QCfjQAId50ZqwjfhxgjS3R1rih
	ojT/bJcBloeGFu5uB4mbTPsT/lnugq6Zbj0abNdpSzF9CGoE0q98Z19KSx70krsdKviVfPuuuWi
	88tKJqMbF64hZYy3xzIP5WFdOUtYEBlSGPs6Dt7bWcdLK6wmTPYU/HWKIU2/8qzVB7a5180vcSx
	xDEL1FGoGliv/8jmJPCrBUwzsZ5vwN6Zhi2RObIMVbTGDpoku+uCa8LAw5BQVNWoeTOHhnTNJgJ
	quyCvlMjKf4G/enPCItS+w/S7dul+WOhSsmwZY9J
X-Received: by 2002:a05:6000:4008:b0:47f:8f8f:db74 with SMTP id ffacd0b85a97d-482b1fd9704mr9006417f8f.12.1787155071250;
        Wed, 19 Aug 2026 08:57:51 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:50 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/37] curl: fix CVE-2026-6429
Date: Wed, 19 Aug 2026 17:56:53 +0200
Message-ID: <daf79a13dc9d59825db632b4d3eb098cad421b6c.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243758

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-6429.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://curl.se/docs/CVE-2026-6429.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429

(From OE-Core rev: 0cbfae83eebf9076f7b22d07b48cb5cef1536989)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-6429.patch             | 367 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 368 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
new file mode 100644
index 00000000000..f4df441aa2b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
@@ -0,0 +1,367 @@
+From 8191fd6d5677c30579c09a8d0988b47bbf33f65f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 5 Jun 2026 01:20:50 -0700
+Subject: [PATCH] http: clear credentials better on redirect
+
+Verify with test 2506: netrc with redirect using proxy
+
+Updated test 998 which was wrong.
+
+Reported-by: Muhamad Arga Reksapati
+
+Closes #21345
+
+CVE: CVE-2026-6429
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306]
+
+Backport Changes:
+- The upstream lib/http.c hunk adds the same-origin credential clearing to
+  Curl_http_follow(). curl-8.7.1 predates that protocol-specific redirect
+  handler and carries the equivalent redirect logic in lib/transfer.c via
+  Curl_follow(), so the full upstream lib/http.c hunk was adapted there.
+- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
+  instead of the upstream tests/data/Makefile.am and
+  tests/libtest/Makefile.am lists.
+- curl-8.7.1 does not contain test2504/lib2504, so the new
+  test2506/lib2506 entries were registered after the nearest existing
+  test2503/lib2502 entries in the target-version test lists.
+- curl-8.7.1 uses the older libtest harness, so first.h,
+  test_lib2506(), and CURLcode result handling were adapted to test.h,
+  test(), and int res.
+- Scarthgap curl-8.7.1 keeps the same incorrect redirected-request
+  Authorization expectation in tests/data/test998, so this backport removes
+  that expectation with an equivalent target-version hunk.
+
+(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/transfer.c             | 103 +++++++++++++++++++++----------------
+ tests/data/Makefile.inc    |   2 +-
+ tests/data/test2506        |  64 +++++++++++++++++++++++
+ tests/data/test998         |   1 -
+ tests/libtest/Makefile.inc |   5 +-
+ tests/libtest/lib2506.c    |  71 +++++++++++++++++++++++++
+ 6 files changed, 198 insertions(+), 48 deletions(-)
+ create mode 100644 tests/data/test2506
+ create mode 100644 tests/libtest/lib2506.c
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index a73462928d..0f5bd8ce59 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -865,49 +865,62 @@ CURLcode Curl_follow(struct Curl_easy *data,
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+
+-    /* Clear auth if this redirects to a different port number or protocol,
+-       unless permitted */
+-    if(!data->set.allow_auth_to_other_hosts && (type != FOLLOW_FAKE)) {
+-      char *portnum;
+-      int port;
+-      bool clear = FALSE;
+-
+-      if(data->set.use_port && data->state.allow_port)
+-        /* a custom port is used */
+-        port = (int)data->set.use_port;
+-      else {
+-        uc = curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
+-                          CURLU_DEFAULT_PORT);
+-        if(uc) {
+-          free(newurl);
+-          return Curl_uc_to_curlcode(uc);
+-        }
+-        port = atoi(portnum);
+-        free(portnum);
+-      }
+-      if(port != data->info.conn_remote_port) {
+-        infof(data, "Clear auth, redirects to port from %u to %u",
+-              data->info.conn_remote_port, port);
+-        clear = TRUE;
++    {
++      bool same_origin;
++      CURLU *u;
++      char *oldscheme = NULL;
++      char *oldhost = NULL;
++      char *oldport = NULL;
++      char *newscheme = NULL;
++      char *newhost = NULL;
++      char *newport = NULL;
++
++      u = curl_url();
++      if(!u) {
++        free(newurl);
++        return CURLE_OUT_OF_MEMORY;
+       }
+-      else {
+-        char *scheme;
+-        const struct Curl_handler *p;
+-        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, 0);
+-        if(uc) {
+-          free(newurl);
+-          return Curl_uc_to_curlcode(uc);
+-        }
+
+-        p = Curl_get_scheme_handler(scheme);
+-        if(p && (p->protocol != data->info.conn_protocol)) {
+-          infof(data, "Clear auth, redirects scheme from %s to %s",
+-                data->info.conn_scheme, scheme);
+-          clear = TRUE;
+-        }
+-        free(scheme);
++      uc = curl_url_set(u, CURLUPART_URL, data->state.url, 0);
++      if(!uc)
++        uc = curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
++      if(!uc)
++        uc = curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
++      if(!uc)
++        uc = curl_url_get(u, CURLUPART_PORT, &oldport, CURLU_DEFAULT_PORT);
++      if(!uc)
++        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &newscheme, 0);
++      if(!uc)
++        uc = curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0);
++      if(!uc)
++        uc = curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
++                          CURLU_DEFAULT_PORT);
++      if(uc) {
++        curl_url_cleanup(u);
++        free(oldscheme);
++        free(oldhost);
++        free(oldport);
++        free(newscheme);
++        free(newhost);
++        free(newport);
++        free(newurl);
++        return Curl_uc_to_curlcode(uc);
+       }
+-      if(clear) {
++
++      same_origin = strcasecompare(oldscheme, newscheme) &&
++                    strcasecompare(oldhost, newhost) &&
++                    !strcmp(oldport, newport);
++
++      curl_url_cleanup(u);
++      free(oldscheme);
++      free(oldhost);
++      free(oldport);
++      free(newscheme);
++      free(newhost);
++      free(newport);
++
++      if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
++         !data->set.str[STRING_USERNAME]) {
+         result = Curl_reset_userpwd(data);
+         if(result) {
+           free(newurl);
+@@ -917,12 +930,12 @@ CURLcode Curl_follow(struct Curl_easy *data,
+         Curl_safefree(data->state.aptr.passwd);
+       }
+     }
+-  }
+
+-  result = Curl_reset_proxypwd(data);
+-  if(result) {
+-    free(newurl);
+-    return result;
++    result = Curl_reset_proxypwd(data);
++    if(result) {
++      free(newurl);
++      return result;
++    }
+   }
+
+   if(type == FOLLOW_FAKE) {
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index aafd309a9d..f673f86384 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -251,7 +251,7 @@ test2300 test2301 test2302 test2303 test2304 test2305 test2306 test2307 \
+ \
+ test2400 test2401 test2402 test2403 test2404 \
+ \
+-test2500 test2501 test2502 test2503 \
++test2500 test2501 test2502 test2503 test2506 \
+ \
+ test2600 test2601 test2602 test2603 \
+ \
+diff --git a/tests/data/test2506 b/tests/data/test2506
+new file mode 100644
+index 0000000000..9c65002496
+--- /dev/null
++++ b/tests/data/test2506
+@@ -0,0 +1,64 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++<reply>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 3
++Location: http://numbertwo.example/%TESTNUMBER0002
++
++ok
++</data>
++<data2 crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 4
++
++yes
++</data2>
++</reply>
++
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++netrc with redirect using proxy
++</name>
++<file name="%LOGDIR/netrc2506">
++machine site.example login batman password robin
++</file>
++<command>
++http://%HOSTIP:%HTTPPORT http://site.example/ %LOGDIR/netrc2506
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET http://site.example/ HTTP/1.1
++Host: site.example
++Authorization: Basic %b64[batman:robin]b64%
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://numbertwo.example/25060002 HTTP/1.1
++Host: numbertwo.example
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test998 b/tests/data/test998
+index 0969d4704b..17c0a0e150 100644
+--- a/tests/data/test998
++++ b/tests/data/test998
+@@ -82,7 +82,6 @@ Proxy-Connection: Keep-Alive
+ 
+  GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
+  Host: somewhere.else.example
+- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
+  User-Agent: curl/%VERSION
+  Accept: */*
+  Proxy-Connection: Keep-Alive
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 9f7cec6027..9d3356aaf5 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -75,7 +75,7 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect libprereq      \
+  lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \
+  lib2301 lib2302 lib2304 lib2305 lib2306 \
+  lib2402 lib2404 \
+- lib2502 \
++ lib2502 lib2506 \
+  lib3010 lib3025 lib3026 lib3027 \
+  lib3100 lib3101 lib3102 lib3103
+
+@@ -684,6 +684,9 @@ lib2404_LDADD = $(TESTUTIL_LIBS)
+ lib2502_SOURCES = lib2502.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib2502_LDADD = $(TESTUTIL_LIBS)
+
++lib2506_SOURCES = lib2506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
++lib2506_LDADD = $(TESTUTIL_LIBS)
++
+ lib3010_SOURCES = lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib3010_LDADD = $(TESTUTIL_LIBS)
+
+diff --git a/tests/libtest/lib2506.c b/tests/libtest/lib2506.c
+new file mode 100644
+index 0000000000..e6dde18507
+--- /dev/null
++++ b/tests/libtest/lib2506.c
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
++#include "test.h"
++
++#include "testtrace.h"
++
++static size_t sink2506(char *ptr, size_t size, size_t nmemb, void *ud)
++{
++  (void)ptr;
++  (void)ud;
++  return size * nmemb;
++}
++
++int test(char *URL)
++{
++  CURL *curl;
++  int res = CURLE_OUT_OF_MEMORY;
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
++  test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2506);
++  test_setopt(curl, CURLOPT_PROXY, URL);
++  test_setopt(curl, CURLOPT_URL, libtest_arg2);
++  test_setopt(curl, CURLOPT_NETRC, CURL_NETRC_OPTIONAL);
++  test_setopt(curl, CURLOPT_NETRC_FILE, libtest_arg3);
++  test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
++  test_setopt(curl, CURLOPT_VERBOSE, 1L);
++
++  /* CURLOPT_UNRESTRICTED_AUTH should not make a difference because the
++     credentials come from netrc */
++  test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);
++
++  res = curl_easy_perform(curl);
++
++test_cleanup:
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return res;
++}
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 2b988654c41..8e39d821626 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
     file://CVE-2026-6276.patch \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
+    file://CVE-2026-6429.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

