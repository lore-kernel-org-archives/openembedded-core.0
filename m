Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B0C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:15:04 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91875.1782738901259413270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Rv/uClps;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12014; q=dns/txt;
  s=iport01; t=1782738901; x=1783948501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wTqW7vzETGCq+4/j6GrIrUYKnB5NTd6bjjDiBDpzR3Y=;
  b=Rv/uClps/S8wP4No6INrlRK8Fx9FLd9mTcRc4GbHfljgyUdEJXvkOrZP
   zm5v5e6emzcDEA8Jry4xgO0ccuFSxW26/HLoC9zdmk2AIxvd6nJNGyyBt
   GEQHBc6STLwfwxy2+T1mdzRomdELwq97RXI+vO8Px0AlP33cEo2LgreCL
   3U3Gtyn4FvKW06gFK/hBZY0VGANKnt4c66Z5+eR1z4xjHp2jAxRt0dCCZ
   eZy9ZT+s4XU9/tIyJfLwjwL2gkczc16U6/c8IjafRlPRYoV8qfNK521gD
   a+P9nnxEEfndMzNRC7T9G5HIotRwucpZAqiKPBD+CcnxljJaTAoXT1wk2
   w==;
X-CSE-ConnectionGUID: AenX/qYoSDGu0TiGOk1D6g==
X-CSE-MsgGUID: QBfMMi9mRoClyzdtT32HnQ==
X-IPAS-Result: =?us-ascii?q?A0AaAAAqb0Jq/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHOJWAOeGxSBag8BAQEPRA0EAQGBcQEggnQCjUsCJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYA?=
 =?us-ascii?q?S0QHAMBAhcBARYrIwgZgwIBgnMCAREGtnKBeTOBAYMoATEFCQICQAFQ2ywBC?=
 =?us-ascii?q?xQBBYEzAYU+iB9bGAGEfCcbG4FygRWDaYEFgVwBAQGBIiVgAgaFdQSCInoSg?=
 =?us-ascii?q?VqCGCeBYYsPSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2Ba?=
 =?us-ascii?q?YEEhH0jHwM5f4EwdVhmFTA1gQIBER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPg?=
 =?us-ascii?q?j0xLwEhDAEpAQEvVn07Cx6SdAoHkBaCIYE1n1oKKIN1jCGODYctGjOFW6URm?=
 =?us-ascii?q?QiOCpVoaIRogWg8gUcLB3AVgyIJFjQZD44tCwuBeIFogX+EQcFNJDUCCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokAIkgVcBAQ?=
IronPort-Data: A9a23:RJkutah1Tu/bPyxWKyPuz8qkX161MREKZh0ujC45NGQN5FlHY01je
 htvCjrXaaqOMGH3fI9yYduy80pUvJfQyNc2TlE+qSBnRnhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfjS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUx9+BHRnh/8
 sc0By1VUhGsoOHv7Oy0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9J4TTG5QIxxzAz
 o7A113TDDQ/NY2a8z2u9mO+ivPzxnnbXrtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:rUzMFqxQcK04OSbScGLsKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICOsqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AO2DQ92hmfY5hPpjUje4gH9OXtDJuW3Db/DDJEki?=
 =?us-ascii?q?DJUl0EIGUZniToY86nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1+U8qgy7+szHbQbT8+YkByYojGuaqJ2EBmUokMQ?=
 =?us-ascii?q?Dgc6vMT1iNyuh126XRLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,232,1774310400"; 
   d="scan'208";a="501695120"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 13:15:00 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 1F2F7180007CD;
	Mon, 29 Jun 2026 13:15:00 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id BBE97CC124A; Mon, 29 Jun 2026 06:14:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429
Date: Mon, 29 Jun 2026 06:14:49 -0700
Message-ID: <20260629131453.1077612-5-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629131453.1077612-1-adongare@cisco.com>
References: <20260629131453.1077612-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239780

From: Anil Dongare <adongare@cisco.com>

