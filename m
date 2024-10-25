Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F94D149DF
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:29:42 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.2550.1729880980499950979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DkG2ol1r;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.51, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-288d70788d6so1284233fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880979; x=1730485779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AjjO1WpZX0vqxA1/WBOqhYqbfvqObDu7VHxtTB36UI=;
        b=DkG2ol1rLbBBhfdI6BDxi8HJrrQ919heZd0BRr2pCsvGHXt6H2h+Oeear7qiDklxOX
         7KV3JmU72rzni8Z0XhN3VxITehBZc9qqKfQ++XPVxoWiV0vbEGpCnDMGv5n2etnkL6ir
         8QuVOHKAnNy1g34ysHhn0+GEFLvDT8Z/PcrTKo5wgB7QY4GFrkqmsU6l2z0hcPPoaZQ6
         m5qNna4hmt/xTq1x/reloq7XsZGYfT6EwUQFUrk7JvKull3ePh2vyShW7vedFts/1sy9
         g+CmByK7s5NY+ZEJQ8LSxDPXCJRD8g8n/tYguoj9NeUVfrwNZuQhTMWxdE4Zl75Ir+JL
         OE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880979; x=1730485779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AjjO1WpZX0vqxA1/WBOqhYqbfvqObDu7VHxtTB36UI=;
        b=T87GidL/tnJ0yWvsDrL5nvcATa3c1/ZvPvRayUnVNlCCk73L2NgJxPFtYZEERGbv3E
         US/ylamrOdKaKEd0z/gM17lwIpUMdTBnVzB9Eakjgv3nd1ToZd1NY8uWS67H37A4XkN4
         n2tuzko92L0zYR5GpkcHBSERpg+0PozlTgjVqeMfelyEfjPhvet72Z6oe4H65wj561o7
         e4g5bGouODe4n3n4J17AgjXcfqzpVI5WlI5TYXtZLW6MD0kYWuPvOOmSWIOj3n/4Kk7E
         dDHXbpcUS2I1onp/1XmpEFLnJuT4AL++wS8ouVsvsKo5EHSfBHxqptgBqMSM39a+qCo9
         Z2YQ==
X-Gm-Message-State: AOJu0YxOgE6fVFmvluy2+ziZZG8ZHtMfdfWd/8+IaemHIYrdKO9uxvQ7
	HkMSul+93P6fxHOWn+H67C1xs7vNQ9+MCQUBrRBqtWdDhzfZYJp7nMqYb51Rm0bSMpbFZ+6M1I9
	R
X-Google-Smtp-Source: AGHT+IHPr3nDwSc5XBP/B3HYnw5m0vK7xRb4QKqdsjH/DkzjYNVc5pmVYXwy4IJzKxdefBhcrio1NA==
X-Received: by 2002:a05:6871:10b:b0:288:865e:1864 with SMTP id 586e51a60fabf-29051745061mr547939fac.0.1729880979377;
        Fri, 25 Oct 2024 11:29:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] openssl: patch CVE-2024-9143
Date: Fri, 25 Oct 2024 11:29:20 -0700
Message-Id: <df9cd27e23f051fb02391ca62d29f152f36f76fe.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206361

From: Peter Marko <peter.marko@siemens.com>

Pick patch from branch openssl-3.2.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-9143.patch       | 202 ++++++++++++++++++
 .../openssl/openssl_3.2.3.bb                  |   1 +
 2 files changed, 203 insertions(+)
 create mode 100755 meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
