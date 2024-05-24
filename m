Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C59C41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.14251.1716552876859869731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HmEwOHY/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f44b4404dfso5469575ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552876; x=1717157676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTeyqO21MX6PRI5KU1YX/BWGt+sp3rm2F35GLeyfFHs=;
        b=HmEwOHY/0l1EvlcmGmJL6vFPZ7fz+JAytwV54jr4P9fhh3S9uYB2TIhvvYhdVGyf0y
         lqll2FWVgTY2/v6kj6toSD5OQb1Sy4Yjg94iMNmy8v8eIJK6WpaNYTfGkz2cnmS9n9Sr
         TMY3ZTanBuP4Lbote6mkXo58LFNyoZI89BFjEa8Zqw8Y9mfu/IegpuAstf0Al49KPsZE
         uYZWDVdydAiEimdt9y+JWZxirNIgcMo9gAq29lfNuNDZGqXw+EAUBmHfH54phbKF0+Mz
         s+PiDR2Pr22xNAkypdNrbfsSfLjzsYmbflqbG98ZhKuWPTJ1dlxECx/MjMr51QpFdMrh
         A6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552876; x=1717157676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTeyqO21MX6PRI5KU1YX/BWGt+sp3rm2F35GLeyfFHs=;
        b=wGqliiEPOaHpEW7umwAqIALi9aFCfbSEAvJLWwDeZNP5qxyOM9zORx8RAXrhZrAnXn
         TKwxF2Wm1zl0Qj5k9YI8VU+RQ5LgPKSkiOgBUjKoic45cUQT+gPsh/ylw/CHXmiSPNvh
         xPtDpxAAWeKPtUwS/yD6hVsvEgWhI4b10kYrGqtEUTrmeLfagDe8cRt2jC7ISpAzLD4n
         fqhRzeZDonAedhVkjGdAIWUGmpff8ASbdbUTHGgh8d58SbPGUm00odEcMY1URhP6UEuA
         QgE6QBff/tB9g+/2C9A3W23xK1urtlofubEfypVLkZiFzplOfmA4KutzIhKNSUOuf8Ef
         eKPA==
X-Gm-Message-State: AOJu0YxtE3NgjYjbZFthK3Pj+rCFUQD/UUbZExW4iHb0KBB+doK7ZvtM
	arCDpOqERFh/47AM9T/ZatJn4iwgT1Vik3m962kU2Xtypu2XCxrQXjH+9mCGlmHqECIdz6PbBXA
	T
X-Google-Smtp-Source: AGHT+IEfyk2KdRq5dHYJyGfM/KHSIgIYIERj84WtPKEUg+IXzRjg2leUtZeyqW29gmdpjGsQKHvczA==
X-Received: by 2002:a17:903:228e:b0:1f3:b0:f9ef with SMTP id d9443c01a7336-1f4497df645mr19775305ad.43.1716552876030;
        Fri, 24 May 2024 05:14:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] openssl: patch CVE-2024-4603
Date: Fri, 24 May 2024 05:14:18 -0700
Message-Id: <601b81350c0f8487439885a576c4d7d883619a6d.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199844

From: Peter Marko <peter.marko@siemens.com>

Advisory: https://github.com/advisories/GHSA-85xr-ghj6-6m46

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-4603.patch       | 180 ++++++++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
new file mode 100644
index 0000000000..b8e0b9fb7d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
@@ -0,0 +1,180 @@
+From 3559e868e58005d15c6013a0c1fd832e51c73397 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/3559e868e58005d15c6013a0c1fd832e51c73397]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ crypto/dsa/dsa_check.c                        | 44 ++++++++++++--
+ .../invalid/p10240_q256_too_big.pem           | 57 +++++++++++++++++++
+ 2 files changed, 97 insertions(+), 4 deletions(-)
+ create mode 100644 test/recipes/15-test_dsaparam_data/invalid/p10240_q256_too_big.pem
+
+diff --git a/crypto/dsa/dsa_check.c b/crypto/dsa/dsa_check.c
+index fb0e9129a2..122449a7bf 100644
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
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index 3b253ddde0..87ab4047d9 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2024-2511.patch \
+           file://CVE-2024-4603.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


