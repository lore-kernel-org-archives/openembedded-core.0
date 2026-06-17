Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1A7CD98F4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10438.1781682488030188937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EHjMv7/+;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4602e2a0372so4249151f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682486; x=1782287286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfPgrIfQZmbbJWP79h1om46Wcs87FIo+4i4+JhkhXYw=;
        b=EHjMv7/+N3q6lA2XnAZhjJhLfHq/G395AH60Bsh8ncrXJYqMrZF/B+2Tst9AeqchPv
         xfqFCT7i8PJQ4WDIKv1ZW7GhCEzxzMOVQ0LJzS2cfzTC+ObnprykzMnMboDrPsQmHPQi
         kUDO6VWr3RLj0AsXybAEt+z+7c8DjKsrx3WZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682486; x=1782287286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PfPgrIfQZmbbJWP79h1om46Wcs87FIo+4i4+JhkhXYw=;
        b=tRkcuvkeUl6WTC+czJhiwcNVkgV5DoUgDz8fAvZUTAzWtkqA0xri2+9IgCmjdL1txY
         kC3WfUsUa/Xt3JQhNEpPIgrahe9cMCqe+lyJvG6Rm1+q5S5XQAV3z34ATmaV+8YOwlHD
         Ff108YrJe5TMYuMyQmMSHVCvkoZsZnaQlUlaSGemjbXZizA1s2ZvQgxrXcaxH9GXwyYA
         12HTyDRgDdve9kjF+3hVLdaF6vBo1omrfmnm4TFi/LJQU61adB2j0ZSNsqYcu3TSBxTT
         9BX8e1gbSLp45WzMQR806HLgerUSq9di6FLtpin3mxJJxKed0NXHnaY/ahjSD+/UE5UX
         DOag==
X-Gm-Message-State: AOJu0YxhVM/jTyKWhDkcM/bcK5BQGWu8Oqd7we3LWBMGPdOUw4BxC6xT
	HAsLJhy90ZYsxM4gHbuELNFSkasDJubVCL7zIh2uBZ/hBcWWVZO+5XfhV/PH2//zKQnkTHfyZ6S
	tyiiJ
X-Gm-Gg: AfdE7cmObjT1bnMA2whEkvBNc6y2dCxOkIF/pAkOiGWRdeLNPkZRitU99+MBKgWssk4
	VyglMy/K0AtAL5RX8holDbVJL4X2rvFf/Y6Yft4kwoZ2mWrtyUM+uQzg7qsQWDi3g2AFRp8LzgE
	/xoeKxudl5VrAdLB+6z2BUj3mh/FsPNGQUXpnyn42lvAiZg8x5/rjJSV5HKIZZ6ZQBToJ8aF1r2
	XZWZFw0m1Kj8PgArBdCHedSK8Y0gfs2Kk2XUEQLH1rqZYxejHHMAOd6Dz9xaou88xrpkIttvDQj
	hB/KUrujrJgHcFtPtbgeAguRNYwY6WYaF6cWq4jrn2nOD/rMR9cqb2ShR/7pnUPABGtCBmf5RMh
	KR+ak8CDCimMtcQGrpRLA2J7oU+ywqJBQCPNzQWZmQVnlROrfKh6CJ0KI29I42aFsifQicK8uoV
	7XxKW17Fk1FD66nZXAsVAfMwXzUI4NxcF8HWPiP2OL+FuvxJNmwFTtEKL3BJEKkKrBfTkcFz2l/
	jeqsUQvGylhSej2lqBZakMP+WCZ
X-Received: by 2002:a5d:6843:0:b0:462:943:7ad8 with SMTP id ffacd0b85a97d-462412c7546mr3107763f8f.31.1781682485970;
        Wed, 17 Jun 2026 00:48:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 1/8] curl: fix CVE-2026-6276
Date: Wed, 17 Jun 2026 09:47:52 +0200
Message-ID: <b43ed650101eb2b1b17d567d960319a4965e278e.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239016

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-6276.
https://nvd.nist.gov/vuln/detail/CVE-2026-6276

Upstream fix:
  https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c92db

