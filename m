Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E13CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:13 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7418.1791372245153739668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OaptspmH;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17299; q=dns/txt;
  s=iport01; t=1791372245; x=1792581845;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VYfZQEuIjXZKZyIVkm8IsnG0KBZwc54SWggluT+tMcY=;
  b=OaptspmHfhV7Co0lzb3wXV/WzczeH9uc/o9c5D6N/h1tBiCeZICgmc8z
   m61tbopExSJuhvu7Qvsycn2xk52Pb1oR+hHixSjG3xLGS3A6GDkAgtIWk
   1Tm8NRu5zpk7b++8Qsb2hj7bcRIn8t/kXMmKSQVlws//qPUqGy0Zn3oNH
   XXcFsVL23Z/lDGFh7tv/u4ncRCjyQXChyboUCLcLZ+G41rs1oSb9o06CW
   UHG+A0OV2CZmP8hNJBc27mXptWP2UqEEcvIN5oUWyMCp2pnMk4/e1JIT9
   eP3HEuKCsBKulYKZfMp3bMoftrJDRzCSyRDeQ7L69BUDdZUtFk7CV4Gz7
   Q==;
X-CSE-ConnectionGUID: BCpVuS6LS9SyVnpZdU8Lqg==
X-CSE-MsgGUID: cFsKAgBTTXK30GiGGvTgBw==
X-IPAS-Result: =?us-ascii?q?A0BLAgCcKsZq/4//Ja1RCYJZgld1YUJJlCmCIQOeGhSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGBcQEggnMCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAhkWKyMIGYMCAYJ0AgERB?=
 =?us-ascii?q?rVmgXkzgQGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?VwCAYEiERRohXUEgg0VgQyBWh5lSoNBiQuFXEiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDCkYDUgRLDcVGQQ+bgeQW?=
 =?us-ascii?q?x6CWQUCFhsvASEMARMWAQEvUIE7AQIMARQIknQHkCCCIYE1n1oKKIN2jCKVO?=
 =?us-ascii?q?hozhVulFJkIizeCU5U0NGiEaYFoPIFZcBU7gmcJFjQZD44uCwuDYIZAxVghJ?=
 =?us-ascii?q?DUCCTIBAQcCBw4DC4FokCaBWAEB?=
IronPort-Data: A9a23:HJsitaPXsh+7V0TvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp2hTUEy
 zZMC26Da66Kamegfth0O42wo0IGvcPRyoRlQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9g2Esawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj699FFH8rBtM8wbdMEF9I7
 c4UFWApdx/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQsi+Kxb4WNJITiqcN9lWiDh
 UvJ1VjFMjJBbPOe5hWbzn2Gmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:kaXwr6GUYHMLYycJpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:+1n4MW0IdpRD7xfnE26Wl7xfMOs9TGDmklPrcnSpN2BxerGoGXuJ9/Yx
