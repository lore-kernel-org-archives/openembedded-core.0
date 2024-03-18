Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ACAC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 06:55:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37386.1710744926710046007
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 23:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kc7eDm0T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3807ca6fbb=haitao.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I6LQFu024048
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 23:55:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=VeQaj
	zfGdGsev0AIoQGBHzw66vFxTsRpsWOTCA3oKrc=; b=kc7eDm0Tzv1UIQmpCzOlJ
	/VzH4q1cleUyjbRVkvgf+ZNFfQLEz25aMqPSZmKgYNV8WJfUhX2F96Q1mObzdB0e
	hTfXAj6fTnI/i3+MzsXKv8sj0BvwhcHfXkcvEYHsJi1ETJjJT9j0zdEictGaNo3h
	BAv+u0+Kws3AjysoZnnLuI4vJCpDIts8B5iRGap5sOz5Mm7JTl2ufPthE0QnYBvL
	Cgi5L52cbpgGkYaCsZCW+MXoj8T69VhGJKZGI/aJD3XkggXPRFcR7tW1cFcFEbt3
	s6WItJN32z3dbCeeqY7sskM+TXaJnO6wqGPs7QJakYoOhwtJSBjevdI9bgVMX9BS
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wwaxg94nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 23:55:26 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 17 Mar 2024 23:55:25 -0700
Received: from pek-lpd-susbld.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Sun, 17 Mar 2024 23:55:24 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performac
Date: Mon, 18 Mar 2024 14:55:24 +0800
Message-ID: <20240318065524.3337545-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: o7ZkS66TvC-cOSKAw178Epj6BYoO_GGx
X-Proofpoint-ORIG-GUID: o7ZkS66TvC-cOSKAw178Epj6BYoO_GGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403180051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 06:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197294

The ssh-keygen would take a long time to generate the entropy of a key

The following commits have fixed the issue.
https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad838880b943870
https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a45c9df61

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
---
 ...-Improve-FIPS-RSA-keygen-performance.patch | 271 ++++++++++++++++++
 ...-Improve-FIPS-RSA-keygen-performance.patch | 185 ++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   2 +
 3 files changed, 458 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keygen-performance.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keygen-performance.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keygen-performance.patch
