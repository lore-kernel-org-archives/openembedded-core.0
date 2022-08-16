Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04041C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 11:21:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.14586.1660648860607153579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 04:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e6Q9traE;
 spf=pass (domain: mvista.com, ip: 209.85.210.172,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d20so9069705pfq.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 04:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=779iEEkgG5AUfq4wQmOZ5v/t7SeF45Sv7VZ+NndZX+I=;
        b=e6Q9traE7q8IqUMHIb4dn+J12Mr9aTPSsnf9Ms+//laCa6zUbHzaKt9UARvbMWse4J
         7azvl9maann7tOg3MMp3pUHKPgaUsozn10CQuDm1GIq6UPeEhOCrTs/NiTd5lIJZ6lmz
         pdlic7reyEKW2zHGaLbpn5YEbqMNb12GW2M7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=779iEEkgG5AUfq4wQmOZ5v/t7SeF45Sv7VZ+NndZX+I=;
        b=g/VIItJ2AraMf1TEScc8Nd/uMtmLoGgwS1cxuGFsslKc54mOT6Aj8R4SNcNeF1vyKT
         r1r1zcUogNb0x5TogHo867gS14qdc1MRg4KSen3eihJEbR8kCXQXMPueYdemg/vCCa4j
         oxd03FSRUxv4MaV0pPCtGvGnS8HHRkD+90Qr5NHM5N2HTu7o6ugcg/+3Dm8U2ruIW6ZE
         ft1IoS0KeLmEKc2Ixwlg5HvhTPZPYqOmjLowu2tc5YEZT6pPu3JvnS4Ex9lvB4UtyUPF
         2n3O5qyEzGku3lnNxkWQeDY/u0kLmWR+wdwAFPNj1+2tXKZsl7N8YVXF9VtIZJZMmTtY
         abOA==
X-Gm-Message-State: ACgBeo0yplZB3kg3aiwabtnb3/VIAn7nTNCGutBq8htJSM9r9sSN2EKQ
	ex/6mKNINAbdJj4HajZsnRQJ2ZHQekMZEA==
X-Google-Smtp-Source: 
 AA6agR4T3ij8ealRJjGXCCrCJPuXtxU1Et2/FNeTGvvsGuXaUSGfag7L1wMr16AfOQKoAFdb9B33Vg==
X-Received: by 2002:a63:80c8:0:b0:421:9052:8259 with SMTP id
 j191-20020a6380c8000000b0042190528259mr17332929pgd.14.1660648859291;
        Tue, 16 Aug 2022 04:20:59 -0700 (PDT)
Received: from MVIN00024 ([157.32.95.37])
        by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b004299ceadcc1sm1391950pga.23.2022.08.16.04.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 04:20:58 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 16:48:41 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] gnutls: CVE-2022-2509 Double free during
 gnutls_pkcs7_verify
Date: Tue, 16 Aug 2022 16:48:40 +0530
Message-Id: <20220816111840.407821-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 11:21:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169434

Source: https://gitlab.com/gnutls/gnutls
MR: 120421
Type: Security Fix
Disposition: Backport from https://gitlab.com/gnutls/gnutls/-/commit/ce37f9eb265dbe9b6d597f5767449e8ee95848e2
ChangeID: f0c84c6aa8178582ac9838c453dacdf2c7cae0e5
Description:
          CVE-2022-2509 gnutls: Double free during gnutls_pkcs7_verify.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../gnutls/gnutls/CVE-2022-2509.patch         | 282 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 2 files changed, 283 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch b/meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch
