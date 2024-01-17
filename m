Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDDAC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 11:47:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.7653.1705492058776535645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 03:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ec4nD7ec;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9c2db82b0so5899860b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705492058; x=1706096858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6/TVlyiWCM3oerQ3eK+V3dOYMlOwUdfbKjRVL/fD+c=;
        b=ec4nD7ecin/q8fSu6hmy8qoY4ga0fKTMZn9oq25KasTqdG1JXRT8EvAdxS8ozqPbA9
         KuowfWLHlHETO76hKd/5jjLifV9bNALM1HjLgLspV0H01+EFLaE1IxtrC/AxK/67YwR2
         Q2fSNRVt10Acpd/HKXifDmA87cj6+QYpPhmCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705492058; x=1706096858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6/TVlyiWCM3oerQ3eK+V3dOYMlOwUdfbKjRVL/fD+c=;
        b=EMBNU6SivPzddgJC9ctf1Fkst8AhNAlmcltilrg529InicYq2b4/uBd7x5Fxm3gSpk
         gn58oHUlq5uaAwMLqVIzB+00/qJh1v08Cykt+zB0PzuPicp2MlEdZbu84zj5D1ud4bOr
         GTtmugZ43YsssvDS2K4drScwrgvNuSnCp7kSSuqaUWbmWPBphFYkueItFBuG/JLQsTx4
         xLnF0WNbx6kvcq0wtIIWxn+76JigRRBM66Dh5rUjtzptiUtqMYq71YevCbTP4rcvL2Rn
         kHPnptFjVFKp5cfcDUJzWf7Y5+z7V9FQ+DcZwJgZyEi8Z7cg8w5pvvsgiNNsYDR786lj
         RBRQ==
X-Gm-Message-State: AOJu0YwWtC0SqEcz8ih8jST6ri+V3Ys5hsJiKuJnYzSo4iS1dq2eNtMg
	XOB0xYzxlTKMdL5TF0C7JpmtiMY/pQZrOXHupFMShl+WAac=
X-Google-Smtp-Source: AGHT+IFsno3Kw6QSdPHRNepR6D33xqIRxiDWMK6cX38wiVvJlCl6zCDaeOAsOE23jn8IWaaEVVrJIA==
X-Received: by 2002:a05:6a21:3a96:b0:19b:827d:ee10 with SMTP id zv22-20020a056a213a9600b0019b827dee10mr107346pzb.92.1705492057790;
        Wed, 17 Jan 2024 03:47:37 -0800 (PST)
Received: from MVIN00016.mvista.com ([152.58.38.131])
        by smtp.gmail.com with ESMTPSA id si15-20020a17090b528f00b0028b17832efdsm16143860pjb.39.2024.01.17.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 03:47:37 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCHv2] openssl: fix CVE-2023-6237 Excessive time spent checking invalid RSA public keys
Date: Wed, 17 Jan 2024 17:15:32 +0530
Message-Id: <20240117114532.716702-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 11:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193905

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2023-6237.patch       | 127 ++++++++++++++++++
 .../openssl/openssl_3.0.12.bb                 |   3 +-
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
new file mode 100644
index 0000000000..621dc6b0ab
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
@@ -0,0 +1,127 @@
+rom e09fc1d746a4fd15bb5c3d7bbbab950aadd005db Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Fri, 22 Dec 2023 16:25:56 +0100
+Subject: [PATCH] Limit the execution time of RSA public key check
+
+Fixes CVE-2023-6237
+
+If a large and incorrect RSA public key is checked with
+EVP_PKEY_public_check() the computation could take very long time
+due to no limit being applied to the RSA public key size and
+unnecessarily high number of Miller-Rabin algorithm rounds
+used for non-primality check of the modulus.
+
+Now the keys larger than 16384 bits (OPENSSL_RSA_MAX_MODULUS_BITS)
+will fail the check with RSA_R_MODULUS_TOO_LARGE error reason.
+Also the number of Miller-Rabin rounds was set to 5.
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/23243)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db]
+CVE: CVE-2023-6237
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/rsa/rsa_sp800_56b_check.c              |  8 +++-
+ test/recipes/91-test_pkey_check.t             |  2 +-
+ .../91-test_pkey_check_data/rsapub_17k.pem    | 48 +++++++++++++++++++
+ 3 files changed, 56 insertions(+), 2 deletions(-)
+ create mode 100644 test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+
+diff --git a/crypto/rsa/rsa_sp800_56b_check.c b/crypto/rsa/rsa_sp800_56b_check.c
+index fc8f19b..bcbdd24 100644
+--- a/crypto/rsa/rsa_sp800_56b_check.c
++++ b/crypto/rsa/rsa_sp800_56b_check.c
+@@ -289,6 +289,11 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
+         return 0;
+ 
+     nbits = BN_num_bits(rsa->n);
++    if (nbits > OPENSSL_RSA_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_RSA, RSA_R_MODULUS_TOO_LARGE);
++        return 0;
++    }
++
+ #ifdef FIPS_MODULE
+     /*
+      * (Step a): modulus must be 2048 or 3072 (caveat from SP800-56Br1)
+@@ -324,7 +329,8 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
+         goto err;
+     }
+ 
+-    ret = ossl_bn_miller_rabin_is_prime(rsa->n, 0, ctx, NULL, 1, &status);
++    /* Highest number of MR rounds from FIPS 186-5 Section B.3 Table B.1 */
++    ret = ossl_bn_miller_rabin_is_prime(rsa->n, 5, ctx, NULL, 1, &status);
+ #ifdef FIPS_MODULE
+     if (ret != 1 || status != BN_PRIMETEST_COMPOSITE_NOT_POWER_OF_PRIME) {
+ #else
+diff --git a/test/recipes/91-test_pkey_check.t b/test/recipes/91-test_pkey_check.t
+index dc7cc64..f8088df 100644
+--- a/test/recipes/91-test_pkey_check.t
++++ b/test/recipes/91-test_pkey_check.t
+@@ -70,7 +70,7 @@ push(@positive_tests, (
+     "dhpkey.pem"
+     )) unless disabled("dh");
+ 
+-my @negative_pubtests = ();
++my @negative_pubtests = ("rsapub_17k.pem");  # Too big RSA public key
+ 
+ push(@negative_pubtests, (
+     "dsapub_noparam.der"
+diff --git a/test/recipes/91-test_pkey_check_data/rsapub_17k.pem b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+new file mode 100644
+index 0000000..9a2eaed
+--- /dev/null
++++ b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+@@ -0,0 +1,48 @@
++-----BEGIN PUBLIC KEY-----
++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
++AQAB
++-----END PUBLIC KEY-----
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
index 4602151d91..b1de72afd0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2023-5678.patch \
            file://CVE-2023-6129.patch \
+           file://CVE-2023-6237.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -259,4 +260,4 @@ CVE_VERSION_SUFFIX = "alphabetical"
 
 # Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
-CVE_CHECK_IGNORE += "CVE-2019-0190"
+CVE_STATUS += "CVE-2019-0190"
-- 
2.25.1


