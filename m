Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4682C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:15:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.19653.1738332939945792931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 06:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xMNHAy1v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21644aca3a0so47520185ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738332939; x=1738937739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWa1llRsXApDx/6fEZl+QIddsRVU0f1IrjF8gaafwg8=;
        b=xMNHAy1vSQkC4VhasqLohsWBpAEZ+107tBqMVuCXBUN3YzjxxycpaJ+qjtQz+Iq496
         Xho2KM0adn6NX4ii0A8VaSZ9INlxtTE2f6QQcctAJzK7UzGtp3/R/0L+4z2Egk+PqDDQ
         0Rm5zyAPk8VoH16N3iFx9l1zSSC9rJeuANQv5rScpBcT66CPNHSLVdACOXK+3pG85te7
         6go4hMK2vbxAz7wo6A1LqJovb61X32ghUhp0L1w37rV9ZfUHDyoF8Rtmg+FPvq4aSpRN
         A6ppJmdhwV5U3uY+Ms95KY+QqjAdQ634gZlUylNjkaPU9ZWKFvFpBSelNZE3352YBwTG
         PS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738332939; x=1738937739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWa1llRsXApDx/6fEZl+QIddsRVU0f1IrjF8gaafwg8=;
        b=WId2aItzg2r6/guGCNgi6PZL7TLm6A0GdUtQsyIBWwvzXSkev0zAQ1UIxkhvFs2Kct
         IARo/zKWGts84vEc1TUYPz2vfUOdCFQxrKDDJapIDotfgL0JW4JpvcQoGZg1o1iMILaf
         RbY2oisRgDAVhKG44Oj6bXWIWyBQraUA2otl4ahg2CKRNIkR40Km+wmDVJh/R0KAuFiN
         0DG6Lz4cKXH8RtQSldXdcUxkFFhs1f2JysrNSiwdfaadw4Jj1TXR0XktZZ619KniOcXP
         /ykGMOIuhdbQ7GCqr1LJJ0FYcPE0+Y+0iYi+Nur+cJVfCKLhdTq9InB3mTEKJYc1P+/v
         bFlw==
X-Gm-Message-State: AOJu0YxEsh4LyhenBLxpzoscmiXdJxp3uphwCv5ELRt+0HciDgdKuHSn
	XP2p1tH1spW99WKew5V6F+1B6/ce5P/149TshJSC33j6b9HN/CdWnS4qHnByEs7Kn+oLrjaYKtg
	qCVo=
X-Gm-Gg: ASbGncskQ/dNavv5GkFiLAeWa78CQPEP+jkx/nYYvxaJBBDJmI1p9UUCjxAbtkaAA2v
	3Z63hRU7pVcRK4Xc1FrvoAHsk0kMPek053W5SnFbmg3KRcSe2u2DJCMmGMtk8XHk6/cWv1iFa+d
	RQqzhzygnwQnuR+uihd71eY7h2tHTFWfKh8VCWk4aS7Ki/8+5tIjjjOLWo6AapIwJoqgG+BQMBC
	8Z8YHRA+1/mGJy+c3xOMyxhpYb5JUMZnufKpwrMv9YZ7b2ahA2Go/3sCOSOoFwMb9qPMortMRn/
	9wYO
X-Google-Smtp-Source: AGHT+IG7Zn86Gxln3E+RSHpV4PcGsXbXzlVkB6JIribqiDhnoBQx0oZnrkQT6usqh87IffPh32qYcg==
X-Received: by 2002:a05:6a20:3954:b0:1e1:a434:2964 with SMTP id adf61e73a8af0-1ed7a5c41ecmr20367757637.2.1738332939047;
        Fri, 31 Jan 2025 06:15:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a958sm3412644b3a.172.2025.01.31.06.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:15:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] openssl: patch CVE-2024-13176
Date: Fri, 31 Jan 2025 06:15:27 -0800
Message-ID: <cb18163c11d7f8b62b829f203b00a4e14513c6cf.1738332771.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738332771.git.steve@sakoman.com>
References: <cover.1738332771.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210483

From: Peter Marko <peter.marko@siemens.com>

Picked [1] per link in [2].

[1] https://github.com/openssl/openssl/commit/07272b05b04836a762b4baa874958af51d513844
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-13176

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-13176.patch      | 125 ++++++++++++++++++
 .../openssl/openssl_3.0.15.bb                 |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
