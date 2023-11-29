Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3F4C10DC2
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.57559.1701299114390459474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xNlNSqyY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cfb30ce241so3502985ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299113; x=1701903913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IYAbRMelwo9pHy/8zeNrEkh6TCXESwuGNiQPf81ysk=;
        b=xNlNSqyYj2AuKZU4pvq20VhL701QDSnU7X5iBtqvovNNpfUqQlD7tj+Bz0Q1p90swG
         CvTEjk/cJwo7bBqlI8iX4+tRDn2cRxka942mwyWixSZEYXUuVVisErAhpdlbaSXWnqTJ
         rEgbYGE5yNCVJxnjjZ4wYcqJiB9hgrXv9AuEWm7bOBRhKEOcoaIp/sPcFrEvJZQxOB2Q
         JHNzVjBfwEbfcmluvCiv0nvjer8uBG8vqLpr8UGm9osQ9+HYJ+574qfXAkDPlq5UA7KX
         0yTWCbuk7ogH3PiaYz0tBvvvMg/Ae3b0gt3FpELoZgPXvQo8G4BUpbqxmSCw83IKesC0
         Y6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299113; x=1701903913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IYAbRMelwo9pHy/8zeNrEkh6TCXESwuGNiQPf81ysk=;
        b=L+mv3sQ+e8wNwQbBgkhAdSAfbDJlaKwTbAk4ro3ktLfOOPokz3+ZtJ5nHVhFbxWYjq
         UhPPZIySy6COey3dt0U9tmp9SoAVAqsG+woJKOHpQvC+nNM1k/zXkw2UPxI4vSJbrX2j
         5lZXgSiR3B7FblxhnEIYFmH6ZZyi+7ojmAFSPkaltWcJfSjVssE+UJyHZS2NkPPKFaHh
         YWxS2X8AfDPa4xAhjSLPZDD5BLwcLt5+8tZkaIB2dVxDe9881gjnqzIhZkyusXl3y0l/
         eWqOBEIGRU0BvvNDl6HVluLVwnrRSK/4TXfpfnwiiNscp4E7LmdUkDH9Mi+o5fTfO3Ib
         k31w==
X-Gm-Message-State: AOJu0Yx3QJTnAJZ4UAgRCM8NRceLuas9+D7uk5W/oHtBsFCQAH/mo7DX
	nm4ZL0PRXqzLlwslVBgKME7STDUqEh3L7LpNjPOkbw==
X-Google-Smtp-Source: AGHT+IEmpBQsCQHQOU85l+PottX4duLA4WzCbhkSgmiEfRPM5QiT4XGl27Ju12myvYCyi8kd9CuCaA==
X-Received: by 2002:a17:902:f80d:b0:1cf:b2a1:3a87 with SMTP id ix13-20020a170902f80d00b001cfb2a13a87mr17040103plb.56.1701299112955;
        Wed, 29 Nov 2023 15:05:12 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] openssl: fix CVE-2023-5678 Generating excessively long X9.42 DH keys or checking excessively long X9.42 DH keys or parameters may be very slow
Date: Wed, 29 Nov 2023 13:04:55 -1000
Message-Id: <6cd4c30a2811420159d72c2f0a9430f1f0294686.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191466

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-5678.patch       | 180 ++++++++++++++++++
 .../openssl/openssl_3.0.12.bb                 |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