Adapted for curl 8.19.0:
- Use Curl_safefree (upstream uses curlx_safefree, renamed in later versions)
- Drop req->userpwd/req->proxyuserpwd context (not yet moved to
  SingleRequest in this version)

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
[YC: fixed indent in curl_8.19.0.bb]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-6276.patch             | 315 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 316 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
new file mode 100644
index 00000000000..68bec24e946
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
@@ -0,0 +1,315 @@
+From 48d71bc976572aaf09c63ab86b5165762450a507 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 14 Apr 2026 08:51:44 +0200
+Subject: [PATCH] urldata: move cookiehost to struct SingleRequest
+
+To make it scoped for the single request appropriately.
+
+Reported-by: Muhamad Arga Reksapati
+
+Verify with libtest 2504: a custom Host *disabled* on reused handle
+
+Closes #21312
+
+CVE: CVE-2026-6276
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c92db]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/http.c                 | 14 +++---
+ lib/request.c              |  3 ++
+ lib/request.h              |  3 ++
+ lib/url.c                  |  2 +-
+ lib/urldata.h              |  3 --
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test2504        | 52 +++++++++++++++++++++
+ tests/libtest/Makefile.inc |  2 +-
+ tests/libtest/lib2504.c    | 93 ++++++++++++++++++++++++++++++++++++++
+ 9 files changed, 162 insertions(+), 12 deletions(-)
+ create mode 100644 tests/data/test2504
+ create mode 100644 tests/libtest/lib2504.c
+
+diff --git a/lib/http.c b/lib/http.c
+index 188da5fd83..7ebbdfa551 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2002,6 +2002,9 @@ static CURLcode http_set_aptr_host(struct Curl_easy *data)
+     data->state.first_remote_protocol = conn->scheme->protocol;
+   }
+   Curl_safefree(aptr->host);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+ 
+   ptr = Curl_checkheaders(data, STRCONST("Host"));
+   if(ptr && (!data->state.this_is_a_follow ||
+@@ -2037,8 +2040,7 @@ static CURLcode http_set_aptr_host(struct Curl_easy *data)
+         if(colon)
+           *colon = 0; /* The host must not include an embedded port number */
+       }
+-      curlx_free(aptr->cookiehost);
+-      aptr->cookiehost = cookiehost;
++      data->req.cookiehost = cookiehost;
+     }
+ #endif
+ 
+@@ -2538,8 +2540,8 @@ static CURLcode http_cookies(struct Curl_easy *data,
+ 
+     if(data->cookies && data->state.cookie_engine) {
+       bool okay;
+-      const char *host = data->state.aptr.cookiehost ?
+-        data->state.aptr.cookiehost : data->conn->host.name;
++      const char *host = data->req.cookiehost ?
++        data->req.cookiehost : data->conn->host.name;
+       Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGLE);
+       result = Curl_cookie_getlist(data, data->conn, &okay, host, &list);
+       if(!result && okay) {
+@@ -3545,8 +3547,8 @@ static CURLcode http_header_s(struct Curl_easy *data,
+   if(v) {
+     /* If there is a custom-set Host: name, use it here, or else use
+      * real peer hostname. */
+-    const char *host = data->state.aptr.cookiehost ?
+-      data->state.aptr.cookiehost : conn->host.name;
++    const char *host = data->req.cookiehost ?
++      data->req.cookiehost : conn->host.name;
+     const bool secure_context = Curl_secure_context(conn, host);
+     CURLcode result;
+     Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGLE);
+diff --git a/lib/request.c b/lib/request.c
+index 66077530d7..765dbac058 100644
+--- a/lib/request.c
++++ b/lib/request.c
+@@ -113,6 +113,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, struct Curl_easy *data)
+   struct curltime t0 = { 0, 0 };
+ 
+   Curl_safefree(req->newurl);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(req->cookiehost);
++#endif
+   Curl_client_reset(data);
+   if(req->sendbuf_init)
+     Curl_bufq_reset(&req->sendbuf);
+diff --git a/lib/request.h b/lib/request.h
+index 5332d48538..6e4bd0fb6e 100644
+--- a/lib/request.h
++++ b/lib/request.h
+@@ -95,6 +95,9 @@ struct SingleRequest {
+   char *newurl;     /* Set to the new URL to use when a redirect or a retry is
+                        wanted */
+ 
++#ifndef CURL_DISABLE_COOKIES
++  char *cookiehost;
++#endif
+ #ifndef CURL_DISABLE_COOKIES
+   unsigned char setcookies;
+ #endif
+diff --git a/lib/url.c b/lib/url.c
+index ec0457bcdd..b9e308add2 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -304,7 +304,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_safefree(data->state.aptr.ref);
+   Curl_safefree(data->state.aptr.host);
+ #ifndef CURL_DISABLE_COOKIES
+-  Curl_safefree(data->state.aptr.cookiehost);
++  Curl_safefree(data->req.cookiehost);
+ #endif
+ #ifndef CURL_DISABLE_RTSP
+   Curl_safefree(data->state.aptr.rtsp_transport);
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 5ae148054b..d71337c8f6 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1052,9 +1052,6 @@ struct UrlState {
+     char *rangeline;
+     char *ref;
+     char *host;
+-#ifndef CURL_DISABLE_COOKIES
+-    char *cookiehost;
+-#endif
+ #ifndef CURL_DISABLE_RTSP
+     char *rtsp_transport;
+ #endif
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 53abf60901..da0f8f55d4 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -264,7 +264,7 @@ test2309 \
+ \
+ test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407 \
+ \
+-test2500 test2501 test2502 test2503 \
++test2500 test2501 test2502 test2503 test2504 \
+ \
+ test2600 test2601 test2602 test2603 test2604 test2605 \
+ \
+diff --git a/tests/data/test2504 b/tests/data/test2504
+new file mode 100644
+index 0000000000..8cec1c8210
+--- /dev/null
++++ b/tests/data/test2504
+@@ -0,0 +1,52 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: server.example.com
++Content-Length: 47
++Set-Cookie: sid=SECRET123; Path=/
++
++file contents should appear once for each file
++</data>
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
++custom Host with cookie, handle reuse, no custom Host:
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
++Host: victim.internal
++Accept: */*
++
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index e3202804a9..2319bafe72 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -113,7 +113,7 @@ TESTS_C = \
+   lib2023.c lib2032.c lib2082.c \
+   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c \
+   lib2402.c           lib2404.c lib2405.c \
+-  lib2502.c \
++  lib2502.c lib2504.c \
+   lib2700.c \
+   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
+   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
+diff --git a/tests/libtest/lib2504.c b/tests/libtest/lib2504.c
+new file mode 100644
+index 0000000000..72b965d6e6
+--- /dev/null
++++ b/tests/libtest/lib2504.c
+@@ -0,0 +1,93 @@
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
++static size_t sink2504(char *ptr, size_t size, size_t nmemb, void *ud)
++{
++  (void)ptr;
++  (void)ud;
++  return size * nmemb;
++}
++
++static void dump_cookies2504(CURL *h, const char *tag)
++{
++  struct curl_slist *cookies = NULL;
++  struct curl_slist *nc;
++  CURLcode rc = curl_easy_getinfo(h, CURLINFO_COOKIELIST, &cookies);
++
++  curl_mprintf("== %s ==\n", tag);
++  if(rc) {
++    curl_mprintf("getinfo error: %d\n", (int)rc);
++    return;
++  }
++  for(nc = cookies; nc; nc = nc->next)
++    puts(nc->data);
++  curl_slist_free_all(cookies);
++}
++
++static CURLcode test_lib2504(const char *URL)
++{
++  CURL *curl;
++  CURLcode result = CURLE_OUT_OF_MEMORY;
++  struct curl_slist *hdrs = NULL;
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
++  hdrs = curl_slist_append(hdrs, "Host: victim.internal");
++  if(hdrs) {
++    test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2504);
++    test_setopt(curl, CURLOPT_COOKIEFILE, "");
++    test_setopt(curl, CURLOPT_HTTPHEADER, hdrs);
++    test_setopt(curl, CURLOPT_URL, URL);
++
++    result = curl_easy_perform(curl);
++    curl_mprintf("req1=%d\n", (int)result);
++    dump_cookies2504(curl, "after request 1");
++
++    test_setopt(curl, CURLOPT_HTTPHEADER, NULL);
++    test_setopt(curl, CURLOPT_URL, URL);
++
++    result = curl_easy_perform(curl);
++    curl_mprintf("req2=%d\n", (int)result);
++    dump_cookies2504(curl, "after request 2");
++  }
++test_cleanup:
++  curl_slist_free_all(hdrs);
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index b9251336b8b..9aa2ccb7870 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2026-6276.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

