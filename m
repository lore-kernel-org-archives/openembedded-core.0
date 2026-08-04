Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144DCC5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 10:34:31 +0000 (UTC)
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13522.1785839669727750299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 03:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i9iRKKpo;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12505; q=dns/txt;
  s=iport01; t=1785839669; x=1787049269;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BOxoMAa9KP2gW30Iuq4Wa6MmD1fQq4qiB0WGACBJOd0=;
  b=i9iRKKpoH1LxA6XbhniBDB0b/R79NwhBLZUxo3syh5nQXv+L/njQYbEP
   UYiY4b+MwAQxcrNxaookPQygflrzJ76zlmyRymBljqDc2+zwThx2yMvYc
   Zq5oV5w53lWQD4MYslcB5UX6KfMKS8Bg5e9Q9d45uy/b4+ylimswWCKOz
   qCC0iXvAiJ2mTq+yW+K56/OOs9fSr880kBhM6QzeF+U8LLk2+aw5g+lD6
   R1OAaWsTzH4W8pMu8BXm5RvlYWQWXRCzIIcQnMjF3inF5lb2ej22MdCJd
   HoAyYAh4OD/Sj/bfwMun4jStsuTantMdA5fmVQ1p7D1R8RNqIWPEifocA
   Q==;
X-CSE-ConnectionGUID: GlqrE9FBROuSYW3ps9AKgA==
X-CSE-MsgGUID: jukT//cjSsKcNXk1yjEAgA==
X-IPAS-Result: =?us-ascii?q?A0AaAAA4v3Fq/85K/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHKHN4IhA4ETkDeMURSBag8BAQEPRA0EAQGBcQEggnMCj?=
 =?us-ascii?q?WcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECA?=
 =?us-ascii?q?QMnCwEYARsiHAMBAhcBARYrIwgQAQiDAgGCdAMRBr5xgXkzgQGDKAExBQkCA?=
 =?us-ascii?q?kABUNsuAQsUAYE4AYU+iCFdGAGEfCcbG4FygRWCc3aBBYFcAQEBgSIlYAIGh?=
 =?us-ascii?q?XUEgiKBDIFaHoEKJYFhjUtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBwWBHYErLIRTIxk2fIEvdUp1LWoSF4EagxUCgnpDCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?44GIIJEMS8BIQwBExYBAS9WfTsLHpJ0CQEHkBaCHoE4n1oKKIN1jCGODYctG?=
 =?us-ascii?q?jOFW6URmQiOCpVnARhQhGmBaDyBRwsHcBWDIgkWNBkPji0LC4F4gWiBf4RBx?=
 =?us-ascii?q?WE8NQIJMgEBBwIHDgMLgWiQAiSBWAEB?=
IronPort-Data: A9a23:r7DwnKgtIGQntS5OYtkvh2J5X161NBEKZh0ujC45NGQN5FlHY01je
 htvXm/TOf6CZWKjeowiaNmzpxwFuZbVmNQxTQE5q3xnEnljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/rf8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU3/v9tLDBg3
 8Y/NQs8UUubnLOf472SH7wEasQLdKEHPasWt2slyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZD/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIK4DUGJwPwi50o
 ErE4mfFRVYRNueE6jGjwnH1l+3itCzSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:X6mETKnZYXMdeSHvgMyVLJjTv9vpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AZHu+o2kD0VXXfEYt3TDBwrs1H9nXOVLZ1W39cmG?=
 =?us-ascii?q?SM0F0c4yqEkeLqYpHnOM7zg=3D=3D?=
X-Talos-MUID: 9a23:l5NfZQta1lAvGht2782nhixhCIAv6KaVE2MGt6UF4tiGGAV/EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,204,1779148800"; 
   d="scan'208";a="59465124"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Aug 2026 10:34:27 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 5C267180003AA
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:34:27 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 15A0CCC037D; Tue,  4 Aug 2026 16:04:26 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 4/5] curl: fix CVE-2026-6429
Date: Tue,  4 Aug 2026 16:03:04 +0530
Message-Id: <20260804103305.1180770-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260804103305.1180770-1-deeratho@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
 <20260804103305.1180770-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242713

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-6429.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://curl.se/docs/CVE-2026-6429.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Rebase the patches on top of scarthgap latest
fixes.
 .../curl/curl/CVE-2026-6429.patch             | 367 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 368 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
new file mode 100644
index 0000000000..f4df441aa2
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
index 19f24c3205..882ab67aae 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -41,6 +41,7 @@ SRC_URI = " \
     file://CVE-2026-4873.patch \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
+    file://CVE-2026-6429.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


