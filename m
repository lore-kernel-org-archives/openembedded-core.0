Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D27CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:04:42 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21227.1792155880998225716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DcLs5dGR;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13483; q=dns/txt;
  s=iport01; t=1792155881; x=1793365481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=icVE4tFrzgJ2we10PGlimq81fjYxsg7EJLIQXf0cVeM=;
  b=DcLs5dGRy/VCAhPseSWNxvAXGldyUwIyKgG68Zw3fZUUT9v++Y1pe3KP
   80RWuJHF4X8jlzJTUHWmfcM8FfdJ4I2LUfsyJPZBP4zdIA35ALmMqBt+1
   Z5SaHV2CK2nfK2TEAtCP4tGtjcO5pIWsB/m7X4a3itg+8kf2+Ow7KcTas
   IzgsEX3QX7FdlzLa4PXqhCDG4Mw/OFdERHmEnD0xA8aClnjuADQZqZfcC
   ricp9NKgg14Fa8FcVvidUyuUPXNXYiOf6W2W1yKnRej5vmlz0/Go8GgTu
   Pg4kXjwysm9eh9TZ4zMemEFsXOKvldnpdQyjzyYuZ3w7yiyj1UbSAXpKm
   w==;
X-CSE-ConnectionGUID: hA3qwsOgSTO6O00pGH5ZOQ==
X-CSE-MsgGUID: +Uen0XvnReqsPP+QN7hGoA==
X-IPAS-Result: =?us-ascii?q?A0BLAgC2H9Jq/5X/Ja1aHgEBCxIMggULgld1YUJJlV5sA?=
 =?us-ascii?q?54cFIFqDwEBAQ9EDQQBAYFxASCCcwKOFQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAhkWKyMIGYMCA?=
 =?us-ascii?q?YJ0AgERBr13gXkzgQGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGDXYEfJxsbg?=
 =?us-ascii?q?XKBFYNpgQWBXAIBAYEhAyJohXUEgiKBDIFaHoEvjX+Fe0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCB?=
 =?us-ascii?q?wKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCD?=
 =?us-ascii?q?QkHKRgNSBEsNxUZBD5uB5IUHoItMQYBMSkGASECAQkBKQEBBCtWE2oCDyoMH?=
 =?us-ascii?q?RSSYJAmgiGBNZ9aCiiDdowilToaM4QEgVeSQJJUmQiOCpVnGFCEaYFoPIFZc?=
 =?us-ascii?q?BWDIgkJDTQZD44uCwuDYIRQgXDIGiQ1AgkyAQEHAgcOAwuBaJAmgVgBAQ?=
IronPort-Data: A9a23:J16B9q/vn7ocrm3RX7lNDrUD7n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DMcDWqPMvvZN2T0LYp1Otvn8h8F7JPTy4MwSgc9+H1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k2FNYB5f1QDlpy0
 qI/cGgVQTDetcWPlefTpulE3qzPLeHxN48Z/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0wn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FbYGLKozbG5UK9qqej
 iH78mKhMg8cDtGG0gK9sUuK2e/gmgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXY0St1ZFet84waLxaPQyx2cB2wJCDBbAOHKr+csTjAsk
 1vMlNTzCHk26vueSGmW8fGfqjba1TUpEFLurBQsFWMti+QPaqlq5v4TZr6PyJKIs+A=
IronPort-HdrOrdr: A9a23:4bCg/KBTSQrdqHTlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A2FqpzWtPMShV+fSYzoP4X7ks6IslWybE02z3LHS?=
 =?us-ascii?q?ELjhOEOWNZn/NyoRdxp8=3D?=
X-Talos-MUID: 9a23:lBbUFAZPFDraGuBT9ALhgmlSKsFS7r21MHhOqLNZu+aDHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536889687"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 13:04:40 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id C016D180001EA;
	Fri, 16 Oct 2026 13:04:39 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 6A946CBF203; Fri, 16 Oct 2026 06:04:39 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][scarthgap][PATCH v2 8/8] curl: fix CVE-2026-7168
Date: Fri, 16 Oct 2026 06:04:39 -0700
Message-Id: <20261016130439.603118-4-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016130439.603118-1-devanshp@cisco.com>
References: <20261016130439.603118-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248020

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507
[2] https://curl.se/docs/CVE-2026-7168.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---

Changes in v2:
- Rebase onto stable/scarthgap-review.
- Explain the test.h macro requirements.

 .../curl/curl/CVE-2026-7168.patch             | 398 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 399 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
