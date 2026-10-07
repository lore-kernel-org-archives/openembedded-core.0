Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD31CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:13 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7417.1791372245128017974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LdT6Xv+P;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12030; q=dns/txt;
  s=iport01; t=1791372245; x=1792581845;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=p/hpJJV+7xlhytj9O17kW1VwztZ+Ovblud+wC0jCwdA=;
  b=LdT6Xv+PJlHLXIkVRk/BWozxX49AGVcelQRXTocTcbsTQLSoiXMJiknT
   1eAsvTOs/W7Qd+hEWMHWTbVzVItyxn77UThgqlkxrjia93Kag6UzzXLue
   4UkydFODf1tM/9Y3rNH1FlYnz6flovYCKOffRoNqTb5gkERcv122d+Si2
   Xm2n/6a6RvoMgGHfxdCcaRm/GsgUNYv33dksG16Gy2Lr1xreFb59Qp2s+
   tP9MT2E4X4zo46Y+zlsZseda1660hhhFAW4Wm1hX6/Kd7uHbEuUCrY3Vw
   XYUFN6Dm4QyQ7AYU/oE/G2sDh2+DebDneCJ/g+yNq6rewkzH5AkPeaGGp
   A==;
X-CSE-ConnectionGUID: TWMQwmluS5mHKLmYpzNeJQ==
X-CSE-MsgGUID: Jlg0VhyNS1evK9FQ4J9YEw==
X-IPAS-Result: =?us-ascii?q?A0BLAgCcKsZq/4r/Ja1aglmCV3VhQkmUKYIhA54aFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYFxASCCcwKOCQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECFwEBFisjCBAJgwIBgnQCA?=
 =?us-ascii?q?REGtWaBeTOBAYMpAT8CAkABUNsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBXAIBgSIlYAIGhXUEgiKBDIFaHoEvjEyFXEiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDCkYDUgRLDcVGQQ+bgeQW?=
 =?us-ascii?q?x6CMy0xLwEhDAETFgEBL1Z4BTsLHpJ0CQEHkBaCIYE1n1oKKIN2jCKODYctG?=
 =?us-ascii?q?jOqb5kIjgqVaBhQhGmBaDyBWXAVgyIJFjQZD44uCwuDYIZAxXkkNQIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiQAiSBWAEB?=
IronPort-Data: A9a23:QtPMe6+p2rY3fuXYPaV1DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GYWUGmCP/aNNDfxKYgnPd++oxwCusfcxoQ1HgBlqn1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajpLs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kKAqgh5eNzHFoT8
 Nw7DDU8dgKlisCPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOE0n1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FbYGPK43SGZ0P9qqej
 kDC8DzHAgA8D4WS1xnU3EvwpL7+sDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:F7Fz46BE0cB87GjlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:ykW9vmBVh2YkC8n6ExVY0XcLH8Q4SSDY7FT0Jn6gG0BkaoTAHA==
X-Talos-MUID: 9a23:eEdinATr29YA1s5yRXTOgD46Csd5xZ/3BV4uwLs/5+vVBAFvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="532990402"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:04 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 07E6B180001C4
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:04 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 6162DCBEF8A; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 7/8] curl: fix CVE-2026-6429
Date: Wed,  7 Oct 2026 04:24:02 -0700
Message-Id: <20261007112403.486499-7-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007112403.486499-1-devanshp@cisco.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247392

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://curl.se/docs/CVE-2026-6429.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-6429.patch             | 365 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 366 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
new file mode 100644
index 0000000000..f7801ff758
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
@@ -0,0 +1,365 @@
+From 8f82af313dcce59c7343b3a4f849aa7e35e066f5 Mon Sep 17 00:00:00 2001
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
+- curl 8.7.1 keeps redirect handling in Curl_follow() in transfer.c.
+  Apply the upstream credential clearing behavior there.
+- Inline the same-origin comparison used by the upstream fix because
+  curl 8.7.1 predates Curl_url_same_origin(). Preserve URL spaces and
+  treat unsupported redirect schemes as a different origin.
+- Register test2506 and lib2506 in the curl 8.7.1 Makefile.inc files.
+  Adapt the newer libtest entry point to the older test harness.
+- Test 998 in curl 8.7.1 stores the expected Basic auth header as
+  literal Base64. Upstream later used %b64[...]b64%; remove the
+  equivalent literal header from the second request expectation.
+
+(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/transfer.c             | 106 ++++++++++++++++++++++---------------
+ tests/data/Makefile.inc    |   2 +-
+ tests/data/test2506        |  64 ++++++++++++++++++++++
+ tests/data/test998         |   1 -
+ tests/libtest/Makefile.inc |   5 +-
+ tests/libtest/lib2506.c    |  71 +++++++++++++++++++++++++
+ 6 files changed, 202 insertions(+), 47 deletions(-)
+ create mode 100644 tests/data/test2506
+ create mode 100644 tests/libtest/lib2506.c
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index a73462928d..9103a66865 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -865,49 +865,67 @@ CURLcode Curl_follow(struct Curl_easy *data,
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
++      bool same_origin = FALSE;
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
++      uc = curl_url_set(u, CURLUPART_URL, data->state.url,
++                        CURLU_URLENCODE | CURLU_ALLOW_SPACE);
++      if(!uc)
++        uc = curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
++      if(!uc)
++        uc = curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
++      if(!uc)
++        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &newscheme, 0);
++      if(!uc)
++        uc = curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0);
++      if(!uc) {
++        same_origin = strcasecompare(oldscheme, newscheme) &&
++                      strcasecompare(oldhost, newhost);
++        if(same_origin) {
++          uc = curl_url_get(u, CURLUPART_PORT, &oldport,
++                            CURLU_DEFAULT_PORT);
++          if(!uc)
++            uc = curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
++                              CURLU_DEFAULT_PORT);
++          if(!uc)
++            same_origin = !strcmp(oldport, newport);
+         }
+-        free(scheme);
+       }
+-      if(clear) {
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
++      }
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
+@@ -917,12 +935,12 @@ CURLcode Curl_follow(struct Curl_easy *data,
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
+index 27b1b52a10..7c0ef24554 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -253,7 +253,7 @@ test2300 test2301 test2302 test2303 test2304 test2305 test2306 test2307 \
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
+index 9b44223845..205179fac3 100644
+--- a/tests/data/test998
++++ b/tests/data/test998
+@@ -82,7 +82,6 @@
+ 
+  GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
+  Host: somewhere.else.example
+- Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
+  User-Agent: curl/%VERSION
+  Accept: */*
+  Proxy-Connection: Keep-Alive
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 78e16b0428..639d010a00 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -77,7 +77,7 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect libprereq      \
+  lib1970 lib1971 lib1972 lib1973 lib1974 lib1975 \
+  lib2301 lib2302 lib2304 lib2305 lib2306 \
+  lib2402 lib2404 \
+- lib2502 \
++ lib2502 lib2506 \
+  lib3010 lib3025 lib3026 lib3027 \
+  lib3100 lib3101 lib3102 lib3103
+ 
+@@ -689,6 +689,9 @@ lib2404_LDADD = $(TESTUTIL_LIBS)
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
index 6f9a814457..00a92d82d4 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -46,6 +46,7 @@ SRC_URI = " \
     file://CVE-2026-8927-dependent.patch \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932.patch \
+    file://CVE-2026-6429.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