new file mode 100644
index 0000000000..aed0e1a5c1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keygen-performance.patch
@@ -0,0 +1,271 @@
+From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00 2001
+From: slontis <shane.lontis@oracle.com>
+Date: Wed, 2 Nov 2022 12:01:34 +1000
+Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
+
+FIPS 186-4 has 5 different algorithms for key generation,
+and all of them rely on testing GCD(a,n) == 1 many times.
+
+Cachegrind was showing that during a RSA keygen operation,
+the function BN_gcd() was taking a considerable percentage
+of the total cycles.
+
+The default provider uses multiprime keygen, which seemed to
+be much faster. This is because it uses BN_mod_inverse()
+instead.
+
+For a 4096 bit key, the entropy of a key that was taking a
+long time to generate was recorded and fed back into subsequent
+runs. Roughly 40% of the cycle time was BN_gcd() with most of the
+remainder in the prime testing. Changing to use the inverse
+resulted in the cycle count being 96% in the prime testing.
+
+Reviewed-by: Paul Dale <pauli@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/19578)
+
+(cherry picked from commit dd1d7bcb69994d81662e709b0ad838880b943870)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad838880b943870]
+
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+---
+ crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
+ crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
+ doc/man3/BN_cmp.pod          | 14 +++++++++++++-
+ include/openssl/bn.h         |  1 +
+ test/bntest.c                | 26 ++++++++++++++++++++++++--
+ util/libcrypto.num           |  1 +
+ 6 files changed, 85 insertions(+), 12 deletions(-)
+
+diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c
+index cd0b015..879a84b 100644
+--- a/crypto/bn/bn_gcd.c
++++ b/crypto/bn/bn_gcd.c
+@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
+     return rv;
+ }
+ 
++/*
++ * The numbers a and b are coprime if the only positive integer that is a
++ * divisor of both of them is 1.
++ * i.e. gcd(a,b) = 1.
++ *
++ * Coprimes have the property: b has a multiplicative inverse modulo a
++ * i.e there is some value x such that bx = 1 (mod a).
++ *
++ * Testing the modulo inverse is currently much faster than the constant
++ * time version of BN_gcd().
++ */
++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx)
++{
++    int ret = 0;
++    BIGNUM *tmp;
++
++    BN_CTX_start(ctx);
++    tmp = BN_CTX_get(ctx);
++    if (tmp == NULL)
++        goto end;
++
++    ERR_set_mark();
++    BN_set_flags(a, BN_FLG_CONSTTIME);
++    ret = (BN_mod_inverse(tmp, a, b, ctx) != NULL);
++    /* Clear any errors (an error is returned if there is no inverse) */
++    ERR_pop_to_mark();
++end:
++    BN_CTX_end(ctx);
++    return ret;
++}
++
+ /*-
+  * This function is based on the constant-time GCD work by Bernstein and Yang:
+  * https://eprint.iacr.org/2019/266
+diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
+index 62d8685..55efaf2 100644
+--- a/crypto/bn/bn_rsa_fips186_4.c
++++ b/crypto/bn/bn_rsa_fips186_4.c
+@@ -286,14 +286,20 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM *Xin,
+             goto err;
+     }
+ 
++    /*
++     * (Step 1) GCD(2r1, r2) = 1.
++     *    Note: This algorithm was doing a gcd(2r1, r2)=1 test before doing an
++     *    mod_inverse(2r1, r2) which are effectively the same operation.
++     *    (The algorithm assumed that the gcd test would be faster). Since the
++     *    mod_inverse is currently faster than calling the constant time
++     *    BN_gcd(), the call to BN_gcd() has been omitted. The inverse result
++     *    is used further down.
++     */
+     if (!(BN_lshift1(r1x2, r1)
+-            /* (Step 1) GCD(2r1, r2) = 1 */
+-            && BN_gcd(tmp, r1x2, r2, ctx)
+-            && BN_is_one(tmp)
++            && (BN_mod_inverse(tmp, r1x2, r2, ctx) != NULL)
+             /* (Step 2) R = ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod r2)*2r1) */
+-            && BN_mod_inverse(R, r2, r1x2, ctx)
++            && (BN_mod_inverse(R, r2, r1x2, ctx) != NULL)
+             && BN_mul(R, R, r2, ctx) /* R = (r2^-1 mod 2r1) * r2 */
+-            && BN_mod_inverse(tmp, r1x2, r2, ctx)
+             && BN_mul(tmp, tmp, r1x2, ctx) /* tmp = (2r1^-1 mod r2)*2r1 */
+             && BN_sub(R, R, tmp)
+             /* Calculate 2r1r2 */
+@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM *Xin,
+ 
+     /*
+      * In FIPS 186-4 imax was set to 5 * nlen/2.
+-     * Analysis by Allen Roginsky (See https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/final/documents/comments-received-fips186-4-december-2015.pdf
++     * Analysis by Allen Roginsky
++     * (See https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/final/documents/comments-received-fips186-4-december-2015.pdf
+      * page 68) indicates this has a 1 in 2 million chance of failure.
+      * The number has been updated to 20 * nlen/2 as used in
+      * FIPS186-5 Appendix B.9 Step 9.
+@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM *Xin,
+ 
+             /* (Step 7) If GCD(Y-1) == 1 & Y is probably prime then return Y */
+             if (BN_copy(y1, Y) == NULL
+-                    || !BN_sub_word(y1, 1)
+-                    || !BN_gcd(tmp, y1, e, ctx))
++                    || !BN_sub_word(y1, 1))
+                 goto err;
+-            if (BN_is_one(tmp)) {
++            if (BN_are_coprime(y1, e, ctx)) {
+                 int rv = BN_check_prime(Y, ctx, cb);
+ 
+                 if (rv > 0)
+diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod
+index f302818..e9ddf8f 100644
+--- a/doc/man3/BN_cmp.pod
++++ b/doc/man3/BN_cmp.pod
+@@ -2,7 +2,8 @@
+ 
+ =head1 NAME
+ 
+-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_is_odd - BIGNUM comparison and test functions
++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_is_odd, BN_are_coprime
++- BIGNUM comparison and test functions
+ 
+ =head1 SYNOPSIS
+ 
+@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_is_odd -
+  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
+  int BN_is_odd(const BIGNUM *a);
+ 
++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
++
+ =head1 DESCRIPTION
+ 
+ BN_cmp() compares the numbers I<a> and I<b>. BN_ucmp() compares their
+@@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and BN_abs_is_word() test if
+ I<a> equals 0, 1, I<w>, or E<verbar>I<w>E<verbar> respectively.
+ BN_is_odd() tests if I<a> is odd.
+ 
++BN_are_coprime() determines if B<a> and B<b> are coprime.
++B<ctx> is used internally for storing temporary variables.
++The values of B<a> and B<b> and B<ctx> must not be NULL.
++
+ =head1 RETURN VALUES
+ 
+ BN_cmp() returns -1 if I<a> E<lt> I<b>, 0 if I<a> == I<b> and 1 if
+@@ -35,11 +42,16 @@ of I<a> and I<b>.
+ BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
+ BN_is_odd() return 1 if the condition is true, 0 otherwise.
+ 
++BN_are_coprime() returns 1 if the B<BIGNUM>'s are coprime, otherwise it
++returns 0.
++
+ =head1 HISTORY
+ 
+ Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
+ BN_abs_is_word() and BN_is_odd() were macros.
+ 
++The function BN_are_coprime() was added in OpenSSL 3.1.
++
+ =head1 COPYRIGHT
+ 
+ Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved.
+diff --git a/include/openssl/bn.h b/include/openssl/bn.h
+index ecd7f01..73895a5 100644
+--- a/include/openssl/bn.h
++++ b/include/openssl/bn.h
+@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
+ int BN_kronecker(const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx); /* returns
+                                                                   * -2 for
+                                                                   * error */
++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
+ BIGNUM *BN_mod_inverse(BIGNUM *ret,
+                        const BIGNUM *a, const BIGNUM *n, BN_CTX *ctx);
+ BIGNUM *BN_mod_sqrt(BIGNUM *ret,
+diff --git a/test/bntest.c b/test/bntest.c
+index c5894c1..eec6222 100644
+--- a/test/bntest.c
++++ b/test/bntest.c
+@@ -38,6 +38,7 @@ typedef struct mpitest_st {
+ 
+ static const int NUM0 = 100;           /* number of tests */
+ static const int NUM1 = 50;            /* additional tests for some functions */
++static const int NUM_PRIME_TESTS = 20;
+ static BN_CTX *ctx;
+ 
+ /*
+@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
+     return st;
+ }
+ 
++static int test_coprime(void)
++{
++    BIGNUM *a = NULL, *b = NULL;
++    int ret = 0;
++
++    ret = TEST_ptr(a = BN_new())
++          && TEST_ptr(b = BN_new())
++          && TEST_true(BN_set_word(a, 66))
++          && TEST_true(BN_set_word(b, 99))
++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
++          && TEST_true(BN_set_word(a, 67))
++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
++    BN_free(a);
++    BN_free(b);
++    return ret;
++}
++
+ static int test_gcd_prime(void)
+ {
+     BIGNUM *a = NULL, *b = NULL, *gcd = NULL;
+@@ -2585,11 +2605,12 @@ static int test_gcd_prime(void)
+ 
+     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL)))
+             goto err;
+-    for (i = 0; i < NUM0; i++) {
++    for (i = 0; i < NUM_PRIME_TESTS; i++) {
+         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
+                                             NULL, NULL, NULL))
+                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
+-                || !TEST_true(BN_is_one(gcd)))
++                || !TEST_true(BN_is_one(gcd))
++                || !TEST_true(BN_are_coprime(a, b, ctx)))
+             goto err;
+     }
+ 
+@@ -3066,6 +3087,7 @@ int setup_tests(void)
+         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
+         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
+         ADD_TEST(test_gcd_prime);
++        ADD_TEST(test_coprime);
+         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
+         ADD_ALL_TESTS(test_mod_exp_consttime, (int)OSSL_NELEM(ModExpTests));
+         ADD_TEST(test_mod_exp2_mont);
+diff --git a/util/libcrypto.num b/util/libcrypto.num
+index 0f6f30b..a1d1ed9 100644
+--- a/util/libcrypto.num
++++ b/util/libcrypto.num
+@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556	3_0_3	EXIST::FUNCTION:
+ OPENSSL_strncasecmp                     5557	3_0_3	EXIST::FUNCTION:
+ OSSL_CMP_CTX_reset_geninfo_ITAVs        5558	3_0_8	EXIST::FUNCTION:CMP
+ OSSL_CMP_MSG_update_recipNonce          5559	3_0_9	EXIST::FUNCTION:CMP
++BN_are_coprime                          5560	3_0_0	EXIST::FUNCTION:
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keygen-performance.patch
new file mode 100644
index 0000000000..1a6b601f65
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keygen-performance.patch
@@ -0,0 +1,185 @@
+From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00 2001
+From: slontis <shane.lontis@oracle.com>
+Date: Wed, 2 Nov 2022 13:20:55 +1000
+Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
+
+Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
+The old code was using a fixed value of 64.
+
+Reviewed-by: Paul Dale <pauli@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/19579)
+
+(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3a45c9df61]
+
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+---
+ crypto/bn/bn_prime.c         | 11 ++++++++
+ crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++------
+ include/crypto/bn.h          |  2 ++
+ 3 files changed, 54 insertions(+), 8 deletions(-)
+
+diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c
+index ddd31a0..79776f1 100644
+--- a/crypto/bn/bn_prime.c
++++ b/crypto/bn/bn_prime.c
+@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int checks, BN_CTX *ctx,
+     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
+ }
+ 
++/*
++ * Use this only for key generation.
++ * It always uses trial division. The number of checks
++ * (MR rounds) passed in is used without being clamped to a minimum value.
++ */
++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *ctx,
++                                  BN_GENCB *cb)
++{
++    return bn_is_prime_int(w, checks, ctx, 1, cb);
++}
++
+ int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)
+ {
+     return ossl_bn_check_prime(p, 0, ctx, 1, cb);
+diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
+index 55efaf2..c3466df 100644
+--- a/crypto/bn/bn_rsa_fips186_4.c
++++ b/crypto/bn/bn_rsa_fips186_4.c
+@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 = {
+     BN_FLG_STATIC_DATA
+ };
+ 
++/*
++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
++ */
++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits)
++{
++    if (nbits >= 4096)
++        return 44;
++    if (nbits >= 3072)
++        return 41;
++    if (nbits >= 2048)
++        return 38;
++    return 0; /* Error */
++}
++
++/*
++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
++ * required for generation of RSA primes (p and q)
++ */
++static int bn_rsa_fips186_5_prime_MR_rounds(int nbits)
++{
++    if (nbits >= 3072)
++        return 4;
++    if (nbits >= 2048)
++        return 5;
++    return 0; /* Error */
++}
++
+ /*
+  * FIPS 186-5 Table A.1. "Min length of auxiliary primes p1, p2, q1, q2".
+  * (FIPS 186-5 has an entry for >= 4096 bits).
+@@ -97,11 +125,13 @@ static int bn_rsa_fips186_5_aux_prime_max_sum_size_for_prob_primes(int nbits)
+  *     Xp1 The passed in starting point to find a probably prime.
+  *     p1 The returned probable prime (first odd integer >= Xp1)
+  *     ctx A BN_CTX object.
++ *     rounds The number of Miller Rabin rounds
+  *     cb An optional BIGNUM callback.
+  * Returns: 1 on success otherwise it returns 0.
+  */
+ static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
+                                                 BIGNUM *p1, BN_CTX *ctx,
++                                                int rounds,
+                                                 BN_GENCB *cb)
+ {
+     int ret = 0;
+@@ -117,7 +147,7 @@ static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
+         i++;
+         BN_GENCB_call(cb, 0, i);
+         /* MR test with trial division */
+-        tmp = BN_check_prime(p1, ctx, cb);
++        tmp = ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
+         if (tmp > 0)
+             break;
+         if (tmp < 0)
+@@ -160,7 +190,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p, BIGNUM *Xpout,
+ {
+     int ret = 0;
+     BIGNUM *p1i = NULL, *p2i = NULL, *Xp1i = NULL, *Xp2i = NULL;
+-    int bitlen;
++    int bitlen, rounds;
+ 
+     if (p == NULL || Xpout == NULL)
+         return 0;
+@@ -177,6 +207,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p, BIGNUM *Xpout,
+     bitlen = bn_rsa_fips186_5_aux_prime_min_size(nlen);
+     if (bitlen == 0)
+         goto err;
++    rounds = bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
+ 
+     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in */
+     if (Xp1 == NULL) {
+@@ -194,8 +225,8 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p, BIGNUM *Xpout,
+     }
+ 
+     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
+-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
+-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, cb))
++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds, cb)
++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, rounds, cb))
+         goto err;
+     /* (Table B.1) auxiliary prime Max length check */
+     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) >=
+@@ -243,11 +274,11 @@ err:
+  */
+ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM *Xin,
+                                        const BIGNUM *r1, const BIGNUM *r2,
+-                                       int nlen, const BIGNUM *e, BN_CTX *ctx,
+-                                       BN_GENCB *cb)
++                                       int nlen, const BIGNUM *e,
++                                       BN_CTX *ctx, BN_GENCB *cb)
+ {
+     int ret = 0;
+-    int i, imax;
++    int i, imax, rounds;
+     int bits = nlen >> 1;
+     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
+     BIGNUM *base, *range;
+@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM *Xin,
+      * The number has been updated to 20 * nlen/2 as used in
+      * FIPS186-5 Appendix B.9 Step 9.
+      */
++    rounds = bn_rsa_fips186_5_prime_MR_rounds(nlen);
+     imax = 20 * bits; /* max = 20/2 * nbits */
+     for (;;) {
+         if (Xin == NULL) {
+@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM *Xin,
+             if (BN_copy(y1, Y) == NULL
+                     || !BN_sub_word(y1, 1))
+                 goto err;
++
+             if (BN_are_coprime(y1, e, ctx)) {
+-                int rv = BN_check_prime(Y, ctx, cb);
++                int rv = ossl_bn_check_generated_prime(Y, rounds, ctx, cb);
+ 
+                 if (rv > 0)
+                     goto end;
+diff --git a/include/crypto/bn.h b/include/crypto/bn.h
+index fd1c09d..00544d9 100644
+--- a/include/crypto/bn.h
++++ b/include/crypto/bn.h
+@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem, const BIGNUM *m,
+ 
+ int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, BN_CTX *ctx,
+                                   BN_GENCB *cb, int enhanced, int *status);
++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *ctx,
++                                  BN_GENCB *cb);
+ 
+ const BIGNUM *ossl_bn_get0_small_factors(void);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index 5e43fdc2de..5b09493ccd 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://0001-Improve-FIPS-RSA-keygen-performance.patch \
+           file://0002-Improve-FIPS-RSA-keygen-performance.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