Backport the upstream fix [1] for the netrc credential leak on redirect
described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://curl.se/docs/CVE-2026-6429.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../curl/curl/CVE-2026-6429.patch             | 362 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
new file mode 100644
index 0000000000..f4398e00f6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
@@ -0,0 +1,362 @@
+From b4024bf808bd558026fdc6096e8457f199ace306 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2026 14:26:20 +0200
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
+- curl 8.19.0 does not have Curl_url_same_origin(), so the same-origin comparison is kept inline in Curl_http_follow().
+- Adapted tests/data/Makefile.am and tests/libtest/Makefile.inc placement for the wrynose test lists.
+
+(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/http.c                 | 121 +++++++++++++++++++------------------
+ tests/data/Makefile.am     |   2 +-
+ tests/data/test2506        |  64 ++++++++++++++++++++
+ tests/data/test998         |   1 -
+ tests/libtest/Makefile.inc |   2 +-
+ tests/libtest/lib2506.c    |  71 ++++++++++++++++++++++
+ 6 files changed, 198 insertions(+), 63 deletions(-)
+ create mode 100644 tests/data/test2506
+ create mode 100644 tests/libtest/lib2506.c
+
+diff --git a/lib/http.c b/lib/http.c
+index b960d79..9ac96ad 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1201,75 +1201,76 @@ CURLcode Curl_http_follow(struct Curl_easy *data, const char *newurl,
+       return CURLE_OUT_OF_MEMORY;
+   }
+   else {
+-    uc = curl_url_get(data->state.uh, CURLUPART_URL, &follow_url, 0);
+-    if(uc)
+-      return Curl_uc_to_curlcode(uc);
+-
+-    /* Clear auth if this redirects to a different port number or protocol,
+-       unless permitted */
+-    if(!data->set.allow_auth_to_other_hosts && (type != FOLLOW_FAKE)) {
+-      int port;
+-      bool clear = FALSE;
++    bool same_origin;
++    CURLcode result;
++    CURLU *u = curl_url();
++    char *oldscheme = NULL;
++    char *oldhost = NULL;
++    char *oldport = NULL;
++    char *newscheme = NULL;
++    char *newhost = NULL;
++    char *newport = NULL;
++    if(!u)
++      return CURLE_OUT_OF_MEMORY;
+ 
+-      if(data->set.use_port && data->state.allow_port)
+-        /* a custom port is used */
+-        port = (int)data->set.use_port;
+-      else {
+-        curl_off_t value;
+-        char *portnum;
+-        const char *p;
+-        uc = curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
+-                          CURLU_DEFAULT_PORT);
+-        if(uc) {
+-          curlx_free(follow_url);
+-          return Curl_uc_to_curlcode(uc);
+-        }
+-        p = portnum;
+-        curlx_str_number(&p, &value, 0xffff);
+-        port = (int)value;
+-        curlx_free(portnum);
+-      }
+-      if(port != data->info.conn_remote_port) {
+-        infof(data, "Clear auth, redirects to port from %u to %u",
+-              data->info.conn_remote_port, port);
+-        clear = TRUE;
+-      }
+-      else {
+-        char *scheme;
+-        const struct Curl_scheme *p;
+-        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, 0);
+-        if(uc) {
+-          curlx_free(follow_url);
+-          return Curl_uc_to_curlcode(uc);
+-        }
++    uc = curl_url_set(u, CURLUPART_URL, Curl_bufref_ptr(&data->state.url),
++                      CURLU_URLENCODE | CURLU_ALLOW_SPACE);
++    if(!uc)
++      uc = curl_url_get(data->state.uh, CURLUPART_URL, &follow_url, 0);
++    if(!uc)
++      uc = curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
++    if(!uc)
++      uc = curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
++    if(!uc)
++      uc = curl_url_get(u, CURLUPART_PORT, &oldport, CURLU_DEFAULT_PORT);
++    if(!uc)
++      uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &newscheme, 0);
++    if(!uc)
++      uc = curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0);
++    if(!uc)
++      uc = curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
++                        CURLU_DEFAULT_PORT);
++    if(uc) {
++      curl_url_cleanup(u);
++      curlx_free(oldscheme);
++      curlx_free(oldhost);
++      curlx_free(oldport);
++      curlx_free(newscheme);
++      curlx_free(newhost);
++      curlx_free(newport);
++      curlx_free(follow_url);
++      return Curl_uc_to_curlcode(uc);
++    }
+ 
+-        p = Curl_get_scheme(scheme);
+-        if(p && (p->protocol != data->info.conn_protocol)) {
+-          infof(data, "Clear auth, redirects scheme from %s to %s",
+-                data->info.conn_scheme, scheme);
+-          clear = TRUE;
+-        }
+-        curlx_free(scheme);
+-      }
+-      if(clear) {
+-        CURLcode result = Curl_reset_userpwd(data);
+-        if(result) {
+-          curlx_free(follow_url);
+-          return result;
+-        }
+-        Curl_safefree(data->state.aptr.user);
+-        Curl_safefree(data->state.aptr.passwd);
++    same_origin = strcasecompare(oldscheme, newscheme) &&
++                  strcasecompare(oldhost, newhost) &&
++                  !strcmp(oldport, newport);
++
++    curl_url_cleanup(u);
++    curlx_free(oldscheme);
++    curlx_free(oldhost);
++    curlx_free(oldport);
++    curlx_free(newscheme);
++    curlx_free(newhost);
++    curlx_free(newport);
++
++    if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
++       !data->set.str[STRING_USERNAME]) {
++      result = Curl_reset_userpwd(data);
++      if(result) {
++        curlx_free(follow_url);
++        return result;
+       }
++      Curl_safefree(data->state.aptr.user);
++      Curl_safefree(data->state.aptr.passwd);
+     }
+-  }
+-  DEBUGASSERT(follow_url);
+-  {
+-    CURLcode result = Curl_reset_proxypwd(data);
++    result = Curl_reset_proxypwd(data);
+     if(result) {
+       curlx_free(follow_url);
+       return result;
+     }
+   }
++  DEBUGASSERT(follow_url);
+ 
+   if(type == FOLLOW_FAKE) {
+     /* we are only figuring out the new URL if we would have followed locations
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 00a5221..1b76b01 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -265,7 +265,7 @@ test2309 \
+ \
+ test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407 \
+ \
+-test2500 test2501 test2502 test2503 test2504 \
++test2500 test2501 test2502 test2503 test2504 test2506 \
+ \
+ test2600 test2601 test2602 test2603 test2604 test2605 \
+ \
+diff --git a/tests/data/test2506 b/tests/data/test2506
+new file mode 100644
+index 0000000..9c65002
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
+index 24d1d3d..56dbc0c 100644
+--- a/tests/data/test998
++++ b/tests/data/test998
+@@ -77,7 +77,6 @@ Proxy-Connection: Keep-Alive
+ 
+ GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
+ Host: somewhere.else.example
+-Authorization: Basic %b64[alberto:einstein]b64%
+ User-Agent: curl/%VERSION
+ Accept: */*
+ Proxy-Connection: Keep-Alive
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 2319baf..2f77c16 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -113,7 +113,7 @@ TESTS_C = \
+   lib2023.c lib2032.c lib2082.c \
+   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c \
+   lib2402.c           lib2404.c lib2405.c \
+-  lib2502.c lib2504.c \
++  lib2502.c lib2504.c lib2506.c \
+   lib2700.c \
+   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
+   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
+diff --git a/tests/libtest/lib2506.c b/tests/libtest/lib2506.c
+new file mode 100644
+index 0000000..8b3b342
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
++#include "first.h"
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
++static CURLcode test_lib2506(const char *URL)
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
++  result = curl_easy_perform(curl);
++
++test_cleanup:
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return result;
++}
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 09e93c8ce5..6c31978519 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2026-6276.patch \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
+    file://CVE-2026-6429.patch \
     file://mbedtls.patch \
 "
 
-- 
2.51.0


