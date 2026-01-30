Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFCAD46C16
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 05:44:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4759.1769751850679346519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 21:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=knB4qHUt;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7d98c1879so10703115ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 21:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1769751850; x=1770356650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/YyhalUpTobOjfJYfEfwiOUbUGY7xzeo9nZeW4xOtx8=;
        b=knB4qHUtttjohc3m9L+AJ/+QiB2lpalwvkc9EqGU3DQ+jmI677nhdgyiCmKrr0bSwP
         yawmkTOMNKlQE9ammXpWtQGRLQgfeDP27l0SDj3v3J9gYczqrvkQLuWi+n26NFB+6E0e
         sxyAE5l0i88+3n9n2SyI1KmfmgYoFSYZZzwo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769751850; x=1770356650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YyhalUpTobOjfJYfEfwiOUbUGY7xzeo9nZeW4xOtx8=;
        b=ICo62XNBSwbicW20AE85CTwZGKMJv6kGGmp5vA12frZsd5OPcAEdTNRtC0eJijOliN
         q3WrdNArL29xkbnRU78+1hflvzNiNzqVGTVcvju9W6eOYcoaFtpBbHOcUKpmdC7UkNpO
         vW6lH3RYxl0X3fG0j4kXZHFVFWiFnoIGJ6LlnJkQhQ3xDtxh/BFYqtTSr+Mn3iDbOtIs
         V93eQOc68cqUFdC7sw9NKjWNOoOZS8FivBGhytF3hhP15mchXy84BIZ+500sQdTkORGu
         f1fW4bhwI4u3qXdLZrI/0kEFoGPQKtiXoaoySXZM6Ivuv+wTDKlIWrXMPqSFagDXga45
         BtdQ==
X-Gm-Message-State: AOJu0YwxY/ns7kShTvG3Sm79xcdJjjkrJPoIkWHEnWSnJ27E8EJGgeeN
	oa/E0PIHyr2uj69GDe2anojRTo3LaTU9qLkP6HmAIkNQCe5sAQ4Jo3lPo1Jia/Axj3+tLyo184f
	ZLTZ/
X-Gm-Gg: AZuq6aKME+mCC+ubnoD7N4HvB8VDTQ1NWyn6AjOfH3u9QRm0OjuTigk6dTfhTnavQMH
	N1/EKYQKdMYNIiBZgXf8lhOAp2sQcO/FnFYQ+rBJ+pAr4jCFf3elHy3Aefbwj7OIuVFdclkFt6d
	hDz3zmFpbxyaBcZ/Z2jwG8T4loegrTfFj8cpi9D8vRb3I3/DxR3ZvB9Q/eOAV2Dtv1mwLD/mT3s
	IDNbdl4wrO45NPBB5FcL/0sLjYNVFJsZQnvGjlj/l24rot18i/hrCyQW6dVy9+ee7xPtC2ruBXA
	7JBdK2yAujdyW71TBGHta139lMlIp/rB68G/D7p7vqaijBGwCuegsMjJ34tFwPSVBRKcx1gdESW
	Cn+AOjWifwmHme7qyOEtetpvZaH+YnJB9v0y02DIufD3PPWhJs2rBIJkQ4WZw+mt0wWz9C5KXVR
	97vkENnvroxLMjwWqQAS4Dd5wQ
X-Received: by 2002:a17:903:110d:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a8d894c2cbmr19122265ad.0.1769751848243;
        Thu, 29 Jan 2026 21:44:08 -0800 (PST)
