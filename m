Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493ADC25B4F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:53:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.20190.1714395215925701862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 05:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z53ZQgmP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso26004905ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714395215; x=1715000015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=At+N7/4QxIiXkj4z8N98XhP/SinVIByu5CaKh2alCks=;
        b=z53ZQgmPFvbE8M183Jy91yOYhGFpgv9Fb9tceXbbDqVWDs6xN8LGrD8IMhSMTBOcQ4
         w00PctNG2/paHpWfybTsZpEz2crvrBqMmKAnC5SsYCrw1ZSPyZMOKl33Vg0gLb9bgdR7
         znOpZGF324bMdQjI6jwXNVsrW03TewH1He0WAbWQlaBHGXWMG2RUvt6c54HPZUKdzcio
         tnK/6gh71tfzmAjvTBlblgmSRL7j0PXfpb48hYtLYmLGOyjB2lzqQIdZWTLjdv0UOXn2
         H8tM7eIfKwb762sZsFEqGXb/Vl7yr8gwx/O33VOubPVco0mkII7U6790pPou4bc3gdTu
         DvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395215; x=1715000015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=At+N7/4QxIiXkj4z8N98XhP/SinVIByu5CaKh2alCks=;
        b=cGhs9TzWZnVC3Qv6buaaPePj8am1T8Vp1E8/Ixq6WNi93TSS40OEf6rY9dzn6wZQC0
         waa/dOm1WAkI3tN+OAPNfYQsgmcbHyav0JD/LhLvk/agKVdEwfY9s5KYkfnVxodpuJv5
         I0QQH6tNq5KPc1PW914cTg8moU8tkxECYwD9XKQD/V2841aJmkFzXnc/KT7iE4pyiUd+
         ByTuaAZkoFE8U1lsQ8x61SlXRsy43SPbuxTNRHdwoBPP6j/qcxFatby2OMbZHXcLT5uM
         zCWZNqqTEEgfuNXydjQjdJqQV/c0u8Th+DlfAp19A0OfqRoaImDKz4RSLxBJ8kGn29hc
         xJLA==
X-Gm-Message-State: AOJu0YztABX4u/cyl2dSObLZqarNddN+n3/aBVayyfCQRkVUH88g15BC
	gny5Zn2Lfrym+HUBM8B3zC6Dq478Hg21sZLlkGItNN+Cvn1D8D5hjr2Atp/g3xdutHRnIc4fswa
	x9u0rfg==
X-Google-Smtp-Source: AGHT+IEJdDbXzkRbiU6hdZosWlglbho6RVHjCimeN/tD82wKzkkSy/6kOSutXHIlZT65S57kejFp0Q==
X-Received: by 2002:a17:902:784f:b0:1e2:a31e:2062 with SMTP id e15-20020a170902784f00b001e2a31e2062mr10230710pln.53.1714395214856;
        Mon, 29 Apr 2024 05:53:34 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902704800b001e868e29fabsm20184399plt.251.2024.04.29.05.53.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:53:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] gnutls: fix CVE-2024-28834
