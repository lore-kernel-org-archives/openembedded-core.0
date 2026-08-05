Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D124AC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:33 +0000 (UTC)
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35947.1785918685491339486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DUq4Qc9a;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15934; q=dns/txt;
  s=iport01; t=1785918685; x=1787128285;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=z+qknjGANL0uQa5ueI6mSIgTc3lkvp2f03Yfk86rbr8=;
  b=DUq4Qc9antFGO4U5Be0Q8A11SzjpQap5AtkzUWlMaKgqRCVH+NNSX46t
   Y3C6E8nt9Yl8ngJdT++IgdZWPALTTqO8Z41f9wNcbLGXdqy+HOeDqE3Yf
   +7gME3wBuW3r9JSD+FZ6RFYv1HK6KlvrjJEHKT/MH7IkXf8tlVAmYf+Xr
   RORxrIjRLyr/hXYNJcFoRbWhOBUVDTxgo3jhBiSJzCbyv5/3VkHBUwXRR
   nIIGqEheR7ZjoXSNGrVg0cPlU1DX9b5nj3aweylhbyi4+iu/rjHqo7AbQ
   Dwhz6hT1JkmNeWOeqQ4VIZjre0cmJjjVbkmNEO0wwSarJA9cFB03J1UTw
   g==;
X-CSE-ConnectionGUID: n8Cwt1ElRvuVxURYUGh9ew==
X-CSE-MsgGUID: xvHR3UU6REGvnwPyM+V7vQ==
X-IPAS-Result: =?us-ascii?q?A0AaAACA83Jq/8tK/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHKHN4E1bAOLZJI3FIFqDwEBAQ9EDQQBAYFxASCCcwKNZ?=
 =?us-ascii?q?gImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBA?=
 =?us-ascii?q?ycLARgBPRwDAQIZFiALIwgRCIMCAYI6AzcDEQa9WoF5M4EBgygBPwICQAFQ2?=
 =?us-ascii?q?EkNglgBCxQBgTgBhT6CfoUjXRgBg12BHycbG4FygRWDaYEFgRpCAgGBIgQha?=
 =?us-ascii?q?IV1BIIigQyBWoEmJYFZjVNIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBwWBHYEohG0jGTZ8gQlegS0qZRIXgQmCewKCem8LGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?Wggggg3ATEvASEMAQcMFgEBL4FTAigRCwEVCJJ0kCeCHoE4nmlxCiiDdYwhj?=
 =?us-ascii?q?z6FfBozhVulEQuYfY4KhAmRLYEahGmBaDyBWXAVO4JnCRY0GQ9WjVcLC4F4g?=
 =?us-ascii?q?WiGQMVhPDUCCTIBAQcCBw4DC4FokAAmgVgBAQ?=
IronPort-Data: A9a23:4fqXTawfCi8wbaZsAXZ6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVTz
 mAYXW+Oa/jfamL8L9kka9jkpEpQ6sCGxodgGVRvpFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEdmFpIEo8tzO39Ty
 +wlEgEwQRDSiv3jldpXSsE07igiBMDmJsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkybC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW8bYKPK4LRLSlTtlaGh
 lidwlmnODw1KtqA8SugsUzzmNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:B8z1Hqvx6oow8fBlLDUGjY/N7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:3DwF6W8Ui905lUZfQh+Vv0hEMd85K1DZ9mnNHV+FM1dUZ73EREDFrQ==
X-Talos-MUID: 9a23:jJc1cAkaSt2RYIaLBQGmdnpyKudSuJmTVnogvosApPGVEG9OZCmk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="59502963"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:21 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id DA04218000143
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:20 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 8FBBBCC8C84; Wed,  5 Aug 2026 14:01:19 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 6/8] curl: fix CVE-2026-11856
Date: Wed,  5 Aug 2026 14:01:01 +0530
Message-Id: <20260805083103.2633995-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242844

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream curl security backports for
CVE-2026-11856. The main fix commit is referenced in [1], the
Digest proxy-state follow-up is referenced in [2], and the public
curl advisory is referenced in [3]. The individual backported commit
links are recorded in the embedded patch headers.

