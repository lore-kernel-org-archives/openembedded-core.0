Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A970C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 17:28:22 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.23276.1716053293828227672
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 10:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=qOfoQuEp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240518172810480b3914a26c663760-gptxbi@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240518172810480b3914a26c663760
        for <openembedded-core@lists.openembedded.org>;
        Sat, 18 May 2024 19:28:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yXwBXD912oKmuhij679hkkagB6zxSXBdvOwu5s8xh6Q=;
 b=qOfoQuEpeZLVD7NCgLm9iPl8uueIqmGW32O10EU3vgdhK8G3jTtcy9Ht5dTy+ZKidaaOgx
 G67Cr4gOaXkLj9kAk2mRLwk7vmSy66hrWxgnxZUAy6ViI9WM2a592g6ZBGAvjOknlK64ktET
 3dKnosIo5A7c6+CaBYOwZe2UvjYK0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: patch CVE-2024-4603
Date: Sat, 18 May 2024 19:27:12 +0200
Message-Id: <20240518172712.2156849-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 17:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199537

From: Peter Marko <peter.marko@siemens.com>

Advisory: https://github.com/advisories/GHSA-85xr-ghj6-6m46

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/openssl/CVE-2024-4603.patch       | 179 ++++++++++++++++++
 .../openssl/openssl_3.3.0.bb                  |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
new file mode 100644
index 0000000000..cdc3d0d503
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
@@ -0,0 +1,179 @@
+From 53ea06486d296b890d565fb971b2764fcd826e7e Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Wed, 8 May 2024 15:23:45 +0200
+Subject: [PATCH] Check DSA parameters for excessive sizes before validating
+
+This avoids overly long computation of various validation
+checks.
+
+Fixes CVE-2024-4603
+
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
+(Merged from https://github.com/openssl/openssl/pull/24346)
+
+(cherry picked from commit 85ccbab216da245cf9a6503dd327072f21950d9b)
+
+<dropped CHANGES.md modifications as it would need backport of all previous changes>
+
+CVE: CVE-2024-4603
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/53ea06486d296b890d565fb971b2764fcd826e7e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ crypto/dsa/dsa_check.c                        | 44 ++++++++++++--
+ .../invalid/p10240_q256_too_big.pem           | 57 +++++++++++++++++++
+ 2 files changed, 97 insertions(+), 4 deletions(-)
+
+diff --git a/crypto/dsa/dsa_check.c b/crypto/dsa/dsa_check.c
+index 7b6d7df88f..e1375dfad9 100644
+--- a/crypto/dsa/dsa_check.c
++++ b/crypto/dsa/dsa_check.c
+@@ -19,8 +19,34 @@
+ #include "dsa_local.h"
+ #include "crypto/dsa.h"
+ 
++static int dsa_precheck_params(const DSA *dsa, int *ret)
++{
++    if (dsa->params.p == NULL || dsa->params.q == NULL) {
++        ERR_raise(ERR_LIB_DSA, DSA_R_BAD_FFC_PARAMETERS);
++        *ret = FFC_CHECK_INVALID_PQ;
++        return 0;
++    }
++
++    if (BN_num_bits(dsa->params.p) > OPENSSL_DSA_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_DSA, DSA_R_MODULUS_TOO_LARGE);
++        *ret = FFC_CHECK_INVALID_PQ;
++        return 0;
++    }
++
++    if (BN_num_bits(dsa->params.q) >= BN_num_bits(dsa->params.p)) {
++        ERR_raise(ERR_LIB_DSA, DSA_R_BAD_Q_VALUE);
++        *ret = FFC_CHECK_INVALID_PQ;
++        return 0;
++    }
++
++    return 1;
++}
++
+ int ossl_dsa_check_params(const DSA *dsa, int checktype, int *ret)
+ {
++    if (!dsa_precheck_params(dsa, ret))
++        return 0;
++
+     if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK)
+         return ossl_ffc_params_simple_validate(dsa->libctx, &dsa->params,
+                                                FFC_PARAM_TYPE_DSA, ret);
+@@ -39,6 +65,9 @@ int ossl_dsa_check_params(const DSA *dsa, int checktype, int *ret)
+  */
+ int ossl_dsa_check_pub_key(const DSA *dsa, const BIGNUM *pub_key, int *ret)
+ {
++    if (!dsa_precheck_params(dsa, ret))
++        return 0;
++
+     return ossl_ffc_validate_public_key(&dsa->params, pub_key, ret)
+            && *ret == 0;
+ }
+@@ -50,6 +79,9 @@ int ossl_dsa_check_pub_key(const DSA *dsa, const BIGNUM *pub_key, int *ret)
+  */
+ int ossl_dsa_check_pub_key_partial(const DSA *dsa, const BIGNUM *pub_key, int *ret)
+ {
++    if (!dsa_precheck_params(dsa, ret))
++        return 0;
++
+     return ossl_ffc_validate_public_key_partial(&dsa->params, pub_key, ret)
+            && *ret == 0;
+ }
+@@ -58,8 +90,10 @@ int ossl_dsa_check_priv_key(const DSA *dsa, const BIGNUM *priv_key, int *ret)
+ {
+     *ret = 0;
+ 
+-    return (dsa->params.q != NULL
+-            && ossl_ffc_validate_private_key(dsa->params.q, priv_key, ret));
++    if (!dsa_precheck_params(dsa, ret))
++        return 0;
++
++    return ossl_ffc_validate_private_key(dsa->params.q, priv_key, ret);
+ }
+ 
+ /*
+@@ -72,8 +106,10 @@ int ossl_dsa_check_pairwise(const DSA *dsa)
+     BN_CTX *ctx = NULL;
+     BIGNUM *pub_key = NULL;
+ 
+-    if (dsa->params.p == NULL
+-        || dsa->params.g == NULL
++    if (!dsa_precheck_params(dsa, &ret))
++        return 0;
++
++    if (dsa->params.g == NULL
+         || dsa->priv_key == NULL
+         || dsa->pub_key == NULL)
+         return 0;
+diff --git a/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem b/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
+new file mode 100644
+index 0000000000..e85e2953b7
+--- /dev/null
++++ b/test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
+@@ -0,0 +1,57 @@
++-----BEGIN DSA PARAMETERS-----
++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
++vKuje86bePD6kD/LH3wmkA==
++-----END DSA PARAMETERS-----
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
index 113ed4bf95..fccf6988b1 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://bti.patch \
+           file://CVE-2024-4603.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.30.2


