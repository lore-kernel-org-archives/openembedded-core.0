Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32A7C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:46:40 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13110.1787564794262622995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=exxNvKPb;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13099; q=dns/txt;
  s=iport01; t=1787564794; x=1788774394;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Tk8kxXdTHuynu48K58Eo56cKjZPjYXYSEqdihxovF7E=;
  b=exxNvKPbOJ1ZNiNd9iwQNTLH538XNO06YNmiqvuPBm+bXOL/BAzOse4S
   4CrodcPvJ7MQ3D1wE+hrNuPcCqvKnOcSquGvtYIbEHAiVM1hFU6vV0VKe
   gQg2eJL1U8Yp2XAoDdpgGdZk7qvJ+iqALZ3IsW2fxtqUKsDP1DMlkb7u2
   Vhn1NlPTYllc4qW0CCtmFoPLp3AWrYGc5B1vr/6PolPp/pqCNFuvE8s1r
   DOPiVIVcF3XZlXoBv4IuqIrDsj4NO4boe7ASJjv8ZEgrg/neVPu5ZcutU
   SOXtvpljSLZvI3vz1lccEsprPo2+q2zq9KRJZezp5EKKILZl+g2+6vY4s
   A==;
X-CSE-ConnectionGUID: kYUDgt6bQEC29XoRCSJozw==
X-CSE-MsgGUID: rtI7ulDzSImtLc6dxJCHzQ==
X-IPAS-Result: =?us-ascii?q?A0AJAABPEoxq/5D/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF8BgEBAQsBglZ0X0JJjHKHN4IhA4ETkDeMURSBag8BAQEPRA0EAQGBc?=
 =?us-ascii?q?QEggnMCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2GWgECAQMnCwEYARsiHAMBAhcBARYrIwgQAQiDAgGCdAMRBsI2gXkzgQGDK?=
 =?us-ascii?q?AExBQkCAkABUNswAQsUAYE4AYU+iCJdGAGEfCcbG4FygRWCc3aBBYFcAQEBg?=
 =?us-ascii?q?SIlYAIGhXUEgiKBDIFaHniBVI8WSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWUSF4EJggcCglqCBQIBSUMOB0ciC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB45eH4JHMS8BGgcMARMWAQEvVn0JMgseknQJAQeQFoIeg?=
 =?us-ascii?q?TifWgoog3aMIo4Nhy0aM4VbpRGZCI4KlWcBGFCEaYFoPIFHCwdwFYMiCRY0G?=
 =?us-ascii?q?Q+OLQsLgXiBaIF/hEHFYTw1AgkyAQEHAgcOAwuBaJACJIFYAQE?=
IronPort-Data: A9a23:xE6PRq2dDp+DxDpoZfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzYGz
 WdKUG2EaPvcZjOkfNsjPIuwpklXuJKDmt5hGQFk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGD3ALEYIEpOxOLEoUp
 MwfEhs2TBeRmLfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW3aIOMK4DVFK25mG6Cu
 kOZ4mDVECo7McC7wmSJ4lCHpv32yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NgRTn6li7dKnuEhX3rfS+0PiYojpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:dzdgv2y7yhld8Pbv3pYyBgUXK/0JfWGDxk79CBXpOWFTY4a3Tk2PrfY=
X-Talos-MUID: 9a23:7nOLqwlR/OIMBegV25tZdnp4KOY3/qCCGnsslIkisJeIJQ5bGyWk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="520119479"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 09:46:33 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 76BAF1800020A
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:46:32 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 9B075CC037D; Mon, 24 Aug 2026 15:16:30 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v3 4/5] curl: fix CVE-2026-6429
Date: Mon, 24 Aug 2026 15:16:20 +0530
Message-Id: <20260824094620.2189899-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260804103305.1180770-4-deeratho@cisco.com>
References: <20260804103305.1180770-4-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244074

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-6429.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://curl.se/docs/CVE-2026-6429.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v3:
- Preserve URL parsing semantics for URLs containing spaces.
- Treat unsupported redirect schemes as a different origin.
- Restore the truncated lib2506 cleanup and return path.
- Correct embedded patch hunk counts and statistics.

 .../curl/curl/CVE-2026-6429.patch             | 376 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 377 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
new file mode 100644
index 0000000000..5f99318c8a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
@@ -0,0 +1,376 @@
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
+- The inline same-origin comparison preserves upstream URL parsing semantics:
+  the previous URL is encoded while allowing spaces, and scheme/host are
+  compared before resolving default ports so unsupported redirect schemes
+  are treated as a different origin rather than as a fatal parsing error.
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
+ lib/transfer.c             | 108 ++++++++++++++++++++++++++------------------
+ tests/data/Makefile.inc    |   2 +-
+ tests/data/test2506        |  64 +++++++++++++++++++++++
+ tests/data/test998         |   1 -
+ tests/libtest/Makefile.inc |   5 +-
+ tests/libtest/lib2506.c    |  71 +++++++++++++++++++++++++++++
+ 6 files changed, 203 insertions(+), 48 deletions(-)
+ create mode 100644 tests/data/test2506
+ create mode 100644 tests/libtest/lib2506.c
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index a73462928d..0f5bd8ce59 100644
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
+-        }
+-        free(scheme);
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
++        }
++      }
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
index 781b37c5ad..4f828ffd79 100644
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