[1] https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45cae0f96ffabc535
[2] https://github.com/curl/curl/commit/7ec25148c06b049d3252172ff17fae85b19c54c9
[3] https://curl.se/docs/CVE-2026-11856.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-11856_p1.patch         | 372 ++++++++++++++++++
 .../curl/curl/CVE-2026-11856_p2.patch         |  72 ++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 446 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch
new file mode 100644
index 0000000000..80fb18a7c1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch
@@ -0,0 +1,372 @@
+From 3349fbcb7876456cadc3cc3a8d3e8aff29406906 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 13 Jul 2026 23:17:23 -0700
+Subject: [PATCH] digest: flush state on origin or credential change
+
+Verified by test 1686
+
+Closes #21944
+
+CVE: CVE-2026-11856
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45cae0f96ffabc535]
+
+Backport Changes:
+- Wrynose curl 8.19.0 does not have upstream Curl_peer or
+  struct Curl_creds. This backport stores the host Digest origin
+  and user/password on digestdata, then flushes stale host Digest
+  state before reuse when either value changes.
+- Kept Wrynose test-list ordering and added only the upstream
+  test1686/lib1686 regression coverage.
+
+(cherry picked from commit 5c6b4880357ab3e72967c1c45cae0f96ffabc535)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/http_digest.c          | 50 ++++++++++++++++++++
+ lib/urldata.h              |  3 ++
+ lib/vauth/digest.c         |  3 ++
+ lib/vauth/digest_sspi.c    |  4 ++
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test1686        | 84 +++++++++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |  1 +
+ tests/libtest/lib1686.c    | 96 ++++++++++++++++++++++++++++++++++++++
+ 8 files changed, 242 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test1686
+ create mode 100644 tests/libtest/lib1686.c
+
+diff --git a/lib/http_digest.c b/lib/http_digest.c
+index f5b20c5e9d..29bfa3b0b3 100644
+--- a/lib/http_digest.c
++++ b/lib/http_digest.c
+@@ -29,6 +29,7 @@
+ #include "strcase.h"
+ #include "vauth/vauth.h"
+ #include "http_digest.h"
++#include "curlx/strdup.h"
+ #include "curlx/strparse.h"
+ 
+ /* Test example headers:
+@@ -38,6 +39,49 @@ Proxy-Authenticate: Digest realm="testrealm", nonce="1053604598"
+ 
+ */
+ 
++static CURLcode digest_update_origin(struct Curl_easy *data,
++                                     struct digestdata *digest,
++                                     const char *userp,
++                                     const char *passwdp)
++{
++  char *origin;
++  char *authuser;
++  char *authpasswd;
++  bool flush = FALSE;
++
++  origin = curl_maprintf("%s:%d:%s", data->conn->scheme->name,
++                         data->conn->remote_port, data->conn->host.name);
++  if(!origin)
++    return CURLE_OUT_OF_MEMORY;
++
++  authuser = curlx_strdup(userp);
++  authpasswd = curlx_strdup(passwdp);
++  if(!authuser || !authpasswd) {
++    curlx_free(origin);
++    curlx_free(authuser);
++    curlx_free(authpasswd);
++    return CURLE_OUT_OF_MEMORY;
++  }
++
++  if(digest->authorigin && Curl_timestrcmp(digest->authorigin, origin))
++    flush = TRUE;
++  else if(digest->authuser && Curl_timestrcmp(digest->authuser, userp))
++    flush = TRUE;
++  else if(digest->authpasswd && Curl_timestrcmp(digest->authpasswd, passwdp))
++    flush = TRUE;
++
++  if(flush)
++    Curl_auth_digest_cleanup(digest);
++
++  Curl_safefree(digest->authorigin);
++  Curl_safefree(digest->authuser);
++  Curl_safefree(digest->authpasswd);
++  digest->authorigin = origin;
++  digest->authuser = authuser;
++  digest->authpasswd = authpasswd;
++  return CURLE_OK;
++}
++
+ CURLcode Curl_input_digest(struct Curl_easy *data,
+                            bool proxy,
+                            const char *header) /* rest of the *-authenticate:
+@@ -114,6 +158,12 @@ CURLcode Curl_output_digest(struct Curl_easy *data,
+   if(!passwdp)
+     passwdp = "";
+ 
++  if(!proxy) {
++    result = digest_update_origin(data, digest, userp, passwdp);
++    if(result)
++      return result;
++  }
++
+ #ifdef USE_WINDOWS_SSPI
+   have_chlg = !!digest->input_token;
+ #else
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 455ed7f996..113f6e7102 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -283,6 +283,9 @@ struct ssl_general_config {
+ #ifndef CURL_DISABLE_DIGEST_AUTH
+ /* Struct used for Digest challenge-response authentication */
+ struct digestdata {
++  char *authorigin; /* origin used for the host Digest state */
++  char *authuser;   /* user used for the host Digest state */
++  char *authpasswd; /* password used for the host Digest state */
+ #ifdef USE_WINDOWS_SSPI
+   BYTE *input_token;
+   size_t input_token_len;
+diff --git a/lib/vauth/digest.c b/lib/vauth/digest.c
+index 9609390387..1feee07764 100644
+--- a/lib/vauth/digest.c
++++ b/lib/vauth/digest.c
+@@ -1028,6 +1028,9 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+  */
+ void Curl_auth_digest_cleanup(struct digestdata *digest)
+ {
++  Curl_safefree(digest->authorigin);
++  Curl_safefree(digest->authuser);
++  Curl_safefree(digest->authpasswd);
+   Curl_safefree(digest->nonce);
+   Curl_safefree(digest->cnonce);
+   Curl_safefree(digest->realm);
+diff --git a/lib/vauth/digest_sspi.c b/lib/vauth/digest_sspi.c
+index f29e569cd1..4688a7b5c5 100644
+--- a/lib/vauth/digest_sspi.c
++++ b/lib/vauth/digest_sspi.c
+@@ -636,6 +636,10 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+  */
+ void Curl_auth_digest_cleanup(struct digestdata *digest)
+ {
++  Curl_safefree(digest->authorigin);
++  Curl_safefree(digest->authuser);
++  Curl_safefree(digest->authpasswd);
++
+   /* Free the input token */
+   Curl_safefree(digest->input_token);
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index f9d20a9cc8..89eae33ca0 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -226,7 +226,7 @@ test1660 test1661 test1662 test1663 test1664 test1665 \
+ \
+ test1670 test1671 \
+ \
+-test1680 test1681 test1682 test1683 \
++test1680 test1681 test1682 test1683 test1686 \
+ \
+ test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707 \
+ test1708 test1709 test1710 test1711 test1712 \
+diff --git a/tests/data/test1686 b/tests/data/test1686
+new file mode 100644
+index 0000000000..2d419ad608
+--- /dev/null
++++ b/tests/data/test1686
+@@ -0,0 +1,84 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++Digest
++</keywords>
++</info>
++
++<reply>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 401 Authorization Required
++Server: Apache/1.3.27 (Darwin) PHP/4.1.2
++WWW-Authenticate: Digest realm="my-backyard", nonce="314156295"
++Content-Length: 26
++
++This is not the real page
++</data>
++
++# This is supposed to be returned when the server gets a
++# Authorization: Digest line passed-in from the client
++<data1000 crlf="headers">
++HTTP/1.1 200 OK
++Server: Apache/1.3.27 (Darwin) PHP/4.1.2
++Content-Type: text/html; charset=iso-8859-1
++Content-Length: 23
++
++This IS the real page!
++</data1000>
++
++</reply>
++
++<client>
++<features>
++!SSPI
++crypto
++digest
++</features>
++<server>
++http
++</server>
++<name>
++HTTP Digest to different origins and switching credentials
++</name>
++<tool>
++lib%TESTNUMBER
++</tool>
++<command>
++%HOSTIP %HTTPPORT
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET /api HTTP/1.1
++Host: first.test:%HTTPPORT
++Accept: */*
++
++GET /api HTTP/1.1
++Host: first.test:%HTTPPORT
++Authorization: Digest username="alice", realm="my-backyard", nonce="314156295", uri="/api", response="4ecc00e567c37a9d537727890c2e5b32"
++Accept: */*
++
++GET /hook HTTP/1.1
++Host: second.test:%HTTPPORT
++Accept: */*
++
++GET /hook HTTP/1.1
++Host: second.test:%HTTPPORT
++Authorization: Digest username="alice", realm="my-backyard", nonce="314156295", uri="/hook", response="d3a7738fb6a23f5543fb8dacc0f0f253"
++Accept: */*
++
++GET /hook HTTP/1.1
++Host: second.test:%HTTPPORT
++Accept: */*
++
++GET /hook HTTP/1.1
++Host: second.test:%HTTPPORT
++Authorization: Digest username="bob", realm="my-backyard", nonce="314156295", uri="/hook", response="777e68eddb77294d9cbd6134973cbbab"
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index e938b87bc5..ef23ca4e28 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -102,6 +102,7 @@ TESTS_C = \
+   lib1598.c lib1599.c \
+   lib1647.c \
+   lib1662.c \
++  lib1686.c \
+   lib1900.c lib1901.c lib1902.c lib1903.c lib1905.c lib1906.c lib1907.c \
+   lib1908.c           lib1910.c lib1911.c lib1912.c lib1913.c \
+   lib1915.c lib1916.c           lib1918.c lib1919.c lib1920.c \
+diff --git a/tests/libtest/lib1686.c b/tests/libtest/lib1686.c
+new file mode 100644
+index 0000000000..e457012bb9
+--- /dev/null
++++ b/tests/libtest/lib1686.c
+@@ -0,0 +1,96 @@
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
++#include "first.h"
++
++static size_t devnull_1686(char *p, size_t s, size_t n, void *u)
++{
++  (void)p;
++  (void)u;
++  return s * n;
++}
++
++#define FIRSTHOST "first.test"
++#define SECONDHOST "second.test"
++
++static CURLcode test_lib1686(const char *hostip)
++{
++  CURL *curl = NULL;
++  CURLcode result = CURLE_OK;
++  const char *httpport = libtest_arg2;
++  char firsturl[100];
++  char secondurl[100];
++  char firstres[100];
++  char secondres[100];
++  struct curl_slist *host = NULL;
++  struct curl_slist *host2 = NULL;
++
++  if(curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
++    curl_mfprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  /* create strings for CURLOPT_RESOLVE */
++  curl_msnprintf(firstres, sizeof(firstres), "%s:%s:%s",
++                 FIRSTHOST, httpport, hostip);
++  curl_msnprintf(secondres, sizeof(secondres), "%s:%s:%s",
++                 SECONDHOST, httpport, hostip);
++
++  /* create URLs */
++  curl_msnprintf(firsturl, sizeof(firsturl), "http://%s:%s/api",
++                 FIRSTHOST, httpport);
++  curl_msnprintf(secondurl, sizeof(secondurl), "http://%s:%s/hook",
++                 SECONDHOST, httpport);
++
++  host = curl_slist_append(NULL, firstres);
++  if(!host)
++    goto test_cleanup;
++  host2 = curl_slist_append(host, secondres);
++  if(!host2)
++    goto test_cleanup;
++  host = host2;
++
++  curl = curl_easy_init();
++  if(curl) {
++    easy_setopt(curl, CURLOPT_RESOLVE, host);
++    easy_setopt(curl, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);
++    easy_setopt(curl, CURLOPT_USERPWD, "alice:bond");
++    easy_setopt(curl, CURLOPT_WRITEFUNCTION, devnull_1686);
++
++    easy_setopt(curl, CURLOPT_URL, firsturl);
++    result = curl_easy_perform(curl);
++
++    easy_setopt(curl, CURLOPT_URL, secondurl);
++    result = curl_easy_perform(curl);
++
++    easy_setopt(curl, CURLOPT_USERPWD, "bob:secret");
++    easy_setopt(curl, CURLOPT_URL, secondurl);
++    result = curl_easy_perform(curl);
++  }
++
++test_cleanup:
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  curl_slist_free_all(host);
++  return result;
++}
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-11856_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-11856_p2.patch
new file mode 100644
index 0000000000..4e3dc45186
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11856_p2.patch
@@ -0,0 +1,72 @@
+From 0d7f5b5037e2878ee68ca8317445df1240d117bf Mon Sep 17 00:00:00 2001
+From: alhudz <al.hudz.k@gmail.com>
+Date: Thu, 30 Jul 2026 22:18:13 -0700
+Subject: [PATCH] digest: flush proxy state on proxy or credential change
+
+Closes #21951
+
+CVE: CVE-2026-11856
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7ec25148c06b049d3252172ff17fae85b19c54c9]
+
+Backport Changes:
+- Wrynose curl 8.19.0 does not have upstream Curl_peer or Curl_creds.
+  This backport extends the string-based Digest origin and credential
+  tracking introduced by upstream commit [1] to the proxy path, so
+  proxy Digest state is flushed when the proxy destination or proxy
+  credentials change.
+
+[1] https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45cae0f96ffabc535
+
+(cherry picked from commit 7ec25148c06b049d3252172ff17fae85b19c54c9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/http_digest.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/lib/http_digest.c b/lib/http_digest.c
+index 29bfa3b0b3..06e4028f02 100644
+--- a/lib/http_digest.c
++++ b/lib/http_digest.c
+@@ -41,6 +41,7 @@ Proxy-Authenticate: Digest realm="testrealm", nonce="1053604598"
+ 
+ static CURLcode digest_update_origin(struct Curl_easy *data,
+                                      struct digestdata *digest,
++                                     bool proxy,
+                                      const char *userp,
+                                      const char *passwdp)
+ {
+@@ -49,8 +50,15 @@ static CURLcode digest_update_origin(struct Curl_easy *data,
+   char *authpasswd;
+   bool flush = FALSE;
+ 
+-  origin = curl_maprintf("%s:%d:%s", data->conn->scheme->name,
+-                         data->conn->remote_port, data->conn->host.name);
++#ifndef CURL_DISABLE_PROXY
++  if(proxy)
++    origin = curl_maprintf("%d:%d:%s", data->conn->http_proxy.proxytype,
++                           data->conn->http_proxy.port,
++                           data->conn->http_proxy.host.name);
++  else
++#endif
++    origin = curl_maprintf("%s:%d:%s", data->conn->scheme->name,
++                           data->conn->remote_port, data->conn->host.name);
+   if(!origin)
+     return CURLE_OUT_OF_MEMORY;
+ 
+@@ -158,11 +166,9 @@ CURLcode Curl_output_digest(struct Curl_easy *data,
+   if(!passwdp)
+     passwdp = "";
+ 
+-  if(!proxy) {
+-    result = digest_update_origin(data, digest, userp, passwdp);
+-    if(result)
+-      return result;
+-  }
++  result = digest_update_origin(data, digest, proxy, userp, passwdp);
++  if(result)
++    return result;
+ 
+ #ifdef USE_WINDOWS_SSPI
+   have_chlg = !!digest->input_token;
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 33ccb73eb3..b0edc5b960 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,8 @@ SRC_URI = " \
     file://CVE-2026-8932-dependent.patch \
     file://CVE-2026-8932.patch \
     file://CVE-2026-8458.patch \
+    file://CVE-2026-11856_p1.patch \
+    file://CVE-2026-11856_p2.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


