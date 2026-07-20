Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40585C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 10:57:58 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6359.1784545069922226396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 03:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LKAoVRoV;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12614; q=dns/txt;
  s=iport01; t=1784545069; x=1785754669;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+Bay5xEidMycTSRTt7WoGYdtw0hSDk4X9AuNVP71/v4=;
  b=LKAoVRoVB0ttUphWcdcvTbTW6HS6XRVlE4q1mkv4mpGXSkyl3LrNPuuI
   GD+FZ0n26n2Zq7vnUaChooM7ne2UqKlM7VBuIFz75Svw3Dk962S2zlIfd
   CMmnZMOYLl8P4FaShTTwJonHQhpIiMHr3/wnfBAZurDw9BCUnVtxWIgqQ
   KeFGoApOLzdFf4FHJQjrkoKChxYVMRt+zK3Rw2jFq3FEkRaSif3aSwOG5
   So9bI4P0PytAc68wqQbzuzcNkyMUhpMzg0ee6aOnPx9IlgyFqNk5BDOcn
   aZ+bE2npbXpwbOwBFwLCTHO1kxZcwDD4S5oanGjEoqnSTMjXeQCH/EwI+
   Q==;
X-CSE-ConnectionGUID: KR74vJuZShGuvf9G52JAuw==
X-CSE-MsgGUID: Jj283y46SEelHZGRu3jklQ==
X-IPAS-Result: =?us-ascii?q?A0AnAACp/V1q/4z/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKHN4E1bAOeGxSBag8BAQEPRA0EAQGBcQEggnMCjVMCJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAT0cA?=
 =?us-ascii?q?wECGRYrIwgRCIMCAYJ0AxEGvD6BeTOBAYMoATEFCQICQAFQ2y4BCxQBgTgBh?=
 =?us-ascii?q?T6IIFwYAYNdgR8nGxuBcoEVg2mBBYFcAQEBAYEhAyJohXUEgiKBDIFagXUmg?=
 =?us-ascii?q?WGMFkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgTqBAoR3I?=
 =?us-ascii?q?x8DOX+BMHVKdy1qEheBJoNLAgcDCxgNSBEsNxQZBD5uB408I4IHMQYBMS8BI?=
 =?us-ascii?q?QIBCQEpAQEEK1Z9AjkMHZJ0kCeCHoE4n1oKKIN1jCGVOhozhVulEZkIjgqVa?=
 =?us-ascii?q?BhQhGmBaDyBRwsHcBU7gmcJCQ00GQ+OLQsLgXiBaIF/glGBcMVWPDUCCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokCaBWAEB?=
IronPort-Data: A9a23:wlNtOKmn7Ufqyq9l18hd16zo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCmyAOPiPNzSmc9glboqy/E4Ev8LcytUyTQQ4pX1nE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9HuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa4ipbppI3x8z
 vw3NS4DPz/e3cCf3a3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKII4bSGZwIwRfwS
 mTu3WajUkoLaIKk5DeB0kCDvPKUnyD/YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:Kc+O1a4jf6VV+KKnOwPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:ZPf6HG3TiVyTMYUjqsGUtrxfOfp6LmP/0UXrI2ClF2g4Z+DPa3aN5/Yx
