Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F13C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:16 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9552.1788512409683483933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TdBWxUEy;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14163; q=dns/txt;
  s=iport01; t=1788512409; x=1789722009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gfm+LgX2azY5DeXmqSn+19+iX2DVIssul+DxXoCMvd8=;
  b=TdBWxUEyY2f2g/QFu90fQ+zWHZ8M1+mk0G7bKqQ7kO+f8NA/hDHlPzWO
   udq8QUw9Kdi5CFfC0khTCk4z53xLwYumcyry6gr47uhcmBZtzA9boHOVK
   1q0F1eZLiTPKz0UEhfuAPtJNFt/4Q0aWeByC/ENqYI4GhY0P6AR9P3nI2
   aSOdmdxAbbGL0TQ3U6Xda9QSiJyrQGfpnkM3aiXkixV2IQTvPxra2dn2H
   Bq3aAvOMgrdF6pbjoOB8rEkTV0YH+gIMvbvuYZC0GiFzTufpnsF0vFwKp
   yY+W8PN3EpiPY7JakmJyvRPUvuHZYq8MZQXSRR4TJ7HCIS/caOgqkmrqn
   A==;
X-CSE-ConnectionGUID: nkAnx5erSXCb5RL/whITRQ==
X-CSE-MsgGUID: xvz9eyqTQDeKKj8On6z+KQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgDxh5pq/48QJK1RCYJZgld0YENJlkoDgROdCBSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGBcQEggnMCjgICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QGQECAQMnCwEYAS0QHAMBAhkWKyMIGYMCAYJ0AxEGw?=
 =?us-ascii?q?jiBeTOBAYMoAT8CAkABUNsxAQsUAQWBM4U/iCJdGAGEfCcbG4FygRWCc3aBB?=
 =?us-ascii?q?YFcAgGBIhEUaIV1BIINFYEMgVoecIElg0SGa4UrSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIAoJUg?=
 =?us-ascii?q?gMCAUlDDgdHUwknQQQLGA1IESw3FRkEPm4Hjl8fgkkFAhYbLwEhDAETFgIvU?=
 =?us-ascii?q?BmBIgECDAEUCJJ0B5AggiGBNZ9aCiiDdowilToaM6ptmQiOCpU0gRyEaYFoP?=
 =?us-ascii?q?IFZcBU7gmcJFjQZD44uCwuDYIZAxVghJzICCTIBAQcCBw4DC4FokCaBWAEB?=
IronPort-Data: A9a23:3kzPoqAkkHysFBVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApD4k32AHy
 2QYC2DXbP/bMzamLoslOojn90oG6MeAzYRhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA79gGYoWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TExfZHClFrMJcjys19XFtqs
 uMYCQw3V0XW7w626OrTpuhEj8AnKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWEHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFcoi+G2bIGIEjCMbdVLjBeVt
 3v6xkj0ITIYZPuZlyjG0Uv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvSS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH69V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:Iqcka6pm6w3KBZ4FQH2yfZ4aV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:Sl/eV2xkTz6yzKX0do7tBgUSGekjYiDQ1kzgCEXlM0IuV720dWWprfY=
X-Talos-MUID: 9a23:4b7sTgbG+VQrSeBTpyH+1TxzLftRz6mNK0JdtpNYqYqnDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="831313435"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:00:08 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 63D0E18000254;
	Fri,  4 Sep 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 023DCCC12A9; Fri,  4 Sep 2026 02:00:08 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 4/6] curl: Fix CVE-2026-8932
Date: Fri,  4 Sep 2026 02:00:05 -0700
Message-Id: <20260904090007.27374-4-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904090007.27374-1-devanshp@cisco.com>
References: <20260904090007.27374-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245076

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4fa3ba3e
[2] https://curl.se/docs/CVE-2026-8932.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8932.patch             | 342 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8932.patch b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
new file mode 100644
index 0000000000..c845826cb3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
@@ -0,0 +1,342 @@
+From fc625fa247f68bc6a44bda391cd8c09bfc5ce5d5 Mon Sep 17 00:00:00 2001
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
+- curl 8.7.1 keeps the session cache in vtls.c and stores backend key properties
+  outside ssl_primary_config. Duplicate those pointers into the primary
+  configuration so the upstream match, clone, and free behavior covers
+  connection and session reuse without moving every backend access.
+- Omitted backend-only field-access moves in ldap.c, vssh/, and vtls backends
+  because the target keeps the original ssl_config_data members as aliases.
+- Adapt unit3303 to the target curlcheck and test-data harnesses and allocation
+  helpers, and extend it with unit3304's case-insensitive cert_type/key_type
+  checks.
+- Omit newer vtls_scache.c/vtls_scache.h and unit3304 because their peer-key
+  API does not exist in 8.7.1. The target session cache instead uses the clone
+  and match functions in vtls.c, which the adapted unit3303 exercises.
+
+(cherry picked from commit 7541ae569d82fb308a5e2d94916027da4fa3ba3e)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/urldata.h           |   5 ++
+ lib/vtls/vtls.c         |  25 ++++++++
+ tests/data/Makefile.inc |   3 +-
+ tests/data/test3303     |  23 ++++++++
+ tests/unit/Makefile.inc |   4 +-
+ tests/unit/unit3303.c   | 127 ++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 185 insertions(+), 2 deletions(-)
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
+index b68e6b4562..02189d8cc6 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -265,4 +265,5 @@ test3024 test3025 test3026 test3027 test3028 test3029 test3030 \
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
+index 0000000000..060a9361fc
+--- /dev/null
++++ b/tests/unit/unit3303.c
+@@ -0,0 +1,127 @@
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
++#include "urldata.h"
++
++#ifdef USE_SSL
++#include "vtls/vtls.h"
++#endif
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
++  struct connectdata *conn;
++  struct ssl_primary_config *primary;
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
++
++  curl_easy_setopt(curl, CURLOPT_SSLCERT, "client.pem");
++  curl_easy_setopt(curl, CURLOPT_SSLKEY, "client.key");
++  curl_easy_setopt(curl, CURLOPT_KEYPASSWD, "secret");
++  curl_easy_setopt(curl, CURLOPT_SSLCERTTYPE, "PEM");
++  curl_easy_setopt(curl, CURLOPT_SSLKEYTYPE, "PEM");
++
++  abort_unless(!Curl_ssl_easy_config_complete((struct Curl_easy *)curl),
++               "Curl_ssl_easy_config_complete failed");
++
++  conn = calloc(1, sizeof(*conn));
++  abort_unless(conn, "connection allocation failed");
++  abort_unless(!Curl_ssl_conn_config_init((struct Curl_easy *)curl, conn),
++               "Curl_ssl_conn_config_init failed");
++
++  fail_unless(Curl_ssl_conn_config_match((struct Curl_easy *)curl, conn,
++                                         FALSE),
++              "identical mTLS config should match");
++
++  primary = &((struct Curl_easy *)curl)->set.ssl.primary;
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
++  Curl_ssl_conn_config_cleanup(conn);
++  free(conn);
++  curl_easy_cleanup(curl);
++}
++#endif /* USE_SSL */
++UNITTEST_STOP
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index f22e69fba4..6a2c44365b 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -45,6 +45,7 @@ SRC_URI = " \
     file://CVE-2026-8924.patch \
     file://CVE-2026-8927-dependent.patch \
     file://CVE-2026-8927.patch \
+    file://CVE-2026-8932.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


