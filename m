Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.8252.1595926408928178289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: oLM5Z0O99F8ksehf2HRj01CLF0kkkio2jqmBMRLwv8i2QZ8/N9bHzPhtY/XUeNWYdMULT7RSPO
 pXza8ua4u/qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699787"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:28 -0700
IronPort-SDR: LHoVHYYc1351UN/UdSePPq7asM65Z87ifmgT6b2m1QMqnrokq22erkONBzXdf7A4/ljqS44dkc
 B9Y4u1thjB0g==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245978"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:27 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 29/32] nss: Fix CVE-2020-12399
Date: Tue, 28 Jul 2020 16:51:30 +0800
Message-Id: <c447b32c1ec0c117748a4be68dda02d375c81b85.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Master (nss version 3.54) is not affected by this issue. This is a backport
from nss version 3.54.

NSS has shown timing differences when performing DSA signatures, which was
exploitable and could eventually leak private keys. This vulnerability affects
Thunderbird < 68.9.0, Firefox < 77, and Firefox ESR < 68.9.

Upstream patch:
https://hg.mozilla.org/projects/nss/rev/daa823a4a29bcef0fec33a379ec83857429aea2e

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.25.4