new file mode 100644
index 0000000..42e576e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
@@ -0,0 +1,398 @@
+From 9026628dd5fa02b66cb85606e2121c94f9943efa Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Apr 2026 09:14:51 +0200
+Subject: [PATCH] setopt: clear proxy auth properties when switching
+
+Verify with test 1588
+
+Closes #21453
+
+CVE: CVE-2026-7168
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507]
+
+Backport Changes:
+- Add setproxy() to the older setopt.c and include vauth/vauth.h.
+  Keep cleanup as a no-op when Digest is disabled.
+- Register test1588/lib1588 in Makefile.inc and use the old test()
+  entry point and testutil.h. Read test_argv[4] only if test_argc >= 5.
+- curl 8.7.1 has test.h instead of first.h. res_easy_setopt() and
+  res_global_init() write to res, so use that name in init1588()
+  and test(). Keep CURLcode and run1588()'s original result variable.
+- Use the older digest-auth feature name with the dependency patch's
+  feature detection, and crlf="yes" replies for the old test server.
+
+(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/setopt.c               |  18 ++++-
+ lib/vauth/vauth.h          |   2 +
+ tests/data/Makefile.inc    |   2 +
+ tests/data/test1588        | 106 ++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |   5 +-
+ tests/libtest/lib1588.c    | 152 +++++++++++++++++++++++++++++++++++++
+ 6 files changed, 282 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1588
+ create mode 100644 tests/libtest/lib1588.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 8a5a5d7c33..7eaf30910f 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -51,6 +51,7 @@
+ #include "altsvc.h"
+ #include "hsts.h"
+ #include "tftp.h"
++#include "vauth/vauth.h"
+ #include "strdup.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *s)
+   return CURLE_OK;
+ }
+ 
++#ifndef CURL_DISABLE_PROXY
++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
++{
++  if((data->set.str[STRING_PROXY] && proxy) &&
++     /* there was one set, is this a new one? */
++     !strcmp(data->set.str[STRING_PROXY], proxy))
++    return CURLE_OK; /* same one as before */
++
++  Curl_auth_digest_cleanup(&data->state.proxydigest);
++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
++}
++#endif
++
+ CURLcode Curl_setblobopt(struct curl_blob **blobp,
+                          const struct curl_blob *blob)
+ {
+@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      * Setting it to NULL, means no proxy but allows the environment variables
+      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
+      */
+-    result = Curl_setstropt(&data->set.str[STRING_PROXY],
+-                            va_arg(param, char *));
++    result = setproxy(data, va_arg(param, char *));
+     break;
+ 
+   case CURLOPT_PRE_PROXY:
+diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
+index 9da0540892..bf5c7a3e12 100644
+--- a/lib/vauth/vauth.h
++++ b/lib/vauth/vauth.h
+@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+ 
+ /* This is used to clean up the digest specific data */
+ void Curl_auth_digest_cleanup(struct digestdata *digest);
++#else
++#define Curl_auth_digest_cleanup(x)
+ #endif /* !CURL_DISABLE_DIGEST_AUTH */
+ 
+ #ifdef USE_GSASL
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 7c0ef24554..5e83979417 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -201,6 +201,8 @@ test1550 test1551 test1552 test1553 test1554 test1555 test1556 test1557 \
+ test1558 test1559 test1560 test1561 test1562 test1563 test1564 test1565 \
+ test1566 test1567 test1568 test1569 test1570 \
+ \
++test1588 \
++\
+ test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597 \
+ test1598 \
+ test1600 test1601 test1602 test1603 test1604 test1605 test1606 test1607 \
+diff --git a/tests/data/test1588 b/tests/data/test1588
+new file mode 100644
+index 0000000000..ba996fb2ff
+--- /dev/null
++++ b/tests/data/test1588
+@@ -0,0 +1,106 @@
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
++<data crlf="yes">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++And you should ignore this data.
++</data>
++
++# then this is returned when we get proxy-auth
++<data1000 crlf="yes">
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++</data1000>
++
++<datacheck crlf="headers">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++</datacheck>
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
++!SSPI
++crypto
++proxy
++digest-auth
++</features>
++<name>
++HTTP proxy auth Digest, then change proxy and do it again
++</name>
++<command>
++http://test.remote.example.com/path/%TESTNUMBER %HOSTIP %HTTPPORT silly:person custom.set.host.name
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Proxy-Authorization: Digest username="silly", realm="weirdorealm", nonce="12345", uri="/path/1588", response="d0b2f000c7e3fca24452b5810713404a"
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/1588 HTTP/1.1
++Host: test.remote.example.com
++Proxy-Authorization: Digest username="silly", realm="weirdorealm", nonce="12345", uri="/path/1588", response="d0b2f000c7e3fca24452b5810713404a"
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 639d010a00..3eeaed2f27 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -62,7 +62,7 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect libprereq      \
+  lib1540 lib1541 lib1542 lib1543         lib1545 \
+  lib1550 lib1551 lib1552 lib1553 lib1554 lib1555 lib1556 lib1557 \
+  lib1558 lib1559 lib1560 lib1564 lib1565 lib1567 lib1568 lib1569 \
+- lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
++ lib1588 lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
+  \
+  lib1647 \
+  \
+@@ -520,6 +520,9 @@ lib1568_SOURCES = lib1568.c $(SUPPORTFILES)
+ 
+ lib1569_SOURCES = lib1569.c $(SUPPORTFILES)
+ 
++lib1588_SOURCES = lib1588.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
++lib1588_LDADD = $(TESTUTIL_LIBS)
++
+ lib1591_SOURCES = lib1591.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib1591_LDADD = $(TESTUTIL_LIBS)
+ 
+diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
+new file mode 100644
+index 0000000000..60d0dd43be
+--- /dev/null
++++ b/tests/libtest/lib1588.c
+@@ -0,0 +1,152 @@
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
++ * argv1 = URL
++ * argv2 = proxy host
++ * argv3 = proxy port
++ * argv4 = proxyuser:password
++ */
++
++#include "test.h"
++#include "testutil.h"
++
++static CURLcode init1588(CURL *curl, const char *url,
++                         const char *userpwd, const char *proxy)
++{
++  CURLcode res = CURLE_OK;
++
++  res_easy_setopt(curl, CURLOPT_URL, url);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY, proxy);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
++  if(res)
++    goto init_failed;
++#if 0
++  res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
++  if(res)
++    goto init_failed;
++#endif
++
++  res_easy_setopt(curl, CURLOPT_HEADER, 1L);
++  if(res)
++    goto init_failed;
++
++  return CURLE_OK; /* success */
++
++init_failed:
++  return res; /* failure */
++}
++
++static CURLcode run1588(CURL *curl, const char *url, const char *userpwd,
++                        const char *proxy)
++{
++  CURLcode result = CURLE_OK;
++
++  result = init1588(curl, url, userpwd, proxy);
++  if(result)
++    return result;
++
++  return curl_easy_perform(curl);
++}
++
++int test(char *URL)
++{
++  int res = CURLE_OK;
++  CURL *curl = NULL;
++  const char *proxyuserpws;
++  struct curl_slist *host = NULL;
++  struct curl_slist *host2 = NULL;
++  char proxy1_resolve[128];
++  char proxy2_resolve[128];
++  char proxy1_connect[128];
++  char proxy2_connect[128];
++
++  if(test_argc < 5)
++    return TEST_ERR_MAJOR_BAD;
++  proxyuserpws = test_argv[4];
++
++  curl_msnprintf(proxy1_resolve, sizeof(proxy1_resolve),
++                 "firstproxy:%s:%s", libtest_arg3, libtest_arg2);
++  curl_msnprintf(proxy2_resolve, sizeof(proxy2_resolve),
++                 "secondproxy:%s:%s", libtest_arg3, libtest_arg2);
++
++  /* we connect to the fake host name but the right port number */
++  curl_msnprintf(proxy1_connect, sizeof(proxy1_connect),
++                 "firstproxy:%s", libtest_arg3);
++  curl_msnprintf(proxy2_connect, sizeof(proxy2_connect),
++                 "secondproxy:%s", libtest_arg3);
++
++  res_global_init(CURL_GLOBAL_ALL);
++  if(res)
++    return res;
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
++
++  res = run1588(curl, URL, proxyuserpws, proxy1_connect);
++  if(res)
++    goto test_cleanup;
++
++  curl_mfprintf(stderr, "lib1588: now we do the request again\n");
++
++  res = run1588(curl, URL, proxyuserpws, proxy2_connect);
++
++test_cleanup:
++
++  /* proper cleanup sequence - type PB */
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  curl_slist_free_all(host);
++  return res;
++}
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 00a92d8..4ce564a 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -47,6 +47,7 @@ SRC_URI = " \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932.patch \
     file://CVE-2026-6429.patch \
+    file://CVE-2026-7168.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