X-Talos-MUID: 9a23:pXqWkgXO8t0JH6Xq/DTCnxJLO+1U35SNUxgikLoppfWLHzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="532477060"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:04 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 05D411800026C
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:04 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 5BCDBCBF21E; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 6/8] curl: fix CVE-2026-8932
Date: Wed,  7 Oct 2026 04:24:01 -0700
Message-Id: <20261007112403.486499-6-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007112403.486499-1-devanshp@cisco.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247394

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4fa3ba3e
[2] https://curl.se/docs/CVE-2026-8932.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8932.patch             | 427 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 428 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8932.patch b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
new file mode 100644
index 0000000000..0b539c54ab
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
@@ -0,0 +1,427 @@
+From c25faf128bba57a64da636f126773b858b35bc27 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Tue, 19 May 2026 11:47:50 +0200
+Subject: [PATCH] tls: fix incomplete mTLS config in conn reuse and session
+ cache
+
+cert_type, key, key_type, key_passwd and key_blob lived in
+ssl_config_data but not in ssl_primary_config, so they were invisible to
+match_ssl_primary_config() and to the TLS session cache peer key.
+
+Two easy handles sharing a connection pool could reuse each other's
+authenticated connections when they differed only on SSLKEY, SSLKEYTYPE,
+KEYPASSWD, SSLCERTTYPE or SSLKEYBLOB. The second handle would silently
+inherit the first handle's authenticated identity.
+
+Promote all five fields into ssl_primary_config so the conn-reuse
+predicate and session cache key cover the complete client credential
+set. Also replace the fixed ":CCERT" session cache marker with the
+actual clientcert path so sessions are not shared across different
+client certificates.
+
+Verified by test 3303 and 3304
+
+Reported-By: Joshua Rogers (AISLE Research)
+Closes #21667
+
+CVE: CVE-2026-8932
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4fa3ba3e]
+
+Backport Changes:
+- curl 8.7.1 keeps the session cache in vtls.c and stores backend key
+  properties outside ssl_primary_config. Duplicate those pointers into
+  the primary configuration so matching and cloning cover reuse.
+- Keep the old backend members as aliases, so omit backend-only access
+  moves in ldap.c, vssh, and the TLS backend files.
+- Adapt unit3303 to the curl 8.7.1 harness and allocation helpers.
+  Include memdebug.h last so cleanup uses the debug allocator's free()
+  hook. Fold unit3304's case-insensitive cert_type and key_type checks
+  into it.
+- Extend unit3303 with key_blob deep-copy, connection reuse, and TLS
+  session cache matching checks.
+- Omit vtls_scache.c, vtls_scache.h, and unit3304 because their peer
+  key API does not exist in curl 8.7.1. The vtls.c cache uses the
+  updated clone and match functions exercised by unit3303.
+
+(cherry picked from commit 7541ae569d82fb308a5e2d94916027da4fa3ba3e)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/urldata.h           |   5 +
+ lib/vtls/vtls.c         |  25 +++++
+ tests/data/Makefile.inc |   3 +-
+ tests/data/test3303     |  23 +++++
+ tests/unit/Makefile.inc |   4 +-
+ tests/unit/unit3303.c   | 210 ++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 268 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test3303
+ create mode 100644 tests/unit/unit3303.c
+
+diff --git a/lib/urldata.h b/lib/urldata.h
+index d2d9424197..9015515e17 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -286,6 +286,11 @@ struct ssl_primary_config {
+   char *CAfile;          /* certificate to verify peer against */
+   char *issuercert;      /* optional issuer certificate filename */
+   char *clientcert;
++  char *cert_type;       /* format for certificate (default: PEM) */
++  char *key;             /* private key file name */
++  struct curl_blob *key_blob;
++  char *key_type;        /* format for private key (default: PEM) */
++  char *key_passwd;      /* plain text private key password */
+   char *cipher_list;     /* list of ciphers to use */
+   char *cipher_list13;   /* list of TLS 1.3 cipher suites to use */
+   char *pinned_key;
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index d13a3cb1b7..c89e8abcc6 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -187,10 +187,15 @@ match_ssl_primary_config(struct Curl_easy *data,
+      blobcmp(c1->cert_blob, c2->cert_blob) &&
+      blobcmp(c1->ca_info_blob, c2->ca_info_blob) &&
+      blobcmp(c1->issuercert_blob, c2->issuercert_blob) &&
++     blobcmp(c1->key_blob, c2->key_blob) &&
+      Curl_safecmp(c1->CApath, c2->CApath) &&
+      Curl_safecmp(c1->CAfile, c2->CAfile) &&
+      Curl_safecmp(c1->issuercert, c2->issuercert) &&
+      Curl_safecmp(c1->clientcert, c2->clientcert) &&
++     curl_strequal(c1->cert_type, c2->cert_type) &&
++     Curl_safecmp(c1->key, c2->key) &&
++     curl_strequal(c1->key_type, c2->key_type) &&
++     !Curl_timestrcmp(c1->key_passwd, c2->key_passwd) &&
+ #ifdef USE_TLS_SRP
+      !Curl_timestrcmp(c1->username, c2->username) &&
+      !Curl_timestrcmp(c1->password, c2->password) &&
+@@ -234,10 +239,15 @@ static bool clone_ssl_primary_config(struct ssl_primary_config *source,
+   CLONE_BLOB(cert_blob);
+   CLONE_BLOB(ca_info_blob);
+   CLONE_BLOB(issuercert_blob);
++  CLONE_BLOB(key_blob);
+   CLONE_STRING(CApath);
+   CLONE_STRING(CAfile);
+   CLONE_STRING(issuercert);
+   CLONE_STRING(clientcert);
++  CLONE_STRING(cert_type);
++  CLONE_STRING(key);
++  CLONE_STRING(key_type);
++  CLONE_STRING(key_passwd);
+   CLONE_STRING(cipher_list);
+   CLONE_STRING(cipher_list13);
+   CLONE_STRING(pinned_key);
+@@ -257,12 +267,17 @@ static void Curl_free_primary_ssl_config(struct ssl_primary_config *sslc)
+   Curl_safefree(sslc->CAfile);
+   Curl_safefree(sslc->issuercert);
+   Curl_safefree(sslc->clientcert);
++  Curl_safefree(sslc->cert_type);
++  Curl_safefree(sslc->key);
++  Curl_safefree(sslc->key_type);
++  Curl_safefree(sslc->key_passwd);
+   Curl_safefree(sslc->cipher_list);
+   Curl_safefree(sslc->cipher_list13);
+   Curl_safefree(sslc->pinned_key);
+   Curl_safefree(sslc->cert_blob);
+   Curl_safefree(sslc->ca_info_blob);
+   Curl_safefree(sslc->issuercert_blob);
++  Curl_safefree(sslc->key_blob);
+   Curl_safefree(sslc->curves);
+   Curl_safefree(sslc->CRLfile);
+ #ifdef USE_TLS_SRP
+@@ -297,6 +312,11 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   data->set.ssl.key_passwd = data->set.str[STRING_KEY_PASSWD];
+   data->set.ssl.primary.clientcert = data->set.str[STRING_CERT];
+   data->set.ssl.key_blob = data->set.blobs[BLOB_KEY];
++  data->set.ssl.primary.cert_type = data->set.ssl.cert_type;
++  data->set.ssl.primary.key = data->set.ssl.key;
++  data->set.ssl.primary.key_type = data->set.ssl.key_type;
++  data->set.ssl.primary.key_passwd = data->set.ssl.key_passwd;
++  data->set.ssl.primary.key_blob = data->set.ssl.key_blob;
+ 
+ #ifndef CURL_DISABLE_PROXY
+   data->set.proxy_ssl.primary.CApath = data->set.str[STRING_SSL_CAPATH_PROXY];
+@@ -322,6 +342,11 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   data->set.proxy_ssl.key_passwd = data->set.str[STRING_KEY_PASSWD_PROXY];
+   data->set.proxy_ssl.primary.clientcert = data->set.str[STRING_CERT_PROXY];
+   data->set.proxy_ssl.key_blob = data->set.blobs[BLOB_KEY_PROXY];
++  data->set.proxy_ssl.primary.cert_type = data->set.proxy_ssl.cert_type;
++  data->set.proxy_ssl.primary.key = data->set.proxy_ssl.key;
++  data->set.proxy_ssl.primary.key_type = data->set.proxy_ssl.key_type;
++  data->set.proxy_ssl.primary.key_passwd = data->set.proxy_ssl.key_passwd;
++  data->set.proxy_ssl.primary.key_blob = data->set.proxy_ssl.key_blob;
+ #ifdef USE_TLS_SRP
+   data->set.proxy_ssl.primary.username =
+     data->set.str[STRING_TLSAUTH_USERNAME_PROXY];
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index f420a8a4f5..27b1b52a10 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -264,4 +264,5 @@ test3024 test3025 test3026 test3027 test3028 test3029 test3030 \
+ \
+ test3100 test3101 test3102 test3103 \
+ test3200 \
+-test3201 test3202
++test3201 test3202 \
++test3303
+diff --git a/tests/data/test3303 b/tests/data/test3303
+new file mode 100644
+index 0000000000..9b52bcb817
+--- /dev/null
++++ b/tests/data/test3303
+@@ -0,0 +1,23 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++unittest
++TLS
++mTLS
++</keywords>
++</info>
++
++# Client-side
++<client>
++<server>
++none
++</server>
++<features>
++unittest
++</features>
++<name>
++conn-reuse match distinguishes mTLS key, cert_type, key_type and key_passwd fields
++</name>
++</client>
++</testcase>
+diff --git a/tests/unit/Makefile.inc b/tests/unit/Makefile.inc
+index 1926b49b3a..afbe29d2b7 100644
+--- a/tests/unit/Makefile.inc
++++ b/tests/unit/Makefile.inc
+@@ -39,7 +39,7 @@ UNITPROGS = unit1300          unit1302 unit1303 unit1304 unit1305 unit1307 \
+  unit1650 unit1651 unit1652 unit1653 unit1654 unit1655 unit1656 \
+  unit1660 unit1661 \
+  unit2600 unit2601 unit2602 unit2603 \
+- unit3200
++ unit3200 unit3303
+ 
+ unit1300_SOURCES = unit1300.c $(UNITFILES)
+ 
+@@ -134,3 +134,5 @@ unit2602_SOURCES = unit2602.c $(UNITFILES)
+ unit2603_SOURCES = unit2603.c $(UNITFILES)
+ 
+ unit3200_SOURCES = unit3200.c $(UNITFILES)
++
++unit3303_SOURCES = unit3303.c $(UNITFILES)
+diff --git a/tests/unit/unit3303.c b/tests/unit/unit3303.c
+new file mode 100644
+index 0000000000..f9928b638a
+--- /dev/null
++++ b/tests/unit/unit3303.c
+@@ -0,0 +1,210 @@
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
++#include "curlcheck.h"
++#include "cfilters.h"
++#include "http.h"
++#include "urldata.h"
++
++#ifdef USE_SSL
++#include "vtls/vtls.h"
++#include "vtls/vtls_int.h"
++#endif
++#include "memdebug.h" /* LAST include file */
++
++static CURLcode unit_setup(void)
++{
++  return curl_global_init(CURL_GLOBAL_ALL);
++}
++
++static void unit_stop(void)
++{
++  curl_global_cleanup();
++}
++
++UNITTEST_START
++#ifdef USE_SSL
++{
++  CURL *curl;
++  struct Curl_easy *data;
++  struct connectdata *conn;
++  struct Curl_cfilter cf;
++  struct ssl_connect_data sslctx;
++  struct ssl_primary_config *primary;
++  struct curl_blob key_blob;
++  struct curl_blob alt_key_blob;
++  struct curl_blob *saved_blob;
++  struct curl_blob *saved_conn_blob;
++  void *sessionid;
++  size_t idsize = 0;
++  bool added = FALSE;
++  char fake_session;
++  char *saved;
++  static char alt_passwd[] = "wrong";
++  static char alt_key[] = "other.key";
++  static char alt_ktype[] = "DER";
++  static char alt_ctype[] = "P12";
++  static char lc_ctype[] = "pem";
++  static char lc_ktype[] = "pem";
++
++  curl = curl_easy_init();
++  abort_unless(curl, "curl_easy_init failed");
++  data = (struct Curl_easy *)curl;
++
++  key_blob.data = (void *)"first private key";
++  key_blob.len = sizeof("first private key") - 1;
++  key_blob.flags = CURL_BLOB_COPY;
++  alt_key_blob.data = (void *)"second private key";
++  alt_key_blob.len = sizeof("second private key") - 1;
++  alt_key_blob.flags = CURL_BLOB_NOCOPY;
++
++  curl_easy_setopt(curl, CURLOPT_SSLCERT, "client.pem");
++  curl_easy_setopt(curl, CURLOPT_SSLKEY, "client.key");
++  curl_easy_setopt(curl, CURLOPT_SSLKEY_BLOB, &key_blob);
++  curl_easy_setopt(curl, CURLOPT_KEYPASSWD, "secret");
++  curl_easy_setopt(curl, CURLOPT_SSLCERTTYPE, "PEM");
++  curl_easy_setopt(curl, CURLOPT_SSLKEYTYPE, "PEM");
++
++  abort_unless(!Curl_ssl_easy_config_complete(data),
++               "Curl_ssl_easy_config_complete failed");
++
++  conn = calloc(1, sizeof(*conn));
++  abort_unless(conn, "connection allocation failed");
++  abort_unless(!Curl_ssl_conn_config_init(data, conn),
++               "Curl_ssl_conn_config_init failed");
++
++  fail_unless(Curl_ssl_conn_config_match(data, conn, FALSE),
++              "identical mTLS config should match");
++
++  primary = &data->set.ssl.primary;
++
++  fail_unless(conn->ssl_config.key_blob &&
++              conn->ssl_config.key_blob != primary->key_blob &&
++              conn->ssl_config.key_blob->len == primary->key_blob->len &&
++              !memcmp(conn->ssl_config.key_blob->data,
++                      primary->key_blob->data, primary->key_blob->len),
++              "key_blob must be cloned into the connection config");
++
++  saved_blob = primary->key_blob;
++  primary->key_blob = &alt_key_blob;
++  fail_unless(!Curl_ssl_conn_config_match(data, conn, FALSE),
++              "different key_blob must not reuse conn");
++  primary->key_blob = saved_blob;
++
++  saved = primary->key_passwd;
++  primary->key_passwd = alt_passwd;
++  fail_unless(!Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                          FALSE),
++              "different key_passwd must not reuse conn");
++  primary->key_passwd = saved;
++
++  saved = primary->key;
++  primary->key = alt_key;
++  fail_unless(!Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                          FALSE),
++              "different key must not reuse conn");
++  primary->key = saved;
++
++  saved = primary->key_type;
++  primary->key_type = alt_ktype;
++  fail_unless(!Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                          FALSE),
++              "different key_type must not reuse conn");
++  primary->key_type = saved;
++
++  saved = primary->cert_type;
++  primary->cert_type = alt_ctype;
++  fail_unless(!Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                          FALSE),
++              "different cert_type must not reuse conn");
++  primary->cert_type = saved;
++
++  primary->cert_type = lc_ctype;
++  fail_unless(Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                         FALSE),
++              "cert_type comparison must be case-insensitive");
++  primary->cert_type = saved;
++
++  primary->key_type = lc_ktype;
++  fail_unless(Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                         FALSE),
++              "key_type comparison must be case-insensitive");
++  primary->key_type = saved;
++
++  fail_unless(Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                         FALSE),
++              "restored mTLS config should match");
++
++  memset(&cf, 0, sizeof(cf));
++  memset(&sslctx, 0, sizeof(sslctx));
++  conn->handler = &Curl_handler_https;
++  sslctx.peer.hostname = "example.com";
++  sslctx.port = 443;
++  cf.cft = &Curl_cft_ssl;
++  cf.ctx = &sslctx;
++  cf.conn = conn;
++
++  abort_unless(!Curl_ssl_initsessions(data, 1),
++               "Curl_ssl_initsessions failed");
++  abort_unless(!Curl_ssl_addsessionid(&cf, data, &fake_session, 1,
++                                      &added),
++               "Curl_ssl_addsessionid failed");
++  fail_unless(added, "session was not added to the cache");
++  fail_unless(data->state.session[0].ssl_config.key_blob &&
++              data->state.session[0].ssl_config.key_blob !=
++                conn->ssl_config.key_blob,
++              "key_blob must be cloned into the session cache");
++
++  sessionid = NULL;
++  fail_unless(!Curl_ssl_getsessionid(&cf, data, &sessionid, &idsize) &&
++              sessionid == &fake_session,
++              "identical key_blob should reuse the TLS session");
++
++  saved_conn_blob = conn->ssl_config.key_blob;
++  conn->ssl_config.key_blob = &alt_key_blob;
++  sessionid = NULL;
++  fail_unless(Curl_ssl_getsessionid(&cf, data, &sessionid, &idsize) &&
++              !sessionid,
++              "different key_blob must not reuse the TLS session");
++  conn->ssl_config.key_blob = saved_conn_blob;
++
++  sessionid = NULL;
++  fail_unless(!Curl_ssl_getsessionid(&cf, data, &sessionid, &idsize) &&
++              sessionid == &fake_session,
++              "restored key_blob should reuse the TLS session");
++
++  Curl_ssl_conn_config_cleanup(conn);
++  conn->ssl_config = data->state.session[0].ssl_config;
++  memset(&data->state.session[0].ssl_config, 0,
++         sizeof(data->state.session[0].ssl_config));
++  free(data->state.session[0].name);
++  data->state.session[0].name = NULL;
++  free(data->state.session[0].conn_to_host);
++  data->state.session[0].conn_to_host = NULL;
++  data->state.session[0].sessionid = NULL;
++  Curl_ssl_conn_config_cleanup(conn);
++  free(conn);
++  curl_easy_cleanup(curl);
++}
++#endif /* USE_SSL */
++UNITTEST_STOP
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 9f261955ff..6f9a814457 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -45,6 +45,7 @@ SRC_URI = " \
     file://CVE-2026-8286.patch \
     file://CVE-2026-8927-dependent.patch \
     file://CVE-2026-8927.patch \
+    file://CVE-2026-8932.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