Received: from MVIN00013.mvista.com ([150.129.170.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3ddfsm66190335ad.66.2026.01.29.21.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 21:44:07 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] openssl: fix CVE-2025-15467
Date: Fri, 30 Jan 2026 11:13:50 +0530
Message-ID: <20260130054350.300667-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 05:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230177

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/ce39170276daec87f55c39dad1f629b56344429e && https://github.com/openssl/openssl/commit/cdccf8f2ef17ae020bd69360c43a39306b89c381 && https://github.com/openssl/openssl/commit/e0666f72294691a808443970b654412a6d92fa0f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2025-15467-01.patch   |  40 ++++++
 .../openssl/openssl/CVE-2025-15467-02.patch   |  65 +++++++++
 .../openssl/openssl/CVE-2025-15467-03.patch   | 128 ++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |   3 +
 4 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.patch
new file mode 100644
index 0000000000..55809d4c03
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.patch
@@ -0,0 +1,40 @@
+From ce39170276daec87f55c39dad1f629b56344429e Mon Sep 17 00:00:00 2001
+From: Igor Ustinov <igus68@gmail.com>
+Date: Mon, 12 Jan 2026 12:19:59 +0100
+Subject: [PATCH] Correct handling of AEAD-encrypted CMS with inadmissibly long
+ IV
+
+Fixes CVE-2025-15467
+
+Reviewed-by: Norbert Pocs <norbertp@openssl.org>
+Reviewed-by: Eugene Syromiatnikov <esyr@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+MergeDate: Mon Jan 26 19:34:29 2026
+
+CVE: CVE-2025-15467
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/ce39170276daec87f55c39dad1f629b56344429e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/evp/evp_lib.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/crypto/evp/evp_lib.c b/crypto/evp/evp_lib.c
+index f29d592..df38677 100644
+--- a/crypto/evp/evp_lib.c
++++ b/crypto/evp/evp_lib.c
+@@ -249,10 +249,9 @@ int evp_cipher_get_asn1_aead_params(EVP_CIPHER_CTX *c, ASN1_TYPE *type,
+     if (type == NULL || asn1_params == NULL)
+         return 0;
+ 
+-    i = ossl_asn1_type_get_octetstring_int(type, &tl, NULL, EVP_MAX_IV_LENGTH);
+-    if (i <= 0)
++    i = ossl_asn1_type_get_octetstring_int(type, &tl, iv, EVP_MAX_IV_LENGTH);
++    if (i <= 0 || i > EVP_MAX_IV_LENGTH)
+         return -1;
+-    ossl_asn1_type_get_octetstring_int(type, &tl, iv, i);
+ 
+     memcpy(asn1_params->iv, iv, i);
+     asn1_params->iv_len = i;
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.patch
new file mode 100644
index 0000000000..52557bcaab
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.patch
@@ -0,0 +1,65 @@
+From cdccf8f2ef17ae020bd69360c43a39306b89c381 Mon Sep 17 00:00:00 2001
+From: Igor Ustinov <igus68@gmail.com>
+Date: Mon, 12 Jan 2026 12:21:21 +0100
+Subject: [PATCH] Some comments to clarify functions usage
+
+Reviewed-by: Norbert Pocs <norbertp@openssl.org>
+Reviewed-by: Eugene Syromiatnikov <esyr@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+MergeDate: Mon Jan 26 19:34:31 2026
+
+CVE: CVE-2025-15467
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/cdccf8f2ef17ae020bd69360c43a39306b89c381]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/asn1/evp_asn1.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/crypto/asn1/evp_asn1.c b/crypto/asn1/evp_asn1.c
+index 13d8ed3..6aca011 100644
+--- a/crypto/asn1/evp_asn1.c
++++ b/crypto/asn1/evp_asn1.c
+@@ -60,6 +60,12 @@ static ossl_inline void asn1_type_init_oct(ASN1_OCTET_STRING *oct,
+     oct->flags = 0;
+ }
+ 
++/*
++ * This function copies 'anum' to 'num' and the data of 'oct' to 'data'.
++ * If the length of 'data' > 'max_len', copies only the first 'max_len'
++ * bytes, but returns the full length of 'oct'; this allows distinguishing
++ * whether all the data was copied.
++ */
+ static int asn1_type_get_int_oct(ASN1_OCTET_STRING *oct, int32_t anum,
+                                  long *num, unsigned char *data, int max_len)
+ {
+@@ -106,6 +112,13 @@ int ASN1_TYPE_set_int_octetstring(ASN1_TYPE *a, long num, unsigned char *data,
+     return 0;
+ }
+ 
++/*
++ * This function decodes an int-octet sequence and copies the integer to 'num'
++ * and the data of octet to 'data'.
++ * If the length of 'data' > 'max_len', copies only the first 'max_len'
++ * bytes, but returns the full length of 'oct'; this allows distinguishing
++ * whether all the data was copied.
++ */
+ int ASN1_TYPE_get_int_octetstring(const ASN1_TYPE *a, long *num,
+                                   unsigned char *data, int max_len)
+ {
+@@ -162,6 +175,13 @@ int ossl_asn1_type_set_octetstring_int(ASN1_TYPE *a, long num,
+     return 0;
+ }
+ 
++/*
++ * This function decodes an octet-int sequence and copies the data of octet
++ * to 'data' and the integer to 'num'.
++ * If the length of 'data' > 'max_len', copies only the first 'max_len'
++ * bytes, but returns the full length of 'oct'; this allows distinguishing
++ * whether all the data was copied.
++ */
+ int ossl_asn1_type_get_octetstring_int(const ASN1_TYPE *a, long *num,
+                                        unsigned char *data, int max_len)
+ {
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.patch
new file mode 100644
index 0000000000..8a2923d8fd
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.patch
@@ -0,0 +1,128 @@
+From 31bf9ffbba8dce368cd2e47fbc77bdeee92a0699 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 30 Jan 2026 10:32:18 +0530
+Subject: [PATCH 3/3] 
+
+CVE: CVE-2025-15467
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e0666f72294691a808443970b654412a6d92fa0f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ test/cmsapitest.c                             | 39 ++++++++++++++++++-
+ test/recipes/80-test_cmsapi.t                 |  3 +-
+ .../encDataWithTooLongIV.pem                  | 11 ++++++
+ 3 files changed, 50 insertions(+), 3 deletions(-)
+ create mode 100644 test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem
+
+diff --git a/test/cmsapitest.c b/test/cmsapitest.c
+index 5839eb7..ab412d3 100644
+--- a/test/cmsapitest.c
++++ b/test/cmsapitest.c
+@@ -9,10 +9,10 @@
+ 
+ #include <string.h>
+ 
++#include <openssl/pem.h>
+ #include <openssl/cms.h>
+ #include <openssl/bio.h>
+ #include <openssl/x509.h>
+-#include <openssl/pem.h>
+ #include "../crypto/cms/cms_local.h" /* for d.signedData and d.envelopedData */
+ 
+ #include "testutil.h"
+@@ -20,6 +20,7 @@
+ static X509 *cert = NULL;
+ static EVP_PKEY *privkey = NULL;
+ static char *derin = NULL;
++static char *too_long_iv_cms_in = NULL;
+ 
+ static int test_encrypt_decrypt(const EVP_CIPHER *cipher)
+ {
+@@ -382,6 +383,38 @@ end:
+     return ret;
+ }
+ 
++static int test_cms_aesgcm_iv_too_long(void)
++{
++    int ret = 0;
++    BIO *cmsbio = NULL, *out = NULL;
++    CMS_ContentInfo *cms = NULL;
++    unsigned long err = 0;
++
++    if (!TEST_ptr(cmsbio = BIO_new_file(too_long_iv_cms_in, "r")))
++        goto end;
++
++    if (!TEST_ptr(cms = PEM_read_bio_CMS(cmsbio, NULL, NULL, NULL)))
++        goto end;
++
++    /* Must fail cleanly (no crash) */
++    if (!TEST_false(CMS_decrypt(cms, privkey, cert, NULL, out, 0)))
++        goto end;
++    err = ERR_peek_last_error();
++    if (!TEST_ulong_ne(err, 0))
++        goto end;
++    if (!TEST_int_eq(ERR_GET_LIB(err), ERR_LIB_CMS))
++        goto end;
++    if (!TEST_int_eq(ERR_GET_REASON(err), CMS_R_CIPHER_PARAMETER_INITIALISATION_ERROR))
++        goto end;
++
++    ret = 1;
++end:
++    CMS_ContentInfo_free(cms);
++    BIO_free(cmsbio);
++    BIO_free(out);
++    return ret;
++}
++
+ OPT_TEST_DECLARE_USAGE("certfile privkeyfile derfile\n")
+ 
+ int setup_tests(void)
+@@ -396,7 +429,8 @@ int setup_tests(void)
+ 
+     if (!TEST_ptr(certin = test_get_argument(0))
+             || !TEST_ptr(privkeyin = test_get_argument(1))
+-            || !TEST_ptr(derin = test_get_argument(2)))
++            || !TEST_ptr(derin = test_get_argument(2))
++            || !TEST_ptr(too_long_iv_cms_in = test_get_argument(3)))
+         return 0;
+ 
+     certbio = BIO_new_file(certin, "r");
+@@ -429,6 +463,7 @@ int setup_tests(void)
+     ADD_TEST(test_CMS_add1_cert);
+     ADD_TEST(test_d2i_CMS_bio_NULL);
+     ADD_ALL_TESTS(test_d2i_CMS_decode, 2);
++    ADD_TEST(test_cms_aesgcm_iv_too_long);
+     return 1;
+ }
+ 
+diff --git a/test/recipes/80-test_cmsapi.t b/test/recipes/80-test_cmsapi.t
+index af00355..182629e 100644
+--- a/test/recipes/80-test_cmsapi.t
++++ b/test/recipes/80-test_cmsapi.t
+@@ -18,5 +18,6 @@ plan tests => 1;
+ 
+ ok(run(test(["cmsapitest", srctop_file("test", "certs", "servercert.pem"),
+              srctop_file("test", "certs", "serverkey.pem"),
+-             srctop_file("test", "recipes", "80-test_cmsapi_data", "encryptedData.der")])),
++             srctop_file("test", "recipes", "80-test_cmsapi_data", "encryptedData.der"),
++             srctop_file("test", "recipes", "80-test_cmsapi_data", "encDataWithTooLongIV.pem")])),
+              "running cmsapitest");
+diff --git a/test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem b/test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem
+new file mode 100644
+index 0000000..4323cd2
+--- /dev/null
++++ b/test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem
+@@ -0,0 +1,11 @@
++-----BEGIN CMS-----
++MIIBmgYLKoZIhvcNAQkQARegggGJMIIBhQIBADGCATMwggEvAgEAMBcwEjEQMA4G
++A1UEAwwHUm9vdCBDQQIBAjANBgkqhkiG9w0BAQEFAASCAQC8ZqP1OqbletcUre1V
++b4XOobZzQr6wKMSsdjtGzVbZowUVv5DkOn9VOefrpg4HxMq/oi8IpzVYj8ZiKRMV
++NTJ+/d8FwwBwUUNNP/IDnfEpX+rT1+pGS5zAa7NenLoZgGBNjPy5I2OHP23fPnEd
++sm8YkFjzubkhAD1lod9pEOEqB3V2kTrTTiwzSNtMHggna1zPox6TkdZwFmMnp8d2
++CVa6lIPGx26gFwCuIDSaavmQ2URJ615L8gAvpYUlpsDqjFsabWsbaOFbMz3bIGJu
++GkrX2ezX7CpuC1wjix26ojlTySJHv+L0IrpcaIzLlC5lB1rqtuija8dGm3rBNm/P
++AAUNMDcGCSqGSIb3DQEHATAjBglghkgBZQMEAQYwFgQRzxwoRQzOHVooVn3CpaWl
++paUCARCABUNdolo6BBA55E9hYaYO2S8C/ZnD8dRO
++-----END CMS-----
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
index 4756f5aaa6..fac62245d7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -13,6 +13,9 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://CVE-2024-41996.patch \
+           file://CVE-2025-15467-01.patch \
+           file://CVE-2025-15467-02.patch \
+           file://CVE-2025-15467-03.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.50.1