Date: Mon, 29 Apr 2024 05:53:21 -0700
Message-Id: <18c4f65934331da48c597201c33334578e91a45d.1714394934.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714394934.git.steve@sakoman.com>
References: <cover.1714394934.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 12:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198738

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in GnuTLS. The Minerva attack is a cryptographic vulnerability
that exploits deterministic behavior in systems like GnuTLS, leading to
side-channel leaks. In specific scenarios, such as when using the
GNUTLS_PRIVKEY_FLAG_REPRODUCIBLE flag, it can result in a noticeable step in
nonce size from 513 to 512 bits, exposing a potential timing side-channel.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2024-28834.patch        | 457 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 2 files changed, 458 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-28834.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-28834.patch b/meta/recipes-support/gnutls/gnutls/CVE-2024-28834.patch
new file mode 100644
index 0000000000..6c06fc2782
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-28834.patch
@@ -0,0 +1,457 @@
+From 1c4701ffc342259fc5965d5a0de90d87f780e3e5 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 12 Jan 2024 17:56:58 +0900
+Subject: [PATCH] nettle: avoid normalization of mpz_t in deterministic ECDSA
+
+This removes function calls that potentially leak bit-length of a
+private key used to calculate a nonce in deterministic ECDSA.  Namely:
+
+- _gnutls_dsa_compute_k has been rewritten to work on always
+  zero-padded mp_limb_t arrays instead of mpz_t
+- rnd_mpz_func has been replaced with rnd_datum_func, which is backed
+  by a byte array instead of an mpz_t value
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2024-28834
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1c4701ffc342259fc5965d5a0de90d87f780e3e5]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/nettle/int/dsa-compute-k.c    | 86 ++++++++++++++++++++-----------
+ lib/nettle/int/dsa-compute-k.h    | 32 +++++++++---
+ lib/nettle/int/ecdsa-compute-k.c  | 32 +++---------
+ lib/nettle/int/ecdsa-compute-k.h  |  8 +--
+ lib/nettle/pk.c                   | 78 +++++++++++++++++++---------
+ tests/sign-verify-deterministic.c |  2 +-
+ 6 files changed, 141 insertions(+), 97 deletions(-)
+
+diff --git a/lib/nettle/int/dsa-compute-k.c b/lib/nettle/int/dsa-compute-k.c
+index 3f5105a..f937693 100644
+--- a/lib/nettle/int/dsa-compute-k.c
++++ b/lib/nettle/int/dsa-compute-k.c
+@@ -31,33 +31,39 @@
+ #include "mpn-base256.h"
+ #include <string.h>
+
+-#define BITS_TO_LIMBS(bits) (((bits) + GMP_NUMB_BITS - 1) / GMP_NUMB_BITS)
+-
+-/* The maximum size of q, chosen from the fact that we support
+- * 521-bit elliptic curve generator and 512-bit DSA subgroup at
+- * maximum. */
+-#define MAX_Q_BITS 521
+-#define MAX_Q_SIZE ((MAX_Q_BITS + 7) / 8)
+-#define MAX_Q_LIMBS BITS_TO_LIMBS(MAX_Q_BITS)
+-
+-#define MAX_HASH_BITS (MAX_HASH_SIZE * 8)
+-#define MAX_HASH_LIMBS BITS_TO_LIMBS(MAX_HASH_BITS)
+-
+-int
+-_gnutls_dsa_compute_k(mpz_t k,
+-		      const mpz_t q,
+-		      const mpz_t x,
+-		      gnutls_mac_algorithm_t mac,
+-		      const uint8_t *digest,
+-		      size_t length)
++/* For mini-gmp */
++#ifndef GMP_LIMB_BITS
++#define GMP_LIMB_BITS GMP_NUMB_BITS
++#endif
++
++static inline int is_zero_limb(mp_limb_t x)
++{
++	x |= (x << 1);
++	return ((x >> 1) - 1) >> (GMP_LIMB_BITS - 1);
++}
++
++static int sec_zero_p(const mp_limb_t *ap, mp_size_t n)
++{
++	volatile mp_limb_t w;
++	mp_size_t i;
++
++	for (i = 0, w = 0; i < n; i++)
++		w |= ap[i];
++
++
++	return is_zero_limb(w);
++}
++
++int _gnutls_dsa_compute_k(mp_limb_t *h, const mp_limb_t *q, const mp_limb_t *x,
++			  mp_size_t qn, mp_bitcnt_t q_bits,
++		          gnutls_mac_algorithm_t mac,
++		          const uint8_t *digest,
++		          size_t length)
+ {
+	uint8_t V[MAX_HASH_SIZE];
+	uint8_t K[MAX_HASH_SIZE];
+	uint8_t xp[MAX_Q_SIZE];
+	uint8_t tp[MAX_Q_SIZE];
+-	mp_limb_t h[MAX(MAX_Q_LIMBS, MAX_HASH_LIMBS)];
+-	mp_bitcnt_t q_bits = mpz_sizeinbase (q, 2);
+-	mp_size_t qn = mpz_size(q);
+	mp_bitcnt_t h_bits = length * 8;
+	mp_size_t hn = BITS_TO_LIMBS(h_bits);
+	size_t nbytes = (q_bits + 7) / 8;
+@@ -66,6 +72,7 @@ _gnutls_dsa_compute_k(mpz_t k,
+	mp_limb_t cy;
+	gnutls_hmac_hd_t hd;
+	int ret = 0;
++	mp_limb_t scratch[MAX_Q_LIMBS];
+
+	if (unlikely(q_bits > MAX_Q_BITS))
+		return gnutls_assert_val(GNUTLS_E_INVALID_REQUEST);
+@@ -73,7 +80,7 @@ _gnutls_dsa_compute_k(mpz_t k,
+		return gnutls_assert_val(GNUTLS_E_INVALID_REQUEST);
+
+	/* int2octets(x) */
+-	mpn_get_base256(xp, nbytes, mpz_limbs_read(x), qn);
++	mpn_get_base256(xp, nbytes, x, qn);
+
+	/* bits2octets(h) */
+	mpn_set_base256(h, hn, digest, length);
+@@ -97,12 +104,12 @@ _gnutls_dsa_compute_k(mpz_t k,
+			mpn_rshift(h, h, hn, shift % GMP_NUMB_BITS);
+	}
+
+-	cy = mpn_sub_n(h, h, mpz_limbs_read(q), qn);
++	cy = mpn_sub_n(h, h, q, qn);
+	/* Fall back to addmul_1, if nettle is linked with mini-gmp. */
+ #ifdef mpn_cnd_add_n
+-	mpn_cnd_add_n(cy, h, h, mpz_limbs_read(q), qn);
++	mpn_cnd_add_n(cy, h, h, q, qn);
+ #else
+-	mpn_addmul_1(h, mpz_limbs_read(q), qn, cy != 0);
++	mpn_addmul_1(h, q, qn, cy != 0);
+ #endif
+	mpn_get_base256(tp, nbytes, h, qn);
+
+@@ -178,12 +185,8 @@ _gnutls_dsa_compute_k(mpz_t k,
+		if (tlen * 8 > q_bits)
+			mpn_rshift (h, h, qn, tlen * 8 - q_bits);
+		/* Check if k is in [1,q-1] */
+-		if (!mpn_zero_p (h, qn) &&
+-		    mpn_cmp (h, mpz_limbs_read(q), qn) < 0) {
+-			mpn_copyi(mpz_limbs_write(k, qn), h, qn);
+-			mpz_limbs_finish(k, qn);
++		if (!sec_zero_p(h, qn) && mpn_sub_n(scratch, h, q, qn))
+			break;
+-		}
+
+		ret = gnutls_hmac_init(&hd, mac, K, length);
+		if (ret < 0)
+@@ -207,3 +210,24 @@ _gnutls_dsa_compute_k(mpz_t k,
+
+	return ret;
+ }
++
++/* cancel-out dsa_sign's addition of 1 to random data */
++void _gnutls_dsa_compute_k_finish(uint8_t *k, size_t nbytes, mp_limb_t *h,
++				  mp_size_t n)
++{
++	/* Fall back to sub_1, if nettle is linked with mini-gmp. */
++#ifdef mpn_sec_sub_1
++	mp_limb_t t[MAX_Q_LIMBS];
++
++	mpn_sec_sub_1(h, h, n, 1, t);
++#else
++	mpn_sub_1(h, h, n, 1);
++#endif
++	mpn_get_base256(k, nbytes, h, n);
++}
++
++void _gnutls_ecdsa_compute_k_finish(uint8_t *k, size_t nbytes, mp_limb_t *h,
++				    mp_size_t n)
++{
++	mpn_get_base256(k, nbytes, h, n);
++}
+diff --git a/lib/nettle/int/dsa-compute-k.h b/lib/nettle/int/dsa-compute-k.h
+index 64e90e0..778c484 100644
+--- a/lib/nettle/int/dsa-compute-k.h
++++ b/lib/nettle/int/dsa-compute-k.h
+@@ -26,12 +26,30 @@
+ #include <gnutls/gnutls.h>
+ #include <nettle/bignum.h> /* includes gmp.h */
+
+-int
+-_gnutls_dsa_compute_k(mpz_t k,
+-		      const mpz_t q,
+-		      const mpz_t x,
+-		      gnutls_mac_algorithm_t mac,
+-		      const uint8_t *digest,
+-		      size_t length);
++#define BITS_TO_LIMBS(bits) (((bits) + GMP_NUMB_BITS - 1) / GMP_NUMB_BITS)
++
++/* The maximum size of q, chosen from the fact that we support
++ * 521-bit elliptic curve generator and 512-bit DSA subgroup at
++ * maximum. */
++#define MAX_Q_BITS 521
++#define MAX_Q_SIZE ((MAX_Q_BITS + 7) / 8)
++#define MAX_Q_LIMBS BITS_TO_LIMBS(MAX_Q_BITS)
++
++#define MAX_HASH_BITS (MAX_HASH_SIZE * 8)
++#define MAX_HASH_LIMBS BITS_TO_LIMBS(MAX_HASH_BITS)
++
++#define DSA_COMPUTE_K_ITCH MAX(MAX_Q_LIMBS, MAX_HASH_LIMBS)
++
++int _gnutls_dsa_compute_k(mp_limb_t *h, const mp_limb_t *q, const mp_limb_t *x,
++			  mp_size_t qn, mp_bitcnt_t q_bits,
++                          gnutls_mac_algorithm_t mac,
++		          const uint8_t *digest,
++		          size_t length);
++
++void _gnutls_dsa_compute_k_finish(uint8_t *k, size_t nbytes, mp_limb_t *h,
++				  mp_size_t n);
++
++void _gnutls_ecdsa_compute_k_finish(uint8_t *k, size_t nbytes, mp_limb_t *h,
++				    mp_size_t n);
+
+ #endif /* GNUTLS_LIB_NETTLE_INT_DSA_COMPUTE_K_H */
+diff --git a/lib/nettle/int/ecdsa-compute-k.c b/lib/nettle/int/ecdsa-compute-k.c
+index 94914eb..fc3b2ba 100644
+--- a/lib/nettle/int/ecdsa-compute-k.c
++++ b/lib/nettle/int/ecdsa-compute-k.c
+@@ -29,39 +29,38 @@
+ #include "dsa-compute-k.h"
+ #include "gnutls_int.h"
+
+-static inline int
+-_gnutls_ecc_curve_to_dsa_q(mpz_t *q, gnutls_ecc_curve_t curve)
++int _gnutls_ecc_curve_to_dsa_q(mpz_t q, gnutls_ecc_curve_t curve)
+ {
+	switch (curve) {
+ #ifdef ENABLE_NON_SUITEB_CURVES
+	case GNUTLS_ECC_CURVE_SECP192R1:
+-		mpz_init_set_str(*q,
++		mpz_init_set_str(q,
+				 "FFFFFFFFFFFFFFFFFFFFFFFF99DEF836"
+				 "146BC9B1B4D22831",
+				 16);
+		return 0;
+	case GNUTLS_ECC_CURVE_SECP224R1:
+-		mpz_init_set_str(*q,
++		mpz_init_set_str(q,
+				 "FFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2"
+				 "E0B8F03E13DD29455C5C2A3D",
+				 16);
+		return 0;
+ #endif
+	case GNUTLS_ECC_CURVE_SECP256R1:
+-		mpz_init_set_str(*q,
++		mpz_init_set_str(q,
+				 "FFFFFFFF00000000FFFFFFFFFFFFFFFF"
+				 "BCE6FAADA7179E84F3B9CAC2FC632551",
+				 16);
+		return 0;
+	case GNUTLS_ECC_CURVE_SECP384R1:
+-		mpz_init_set_str(*q,
++		mpz_init_set_str(q,
+				 "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
+				 "FFFFFFFFFFFFFFFFC7634D81F4372DDF"
+				 "581A0DB248B0A77AECEC196ACCC52973",
+				 16);
+		return 0;
+	case GNUTLS_ECC_CURVE_SECP521R1:
+-		mpz_init_set_str(*q,
++		mpz_init_set_str(q,
+				 "1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
+				 "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
+				 "FFA51868783BF2F966B7FCC0148F709A"
+@@ -74,22 +73,3 @@ _gnutls_ecc_curve_to_dsa_q(mpz_t *q, gnutls_ecc_curve_t curve)
+	}
+ }
+
+-int
+-_gnutls_ecdsa_compute_k (mpz_t k,
+-			 gnutls_ecc_curve_t curve,
+-			 const mpz_t x,
+-			 gnutls_mac_algorithm_t mac,
+-			 const uint8_t *digest,
+-			 size_t length)
+-{
+-	mpz_t q;
+-	int ret;
+-
+-	ret = _gnutls_ecc_curve_to_dsa_q(&q, curve);
+-	if (ret < 0)
+-		return gnutls_assert_val(ret);
+-
+-	ret = _gnutls_dsa_compute_k (k, q, x, mac, digest, length);
+-	mpz_clear(q);
+-	return ret;
+-}
+diff --git a/lib/nettle/int/ecdsa-compute-k.h b/lib/nettle/int/ecdsa-compute-k.h
+index 7ca401d..a7e612b 100644
+--- a/lib/nettle/int/ecdsa-compute-k.h
++++ b/lib/nettle/int/ecdsa-compute-k.h
+@@ -26,12 +26,6 @@
+ #include <gnutls/gnutls.h>
+ #include <nettle/bignum.h> /* includes gmp.h */
+
+-int
+-_gnutls_ecdsa_compute_k (mpz_t k,
+-			 gnutls_ecc_curve_t curve,
+-			 const mpz_t x,
+-			 gnutls_mac_algorithm_t mac,
+-			 const uint8_t *digest,
+-			 size_t length);
++int _gnutls_ecc_curve_to_dsa_q(mpz_t q, gnutls_ecc_curve_t curve);
+
+ #endif /* GNUTLS_LIB_NETTLE_INT_ECDSA_COMPUTE_K_H */
+diff --git a/lib/nettle/pk.c b/lib/nettle/pk.c
+index eba246f..799cc9d 100644
+--- a/lib/nettle/pk.c
++++ b/lib/nettle/pk.c
+@@ -97,10 +97,16 @@ static void rnd_nonce_func(void *_ctx, size_t length, uint8_t * data)
+	}
+ }
+
+-static void rnd_mpz_func(void *_ctx, size_t length, uint8_t * data)
++static void rnd_datum_func(void *ctx, size_t length, uint8_t *data)
+ {
+-	mpz_t *k = _ctx;
+-	nettle_mpz_get_str_256 (length, data, *k);
++	gnutls_datum_t *d = ctx;
++
++	if (length > d->size) {
++		memset(data, 0, length - d->size);
++		memcpy(data + (length - d->size), d->data, d->size);
++	} else {
++		memcpy(data, d->data, length);
++	}
+ }
+
+ static void rnd_nonce_func_fallback(void *_ctx, size_t length, uint8_t * data)
+@@ -1076,7 +1082,11 @@ _wrap_nettle_pk_sign(gnutls_pk_algorithm_t algo,
+			struct dsa_signature sig;
+			int curve_id = pk_params->curve;
+			const struct ecc_curve *curve;
+-			mpz_t k;
++			mpz_t q;
++	                /* 521-bit elliptic curve generator at maximum */
++                        uint8_t buf[(521 + 7) / 8];
++		        gnutls_datum_t k = { NULL, 0 };
++
+			void *random_ctx;
+			nettle_random_func *random_func;
+
+@@ -1123,19 +1133,31 @@ _wrap_nettle_pk_sign(gnutls_pk_algorithm_t algo,
+				hash_len = vdata->size;
+			}
+
+-			mpz_init(k);
++			mpz_init(q);
++
+			if (_gnutls_get_lib_state() == LIB_STATE_SELFTEST ||
+			    (sign_params->flags & GNUTLS_PK_FLAG_REPRODUCIBLE)) {
+-				ret = _gnutls_ecdsa_compute_k(k,
+-							      curve_id,
+-							      pk_params->params[ECC_K],
+-							      DIG_TO_MAC(sign_params->dsa_dig),
+-							      vdata->data,
+-							      vdata->size);
++				mp_limb_t h[DSA_COMPUTE_K_ITCH];
++
++		                ret = _gnutls_ecc_curve_to_dsa_q(q, curve_id);
+				if (ret < 0)
+					goto ecdsa_cleanup;
++
++				ret = _gnutls_dsa_compute_k(
++					h, mpz_limbs_read(q), priv.p,
++				        ecc_size(priv.ecc), ecc_bit_size(priv.ecc),
++				        DIG_TO_MAC(sign_params->dsa_dig), vdata->data,
++			                vdata->size);
++				if (ret < 0)
++					goto ecdsa_cleanup;
++				k.data = buf;
++				k.size = (ecc_bit_size(priv.ecc) + 7) / 8;
++
++				_gnutls_ecdsa_compute_k_finish(k.data, k.size, h,
++						       ecc_size(priv.ecc));
++
+				random_ctx = &k;
+-				random_func = rnd_mpz_func;
++				random_func = rnd_datum_func;
+			} else {
+				random_ctx = NULL;
+				random_func = rnd_nonce_func;
+@@ -1156,7 +1178,7 @@ _wrap_nettle_pk_sign(gnutls_pk_algorithm_t algo,
+  ecdsa_cleanup:
+			dsa_signature_clear(&sig);
+			ecc_scalar_zclear(&priv);
+-			mpz_clear(k);
++			mpz_clear(q);
+
+			if (ret < 0) {
+				gnutls_assert();
+@@ -1169,7 +1191,10 @@ _wrap_nettle_pk_sign(gnutls_pk_algorithm_t algo,
+			struct dsa_params pub;
+			bigint_t priv;
+			struct dsa_signature sig;
+-			mpz_t k;
++			/* 512-bit DSA subgroup at maximum */
++		        uint8_t buf[(512 + 7) / 8];
++	                gnutls_datum_t k = { NULL, 0 };
++
+			void *random_ctx;
+			nettle_random_func *random_func;
+
+@@ -1196,21 +1221,25 @@ _wrap_nettle_pk_sign(gnutls_pk_algorithm_t algo,
+				hash_len = vdata->size;
+			}
+
+-			mpz_init(k);
+			if (_gnutls_get_lib_state() == LIB_STATE_SELFTEST ||
+			    (sign_params->flags & GNUTLS_PK_FLAG_REPRODUCIBLE)) {
+-				ret = _gnutls_dsa_compute_k(k,
+-							    pub.q,
+-							    TOMPZ(priv),
+-							    DIG_TO_MAC(sign_params->dsa_dig),
+-							    vdata->data,
+-							    vdata->size);
++				mp_limb_t h[DSA_COMPUTE_K_ITCH];
++				ret = _gnutls_dsa_compute_k(
++					h, mpz_limbs_read(pub.q),
++					mpz_limbs_read(TOMPZ(priv)), mpz_size(pub.q),
++				       	mpz_sizeinbase(pub.q, 2),
++				       	DIG_TO_MAC(sign_params->dsa_dig), vdata->data,
++				       	vdata->size);
+				if (ret < 0)
+					goto dsa_fail;
+-				/* cancel-out dsa_sign's addition of 1 to random data */
+-				mpz_sub_ui (k, k, 1);
++				k.data = buf;
++				k.size = (mpz_sizeinbase(pub.q, 2) + 7) / 8;
++
++				_gnutls_dsa_compute_k_finish(k.data, k.size, h,
++							     mpz_size(pub.q));
++
+				random_ctx = &k;
+-				random_func = rnd_mpz_func;
++				random_func = rnd_datum_func;
+			} else {
+				random_ctx = NULL;
+				random_func = rnd_nonce_func;
+@@ -1230,7 +1259,6 @@ _wrap_nettle_pk_sign(gnutls_pk_algorithm_t algo,
+
+  dsa_fail:
+			dsa_signature_clear(&sig);
+-			mpz_clear(k);
+
+			if (ret < 0) {
+				gnutls_assert();
+diff --git a/tests/sign-verify-deterministic.c b/tests/sign-verify-deterministic.c
+index 6e90728..25aa553 100644
+--- a/tests/sign-verify-deterministic.c
++++ b/tests/sign-verify-deterministic.c
+@@ -197,7 +197,7 @@ void doit(void)
+					      &signature);
+		if (ret < 0)
+			testfail("gnutls_pubkey_verify_data2\n");
+-		success(" - pass");
++		success(" - pass\n");
+
+	next:
+		gnutls_free(signature.data);
+--
+2.40.0
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index b290022781..3c4ecc4f59 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2023-5981.patch \
            file://CVE-2024-0553.patch \
            file://CVE-2024-0567.patch \
+           file://CVE-2024-28834.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.34.1


