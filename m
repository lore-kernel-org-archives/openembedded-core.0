Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD8C16B512
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 23:15:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9INFQsq027249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 16:15:26 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 18 Oct 2019 16:15:25 -0700
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191018193259.126775-1-trevor.gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5e2a9d1a-8362-a234-02df-57b79bd9c8ba@windriver.com>
Date: Fri, 18 Oct 2019 19:15:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018193259.126775-1-trevor.gamblin@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] libgcrypt: fix CVE-2019-13627
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
X-List-Received-Date: Fri, 18 Oct 2019 23:15:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 10/18/19 3:32 PM, Trevor Gamblin wrote:
> Note that there are two patch files added for this fix.
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...cdsa-Fix-use-of-nonce-use-larger-one.patch | 126 ++++++++++++++++++
>   ...Add-mitigation-against-timing-attack.patch |  68 ++++++++++
>   .../libgcrypt/libgcrypt_1.8.4.bb              |   2 +

NAK.

1.8.5 has been released and it DOES contain a fix for this CVE.

On master the commits are:
7c294330 dsa,ecdsa: Fix use of nonce, use larger one.
b9577f7c ecc: Add mitigation against timing attack.

but they are not part of a tagged release:
$ git tag --contains 7c294330 -> NULL
$ git tag --contains b9577f7c -> NULL

BUT, if you look at:

$ git log --oneline libgcrypt-1.8.4..libgcrypt-1.8.5 | \
   grep -i mitigation
d5407b78 ecc: Add mitigation against timing attack.

$ git log --oneline libgcrypt-1.8.4..libgcrypt-1.8.5 | \
   grep -i nonce
db4e9976 dsa,ecdsa: Fix use of nonce, use larger one.


and if you look at those logs, you'll see that these commits
were cherry-picked from master.

Also note the branch:
$ git branch -a --contains d5407b78
   remotes/origin/LIBGCRYPT-1.8-BRANCH

so that makes sense. I wasn't able to the branch without the -a
so I was concerned that the repo was being handled in a way
that I didn't understand.

../Randy