X-Talos-MUID: 9a23:9C9xIgmD3IzmIjxiIOWkdnpANp04uLXyVnsgnJEmiea+KHdyODOk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512041579"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 10:57:48 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 7DCA4180001C0
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:48 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 9F270CC037D; Mon, 20 Jul 2026 16:27:46 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 5/5] curl: fix CVE-2026-7168
Date: Mon, 20 Jul 2026 16:26:47 +0530
Message-Id: <20260720105647.2451180-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720105647.2451180-1-deeratho@cisco.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241357

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for proxy Digest state reuse across proxy
switches described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507
[2] https://curl.se/docs/CVE-2026-7168.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-7168

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-7168.patch             | 373 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 374 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
new file mode 100644
index 0000000000..b848fbaf84
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
@@ -0,0 +1,373 @@
+From c1cfdf59acbaf9504c4578d4cf56cdd7c8594507 Mon Sep 17 00:00:00 2001
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
+- Adapted setproxy() insertion and test-list placement to the curl 8.19.0 wrynose layout.
+
+(cherry picked from commit c1cfdf59acbaf9504c4578d4cf56cdd7c8594507)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/setopt.c               |  14 +++-
+ lib/vauth/vauth.h          |   1 +
+ tests/data/Makefile.am     |   2 +-
+ tests/data/test1588        | 106 ++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |   2 +-
+ tests/libtest/lib1588.c    | 150 +++++++++++++++++++++++++++++++++++++
+ 6 files changed, 272 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1588
+ create mode 100644 tests/libtest/lib1588.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 84f3e02..d12ffb6 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -49,6 +49,7 @@
+ #include "curlx/strdup.h"
+ #include "escape.h"
+ #include "bufref.h"
++#include "vauth/vauth.h"
+
+ static CURLcode setopt_set_timeout_sec(timediff_t *ptimeout_ms, long secs)
+ {
+@@ -1664,6 +1665,17 @@ static CURLcode cookiefile(struct Curl_easy *data, const char *ptr)
+ #endif
+
+ #ifndef CURL_DISABLE_PROXY
++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
++{
++  if((data->set.str[STRING_PROXY] && proxy) &&
++     !strcmp(data->set.str[STRING_PROXY], proxy))
++    return CURLE_OK;
++
++  Curl_auth_digest_cleanup(&data->state.proxydigest);
++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
++}
++
+ static CURLcode setopt_cptr_proxy(struct Curl_easy *data, CURLoption option,
+                                   const char *ptr)
+ {
+@@ -1759,7 +1771,7 @@ static CURLcode setopt_cptr_proxy(struct Curl_easy *data, CURLoption option,
+      * Setting it to NULL, means no proxy but allows the environment variables
+      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
+      */
+-    return Curl_setstropt(&s->str[STRING_PROXY], ptr);
++    return setproxy(data, ptr);
+   case CURLOPT_PRE_PROXY:
+     /*
+      * Set proxy server:port to use as SOCKS proxy.
+diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
+index 3e66c89..20ee51e 100644
+--- a/lib/vauth/vauth.h
++++ b/lib/vauth/vauth.h
+@@ -117,6 +117,7 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+ /* This is used to clean up the digest specific data */
+ void Curl_auth_digest_cleanup(struct digestdata *digest);
+ #else
++#define Curl_auth_digest_cleanup(x)
+ #define Curl_auth_is_digest_supported()       FALSE
+ #endif /* !CURL_DISABLE_DIGEST_AUTH */
+
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 1b76b01..1e84b26 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -208,7 +208,7 @@ test1548 test1549 test1550 test1551 test1552 test1553 test1554 test1555 \
+ test1556 test1557 test1558 test1559 test1560 test1561 test1562 test1563 \
+ test1564 test1565 test1566 test1567 test1568 test1569 test1570 test1571 \
+ test1572 test1573 test1574 test1575 test1576 test1577 test1578 test1579 \
+-test1580 test1581 test1582 test1583 test1584 test1585 \
++test1580 test1581 test1582 test1583 test1584 test1585 test1588 \
+ \
+ test1590 test1591 test1592 test1593 test1594 test1595 test1596 test1597 \
+ test1598 test1599 test1600 test1601 test1602 test1603 test1604 test1605 \
+diff --git a/tests/data/test1588 b/tests/data/test1588
+new file mode 100644
+index 0000000..753e98c
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
++<data crlf="headers">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++And you should ignore this data.
++</data>
++
++# then this is returned when we get proxy-auth
++<data1000 crlf="headers">
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
++digest
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
+index 2f77c16..96b82bc 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -97,7 +97,7 @@ TESTS_C = \
+   lib1559.c lib1560.c                               lib1564.c lib1565.c \
+   lib1567.c lib1568.c lib1569.c           lib1571.c \
+   lib1576.c \
+-  lib1582.c \
++  lib1582.c lib1588.c \
+   lib1591.c lib1592.c lib1593.c lib1594.c                     lib1597.c \
+   lib1598.c lib1599.c \
+   lib1662.c \
+diff --git a/tests/libtest/lib1588.c b/tests/libtest/lib1588.c
+new file mode 100644
+index 0000000..9b12f36
+--- /dev/null
++++ b/tests/libtest/lib1588.c
+@@ -0,0 +1,150 @@
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
++#include "first.h"
++
++static CURLcode init1588(CURL *curl, const char *url,
++                         const char *userpwd, const char *proxy)
++{
++  CURLcode result = CURLE_OK;
++
++  res_easy_setopt(curl, CURLOPT_URL, url);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY, proxy);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
++  if(result)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
++  if(result)
++    goto init_failed;
++#if 0
++  res_easy_setopt(curl, CURLOPT_HTTPPROXYTUNNEL, 1L);
++  if(result)
++    goto init_failed;
++#endif
++
++  res_easy_setopt(curl, CURLOPT_HEADER, 1L);
++  if(result)
++    goto init_failed;
++
++  return CURLE_OK; /* success */
++
++init_failed:
++  return result; /* failure */
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
++static CURLcode test_lib1588(const char *URL)
++{
++  CURLcode result = CURLE_OK;
++  CURL *curl = NULL;
++  const char *proxyuserpws = libtest_arg4;
++  struct curl_slist *host = NULL;
++  struct curl_slist *host2 = NULL;
++  char proxy1_resolve[128];
++  char proxy2_resolve[128];
++  char proxy1_connect[128];
++  char proxy2_connect[128];
++
++  if(test_argc < 3)
++    return TEST_ERR_MAJOR_BAD;
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
++  result = run1588(curl, URL, proxyuserpws, proxy1_connect);
++  if(result)
++    goto test_cleanup;
++
++  curl_mfprintf(stderr, "lib1588: now we do the request again\n");
++
++  result = run1588(curl, URL, proxyuserpws, proxy2_connect);
++
++test_cleanup:
++
++  /* proper cleanup sequence - type PB */
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  curl_slist_free_all(host);
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 683163bfa6..7996aa7d00 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
+    file://CVE-2026-7168.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


