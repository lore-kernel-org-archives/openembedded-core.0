Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08676C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:48:23 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34947.1782730092869442519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CFxMcHrs;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12008; q=dns/txt;
  s=iport01; t=1782730092; x=1783939692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M/UA6ag285o0KISDa2a++LhMn9eB9lBpi9Mk0kGwz2U=;
  b=CFxMcHrs8rcquWub4O2fgUNdz3hTgMIHLWIVNeeAiaD3HzCiaLFkm3cP
   cjDjot6kocZ8LX/5VIfsNPsWxVrqquTGfQyhpd3IfHVtlwi4eoyamx3lb
   /4hHUhkUwcyzwTqZiarSCVJ6YwC/5EOPwb6fkiYwVmfqN2APX9z9wDqyG
   qpe2yWom5fo/AxG8VZ5LTVdNef6mb3ePjoAZ8EBqqTVJqOXTvYUuIz3He
   sHkp+VgMM9Q1xiAmTGxNfLuTsmosU4iP6hM53EWuqeQ6pJYklyZ8Ppi6D
   cN3D5Uc0dZwnlb+r8BrKUoGK0tGJXNDLpeUwf3Hyq8un6r8eCXr+gU2rx
   g==;
X-CSE-ConnectionGUID: vT2A90vlR/ex8ijeU/VfEQ==
X-CSE-MsgGUID: 4PY1kugmRWu8iQxUoT4NEg==
X-IPAS-Result: =?us-ascii?q?A0AIAABFTEJq/43/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF8BgEBAQsBglZ0X0JJjHOJWAOeGxSBag8BAQEPRA0EAQGBcQEggnQCj?=
 =?us-ascii?q?UsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECA?=
 =?us-ascii?q?QMnCwEYAS0QHAMBAi8rIwgZgwIBgnMCAREGtg+BeTOBAYMoATEFCQICQAFQ2?=
 =?us-ascii?q?ywBCxQBBYEzAYU+iB9bGAGEfCcbG4FygRWDaYEFgTIqAQEBgSIlhl0EgiKBD?=
 =?us-ascii?q?IFaHoF6J4Fhiw9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBH?=
 =?us-ascii?q?YFpgQSEfSMfAzl/gTB1WGYVMDWBAgERHgqBUicDCxgNSBEsNxQbBD5uB4xeF?=
 =?us-ascii?q?w+CPTEpBgEaBwwBExYBAS9WE2o7Cx6SdAcdkAOCIYE1n1oKKIN1jCGVOhozh?=
 =?us-ascii?q?VulEZkIjgqIK41VUIRogWg8gUcLB3AVgyIJFjQZD1eNVgsLg2CBf4RBwhAkN?=
 =?us-ascii?q?QIJMgEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:2/RKxaAlpHzGJhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD8r0zEOy
 WIYCGHQbKvcYWXzKNokbYzno0lUvpbWn9JiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH/i2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3ck0JRBuI4kivetnUWBM+
 MFfFj4gV0XW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FEpiuCzboqEI7RmQ+0JpnfBp
 X/J+l7GH0EbDcyizgbZ1F+j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:d9TvnqkQVqvMwm5pu4FuXyvV1ZPpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3AVXGoWGlb2kFuLGwSIMGheYftGC/XOWPhll6Be1G?=
 =?us-ascii?q?8MyFkWO2US1Ktv51qvvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AkwWzygzvGtVKtX2xsUkjVQ/QUhmaqPiWORkOjJo?=
 =?us-ascii?q?DgfaZZS1JKwqasGiRb4Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502066891"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 10:48:11 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id A98A918000491;
	Mon, 29 Jun 2026 10:48:11 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 544ABCC12A9; Mon, 29 Jun 2026 03:48:11 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 5/7] curl: fix CVE-2026-6276
Date: Mon, 29 Jun 2026 03:47:55 -0700
Message-ID: <20260629104801.972184-5-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239749