new file mode 100755
index 0000000000..99c16cd573
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
@@ -0,0 +1,202 @@
+From bc7e04d7c8d509fb78fc0e285aa948fb0da04700 Mon Sep 17 00:00:00 2001
+From: Viktor Dukhovni <viktor@openssl.org>
+Date: Thu, 19 Sep 2024 01:02:40 +1000
+Subject: [PATCH] Harden BN_GF2m_poly2arr against misuse.
+
+The BN_GF2m_poly2arr() function converts characteristic-2 field
+(GF_{2^m}) Galois polynomials from a representation as a BIGNUM bitmask,
+to a compact array with just the exponents of the non-zero terms.
+
+These polynomials are then used in BN_GF2m_mod_arr() to perform modular
+reduction.  A precondition of calling BN_GF2m_mod_arr() is that the
+polynomial must have a non-zero constant term (i.e. the array has `0` as
+its final element).
+
+Internally, callers of BN_GF2m_poly2arr() did not verify that
+precondition, and binary EC curve parameters with an invalid polynomial
+could lead to out of bounds memory reads and writes in BN_GF2m_mod_arr().
+
+The precondition is always true for polynomials that arise from the
+standard form of EC parameters for characteristic-two fields (X9.62).
+See the "Finite Field Identification" section of:
+
+    https://www.itu.int/ITU-T/formal-language/itu-t/x/x894/2018-cor1/ANSI-X9-62.html
+
+The OpenSSL GF(2^m) code supports only the trinomial and pentanomial
+basis X9.62 forms.
+
+This commit updates BN_GF2m_poly2arr() to return `0` (failure) when
+the constant term is zero (i.e. the input bitmask BIGNUM is not odd).
+
+Additionally, the return value is made unambiguous when there is not
+enough space to also pad the array with a final `-1` sentinel value.
+The return value is now always the number of elements (including the
+final `-1`) that would be filled when the output array is sufficiently
+large.  Previously the same count was returned both when the array has
+just enough room for the final `-1` and when it had only enough space
+for non-sentinel values.
+
+Finally, BN_GF2m_poly2arr() is updated to reject polynomials whose
+degree exceeds `OPENSSL_ECC_MAX_FIELD_BITS`, this guards against
+CPU exhausition attacks via excessively large inputs.
+
+The above issues do not arise in processing X.509 certificates.  These
+generally have EC keys from "named curves", and RFC5840 (Section 2.1.1)
+disallows explicit EC parameters.  The TLS code in OpenSSL enforces this
+constraint only after the certificate is decoded, but, even if explicit
+parameters are specified, they are in X9.62 form, which cannot represent
+problem values as noted above.
+
+Initially reported as oss-fuzz issue 71623.
+
+A closely related issue was earlier reported in
+<https://github.com/openssl/openssl/issues/19826>.
+
+Severity: Low, CVE-2024-9143
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/25639)
+
+(cherry picked from commit 8e008cb8b23ec7dc75c45a66eeed09c815b11cd2)
+
+CVE: CVE-2024-9143
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/bc7e04d7c8d509fb78fc0e285aa948fb0da04700]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ crypto/bn/bn_gf2m.c     | 28 +++++++++++++++-------
+ test/ec_internal_test.c | 51 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 71 insertions(+), 8 deletions(-)
+
+diff --git a/crypto/bn/bn_gf2m.c b/crypto/bn/bn_gf2m.c
+index 444c5ca7a3755..ae7e9d751c29c 100644
+--- a/crypto/bn/bn_gf2m.c
++++ b/crypto/bn/bn_gf2m.c
+@@ -15,6 +15,7 @@
+ #include "bn_local.h"
+ 
+ #ifndef OPENSSL_NO_EC2M
++# include <openssl/ec.h>
+ 
+ /*
+  * Maximum number of iterations before BN_GF2m_mod_solve_quad_arr should
+@@ -1130,16 +1131,26 @@ int BN_GF2m_mod_solve_quad(BIGNUM *r, const BIGNUM *a, const BIGNUM *p,
+ /*
+  * Convert the bit-string representation of a polynomial ( \sum_{i=0}^n a_i *
+  * x^i) into an array of integers corresponding to the bits with non-zero
+- * coefficient.  Array is terminated with -1. Up to max elements of the array
+- * will be filled.  Return value is total number of array elements that would
+- * be filled if array was large enough.
++ * coefficient.  The array is intended to be suitable for use with
++ * `BN_GF2m_mod_arr()`, and so the constant term of the polynomial must not be
++ * zero.  This translates to a requirement that the input BIGNUM `a` is odd.
++ *
++ * Given sufficient room, the array is terminated with -1.  Up to max elements
++ * of the array will be filled.
++ *
++ * The return value is total number of array elements that would be filled if
++ * array was large enough, including the terminating `-1`.  It is `0` when `a`
++ * is not odd or the constant term is zero contrary to requirement.
++ *
++ * The return value is also `0` when the leading exponent exceeds
++ * `OPENSSL_ECC_MAX_FIELD_BITS`, this guards against CPU exhaustion attacks,
+  */
+ int BN_GF2m_poly2arr(const BIGNUM *a, int p[], int max)
+ {
+     int i, j, k = 0;
+     BN_ULONG mask;
+ 
+-    if (BN_is_zero(a))
++    if (!BN_is_odd(a))
+         return 0;
+ 
+     for (i = a->top - 1; i >= 0; i--) {
+@@ -1157,12 +1168,13 @@ int BN_GF2m_poly2arr(const BIGNUM *a, int p[], int max)
+         }
+     }
+ 
+-    if (k < max) {
++    if (k > 0 && p[0] > OPENSSL_ECC_MAX_FIELD_BITS)
++        return 0;
++
++    if (k < max)
+         p[k] = -1;
+-        k++;
+-    }
+ 
+-    return k;
++    return k + 1;
+ }
+ 
+ /*
+diff --git a/test/ec_internal_test.c b/test/ec_internal_test.c
+index 5076f9894d5b8..92904cfc42b20 100644
+--- a/test/ec_internal_test.c
++++ b/test/ec_internal_test.c
+@@ -155,6 +155,56 @@ static int field_tests_ecp_mont(void)
+ }
+ 
+ #ifndef OPENSSL_NO_EC2M
++/* Test that decoding of invalid GF2m field parameters fails. */
++static int ec2m_field_sanity(void)
++{
++    int ret = 0;
++    BN_CTX *ctx = BN_CTX_new();
++    BIGNUM *p, *a, *b;
++    EC_GROUP *group1 = NULL, *group2 = NULL, *group3 = NULL;
++
++    TEST_info("Testing GF2m hardening\n");
++
++    BN_CTX_start(ctx);
++    p = BN_CTX_get(ctx);
++    a = BN_CTX_get(ctx);
++    if (!TEST_ptr(b = BN_CTX_get(ctx))
++        || !TEST_true(BN_one(a))
++        || !TEST_true(BN_one(b)))
++        goto out;
++
++    /* Even pentanomial value should be rejected */
++    if (!TEST_true(BN_set_word(p, 0xf2)))
++        goto out;
++    if (!TEST_ptr_null(group1 = EC_GROUP_new_curve_GF2m(p, a, b, ctx)))
++        TEST_error("Zero constant term accepted in GF2m polynomial");
++
++    /* Odd hexanomial should also be rejected */
++    if (!TEST_true(BN_set_word(p, 0xf3)))
++        goto out;
++    if (!TEST_ptr_null(group2 = EC_GROUP_new_curve_GF2m(p, a, b, ctx)))
++        TEST_error("Hexanomial accepted as GF2m polynomial");
++
++    /* Excessive polynomial degree should also be rejected */
++    if (!TEST_true(BN_set_word(p, 0x71))
++        || !TEST_true(BN_set_bit(p, OPENSSL_ECC_MAX_FIELD_BITS + 1)))
++        goto out;
++    if (!TEST_ptr_null(group3 = EC_GROUP_new_curve_GF2m(p, a, b, ctx)))
++        TEST_error("GF2m polynomial degree > %d accepted",
++                   OPENSSL_ECC_MAX_FIELD_BITS);
++
++    ret = group1 == NULL && group2 == NULL && group3 == NULL;
++
++ out:
++    EC_GROUP_free(group1);
++    EC_GROUP_free(group2);
++    EC_GROUP_free(group3);
++    BN_CTX_end(ctx);
++    BN_CTX_free(ctx);
++
++    return ret;
++}
++
+ /* test EC_GF2m_simple_method directly */
+ static int field_tests_ec2_simple(void)
+ {
+@@ -443,6 +493,7 @@ int setup_tests(void)
+     ADD_TEST(field_tests_ecp_simple);
+     ADD_TEST(field_tests_ecp_mont);
+ #ifndef OPENSSL_NO_EC2M
++    ADD_TEST(ec2m_field_sanity);
+     ADD_TEST(field_tests_ec2_simple);
+ #endif
+     ADD_ALL_TESTS(field_tests_default, crv_len);
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb b/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
index 53139df40c..2c30dbd47a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://CVE-2024-9143.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