>   3 files changed, 196 insertions(+)
>   create mode 100644 meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
>   create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
> 
> diff --git a/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch b/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
> new file mode 100644
> index 0000000000..fdc3873ba1
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
> @@ -0,0 +1,126 @@
> +From 7c2943309d14407b51c8166c4dcecb56a3628567 Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Thu, 8 Aug 2019 17:42:02 +0900
> +Subject: [PATCH] dsa,ecdsa: Fix use of nonce, use larger one.
> +
> +* cipher/dsa-common.c (_gcry_dsa_modify_k): New.
> +* cipher/pubkey-internal.h (_gcry_dsa_modify_k): New.
> +* cipher/dsa.c (sign): Use _gcry_dsa_modify_k.
> +* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Likewise.
> +* cipher/ecc-gost.c (_gcry_ecc_gost_sign): Likewise.
> +
> +CVE-id: CVE-2019-13627
> +GnuPG-bug-id: 4626
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +---
> + cipher/dsa-common.c      | 24 ++++++++++++++++++++++++
> + cipher/dsa.c             |  2 ++
> + cipher/ecc-ecdsa.c       | 10 +---------
> + cipher/ecc-gost.c        |  2 ++
> + cipher/pubkey-internal.h |  1 +
> + 5 files changed, 30 insertions(+), 9 deletions(-)
> +
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=7c2943309d1]
> +This backport is one of two upstream patches addressing CVE-2019-13627.
> +
> +CVE: CVE-2019-13627
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +diff --git a/cipher/dsa-common.c b/cipher/dsa-common.c
> +index 8c0a6843..fe49248d 100644
> +--- a/cipher/dsa-common.c
> ++++ b/cipher/dsa-common.c
> +@@ -29,6 +29,30 @@
> + #include "pubkey-internal.h"
> +
> +
> ++/*
> ++ * Modify K, so that computation time difference can be small,
> ++ * by making K large enough.
> ++ *
> ++ * Originally, (EC)DSA computation requires k where 0 < k < q.  Here,
> ++ * we add q (the order), to keep k in a range: q < k < 2*q (or,
> ++ * addming more q, to keep k in a range: 2*q < k < 3*q), so that
> ++ * timing difference of the EC multiply (or exponentiation) operation
> ++ * can be small.  The result of (EC)DSA computation is same.
> ++ */
> ++void
> ++_gcry_dsa_modify_k (gcry_mpi_t k, gcry_mpi_t q, int qbits)
> ++{
> ++  gcry_mpi_t k1 = mpi_new (qbits+2);
> ++
> ++  mpi_resize (k, (qbits+2+BITS_PER_MPI_LIMB-1) / BITS_PER_MPI_LIMB);
> ++  k->nlimbs = k->alloced;
> ++  mpi_add (k, k, q);
> ++  mpi_add (k1, k, q);
> ++  mpi_set_cond (k, k1, !mpi_test_bit (k, qbits));
> ++
> ++  mpi_free (k1);
> ++}
> ++
> + /*
> +  * Generate a random secret exponent K less than Q.
> +  * Note that ECDSA uses this code also to generate D.
> +diff --git a/cipher/dsa.c b/cipher/dsa.c
> +index 22d8d782..24a53528 100644
> +--- a/cipher/dsa.c
> ++++ b/cipher/dsa.c
> +@@ -635,6 +635,8 @@ sign (gcry_mpi_t r, gcry_mpi_t s, gcry_mpi_t input, DSA_secret_key *skey,
> +       k = _gcry_dsa_gen_k (skey->q, GCRY_STRONG_RANDOM);
> +     }
> +
> ++  _gcry_dsa_modify_k (k, skey->q, qbits);
> ++
> +   /* r = (a^k mod p) mod q */
> +   mpi_powm( r, skey->g, k, skey->p );
> +   mpi_fdiv_r( r, r, skey->q );
> +diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
> +index 84a1cf84..97966c3a 100644
> +--- a/cipher/ecc-ecdsa.c
> ++++ b/cipher/ecc-ecdsa.c
> +@@ -114,15 +114,7 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +           else
> +             k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
> +
> +-          /* Originally, ECDSA computation requires k where 0 < k < n.
> +-           * Here, we add n (the order of curve), to keep k in a
> +-           * range: n < k < 2*n, or, addming more n, keep k in a range:
> +-           * 2*n < k < 3*n, so that timing difference of the EC
> +-           * multiply operation can be small.  The result is same.
> +-           */
> +-          mpi_add (k, k, skey->E.n);
> +-          if (!mpi_test_bit (k, qbits))
> +-            mpi_add (k, k, skey->E.n);
> ++          _gcry_dsa_modify_k (k, skey->E.n, qbits);
> +
> +           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
> +           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
> +diff --git a/cipher/ecc-gost.c b/cipher/ecc-gost.c
> +index a34fa084..0362a6c7 100644
> +--- a/cipher/ecc-gost.c
> ++++ b/cipher/ecc-gost.c
> +@@ -94,6 +94,8 @@ _gcry_ecc_gost_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +           mpi_free (k);
> +           k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
> +
> ++          _gcry_dsa_modify_k (k, skey->E.n, qbits);
> ++
> +           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
> +           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
> +             {
> +diff --git a/cipher/pubkey-internal.h b/cipher/pubkey-internal.h
> +index b8167c77..d31e26f3 100644
> +--- a/cipher/pubkey-internal.h
> ++++ b/cipher/pubkey-internal.h
> +@@ -84,6 +84,7 @@ _gcry_rsa_pss_verify (gcry_mpi_t value, gcry_mpi_t encoded,
> +
> +
> + /*-- dsa-common.c --*/
> ++void _gcry_dsa_modify_k (gcry_mpi_t k, gcry_mpi_t q, int qbits);
> + gcry_mpi_t _gcry_dsa_gen_k (gcry_mpi_t q, int security_level);
> + gpg_err_code_t _gcry_dsa_gen_rfc6979_k (gcry_mpi_t *r_k,
> +                                         gcry_mpi_t dsa_q, gcry_mpi_t dsa_x,
> +--
> +2.23.0
> +
> diff --git a/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch b/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
> new file mode 100644
> index 0000000000..66402d6187
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
> @@ -0,0 +1,68 @@
> +From b9577f7c89b4327edc09f2231bc8b31521102c79 Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Wed, 17 Jul 2019 12:44:50 +0900
> +Subject: [PATCH] ecc: Add mitigation against timing attack.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Add the order N to K.
> +* mpi/ec.c (_gcry_mpi_ec_mul_point): Compute with NBITS of P or larger.
> +
> +CVE-id: CVE-2019-13627
> +GnuPG-bug-id: 4626
> +Co-authored-by: Ján Jančár <johny@neuromancer.sk>
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +---
> + cipher/ecc-ecdsa.c | 10 ++++++++++
> + mpi/ec.c           |  6 +++++-
> + 2 files changed, 15 insertions(+), 1 deletion(-)
> +
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=b9577f7c89b]
> +This backport is one of two upstream patches addressing CVE-2019-13627.
> +
> +CVE: CVE-2019-13627
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
> +index 140e8c09..84a1cf84 100644
> +--- a/cipher/ecc-ecdsa.c
> ++++ b/cipher/ecc-ecdsa.c
> +@@ -114,6 +114,16 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +           else
> +             k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
> +
> ++          /* Originally, ECDSA computation requires k where 0 < k < n.
> ++           * Here, we add n (the order of curve), to keep k in a
> ++           * range: n < k < 2*n, or, addming more n, keep k in a range:
> ++           * 2*n < k < 3*n, so that timing difference of the EC
> ++           * multiply operation can be small.  The result is same.
> ++           */
> ++          mpi_add (k, k, skey->E.n);
> ++          if (!mpi_test_bit (k, qbits))
> ++            mpi_add (k, k, skey->E.n);
> ++
> +           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
> +           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
> +             {
> +diff --git a/mpi/ec.c b/mpi/ec.c
> +index 97afbfed..ed936d74 100644
> +--- a/mpi/ec.c
> ++++ b/mpi/ec.c
> +@@ -1509,7 +1509,11 @@ _gcry_mpi_ec_mul_point (mpi_point_t result,
> +       unsigned int nbits;
> +       int j;
> +
> +-      nbits = mpi_get_nbits (scalar);
> ++      if (mpi_cmp (scalar, ctx->p) >= 0)
> ++        nbits = mpi_get_nbits (scalar);
> ++      else
> ++        nbits = mpi_get_nbits (ctx->p);
> ++
> +       if (ctx->model == MPI_EC_WEIERSTRASS)
> +         {
> +           mpi_set_ui (result->x, 1);
> +--
> +2.23.0
> +
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
> index fda68a2938..9d649e49a3 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
> @@ -21,6 +21,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
>              file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
>              file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
>              file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
> +           file://0001-ecc-Add-mitigation-against-timing-attack.patch \
> +           file://0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch \
>   "
>   SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
>   SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"
> 


-- 
# Randy MacLeod
# Wind River Linux

