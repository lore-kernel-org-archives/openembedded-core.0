Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 760C377A42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 07:53:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8P7r8jr024105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Sep 2017 00:53:08 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 25 Sep 2017 00:53:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 25 Sep 2017 03:53:06 -0400
Message-ID: <1506325986-197674-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libgcrypt: fix CVE-2017-0379
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
X-List-Received-Date: Mon, 25 Sep 2017 07:53:08 -0000
Content-Type: text/plain

Backport the fix from https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;
a=commit;h=bf76acbf0da6b0f245e491bec12c0f0a1b5be7c9

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0005-ecc-Add-input-validation-for-X25519.patch | 157 +++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb  |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0005-ecc-Add-input-validation-for-X25519.patch

diff --git a/meta/recipes-support/libgcrypt/files/0005-ecc-Add-input-validation-for-X25519.patch b/meta/recipes-support/libgcrypt/files/0005-ecc-Add-input-validation-for-X25519.patch
new file mode 100644
index 0000000..c0607aa
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0005-ecc-Add-input-validation-for-X25519.patch
@@ -0,0 +1,157 @@
+From ef570e3d2773c12126e7d3fcdc4db9ef80a5e214 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 25 Aug 2017 18:13:28 +0900
+Subject: [PATCH] ecc: Add input validation for X25519.
+
+* cipher/ecc.c (ecc_decrypt_raw): Add input validation.
+* mpi/ec.c (ec_p_init): Use scratch buffer for bad points.
+(_gcry_mpi_ec_bad_point): New.
+
+--
+
+Following is the paper describing the attack:
+
+    May the Fourth Be With You: A Microarchitectural Side Channel Attack
+    on Real-World Applications of Curve25519
+    by Daniel Genkin, Luke Valenta, and Yuval Yarom
+
+In the current implementation, we do output checking and it results an
+error for those bad points.  However, when attacked, the computation
+will done with leak of private key, even it will results errors.  To
+mitigate leak, we added input validation.
+
+Note that we only list bad points with MSB=0.  By X25519, MSB is
+always cleared.
+
+In future, we should implement constant-time field computation.  Then,
+this input validation could be removed, if performance is important
+and we are sure for no leak.
+
+CVE-id: CVE-2017-0379
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ cipher/ecc.c | 17 +++++++++++++++--
+ mpi/ec.c     | 51 ++++++++++++++++++++++++++++++++++++++++++++++++---
+ src/mpi.h    |  1 +
+ 3 files changed, 64 insertions(+), 5 deletions(-)
+
+diff --git a/cipher/ecc.c b/cipher/ecc.c
+index e25bf09..4e3e5b1 100644
+--- a/cipher/ecc.c
++++ b/cipher/ecc.c
+@@ -1628,9 +1628,22 @@ ecc_decrypt_raw (gcry_sexp_t *r_plain, gcry_sexp_t s_data, gcry_sexp_t keyparms)
+   if (DBG_CIPHER)
+     log_printpnt ("ecc_decrypt    kG", &kG, NULL);
+ 
+-  if (!(flags & PUBKEY_FLAG_DJB_TWEAK)
++  if ((flags & PUBKEY_FLAG_DJB_TWEAK))
++    {
+       /* For X25519, by its definition, validation should not be done.  */
+-      && !_gcry_mpi_ec_curve_point (&kG, ec))
++      /* (Instead, we do output check.)
++       *
++       * However, to mitigate secret key leak from our implementation,
++       * we also do input validation here.  For constant-time
++       * implementation, we can remove this input validation.
++       */
++      if (_gcry_mpi_ec_bad_point (&kG, ec))
++        {
++          rc = GPG_ERR_INV_DATA;
++          goto leave;
++        }
++    }
++  else if (!_gcry_mpi_ec_curve_point (&kG, ec))
+     {
+       rc = GPG_ERR_INV_DATA;
+       goto leave;
+diff --git a/mpi/ec.c b/mpi/ec.c
+index a0f7357..4c16603 100644
+--- a/mpi/ec.c
++++ b/mpi/ec.c
+@@ -396,6 +396,29 @@ ec_get_two_inv_p (mpi_ec_t ec)
+ }
+ 
+ 
++static const char *curve25519_bad_points[] = {
++  "0x0000000000000000000000000000000000000000000000000000000000000000",
++  "0x0000000000000000000000000000000000000000000000000000000000000001",
++  "0x00b8495f16056286fdb1329ceb8d09da6ac49ff1fae35616aeb8413b7c7aebe0",
++  "0x57119fd0dd4e22d8868e1c58c45c44045bef839c55b1d0b1248c50a3bc959c5f",
++  "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec",
++  "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffed",
++  "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffee",
++  NULL
++};
++
++static gcry_mpi_t
++scanval (const char *string)
++{
++  gpg_err_code_t rc;
++  gcry_mpi_t val;
++
++  rc = _gcry_mpi_scan (&val, GCRYMPI_FMT_HEX, string, 0, NULL);
++  if (rc)
++    log_fatal ("scanning ECC parameter failed: %s\n", gpg_strerror (rc));
++  return val;
++}
++
+ 
+ /* This function initialized a context for elliptic curve based on the
+    field GF(p).  P is the prime specifying this field, A is the first
+@@ -434,9 +457,17 @@ ec_p_init (mpi_ec_t ctx, enum gcry_mpi_ec_models model,
+ 
+   _gcry_mpi_ec_get_reset (ctx);
+ 
+-  /* Allocate scratch variables.  */
+-  for (i=0; i< DIM(ctx->t.scratch); i++)
+-    ctx->t.scratch[i] = mpi_alloc_like (ctx->p);
++  if (model == MPI_EC_MONTGOMERY)
++    {
++      for (i=0; i< DIM(ctx->t.scratch) && curve25519_bad_points[i]; i++)
++        ctx->t.scratch[i] = scanval (curve25519_bad_points[i]);
++    }
++  else
++    {
++      /* Allocate scratch variables.  */
++      for (i=0; i< DIM(ctx->t.scratch); i++)
++        ctx->t.scratch[i] = mpi_alloc_like (ctx->p);
++    }
+ 
+   /* Prepare for fast reduction.  */
+   /* FIXME: need a test for NIST values.  However it does not gain us
+@@ -1572,3 +1603,17 @@ _gcry_mpi_ec_curve_point (gcry_mpi_point_t point, mpi_ec_t ctx)
+ 
+   return res;
+ }
++
++
++int
++_gcry_mpi_ec_bad_point (gcry_mpi_point_t point, mpi_ec_t ctx)
++{
++  int i;
++  gcry_mpi_t x_bad;
++
++  for (i = 0; (x_bad = ctx->t.scratch[i]); i++)
++    if (!mpi_cmp (point->x, x_bad))
++      return 1;
++
++  return 0;
++}
+diff --git a/src/mpi.h b/src/mpi.h
+index b5385b5..aeba7f8 100644
+--- a/src/mpi.h
++++ b/src/mpi.h
+@@ -296,6 +296,7 @@ void _gcry_mpi_ec_mul_point (mpi_point_t result,
+                              gcry_mpi_t scalar, mpi_point_t point,
+                              mpi_ec_t ctx);
+ int  _gcry_mpi_ec_curve_point (gcry_mpi_point_t point, mpi_ec_t ctx);
++int _gcry_mpi_ec_bad_point (gcry_mpi_point_t point, mpi_ec_t ctx);
+ 
+ gcry_mpi_t _gcry_mpi_ec_ec2os (gcry_mpi_point_t point, mpi_ec_t ectx);
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
index 1797d95..fb004d9 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://0005-ecc-Add-input-validation-for-X25519.patch \
 "
 SRC_URI[md5sum] = "110ce4352f9ea6f560bdc6c5644ae93c"
 SRC_URI[sha256sum] = "f6e470b7f2d3a703e8747f05a8c19d9e10e26ebf2d5f3d71ff75a40f504e12ee"
-- 
2.8.1


