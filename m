Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46B6C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 20:42:56 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4490.1737578571388258228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 12:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PjGXdYfh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025012220424714229905a6b7c35cb9-hkqc5w@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025012220424714229905a6b7c35cb9
        for <openembedded-core@lists.openembedded.org>;
        Wed, 22 Jan 2025 21:42:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YLMfnY3VDWa6AH46HHgXr05QfqYipX+E6notk1B6844=;
 b=PjGXdYfhlwFD+Ths6w/JoTfoNhs5XMkp6TH4cUGfcU1WX1BxS9gHxo3w/eSFnFYzkr3CdT
 jtM4ihWInT6D2x5k3b6zhes2TjUI8Stqss+uP+39ggNi5AXnUH8qIu+/VuB9wa8Wfbh8ytAk
 cETzwuZ6wGZW8T02cJdNJrHHHFF8+faaH+C2TET7vIqbXqq+rsvqg7bIUhru0eBIWZZIllfN
 pI5qy/Uq/rDIercqRygcxoFeHvhEx0n9c2NK7jMJ/gH2YegQHKOGrg0RKAS5lgDLGmUQtfLJ
 0t44sSnTQhF6tdKeMSwErKvXKZC7ptkgtmYiL4hHH53BlETUeURkJzMA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] openssl: patch CVE-2024-13176
Date: Wed, 22 Jan 2025 21:41:57 +0100
Message-Id: <20250122204157.4016363-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 20:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210161

From: Peter Marko <peter.marko@siemens.com>

Picked [1] per link in [2]

[1] https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a25c181e11f65
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-13176

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/openssl/CVE-2024-13176.patch      | 126 ++++++++++++++++++
 .../openssl/openssl_3.2.3.bb                  |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
new file mode 100644
index 00000000000..28d4dd706a8
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
index 2c30dbd47ab..0b47bab5507 100644
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
2.30.2


