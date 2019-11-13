Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9C97F7B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:33 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k13so1605297pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=9yJZz5jFaCc5PyME2l6WH3wOLTcWJMzOM+3Iyxk4YC0=;
	b=KM8P7XV3uA+bR70bjUwIv9QptJ5GGeltF1NiQMoHgXGCsO5wbiu5SGrJv7L6F6WZDq
	pmTF86DzHRi2RQ/IMcyX2FBoszIorZALoc+ORRpHeCWeedlMJs9NyLHVc/vE1BnrXy5X
	Oi6eE6bkakyfHXWFAG9caXIfqTCPZCY0OnTAWmivs1Nr9NM1DWGQCrRVRGcucx3CZb/f
	hgTFiehZJO+Zo97csNWzPKI2ZQCrgL/GCunsS8C0dt/rgV92B6/DcUMu84M27XkaAclp
	fV51aHY24mfUufpVc7Ej3TSo6YNy0+fV1KdCs+7YfkOuO6pwqo0PsRZAxf/1MTogYOJQ
	KUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=9yJZz5jFaCc5PyME2l6WH3wOLTcWJMzOM+3Iyxk4YC0=;
	b=WUrkxAqODEWzHsi4Y3Fu2wy9sU1I1PCfBx8GRMMBq9iOCWeoqimxd0H2zwC1kjHUJI
	yeN31V1p3+RCZxb6Cfvp795hSe308dGbRCV7p5Z35NdqUqSpeC+bOhXgiCuxaelTcn9L
	qaiiKSd8ionhbYJPEodwd/HIwMficrb4CTu1GaPu8eu82fBPLMWclh6kKlcXWsgxxVSc
	dH5M37nluVWPwPu1yR4ljw48geKVBxan2PzzFejPXEMSKkQUWSXynsHkKcQx5yBm7YxO
	6V4oxpH9AJdbC2vdCi6hGa2ezh2OmU+iUvRiBbKuQ1tcSwZDedb2yWkwpE9JQArl1qbv
	g2pA==
X-Gm-Message-State: APjAAAU1kWGKrV90cAum8QQAZBa1oJrV+0UakP7+ODdjauHWgNb8HqzZ
	7gmKkEGDbOtbKACdFznmb5itu5Sh
X-Google-Smtp-Source: APXvYqzpZA9DfOLlx1kZkqbRPv9sHqfR3NBkBC4PoyCeNkdXL2SShZdbL2pC9/tLSEa7T00VuexrMQ==
X-Received: by 2002:aa7:91c7:: with SMTP id z7mr5257202pfa.111.1573659154365; 
	Wed, 13 Nov 2019 07:32:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:51 -0800
Message-Id: <3361760dbb46cca2e00f053286404b5df39590b3.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 09/31] libgcrypt: fix CVE-2019-13627
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 15:32:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport two fixes for CVE-2019-13627 from upstream
to zeus.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch | 128 +++++++++++++++++++++
 ...-ecc-Add-mitigation-against-timing-attack.patch |  70 +++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb  |   2 +
 3 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch b/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