From: Anil Dongare <adongare@cisco.com>

Backport the upstream fix [1] for the stale custom Host cookie leak
described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c92db
[2] https://curl.se/docs/CVE-2026-6276.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6276

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../curl/curl/CVE-2026-6276.patch             | 338 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
new file mode 100644
index 0000000000..fc4d704cd2
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
@@ -0,0 +1,338 @@
+From 5b15ebefcadb79cfdfd9236a3915469dded3d789 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 5 Jun 2026 01:19:43 -0700
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
+Backport Changes:
+- curl-8.7.1 still stores the custom Host cookie override in
+  data->state.aptr on this older tree. This backport moves that state into
+  struct SingleRequest in the 8.7.1 layout and wires the matching cleanup
+  through Curl_http_host(), Curl_req_hard_reset(), Curl_close(), and
+  lib/urldata.h.
+- curl-8.7.1 uses tests/data/Makefile.inc and tests/libtest/Makefile.inc
+  instead of the upstream Automake lists touched by the original commit.
+
+(cherry picked from commit 3a19987a87f393d9394fe5acc7643f6c263c92db)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/http.c                 | 15 +++---
+ lib/request.c              |  3 ++
+ lib/request.h              |  3 ++
+ lib/url.c                  |  4 ++--
+ lib/urldata.h              |  1 -
+ tests/data/Makefile.inc    |  2 +-
+ tests/data/test2504        | 52 +++++++++++++++++++++
+ tests/libtest/Makefile.inc |  5 +-
+ tests/libtest/lib2504.c    | 93 ++++++++++++++++++++++++++++++++++++++
+ 9 files changed, 168 insertions(+), 10 deletions(-)
+ create mode 100644 tests/data/test2504
+ create mode 100644 tests/libtest/lib2504.c
+
+diff --git a/lib/http.c b/lib/http.c
+index 3ab6d21..d2de421 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1748,6 +1748,9 @@ CURLcode Curl_http_host(struct Curl_easy *data, struct connectdata *conn)
+     data->state.first_remote_protocol = conn->handler->protocol;
+   }
+   Curl_safefree(aptr->host);
++#if !defined(CURL_DISABLE_COOKIES)
++  Curl_safefree(data->req.cookiehost);
++#endif
+
+   ptr = Curl_checkheaders(data, STRCONST("Host"));
+   if(ptr && (!data->state.this_is_a_follow ||
+@@ -1782,8 +1785,8 @@ CURLcode Curl_http_host(struct Curl_easy *data, struct connectdata *conn)
+         if(colon)
+           *colon = 0; /* The host must not include an embedded port number */
+       }
+-      Curl_safefree(aptr->cookiehost);
+-      aptr->cookiehost = cookiehost;
++      Curl_safefree(data->req.cookiehost);
++      data->req.cookiehost = cookiehost;
+     }
+ #endif
+
+@@ -2302,8 +2305,8 @@ CURLcode Curl_http_cookies(struct Curl_easy *data,
+     int count = 0;
+
+     if(data->cookies && data->state.cookie_engine) {
+-      const char *host = data->state.aptr.cookiehost ?
+-        data->state.aptr.cookiehost : conn->host.name;
++      const char *host = data->req.cookiehost ?
++        data->req.cookiehost : conn->host.name;
+       const bool secure_context =
+         conn->handler->protocol&(CURLPROTO_HTTPS|CURLPROTO_WSS) ||
+         strcasecompare("localhost", host) ||
+@@ -3121,8 +3124,8 @@ CURLcode Curl_http_header(struct Curl_easy *data, struct connectdata *conn,
+     if(v) {
+       /* If there is a custom-set Host: name, use it here, or else use
+        * real peer host name. */
+-      const char *host = data->state.aptr.cookiehost?
+-        data->state.aptr.cookiehost:conn->host.name;
++      const char *host = data->req.cookiehost?
++        data->req.cookiehost:conn->host.name;
+       const bool secure_context =
+         conn->handler->protocol&(CURLPROTO_HTTPS|CURLPROTO_WSS) ||
+         strcasecompare("localhost", host) ||
+diff --git a/lib/request.c b/lib/request.c
+index b3b0582..9bede2e 100644
+--- a/lib/request.c
++++ b/lib/request.c
+@@ -111,6 +111,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, struct Curl_easy *data)
+    * free this safely without leaks. */
+   Curl_safefree(req->p.http);
+   Curl_safefree(req->newurl);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(req->cookiehost);
++#endif
+   Curl_client_reset(data);
+   if(req->sendbuf_init)
+     Curl_bufq_reset(&req->sendbuf);
+diff --git a/lib/request.h b/lib/request.h
+index 488fbdd..17d50a3 100644
+--- a/lib/request.h
++++ b/lib/request.h
+@@ -118,6 +118,9 @@ struct SingleRequest {
+ #ifndef CURL_DISABLE_DOH
+   struct dohdata *doh; /* DoH specific data for this request */
+ #endif
++#ifndef CURL_DISABLE_COOKIES
++  char *cookiehost;
++#endif
+ #ifndef CURL_DISABLE_COOKIES
+   unsigned char setcookies;
+ #endif
+diff --git a/lib/url.c b/lib/url.c
+index 34a3470..d34b494 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -313,7 +313,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_safefree(data->state.aptr.rangeline);
+   Curl_safefree(data->state.aptr.ref);
+   Curl_safefree(data->state.aptr.host);
+-  Curl_safefree(data->state.aptr.cookiehost);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+   Curl_safefree(data->state.aptr.rtsp_transport);
+   Curl_safefree(data->state.aptr.user);
+   Curl_safefree(data->state.aptr.passwd);
+diff --git a/lib/urldata.h b/lib/urldata.h
+index b68d023..4fc595a 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1339,7 +1339,6 @@ struct UrlState {
+     char *rangeline;
+     char *ref;
+     char *host;
+-    char *cookiehost;
+     char *rtsp_transport;
+     char *te; /* TE: request header */
+
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index aafd309..9278dac 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -251,7 +251,7 @@ test2300 test2301 test2302 test2303 test2304 test2305 test2306 test2307 \
+ \
+ test2400 test2401 test2402 test2403 test2404 \
+ \
+-test2500 test2501 test2502 test2503 \
++test2500 test2501 test2502 test2503 test2504 \
+ \
+ test2600 test2601 test2602 test2603 \
+ \
+diff --git a/tests/data/test2504 b/tests/data/test2504
+new file mode 100644
+index 0000000..8cec1c8
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
+index 9f7cec6..4653d12 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -75,7 +75,7 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect libprereq      \
+  lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \
+  lib2301 lib2302 lib2304 lib2305 lib2306 \
+  lib2402 lib2404 \
+- lib2502 \
++ lib2502 lib2504 \
+  lib3010 lib3025 lib3026 lib3027 \
+  lib3100 lib3101 lib3102 lib3103
+
+@@ -684,6 +684,9 @@ lib2404_LDADD = $(TESTUTIL_LIBS)
+ lib2502_SOURCES = lib2502.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib2502_LDADD = $(TESTUTIL_LIBS)
+
++lib2504_SOURCES = lib2504.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
++lib2504_LDADD = $(TESTUTIL_LIBS)
++
+ lib3010_SOURCES = lib3010.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib3010_LDADD = $(TESTUTIL_LIBS)
+
+diff --git a/tests/libtest/lib2504.c b/tests/libtest/lib2504.c
+new file mode 100644
+index 0000000..72b965d
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
+--
+2.43.7
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index cead7fe6d4..dc8060e480 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -38,6 +38,7 @@ SRC_URI = " \
     file://CVE-2026-3784.patch \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
+    file://CVE-2026-6276.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.51.0