new file mode 100644
index 0000000000..f8954945d0
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch
@@ -0,0 +1,282 @@
+From 9835638d4e1f37781a47e777c76d5bb14218929b Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 16 Aug 2022 12:23:14 +0530
+Subject: [PATCH] CVE-2022-2509
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/ce37f9eb265dbe9b6d597f5767449e8ee95848e2]
+CVE: CVE-2022-2509
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ NEWS                             |   4 +
+ lib/x509/pkcs7.c                 |   3 +-
+ tests/Makefile.am                |   2 +-
+ tests/pkcs7-verify-double-free.c | 215 +++++++++++++++++++++++++++++++
+ 4 files changed, 222 insertions(+), 2 deletions(-)
+ create mode 100644 tests/pkcs7-verify-double-free.c
+
+diff --git a/NEWS b/NEWS
+index 755a67c..ba70bb3 100644
+--- a/NEWS
++++ b/NEWS
+@@ -7,6 +7,10 @@ See the end for copying conditions.
+ 
+ * Version 3.6.14 (released 2020-06-03)
+ 
++** libgnutls: Fixed double free during verification of pkcs7 signatures.
++   Reported by Jaak Ristioja (#1383). [GNUTLS-SA-2022-07-07, CVSS: medium]
++   [CVE-2022-2509]
++
+ ** libgnutls: Fixed insecure session ticket key construction, since 3.6.4.
+    The TLS server would not bind the session ticket encryption key with a
+    value supplied by the application until the initial key rotation, allowing
+diff --git a/lib/x509/pkcs7.c b/lib/x509/pkcs7.c
+index 98669e8..ccbc69d 100644
+--- a/lib/x509/pkcs7.c
++++ b/lib/x509/pkcs7.c
+@@ -1318,7 +1318,8 @@ gnutls_x509_crt_t find_signer(gnutls_pkcs7_t pkcs7, gnutls_x509_trust_list_t tl,
+ 				issuer = find_verified_issuer_of(pkcs7, issuer, purpose, vflags);
+ 
+ 				if (issuer != NULL && gnutls_x509_crt_check_issuer(issuer, issuer)) {
+-					if (prev) gnutls_x509_crt_deinit(prev);
++					if (prev && prev != signer)
++						gnutls_x509_crt_deinit(prev);
+ 					prev = issuer;
+ 					break;
+ 				}
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 11a083c..cd43a0f 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -219,7 +219,7 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
+ 	 tls-record-size-limit-asym dh-compute ecdh-compute sign-verify-data-newapi \
+ 	 sign-verify-newapi sign-verify-deterministic iov aead-cipher-vec \
+ 	 tls13-without-timeout-func buffer status-request-revoked \
+-	 set_x509_ocsp_multi_cli kdf-api keylog-func \
++	 set_x509_ocsp_multi_cli kdf-api keylog-func pkcs7-verify-double-free \
+ 	 dtls_hello_random_value tls_hello_random_value x509cert-dntypes
+ 
+ if HAVE_SECCOMP_TESTS
+diff --git a/tests/pkcs7-verify-double-free.c b/tests/pkcs7-verify-double-free.c
+new file mode 100644
+index 0000000..fadf307
+--- /dev/null
++++ b/tests/pkcs7-verify-double-free.c
+@@ -0,0 +1,215 @@
++/*
++ * Copyright (C) 2022 Red Hat, Inc.
++ *
++ * Author: Zoltan Fridrich
++ *
++ * This file is part of GnuTLS.
++ *
++ * GnuTLS is free software: you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by
++ * the Free Software Foundation, either version 3 of the License, or
++ * (at your option) any later version.
++ *
++ * GnuTLS is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with GnuTLS. If not, see <https://www.gnu.org/licenses/>.
++ */
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <stdio.h>
++#include <gnutls/pkcs7.h>
++#include <gnutls/x509.h>
++
++#include "utils.h"
++
++static char rca_pem[] =
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIDCjCCAfKgAwIBAgIBATANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQKDApFeGFt\n"
++	"cGxlIENBMCAXDTE3MDcyMTE0NDMzNloYDzIyMjIwNzIxMTQ0MzM2WjAVMRMwEQYD\n"
++	"VQQKDApFeGFtcGxlIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA\n"
++	"v8hnKPJ/IA0SQB/A/a0Uh+npZ67vsgIMrtTQo0r0kJkmkBz5323xO3DVuJfB3QmX\n"
++	"v9zvoeCQLuDvWar5Aixfxgm6s5Q+yPvJj9t3NebDrU+Y4+qyewBIJUF8EF/5iBPC\n"
++	"ZHONmzbfIRWvQWGGgb2CRcOHp2J7AY/QLB6LsWPaLjs/DHva28Q13JaTTHIpdu8v\n"
++	"t6vHr0nXf66DN4MvtoF3N+o+v3snJCMsfXOqASi4tbWR7gtOfCfiz9uBjh0W2Dut\n"
++	"/jclBQkJkLe6esNSM+f4YiOpctVDjmfj8yoHCp394vt0wFqhG38wsTFAyVP6qIcf\n"
++	"5zoSu9ovEt2cTkhnZHjiiwIDAQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1Ud\n"
++	"DwEB/wQEAwIBBjAdBgNVHQ4EFgQUhjeO6Uc5imbjOl2I2ltVA27Hu9YwHwYDVR0j\n"
++	"BBgwFoAUhjeO6Uc5imbjOl2I2ltVA27Hu9YwDQYJKoZIhvcNAQELBQADggEBAD+r\n"
++	"i/7FsbG0OFKGF2+JOnth6NjJQcMfM8LiglqAuBUijrv7vltoZ0Z3FJH1Vi4OeMXn\n"
++	"l7X/9tWUve0uFl75MfjDrf0+lCEdYRY1LCba2BrUgpbbkLywVUdnbsvndehegCgS\n"
++	"jss2/zys3Hlo3ZaHlTMQ/NQ4nrxcxkjOvkZSEOqgxJTLpzm6pr7YUts4k6c6lNiB\n"
++	"FSiJiDzsJCmWR9C3fBbUlfDfTJYGN3JwqX270KchXDElo8gNoDnF7jBMpLFFSEKm\n"
++	"MyfbNLX/srh+CEfZaN/OZV4A3MQ0L8vQEp6M4CJhvRLIuMVabZ2coJ0AzystrOMU\n"
++	"LirBWjg89RoAjFQ7bTE=\n"
++	"-----END CERTIFICATE-----\n";
++
++static char ca_pem[] =
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIDFzCCAf+gAwIBAgIBAjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQKDApFeGFt\n"
++	"cGxlIENBMCAXDTE3MDcyMTE0NDQzNFoYDzIyMjIwNzIxMTQ0NDM0WjAiMSAwHgYD\n"
++	"VQQKDBdFeGFtcGxlIGludGVybWVkaWF0ZSBDQTCCASIwDQYJKoZIhvcNAQEBBQAD\n"
++	"ggEPADCCAQoCggEBAKb9ACB8u//sP6MfNU1OsVw68xz3eTPLgKxS0vpqexm6iGVg\n"
++	"ug/o9uYRLzqiEukv/eyz9WzHmY7sqlOJjOFdv92+SaNg79Jc51WHPFXgea4/qyfr\n"
++	"4y14PGs0SNxm6T44sXurUs7cXydQVUgnq2VCaWFOTUdxXoAWkV8r8GaUoPD/klVz\n"
++	"RqxSZVETmX1XBKhsMnnov41kRwVph2C+VfUspsbaUZaz/o/S1/nokhXRACzKsMBr\n"
++	"obqiGxbY35uVzsmbAW5ErhQz98AWJL3Bub1fsEMXg6OEMmPH4AtX888dTIYZNw0E\n"
++	"bUIESspz1kjJQTtVQDHTprhwz16YiSVeUonlLgMCAwEAAaNjMGEwDwYDVR0TAQH/\n"
++	"BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYEFPBjxDWjMhjXERirKF9O\n"
++	"o/5Cllc5MB8GA1UdIwQYMBaAFIY3julHOYpm4zpdiNpbVQNux7vWMA0GCSqGSIb3\n"
++	"DQEBCwUAA4IBAQCTm+vv3hBa6lL5IT+Fw8aTxQ2Ne7mZ5oyazhvXYwwfKNMX3SML\n"
++	"W2JdPaL64ZwbxxxYvW401o5Z0CEgru3YFrsqB/hEdl0Uf8UWWJmE1rRa+miTmbjt\n"
++	"lrLNCWdrs6CiwvsPITTHg7jevB4KyZYsTSxQFcyr3N3xF+6EmOTC4IkhPPnXYXcp\n"
++	"248ih+WOavSYoRvzgB/Dip1WnPYU2mfIV3O8JReRryngA0TzWCLPLUoWR3R4jwtC\n"
++	"+1uSLoqaenz3qv3F1WEbke37az9YJuXx/5D8CqFQiZ62TUUtI6fYd8mkMBM4Qfh6\n"
++	"NW9XrCkI9wlpL5K9HllhuW0BhKeJkuPpyQ2p\n"
++	"-----END CERTIFICATE-----\n";
++
++static char ee_pem[] =
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIDIjCCAgqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAiMSAwHgYDVQQKDBdFeGFt\n"
++	"cGxlIGludGVybWVkaWF0ZSBDQTAgFw0yMjA3MjExNDQ1MzdaGA8yMjIyMDcyMTE0\n"
++	"NDUzN1owFTETMBEGA1UEAwwKSm9obiBTbWl0aDCCASIwDQYJKoZIhvcNAQEBBQAD\n"
++	"ggEPADCCAQoCggEBAMb1uuxppBFY+WVD45iyHUq7DkIJNNOI/JRaybVJfPktWq2E\n"
++	"eNe7XhV05KKnqZTbDO2iYqNHqGhZ8pz/IstDRTZP3z/q1vXTG0P9Gx28rEy5TaUY\n"
++	"QjtD+ZoFUQm0ORMDBjd8jikqtJ87hKeuOPMH4rzdydotMaPQSm7KLzHBGBr6gg7z\n"
++	"g1IxPWkhMyHapoMqqrhjwjzoTY97UIXpZTEoIA+KpEC8f9CciBtL0i1MPBjWozB6\n"
++	"Jma9q5iEwZXuRr3cnPYeIPlK2drgDZCMuSFcYiT8ApLw5OhKqY1m2EvfZ2ox2s9R\n"
++	"68/HzYdPi3kZwiNEtlBvMlpt5yKBJAflp76d7DkCAwEAAaNuMGwwCwYDVR0PBAQD\n"
++	"AgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUc+Mi\n"
++	"kr8WMCk00SQo+P2iggp/oQkwHwYDVR0jBBgwFoAU8GPENaMyGNcRGKsoX06j/kKW\n"
++	"VzkwDQYJKoZIhvcNAQELBQADggEBAKU9+CUR0Jcfybd1+8Aqgh1RH96yQygnVuyt\n"
++	"Na9rFz4fM3ij9tGXDHXrkZw8bW1dWLU9quu8zeTxKxc3aiDIw739Alz0tukttDo7\n"
++	"dW7YqIb77zsIsWB9p7G9dlxT6ieUy+5IKk69BbeK8KR0vAciAG4KVQxPhuPy/LGX\n"
++	"PzqlJIJ4h61s3UOroReHPB1keLZgpORqrvtpClOmABH9TLFRJA/WFg8Q2XYB/p0x\n"
++	"l/pWiaoBC+8wK9cDoMUK5yOwXeuCLffCb+UlAD0+z/qxJ2pisE8E9X8rRKRrWI+i\n"
++	"G7LtJCEn86EQK8KuRlJxKgj8lClZhoULB0oL4jbblBuNow9WRmM=\n"
++	"-----END CERTIFICATE-----\n";
++
++static char msg_pem[] =
++	"-----BEGIN PKCS7-----\n"
++	"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\n"
++	"-----END PKCS7-----\n";
++
++const gnutls_datum_t rca_datum = { (void *)rca_pem, sizeof(rca_pem) - 1 };
++const gnutls_datum_t ca_datum = { (void *)ca_pem, sizeof(ca_pem) - 1 };
++const gnutls_datum_t ee_datum = { (void *)ee_pem, sizeof(ee_pem) - 1 };
++const gnutls_datum_t msg_datum = { (void *)msg_pem, sizeof(msg_pem) - 1 };
++
++static void tls_log_func(int level, const char *str)
++{
++	fprintf(stderr, "%s |<%d>| %s", "err", level, str);
++}
++
++#define CHECK(X)\
++{\
++	r = X;\
++	if (r < 0)\
++		fail("error in %d: %s\n", __LINE__, gnutls_strerror(r));\
++}\
++
++void doit(void)
++{
++	int r;
++	gnutls_x509_crt_t rca_cert = NULL;
++	gnutls_x509_crt_t ca_cert = NULL;
++	gnutls_x509_crt_t ee_cert = NULL;
++	gnutls_x509_trust_list_t tlist = NULL;
++	gnutls_pkcs7_t pkcs7 = NULL;
++	gnutls_datum_t data = { (unsigned char *)"xxx", 3 };
++
++	if (debug) {
++		gnutls_global_set_log_function(tls_log_func);
++		gnutls_global_set_log_level(4711);
++	}
++
++	// Import certificates
++	CHECK(gnutls_x509_crt_init(&rca_cert));
++	CHECK(gnutls_x509_crt_import(rca_cert, &rca_datum, GNUTLS_X509_FMT_PEM));
++	CHECK(gnutls_x509_crt_init(&ca_cert));
++	CHECK(gnutls_x509_crt_import(ca_cert, &ca_datum, GNUTLS_X509_FMT_PEM));
++	CHECK(gnutls_x509_crt_init(&ee_cert));
++	CHECK(gnutls_x509_crt_import(ee_cert, &ee_datum, GNUTLS_X509_FMT_PEM));
++
++	// Setup trust store
++	CHECK(gnutls_x509_trust_list_init(&tlist, 0));
++	CHECK(gnutls_x509_trust_list_add_named_crt(tlist, rca_cert, "rca", 3, 0));
++	CHECK(gnutls_x509_trust_list_add_named_crt(tlist, ca_cert, "ca", 2, 0));
++	CHECK(gnutls_x509_trust_list_add_named_crt(tlist, ee_cert, "ee", 2, 0));
++
++	// Setup pkcs7 structure
++	CHECK(gnutls_pkcs7_init(&pkcs7));
++	CHECK(gnutls_pkcs7_import(pkcs7, &msg_datum, GNUTLS_X509_FMT_PEM));
++
++	// Signature verification
++	gnutls_pkcs7_verify(pkcs7, tlist, NULL, 0, 0, &data, 0);
++
++	gnutls_x509_crt_deinit(rca_cert);
++	gnutls_x509_crt_deinit(ca_cert);
++	gnutls_x509_crt_deinit(ee_cert);
++	gnutls_x509_trust_list_deinit(tlist, 0);
++	gnutls_pkcs7_deinit(pkcs7);
++}
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index 0c68da7c54..e9af71c7bd 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2020-24659.patch \
            file://CVE-2021-20231.patch \
            file://CVE-2021-20232.patch \
+           file://CVE-2022-2509.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.25.1