new file mode 100644
index 0000000..211e041
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
@@ -0,0 +1,128 @@
+From db4e9976cc31b314aafad6626b2894e86ee44d60 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Thu, 8 Aug 2019 17:42:02 +0900
+Subject: [PATCH] dsa,ecdsa: Fix use of nonce, use larger one.
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=db4e9976cc3]
+CVE: CVE-2019-13627
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+* cipher/dsa-common.c (_gcry_dsa_modify_k): New.
+* cipher/pubkey-internal.h (_gcry_dsa_modify_k): New.
+* cipher/dsa.c (sign): Use _gcry_dsa_modify_k.
+* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Likewise.
+* cipher/ecc-gost.c (_gcry_ecc_gost_sign): Likewise.
+
+--
+
+Cherry-picked master commit of:
+	7c2943309d14407b51c8166c4dcecb56a3628567
+
+CVE-id: CVE-2019-13627
+GnuPG-bug-id: 4626
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+---
+ cipher/dsa-common.c      | 24 ++++++++++++++++++++++++
+ cipher/dsa.c             |  2 ++
+ cipher/ecc-ecdsa.c       | 10 +---------
+ cipher/ecc-gost.c        |  2 ++
+ cipher/pubkey-internal.h |  1 +
+ 5 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/cipher/dsa-common.c b/cipher/dsa-common.c
+index 8c0a6843..fe49248d 100644
+--- a/cipher/dsa-common.c
++++ b/cipher/dsa-common.c
+@@ -29,6 +29,30 @@
+ #include "pubkey-internal.h"
+ 
+ 
++/*
++ * Modify K, so that computation time difference can be small,
++ * by making K large enough.
++ *
++ * Originally, (EC)DSA computation requires k where 0 < k < q.  Here,
++ * we add q (the order), to keep k in a range: q < k < 2*q (or,
++ * addming more q, to keep k in a range: 2*q < k < 3*q), so that
++ * timing difference of the EC multiply (or exponentiation) operation
++ * can be small.  The result of (EC)DSA computation is same.
++ */
++void
++_gcry_dsa_modify_k (gcry_mpi_t k, gcry_mpi_t q, int qbits)
++{
++  gcry_mpi_t k1 = mpi_new (qbits+2);
++
++  mpi_resize (k, (qbits+2+BITS_PER_MPI_LIMB-1) / BITS_PER_MPI_LIMB);
++  k->nlimbs = k->alloced;
++  mpi_add (k, k, q);
++  mpi_add (k1, k, q);
++  mpi_set_cond (k, k1, !mpi_test_bit (k, qbits));
++
++  mpi_free (k1);
++}
++
+ /*
+  * Generate a random secret exponent K less than Q.
+  * Note that ECDSA uses this code also to generate D.
+diff --git a/cipher/dsa.c b/cipher/dsa.c
+index 22d8d782..24a53528 100644
+--- a/cipher/dsa.c
++++ b/cipher/dsa.c
+@@ -635,6 +635,8 @@ sign (gcry_mpi_t r, gcry_mpi_t s, gcry_mpi_t input, DSA_secret_key *skey,
+       k = _gcry_dsa_gen_k (skey->q, GCRY_STRONG_RANDOM);
+     }
+ 
++  _gcry_dsa_modify_k (k, skey->q, qbits);
++
+   /* r = (a^k mod p) mod q */
+   mpi_powm( r, skey->g, k, skey->p );
+   mpi_fdiv_r( r, r, skey->q );
+diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
+index 84a1cf84..97966c3a 100644
+--- a/cipher/ecc-ecdsa.c
++++ b/cipher/ecc-ecdsa.c
+@@ -114,15 +114,7 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+           else
+             k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
+ 
+-          /* Originally, ECDSA computation requires k where 0 < k < n.
+-           * Here, we add n (the order of curve), to keep k in a
+-           * range: n < k < 2*n, or, addming more n, keep k in a range:
+-           * 2*n < k < 3*n, so that timing difference of the EC
+-           * multiply operation can be small.  The result is same.
+-           */
+-          mpi_add (k, k, skey->E.n);
+-          if (!mpi_test_bit (k, qbits))
+-            mpi_add (k, k, skey->E.n);
++          _gcry_dsa_modify_k (k, skey->E.n, qbits);
+ 
+           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
+           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
+diff --git a/cipher/ecc-gost.c b/cipher/ecc-gost.c
+index a34fa084..0362a6c7 100644
+--- a/cipher/ecc-gost.c
++++ b/cipher/ecc-gost.c
+@@ -94,6 +94,8 @@ _gcry_ecc_gost_sign (gcry_mpi_t input, ECC_secret_key *skey,
+           mpi_free (k);
+           k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
+ 
++          _gcry_dsa_modify_k (k, skey->E.n, qbits);
++
+           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
+           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
+             {
+diff --git a/cipher/pubkey-internal.h b/cipher/pubkey-internal.h
+index b8167c77..d31e26f3 100644
+--- a/cipher/pubkey-internal.h
++++ b/cipher/pubkey-internal.h
+@@ -84,6 +84,7 @@ _gcry_rsa_pss_verify (gcry_mpi_t value, gcry_mpi_t encoded,
+ 
+ 
+ /*-- dsa-common.c --*/
++void _gcry_dsa_modify_k (gcry_mpi_t k, gcry_mpi_t q, int qbits);
+ gcry_mpi_t _gcry_dsa_gen_k (gcry_mpi_t q, int security_level);
+ gpg_err_code_t _gcry_dsa_gen_rfc6979_k (gcry_mpi_t *r_k,
+                                         gcry_mpi_t dsa_q, gcry_mpi_t dsa_x,
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch b/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
new file mode 100644
index 0000000..db5a55e
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
@@ -0,0 +1,70 @@
+From d5407b78cca9f9d318a4f4d2f6ba2b8388584cd9 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 17 Jul 2019 12:44:50 +0900
+Subject: [PATCH] ecc: Add mitigation against timing attack.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=d5407b78c]
+CVE: CVE-2019-13627
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Add the order N to K.
+* mpi/ec.c (_gcry_mpi_ec_mul_point): Compute with NBITS of P or larger.
+
+--
+
+Cherry-picked master commit of:
+	 b9577f7c89b4327edc09f2231bc8b31521102c79
+
+CVE-id: CVE-2019-13627
+GnuPG-bug-id: 4626
+Co-authored-by: Ján Jančár <johny@neuromancer.sk>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+---
+ cipher/ecc-ecdsa.c | 10 ++++++++++
+ mpi/ec.c           |  6 +++++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
+index 140e8c09..84a1cf84 100644
+--- a/cipher/ecc-ecdsa.c
++++ b/cipher/ecc-ecdsa.c
+@@ -114,6 +114,16 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+           else
+             k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
+ 
++          /* Originally, ECDSA computation requires k where 0 < k < n.
++           * Here, we add n (the order of curve), to keep k in a
++           * range: n < k < 2*n, or, addming more n, keep k in a range:
++           * 2*n < k < 3*n, so that timing difference of the EC
++           * multiply operation can be small.  The result is same.
++           */
++          mpi_add (k, k, skey->E.n);
++          if (!mpi_test_bit (k, qbits))
++            mpi_add (k, k, skey->E.n);
++
+           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
+           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
+             {
+diff --git a/mpi/ec.c b/mpi/ec.c
+index 89077cd9..adb02600 100644
+--- a/mpi/ec.c
++++ b/mpi/ec.c
+@@ -1309,7 +1309,11 @@ _gcry_mpi_ec_mul_point (mpi_point_t result,
+       unsigned int nbits;
+       int j;
+ 
+-      nbits = mpi_get_nbits (scalar);
++      if (mpi_cmp (scalar, ctx->p) >= 0)
++        nbits = mpi_get_nbits (scalar);
++      else
++        nbits = mpi_get_nbits (ctx->p);
++
+       if (ctx->model == MPI_EC_WEIERSTRASS)
+         {
+           mpi_set_ui (result->x, 1);
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
index 11d078d..1bd3551 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
@@ -24,6 +24,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-Prefetch-GCM-look-up-tables.patch \
            file://0002-AES-move-look-up-tables-to-.data-section-and-unshare.patch \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
+           file://0001-ecc-Add-mitigation-against-timing-attack.patch \
+           file://0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch \
 "
 SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
 SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"
-- 
2.7.4