new file mode 100644
index 0000000000..0076003db1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
@@ -0,0 +1,125 @@
+From 07272b05b04836a762b4baa874958af51d513844 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Wed, 15 Jan 2025 18:27:02 +0100
+Subject: [PATCH] Fix timing side-channel in ECDSA signature computation
+
+There is a timing signal of around 300 nanoseconds when the top word of
+the inverted ECDSA nonce value is zero. This can happen with significant
+probability only for some of the supported elliptic curves. In particular
+the NIST P-521 curve is affected. To be able to measure this leak, the
+attacker process must either be located in the same physical computer or
+must have a very fast network connection with low latency.
+
+Attacks on ECDSA nonce are also known as Minerva attack.
+
+Fixes CVE-2024-13176
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/26429)
+
+(cherry picked from commit 63c40a66c5dc287485705d06122d3a6e74a6a203)
+
+CVE: CVE-2024-13176
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/07272b05b04836a762b4baa874958af51d513844]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ crypto/bn/bn_exp.c  | 21 +++++++++++++++------
+ crypto/ec/ec_lib.c  |  7 ++++---
+ include/crypto/bn.h |  3 +++
+ 3 files changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/crypto/bn/bn_exp.c b/crypto/bn/bn_exp.c
+index 598a592ca1397..d84c7de18a6b6 100644
+--- a/crypto/bn/bn_exp.c
++++ b/crypto/bn/bn_exp.c
+@@ -606,7 +606,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBUF(BIGNUM *b, int top,
+  * out by Colin Percival,
+  * http://www.daemonology.net/hyperthreading-considered-harmful/)
+  */
+-int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
++int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
+                               const BIGNUM *m, BN_CTX *ctx,
+                               BN_MONT_CTX *in_mont)
+ {
+@@ -623,10 +623,6 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
+     unsigned int t4 = 0;
+ #endif
+ 
+-    bn_check_top(a);
+-    bn_check_top(p);
+-    bn_check_top(m);
+-
+     if (!BN_is_odd(m)) {
+         ERR_raise(ERR_LIB_BN, BN_R_CALLED_WITH_EVEN_MODULUS);
+         return 0;
+@@ -1146,7 +1142,7 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
+             goto err;
+     } else
+ #endif
+-    if (!BN_from_montgomery(rr, &tmp, mont, ctx))
++    if (!bn_from_mont_fixed_top(rr, &tmp, mont, ctx))
+         goto err;
+     ret = 1;
+  err:
+@@ -1160,6 +1156,19 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
+     return ret;
+ }
+ 
++int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
++                              const BIGNUM *m, BN_CTX *ctx,
++                              BN_MONT_CTX *in_mont)
++{
++    bn_check_top(a);
++    bn_check_top(p);
++    bn_check_top(m);
++    if (!bn_mod_exp_mont_fixed_top(rr, a, p, m, ctx, in_mont))
++        return 0;
++    bn_correct_top(rr);
++    return 1;
++}
++
+ int BN_mod_exp_mont_word(BIGNUM *rr, BN_ULONG a, const BIGNUM *p,
+                          const BIGNUM *m, BN_CTX *ctx, BN_MONT_CTX *in_mont)
+ {
+diff --git a/crypto/ec/ec_lib.c b/crypto/ec/ec_lib.c
+index b1696d93bd6dd..1f0bf1ec795fa 100644
+--- a/crypto/ec/ec_lib.c
++++ b/crypto/ec/ec_lib.c
+@@ -20,6 +20,7 @@
+ #include <openssl/err.h>
+ #include <openssl/opensslv.h>
+ #include "crypto/ec.h"
++#include "crypto/bn.h"
+ #include "internal/nelem.h"
+ #include "ec_local.h"
+ 
+@@ -1262,10 +1263,10 @@ static int ec_field_inverse_mod_ord(const EC_GROUP *group, BIGNUM *r,
+     if (!BN_sub(e, group->order, e))
+         goto err;
+     /*-
+-     * Exponent e is public.
+-     * No need for scatter-gather or BN_FLG_CONSTTIME.
++     * Although the exponent is public we want the result to be
++     * fixed top.
+      */
+-    if (!BN_mod_exp_mont(r, x, e, group->order, ctx, group->mont_data))
++    if (!bn_mod_exp_mont_fixed_top(r, x, e, group->order, ctx, group->mont_data))
+         goto err;
+ 
+     ret = 1;
+diff --git a/include/crypto/bn.h b/include/crypto/bn.h
+index c5f328156d3a9..59a629b9f6288 100644
+--- a/include/crypto/bn.h
++++ b/include/crypto/bn.h
+@@ -73,6 +73,9 @@ int bn_set_words(BIGNUM *a, const BN_ULONG *words, int num_words);
+  */
+ int bn_mul_mont_fixed_top(BIGNUM *r, const BIGNUM *a, const BIGNUM *b,
+                           BN_MONT_CTX *mont, BN_CTX *ctx);
++int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const BIGNUM *p,
++                              const BIGNUM *m, BN_CTX *ctx,
++                              BN_MONT_CTX *in_mont);
+ int bn_to_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX *mont,
+                          BN_CTX *ctx);
+ int bn_from_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX *mont,
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.15.bb b/meta/recipes-connectivity/openssl/openssl_3.0.15.bb
index 5f7e7c0000..295f05729f 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.15.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.15.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2024-9143.patch \
+           file://CVE-2024-13176.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