new file mode 100644
index 0000000000..796a4f8be9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
@@ -0,0 +1,180 @@
+From db925ae2e65d0d925adef429afc37f75bd1c2017 Mon Sep 17 00:00:00 2001
+From: Richard Levitte <levitte@openssl.org>
+Date: Fri, 20 Oct 2023 09:18:19 +0200
+Subject: [PATCH] Make DH_check_pub_key() and DH_generate_key() safer yet
+
+We already check for an excessively large P in DH_generate_key(), but not in
+DH_check_pub_key(), and none of them check for an excessively large Q.
+
+This change adds all the missing excessive size checks of P and Q.
+
+It's to be noted that behaviours surrounding excessively sized P and Q
+differ.  DH_check() raises an error on the excessively sized P, but only
+sets a flag for the excessively sized Q.  This behaviour is mimicked in
+DH_check_pub_key().
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/22518)
+
+(cherry picked from commit ddeb4b6c6d527e54ce9a99cba785c0f7776e54b6)
+
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=db925ae2e65d0d925adef429afc37f75bd1c2017]
+CVE: CVE-2023-5678
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ crypto/dh/dh_check.c    | 12 ++++++++++++
+ crypto/dh/dh_err.c      |  3 ++-
+ crypto/dh/dh_key.c      | 12 ++++++++++++
+ crypto/err/openssl.txt  |  1 +
+ include/crypto/dherr.h  |  2 +-
+ include/openssl/dh.h    |  6 +++---
+ include/openssl/dherr.h |  3 ++-
+ 7 files changed, 33 insertions(+), 6 deletions(-)
+
+diff --git a/crypto/dh/dh_check.c b/crypto/dh/dh_check.c
+index 7ba2bea..e20eb62 100644
+--- a/crypto/dh/dh_check.c
++++ b/crypto/dh/dh_check.c
+@@ -249,6 +249,18 @@ int DH_check_pub_key_ex(const DH *dh, const BIGNUM *pub_key)
+  */
+ int DH_check_pub_key(const DH *dh, const BIGNUM *pub_key, int *ret)
+ {
++    /* Don't do any checks at all with an excessively large modulus */
++    if (BN_num_bits(dh->params.p) > OPENSSL_DH_CHECK_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_LARGE);
++        *ret = DH_MODULUS_TOO_LARGE | DH_CHECK_PUBKEY_INVALID;
++        return 0;
++    }
++
++    if (dh->params.q != NULL && BN_ucmp(dh->params.p, dh->params.q) < 0) {
++        *ret |= DH_CHECK_INVALID_Q_VALUE | DH_CHECK_PUBKEY_INVALID;
++        return 1;
++    }
++
+     return ossl_ffc_validate_public_key(&dh->params, pub_key, ret);
+ }
+
+diff --git a/crypto/dh/dh_err.c b/crypto/dh/dh_err.c
+index 4152397..f76ac0d 100644
+--- a/crypto/dh/dh_err.c
++++ b/crypto/dh/dh_err.c
+@@ -1,6 +1,6 @@
+ /*
+  * Generated by util/mkerr.pl DO NOT EDIT
+- * Copyright 1995-2021 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+@@ -54,6 +54,7 @@ static const ERR_STRING_DATA DH_str_reasons[] = {
+     {ERR_PACK(ERR_LIB_DH, 0, DH_R_PARAMETER_ENCODING_ERROR),
+     "parameter encoding error"},
+     {ERR_PACK(ERR_LIB_DH, 0, DH_R_PEER_KEY_ERROR), "peer key error"},
++    {ERR_PACK(ERR_LIB_DH, 0, DH_R_Q_TOO_LARGE), "q too large"},
+     {ERR_PACK(ERR_LIB_DH, 0, DH_R_SHARED_INFO_ERROR), "shared info error"},
+     {ERR_PACK(ERR_LIB_DH, 0, DH_R_UNABLE_TO_CHECK_GENERATOR),
+     "unable to check generator"},
+diff --git a/crypto/dh/dh_key.c b/crypto/dh/dh_key.c
+index d84ea99..afc49f5 100644
+--- a/crypto/dh/dh_key.c
++++ b/crypto/dh/dh_key.c
+@@ -49,6 +49,12 @@ int ossl_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
+         goto err;
+     }
+
++    if (dh->params.q != NULL
++        && BN_num_bits(dh->params.q) > OPENSSL_DH_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_DH, DH_R_Q_TOO_LARGE);
++        goto err;
++    }
++
+     if (BN_num_bits(dh->params.p) < DH_MIN_MODULUS_BITS) {
+         ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_SMALL);
+         return 0;
+@@ -267,6 +273,12 @@ static int generate_key(DH *dh)
+         return 0;
+     }
+
++    if (dh->params.q != NULL
++        && BN_num_bits(dh->params.q) > OPENSSL_DH_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_DH, DH_R_Q_TOO_LARGE);
++        return 0;
++    }
++
+     if (BN_num_bits(dh->params.p) < DH_MIN_MODULUS_BITS) {
+         ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_SMALL);
+         return 0;
+diff --git a/crypto/err/openssl.txt b/crypto/err/openssl.txt
+index e51504b..36de321 100644
+--- a/crypto/err/openssl.txt
++++ b/crypto/err/openssl.txt
+@@ -500,6 +500,7 @@ DH_R_NO_PARAMETERS_SET:107:no parameters set
+ DH_R_NO_PRIVATE_VALUE:100:no private value
+ DH_R_PARAMETER_ENCODING_ERROR:105:parameter encoding error
+ DH_R_PEER_KEY_ERROR:111:peer key error
++DH_R_Q_TOO_LARGE:130:q too large
+ DH_R_SHARED_INFO_ERROR:113:shared info error
+ DH_R_UNABLE_TO_CHECK_GENERATOR:121:unable to check generator
+ DSA_R_BAD_FFC_PARAMETERS:114:bad ffc parameters
+diff --git a/include/crypto/dherr.h b/include/crypto/dherr.h
+index bb24d13..519327f 100644
+--- a/include/crypto/dherr.h
++++ b/include/crypto/dherr.h
+@@ -1,6 +1,6 @@
+ /*
+  * Generated by util/mkerr.pl DO NOT EDIT
+- * Copyright 2020-2021 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 2020-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+diff --git a/include/openssl/dh.h b/include/openssl/dh.h
+index 6533260..50e0cf5 100644
+--- a/include/openssl/dh.h
++++ b/include/openssl/dh.h
+@@ -141,7 +141,7 @@ DECLARE_ASN1_ITEM(DHparams)
+ #   define DH_GENERATOR_3          3
+ #   define DH_GENERATOR_5          5
+
+-/* DH_check error codes */
++/* DH_check error codes, some of them shared with DH_check_pub_key */
+ /*
+  * NB: These values must align with the equivalently named macros in
+  * internal/ffc.h.
+@@ -151,10 +151,10 @@ DECLARE_ASN1_ITEM(DHparams)
+ #   define DH_UNABLE_TO_CHECK_GENERATOR    0x04
+ #   define DH_NOT_SUITABLE_GENERATOR       0x08
+ #   define DH_CHECK_Q_NOT_PRIME            0x10
+-#   define DH_CHECK_INVALID_Q_VALUE        0x20
++#   define DH_CHECK_INVALID_Q_VALUE        0x20 /* +DH_check_pub_key */
+ #   define DH_CHECK_INVALID_J_VALUE        0x40
+ #   define DH_MODULUS_TOO_SMALL            0x80
+-#   define DH_MODULUS_TOO_LARGE            0x100
++#   define DH_MODULUS_TOO_LARGE            0x100 /* +DH_check_pub_key */
+
+ /* DH_check_pub_key error codes */
+ #   define DH_CHECK_PUBKEY_TOO_SMALL       0x01
+diff --git a/include/openssl/dherr.h b/include/openssl/dherr.h
+index 5d2a762..074a701 100644
+--- a/include/openssl/dherr.h
++++ b/include/openssl/dherr.h
+@@ -1,6 +1,6 @@
+ /*
+  * Generated by util/mkerr.pl DO NOT EDIT
+- * Copyright 1995-2021 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+@@ -50,6 +50,7 @@
+ #  define DH_R_NO_PRIVATE_VALUE                            100
+ #  define DH_R_PARAMETER_ENCODING_ERROR                    105
+ #  define DH_R_PEER_KEY_ERROR                              111
++#  define DH_R_Q_TOO_LARGE                                 130
+ #  define DH_R_SHARED_INFO_ERROR                           113
+ #  define DH_R_UNABLE_TO_CHECK_GENERATOR                   121
+
+--
+2.40.1
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
index d8c9b073a2..395cace2ec 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2023-5678.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


