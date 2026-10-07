Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E53CA6007
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:13 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7419.1791372245224751971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=C/I1Rgeq;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13680; q=dns/txt;
  s=iport01; t=1791372245; x=1792581845;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0osEExs/2zzmmVT+883UqmYCShpJme4K+QvwbceaGmI=;
  b=C/I1RgeqCRjnSC7pFa2R4xFFIhCsHu8bzzf4DvzH4ufkNiTkJmXNw4if
   N40Uu7EL7+0Emh+nFX7DY/UJJJeXB4DY6/42Krsb4HxV8SIoHNV0VvRFh
   NbWo/2UpICDVy7TmuN/eeBJCnEJIHPqkwM1MTs9SCL1aO+UOOt4djXvyQ
   F1e3D1PvQlFipXuTsJNXMxk81jBQkTbf2U+r+EnD7z5rdUBLrQy3CpXEA
   4Gf2Ayp4Jn2xONQJ3BCFYU2+/8BIbzXFGloevW2vXfMAGijvSUtKzQQ0J
   NT6syGsA0pg/VSOSfg+vxcSNES2DuiBS/y5BejhpQSKD3x2ZImzWrQM/0
   Q==;
X-CSE-ConnectionGUID: gpM/v+kaT7+fb+PSoVm5pg==
X-CSE-MsgGUID: 1rdN4U8jTyapCpL0Cw/4LQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgCcKsZq/5X/Ja1aHgEBCxIMggULgld1YUJJlCmBN?=
 =?us-ascii?q?WwDkUmMURSBag8BAQEPRA0EAQGBcQEggnMCjgkCJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAhkWKyMIG?=
 =?us-ascii?q?YMCAYJ0AgERBrVmgXkzgQGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGDXYEfJ?=
 =?us-ascii?q?xsbgXKBFYNpgQWBXAIBAYEhAyJohXUEgiKBDIFaHoEvjEyFXEiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBC?=
 =?us-ascii?q?YIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDCkYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeQWx6CKDEGATEvASECAQkBKQEBBCtWfQEBOQwdFJJgkCeCIYE1n?=
 =?us-ascii?q?1oKKIN2jCKVOhozhVulFJkIjgqVaBgDTYRpgWg8gVlwFYMiCQkNNBkPji4LC?=
 =?us-ascii?q?4NghFCBcMV5JDUCCTIBAQcCBw4DC4FokCaBWAEB?=
IronPort-Data: A9a23:0m04PanBIv9BwK5VFjI5dUDo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMUWzQPfeDa2GjfIsibt7k8R4GupeHm9AxTQU4+Ck3RFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMs/3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYIA36FpQmJHy
 aNbJjpOViuEuefr2L3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKIIYbQFJQMxRbwS
 mTupn71JE0nZN6j2DOd2WqI3sTQ2n/fYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:eZCQ06u4ByjnsiLHfbAvuXlL7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AAUFrTGjIz72t9t/pPc/hujIXRDJufWX4i2mTIEa?=
 =?us-ascii?q?EViVnQv6tcliu/f58nJ87?=
X-Talos-MUID: 9a23:1CkrUwVz6pur8kTq/Gb2iBc+CZdq37WnEGsVtc0tpI7YERUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="532299138"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:04 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 08799180001CE
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:04 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 65901CBEF98; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 8/8] curl: fix CVE-2026-7168
Date: Wed,  7 Oct 2026 04:24:03 -0700
Message-Id: <20261007112403.486499-8-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007112403.486499-1-devanshp@cisco.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247393

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507
[2] https://curl.se/docs/CVE-2026-7168.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-7168.patch             | 404 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 405 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
new file mode 100644
index 0000000000..ef19f89e4c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
@@ -0,0 +1,404 @@
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
+- Place setproxy() beside Curl_setstropt() in curl 8.7.1's monolithic
+  setopt.c and include vauth/vauth.h for its cleanup declaration.
+- Add the upstream no-op digest cleanup macro for builds without
+  Digest.
+- Register test1588 and lib1588 in the curl 8.7.1 Makefile.inc files.
+- Adapt first.h and test_lib1588() to test.h and test(). The older
+  harness has no libtest_arg4, so use test_argv[4] and require five
+  argv entries before reading the fourth test argument.
+- The curl 8.7.1 test macros write to a variable named res. Use
+  CURLcode res in init1588() and int res in test(); retain upstream
+  CURLcode result in run1588(), which uses no harness macro.
+- Use the curl 8.7.1 digest-auth feature name. The separate dependency
+  patch provides its positive feature detection.
+- Change test1588's reply sections to `crlf="yes"` for the same test
+  server behavior.
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
index 00a92d82d4..4ce564a8bc 100644
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


