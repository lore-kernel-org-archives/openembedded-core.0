Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7060C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.7673.1738205484485285916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0aZri2ge;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216281bc30fso7245615ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205484; x=1738810284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrrudlDiYEYUOtm85uihCfVq5gWck6dASM/6cY5H66k=;
        b=0aZri2gedmifsFIffIbyti0SN3DALueIT2oWU04F3E3WMgieKUk0pD6Qy4S6FgxM7+
         2aTInlCPrvLIL9OdOcAY/CC/Lb0gfteAU9T8zSUWOV3A0vv4J1cUez/7kG4Gf4lfYS+T
         vhIONDhC4XQPceU/L3olN8zQpG4hr3/JSCZCuXbuq/sdCMaxHbbhFKnvizMkJHcq0vz0
         F/FLi6qeDUTXaxuPKGLDa9YO3pJZ2bKn4+Iu6yDsyMZd+IYeU27mZSKI5QRR24DXLw0d
         YgY1cCYlz4zeW/9NOACEOiILK5sdjmXm5B8Oc0e/a64Ka7SDfrVxCJl7NZf7xcHVSbRW
         7KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205484; x=1738810284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrrudlDiYEYUOtm85uihCfVq5gWck6dASM/6cY5H66k=;
        b=IwHZj8gvi4a/aiTqn4qb0VYAmQ/Ed64bKByiEjK3E4pZox5Fw+Ff4As+/jfjOY0DR6
         cIUt/AlR6gMINI673fBLdObJCmQJfVboo6h+tN4IQH9hgDaBqp/OQH4bOBQWhq0hbTgT
         Pacppye+vvcz2CsPzsszlPyZ3W5mDU5AfJ9p2iHY53WnQ40pjGzlEHlHOVXBGJnpzO2+
         k2+HJ0+2kpY5+jj3b/AeMGYBKHolyEhAflmU9+WXq7Y6quud+xF36PNbE0GE3TwAplbK
         IFxHyR85mszR6tOL/uWsOCdILxyoLevN3vPhkpO/Lbxb4W3K0F7YENViYTIuyWqPn5UT
         fVjg==
X-Gm-Message-State: AOJu0YxCU1LvVv3mQ+B5AjHUEsHu6GHIxS33W7zEGAXjt9pLTGGc2fdw
	ynUy0qaNqOhF/AsVBtX6cClw9PLxVi+Iu9Vgbai3Xq34tfNLJg0NTmneNxZSJJX6SWLcyfKHHfn
	toFY=
X-Gm-Gg: ASbGnctDKNgRkyyDqiQtG/0Us61g+Z4TtAdFk6Iom8q7fWxe74G50DsNFO65pvsMUuw
	3ley+PsthP9PI9uK1O7XCrRSYGygftddBhZ4uwa9H6yr+oY8TlBhnLFccVtHTHQMShGZfEaTdi7
	dXiyd1nflp2b8ffmnOi6FghHVH4s/5NHZdmdlfVhbxHi/Nl9eIOHiSgQ2XeDN3Aq7UoB0Cnx9m8
	BJ41MZ8+l4JriRarsj7RS/S13vjwqV5tyCgC3+Z71bPk17h/b7qxKY46KP6WVcUbjdf3cVqmX/D
	9xuJ
X-Google-Smtp-Source: AGHT+IHoA1MgVbPoARmPD2LU9Mh7cr8NiI8nc5ku4svAfEDpHNlgI2MR2Xv41J+THw8kTmWQ06APHA==
X-Received: by 2002:a17:902:ecce:b0:211:3275:3fe with SMTP id d9443c01a7336-21dd7c65555mr83698465ad.17.1738205483351;
        Wed, 29 Jan 2025 18:51:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/12] openssl: patch CVE-2024-13176
Date: Wed, 29 Jan 2025 18:51:02 -0800
Message-ID: <7f9bb49394185fea268397db4fc7d96afae53f28.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210422

From: Peter Marko <peter.marko@siemens.com>

Picked [1] per link in [2]

[1] https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a25c181e11f65
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-13176

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-13176.patch      | 126 ++++++++++++++++++
 .../openssl/openssl_3.2.3.bb                  |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
new file mode 100644
index 0000000000..28d4dd706a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
@@ -0,0 +1,126 @@
+From 4b1cb94a734a7d4ec363ac0a215a25c181e11f65 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 392dcb336405a0c94486aa6655057f59fd3a0902)
+
+CVE: CVE-2024-13176
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a25c181e11f65]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ crypto/bn/bn_exp.c  | 21 +++++++++++++++------
+ crypto/ec/ec_lib.c  |  7 ++++---
+ include/crypto/bn.h |  3 +++
+ 3 files changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/crypto/bn/bn_exp.c b/crypto/bn/bn_exp.c
+index b876edbfac36e..af52e2ced6914 100644
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
+index c92b4dcb0ac45..a79fbb98cf6fa 100644
+--- a/crypto/ec/ec_lib.c
++++ b/crypto/ec/ec_lib.c
+@@ -21,6 +21,7 @@
+ #include <openssl/opensslv.h>
+ #include <openssl/param_build.h>
+ #include "crypto/ec.h"
++#include "crypto/bn.h"
+ #include "internal/nelem.h"
+ #include "ec_local.h"
+ 
+@@ -1261,10 +1262,10 @@ static int ec_field_inverse_mod_ord(const EC_GROUP *group, BIGNUM *r,
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
+index 302f031c2ff1d..499e1d10efab0 100644
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
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb b/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
index 2c30dbd47a..0b47bab550 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://CVE-2024-9143.patch \
+           file://CVE-2024-13176.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


