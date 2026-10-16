Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C94CCF2C3
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:04:42 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21097.1792155881089840302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D4zIjQzI;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17192; q=dns/txt;
  s=iport01; t=1792155881; x=1793365481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H0KKb6aF34xP/0ftm0DPBL3tBgs1MvTl0laFyavqYAM=;
  b=D4zIjQzIPJK74J+800ZzcC9PXYVNnsk7T22MlHj/4+hHyB3smlPlu3HX
   PoER4ldNgr9ITrxHEIoYURtdWL2bV9uJG1+gmj4zWpm6zkIdCh/RlWwkN
   VwiUogXO0r0Pr5qoj9bEna9J/oP78V6znMqO5IN8k0xmSaZbGiq+iaUfj
   KbbYz/M8lT8XQ8ubqSYCgxHUi9CC4iBRd15tJ9GlYd1do/uiiqTqK3hHB
   qBnrg7V5Ur1ST1dh5+kvruwW4fjfZpAN32PFEPrGeDvuFs51UxlOBc5A1
   3CdA3HjV0AdkR/vhKCr3P7vjIFd0MbgV09DHMRgPAQItvwDVgSxZrMhRI
   Q==;
X-CSE-ConnectionGUID: yXK9vXxgQ0WPYG1UI5MNUQ==
X-CSE-MsgGUID: WQptq9yeRXKSDsRMcKdfIg==
X-IPAS-Result: =?us-ascii?q?A0BMAgC2H9Jq/4z/Ja1RCYJZgld1YUJJlkoDnhwUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBgXEBIIJzAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECGRYrIwgZgwIBgnQCAREGv?=
 =?us-ascii?q?XeBeTOBAYMpAT8CAkABUNsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpgQWBX?=
 =?us-ascii?q?AIBgSIRFGiFdQSCDRWBDIFaHmVKg0GKPoV7SIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HkhQegl4FAhYbLwEhDAETFgEBL1BtJycBAgwBFAiSdAeQH4Ihg?=
 =?us-ascii?q?TWfWgoog3aMIpU6GjOFW6UUmQiLN4JTlWcLXYRpgWg8gVlwFTuCZwkWNBkPj?=
 =?us-ascii?q?i4LC4NghkDHeSEkNQIJMgEBBwIHDgMLgWiQAiQJgU8BAQ?=
IronPort-Data: A9a23:dTAB3K9jaBNNVsZZUeXdDrUD7n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2seXm2GPvaPNmb9co9xOY6+o0lXsJHWzoc1SQM5/nxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2knDa5J5NZnDlgWy
 sQpB2kwT02mod+PlefTpulE3qzPLeHxN48Z/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Un1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FbYGIJYzSHJ8L9qqej
 l3/53jgUwAXDuy88haeyFenpePBvCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXY0St1ZFet84waLxaPQyx2cB2wJCDBbAOHKr+csTjAsk
 1vMlNTzCHk36/ueSGmW8fGfqjba1TUpEFLurBQsFWMti+QPaqlq5v4TZr6PyJKIs+A=
IronPort-HdrOrdr: A9a23:6FNaJqnAyFiHraHdubm7DSdlgOTpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AgzXE8GmGbBCDCUBU6AovXKGy8Z3XOWzt7ybOE1+?=
 =?us-ascii?q?3MD5WcIy6EGKxpYZCrvM7zg=3D=3D?=
X-Talos-MUID: 9a23:QIWbgQriwg31VD4x3R0ezw5bLNtxsrWjMnAuqrkdgeyPFiB+GjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535780126"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 13:04:39 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id B86B418000594;
	Fri, 16 Oct 2026 13:04:39 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 60ADDCBF201; Fri, 16 Oct 2026 06:04:39 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][scarthgap][PATCH v2 6/8] curl: fix CVE-2026-8932
Date: Fri, 16 Oct 2026 06:04:37 -0700
Message-Id: <20261016130439.603118-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016130439.603118-1-devanshp@cisco.com>
References: <20261016130439.603118-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248021

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4fa3ba3e
[2] https://curl.se/docs/CVE-2026-8932.html

Validation: unit3303 passes in a native debug build with OpenSSL.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---

Changes in v2:
- Rebase onto stable/scarthgap-review.
- Record native unit3303 validation.

 .../curl/curl/CVE-2026-8932.patch             | 423 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 424 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8932.patch b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
new file mode 100644
index 0000000..432d5e5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
@@ -0,0 +1,423 @@
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
+- Add the missing credential fields to ssl_primary_config for
+  connection and session matching. Keep the backend fields as aliases
+  instead of changing accesses throughout the TLS backends.
+- Keep the session cache in vtls.c; curl 8.7.1 has no vtls_scache
+  files or peer key API.
+- Use the older unit test harness and allocator (memdebug.h last).
+  Combine unit3304's case-insensitive type checks into unit3303,
+  with key_blob deep copy and connection/session matching checks.
+- Use a writable hostname array for the older char * hostname field.
+
+(cherry picked from commit 7541ae569d82fb308a5e2d94916027da4fa3ba3e)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/urldata.h           |   5 +
+ lib/vtls/vtls.c         |  25 +++++
+ tests/data/Makefile.inc |   3 +-
+ tests/data/test3303     |  23 +++++
+ tests/unit/Makefile.inc |   4 +-
+ tests/unit/unit3303.c   | 211 ++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 269 insertions(+), 2 deletions(-)
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
+index 0000000000..d0a59877d6
+--- /dev/null
++++ b/tests/unit/unit3303.c
+@@ -0,0 +1,211 @@
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
++  static char hostname[] = "example.com";
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
++  sslctx.peer.hostname = hostname;
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
index 9f26195..6f9a814 100644
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


