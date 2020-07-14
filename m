Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.15581.1594714839401053306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 01:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06E8Kbwu029425
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 01:20:38 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 01:20:24 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [zeus][PATCH 1/1] nss: Fix CVE-2020-12399
Date: Tue, 14 Jul 2020 11:18:13 +0300
Message-ID: <20200714081813.28574-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Master (nss version 3.54) is not affected by this issue. This is a backport
from nss version 3.54.

NSS has shown timing differences when performing DSA signatures, which was
exploitable and could eventually leak private keys. This vulnerability affects
Thunderbird < 68.9.0, Firefox < 77, and Firefox ESR < 68.9.

Upstream patch:
https://hg.mozilla.org/projects/nss/rev/daa823a4a29bcef0fec33a379ec83857429aea2e

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 ++++++++++++++++++
 meta/recipes-support/nss/nss_3.45.bb          |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch b/meta/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch
new file mode 100644
index 0000000000..517c277ae0
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch
@@ -0,0 +1,110 @@
+From 5942c26888ba12ad5e0d92fb62f23d7cde6dc159 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Mon, 13 Jul 2020 06:25:56 +0000
+Subject: [PATCH] Bug 1631576 - Force a fixed length for DSA exponentiation
+ r=pereida,bbrumley
+
+Differential Revision: https://phabricator.services.mozilla.com/D72011
+
+Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/rev/daa823a4a29bcef0fec33a379ec83857429aea2e]
+
+Authored-by: Robert Relyea <rrelyea@redhat.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ nss/lib/freebl/dsa.c | 45 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 35 insertions(+), 10 deletions(-)
+
+diff --git a/nss/lib/freebl/dsa.c b/nss/lib/freebl/dsa.c
+index aef3539..389c9de 100644
+--- a/nss/lib/freebl/dsa.c
++++ b/nss/lib/freebl/dsa.c
+@@ -313,13 +313,14 @@ DSA_NewKeyFromSeed(const PQGParams *params,
+ 
+ static SECStatus
+ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+-               const unsigned char *kb)
++               const unsigned char *kbytes)
+ {
+     mp_int p, q, g; /* PQG parameters */
+     mp_int x, k;    /* private key & pseudo-random integer */
+     mp_int r, s;    /* tuple (r, s) is signature) */
+     mp_int t;       /* holding tmp values */
+     mp_int ar;      /* holding blinding values */
++    mp_digit fuzz;  /* blinding multiplier for q */
+     mp_err err = MP_OKAY;
+     SECStatus rv = SECSuccess;
+     unsigned int dsa_subprime_len, dsa_signature_len, offset;
+@@ -373,6 +374,7 @@ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+     CHECK_MPI_OK(mp_init(&s));
+     CHECK_MPI_OK(mp_init(&t));
+     CHECK_MPI_OK(mp_init(&ar));
++
+     /*
+     ** Convert stored PQG and private key into MPI integers.
+     */
+@@ -380,14 +382,28 @@ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+     SECITEM_TO_MPINT(key->params.subPrime, &q);
+     SECITEM_TO_MPINT(key->params.base, &g);
+     SECITEM_TO_MPINT(key->privateValue, &x);
+-    OCTETS_TO_MPINT(kb, &k, dsa_subprime_len);
++    OCTETS_TO_MPINT(kbytes, &k, dsa_subprime_len);
++
++    /* k blinding  create a single value that has the high bit set in
++     * the mp_digit*/
++    if (RNG_GenerateGlobalRandomBytes(&fuzz, sizeof(mp_digit)) != SECSuccess) {
++        PORT_SetError(SEC_ERROR_NEED_RANDOM);
++        rv = SECFailure;
++        goto cleanup;
++    }
++    fuzz |= 1ULL << ((sizeof(mp_digit) * PR_BITS_PER_BYTE - 1));
+     /*
+     ** FIPS 186-1, Section 5, Step 1
+     **
+     ** r = (g**k mod p) mod q
+     */
+-    CHECK_MPI_OK(mp_exptmod(&g, &k, &p, &r)); /* r = g**k mod p */
+-    CHECK_MPI_OK(mp_mod(&r, &q, &r));         /* r = r mod q    */
++    CHECK_MPI_OK(mp_mul_d(&q, fuzz, &t)); /* t = q*fuzz */
++    CHECK_MPI_OK(mp_add(&k, &t, &t));     /* t = k+q*fuzz */
++    /* length of t is now fixed, bits in k have been blinded */
++    CHECK_MPI_OK(mp_exptmod(&g, &t, &p, &r)); /* r = g**t mod p */
++    /* r is now g**(k+q*fuzz) == g**k mod p */
++    CHECK_MPI_OK(mp_mod(&r, &q, &r)); /* r = r mod q    */
++
+     /*
+     ** FIPS 186-1, Section 5, Step 2
+     **
+@@ -411,15 +427,24 @@ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+     /* Using mp_invmod on k directly would leak bits from k. */
+     CHECK_MPI_OK(mp_mul(&k, &ar, &k));       /* k = k * ar */
+     CHECK_MPI_OK(mp_mulmod(&k, &t, &q, &k)); /* k = k * t mod q */
+-    CHECK_MPI_OK(mp_invmod(&k, &q, &k));     /* k = k**-1 mod q */
++    /* k is now k*t*ar */
++    CHECK_MPI_OK(mp_invmod(&k, &q, &k)); /* k = k**-1 mod q */
++    /* k is now (k*t*ar)**-1 */
+     CHECK_MPI_OK(mp_mulmod(&k, &t, &q, &k)); /* k = k * t mod q */
+-    SECITEM_TO_MPINT(localDigest, &s);       /* s = HASH(M)     */
++    /* k is now (k*ar)**-1 */
++    SECITEM_TO_MPINT(localDigest, &s); /* s = HASH(M)     */
+     /* To avoid leaking secret bits here the addition is blinded. */
+-    CHECK_MPI_OK(mp_mul(&x, &ar, &x));        /* x = x * ar */
+-    CHECK_MPI_OK(mp_mulmod(&x, &r, &q, &x));  /* x = x * r mod q */
++    CHECK_MPI_OK(mp_mul(&x, &ar, &x)); /* x = x * ar */
++    /* x is now x*ar */
++    CHECK_MPI_OK(mp_mulmod(&x, &r, &q, &x)); /* x = x * r mod q */
++    /* x is now x*r*ar */
+     CHECK_MPI_OK(mp_mulmod(&s, &ar, &q, &t)); /* t = s * ar mod q */
+-    CHECK_MPI_OK(mp_add(&t, &x, &s));         /* s = t + x */
+-    CHECK_MPI_OK(mp_mulmod(&s, &k, &q, &s));  /* s = s * k mod q */
++    /* t is now hash(M)*ar */
++    CHECK_MPI_OK(mp_add(&t, &x, &s)); /* s = t + x */
++    /* s is now (HASH(M)+x*r)*ar */
++    CHECK_MPI_OK(mp_mulmod(&s, &k, &q, &s)); /* s = s * k mod q */
++    /* s is now (HASH(M)+x*r)*ar*(k*ar)**-1 = (k**-1)*(HASH(M)+x*r) */
++
+     /*
+     ** verify r != 0 and s != 0
+     ** mentioned as optional in FIPS 186-1.
+-- 
+2.18.1
+
diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.45.bb
index c8005a5b3a..9fe27af5db 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.45.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
+           file://0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch \
            "
 
 SRC_URI[md5sum] = "f1752d7223ee9d910d551e57264bafa8"
-- 
2.17.1

