Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 686D2738AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 18:10:39 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id fl4so51336357pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=MlG9Ll5ZnHSx4OnEa2/tbh64KNDgj7naiN9dbJvCy7Y=;
	b=grAEEh6jYRAqNhji+emsXxnEXq9lbmd3kDVCCxaf0D8YeadT+D6bMV9IyzXyNUzeyN
	PRnWs5d8F+n5br7UQyCBSnP4vqtawcabwpaNKHiLqDO3rsRUtVHhVxvRC1U1ONQ2Qu5k
	ubEcXzI1LDd+FAg6xrektGVoAMwgHLnYPK1IrP/Fa8Y9g/Ex5Tsl7o+KE9TOmZP3zMqy
	GZYB4OCKaovcIKlW9AAHTjhVZpTv1m8WoZfNB78miUoCMIVD5Bcii45JNTO1WWOD3Oye
	9+ymAZJrZTkkktXHywwpJqKZY/0VKU4igHTQXH1Ya83UpopYqYTvb/L5qbitmFzD8TYd
	7rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=MlG9Ll5ZnHSx4OnEa2/tbh64KNDgj7naiN9dbJvCy7Y=;
	b=gpYy6MXIelXbClqmhyGovQbrBbChQTgwLHzO5cVrV9o7TgGS9PR4WQIoIoDgck/E04
	Q2gAAYBknlG8a7RVkE6u0D3JPAlOwGXdlneR1B4+0prJVFOi1hxVou0Ab5bYM8fHxIw8
	WBqsjXaPji7aOk+O0XTUGAmprxUw81Td6GANQgadhfrwz1WTw+vU2GqpPcUdQyZdw/NL
	BszeEm/h8gTldKo6K7dhM7WKJYy6z9qWLRz9gr1ypGgapBVfJ5XfvcdVb90xACtgacnA
	GeIstHgDeXr7pT5u4a1mT9GbUiMtTAxn4/iH53z84R03cxzvD44Y/6bg43akdLi6x/gn
	jBSA==
X-Gm-Message-State: AG10YOSXPo2Sp+kmvPnj6Fgy7t2RqYf9yyNKf5V0lbn0Xk/MUo/yxfkgCCYDoRbWbA3JJA==
X-Received: by 10.66.248.198 with SMTP id yo6mr11291698pac.54.1455387040410;
	Sat, 13 Feb 2016 10:10:40 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	h66sm27586647pfd.91.2016.02.13.10.10.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Feb 2016 10:10:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 10:10:25 -0800
Message-Id: <1455387025-25341-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [jethro][PATCH] libgcrypt: Security fix CVE-2015-7511
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
X-List-Received-Date: Sat, 13 Feb 2016 18:10:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7511 libgcrypt: side-channel attack on ECDH with Weierstrass curves

affects libgcrypt < 1.6.5

Patch 1 is a dependancy patch. simple macro name change.
Patch 2 is the cve fix.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libgcrypt/files/CVE-2015-7511_1.patch          | 245 +++++++++++++++++++++
 .../libgcrypt/files/CVE-2015-7511_2.patch          |  55 +++++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb  |   4 +
 3 files changed, 304 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch b/meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch
new file mode 100644
index 0000000..14c25b9
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch
@@ -0,0 +1,245 @@
+From 2ef48ba59c32bfa1a9265d5eea8ab225a658903a Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 9 Jan 2014 19:14:09 +0100
+Subject: [PATCH] ecc: Make a macro shorter.
+
+* src/mpi.h (MPI_EC_TWISTEDEDWARDS): Rename to MPI_EC_EDWARDS.  CHnage
+all users.
+* cipher/ecc-curves.c (domain_parms): Add parameters for Curve3617 as
+comment.
+* mpi/ec.c (dup_point_twistededwards): Rename to dup_point_edwards.
+(add_points_twistededwards): Rename to add_points_edwards.
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+
+Upstream-Status: Backport
+2ef48ba59c32bfa1a9265d5eea8ab225a658903a
+
+CVE: CVE-2015-7511 depend patch
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ cipher/ecc-curves.c | 22 +++++++++++++++++++---
+ cipher/ecc-misc.c   |  4 ++--
+ cipher/ecc.c        |  8 ++++----
+ mpi/ec.c            | 22 +++++++++++-----------
+ src/mpi.h           | 11 ++++++++---
+ 5 files changed, 44 insertions(+), 23 deletions(-)
+
+Index: libgcrypt-1.6.3/cipher/ecc-curves.c
+===================================================================
+--- libgcrypt-1.6.3.orig/cipher/ecc-curves.c
++++ libgcrypt-1.6.3/cipher/ecc-curves.c
+@@ -105,7 +105,7 @@ static const ecc_domain_parms_t domain_p
+     {
+       /* (-x^2 + y^2 = 1 + dx^2y^2) */
+       "Ed25519", 256, 0,
+-      MPI_EC_TWISTEDEDWARDS, ECC_DIALECT_ED25519,
++      MPI_EC_EDWARDS, ECC_DIALECT_ED25519,
+       "0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED",
+       "-0x01",
+       "-0x2DFC9311D490018C7338BF8688861767FF8FF5B2BEBE27548A14B235ECA6874A",
+@@ -113,6 +113,22 @@ static const ecc_domain_parms_t domain_p
+       "0x216936D3CD6E53FEC0A4E231FDD6DC5C692CC7609525A7B2C9562D608F25D51A",
+       "0x6666666666666666666666666666666666666666666666666666666666666658"
+     },
++#if 0 /* No real specs yet found.  */
++    {
++      /* x^2 + y^2 = 1 + 3617x^2y^2 mod 2^414 - 17 */
++      "Curve3617",
++      "0x3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
++      "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF",
++      MPI_EC_EDWARDS, 0,
++      "0x01",
++      "0x0e21",
++      "0x07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB3CC92414CF"
++      "706022B36F1C0338AD63CF181B0E71A5E106AF79",
++      "0x1A334905141443300218C0631C326E5FCD46369F44C03EC7F57FF35498A4AB4D"
++      "6D6BA111301A73FAA8537C64C4FD3812F3CBC595",
++      "0x22"
++    },
++#endif /*0*/
+     {
+       "NIST P-192", 192, 1,
+       MPI_EC_WEIERSTRASS, ECC_DIALECT_STANDARD,
+@@ -404,7 +420,7 @@ _gcry_ecc_fill_in_curve (unsigned int nb
+   switch (domain_parms[idx].model)
+     {
+     case MPI_EC_WEIERSTRASS:
+-    case MPI_EC_TWISTEDEDWARDS:
++    case MPI_EC_EDWARDS:
+       break;
+     case MPI_EC_MONTGOMERY:
+       return GPG_ERR_NOT_SUPPORTED;
+@@ -1039,7 +1055,7 @@ _gcry_ecc_get_mpi (const char *name, mpi
+       if (name[1] != '@')
+         return _gcry_mpi_ec_ec2os (ec->Q, ec);
+ 
+-      if (!strcmp (name+2, "eddsa") && ec->model == MPI_EC_TWISTEDEDWARDS)
++      if (!strcmp (name+2, "eddsa") && ec->model == MPI_EC_EDWARDS)
+         {
+           unsigned char *encpk;
+           unsigned int encpklen;
+Index: libgcrypt-1.6.3/cipher/ecc-misc.c
+===================================================================
+--- libgcrypt-1.6.3.orig/cipher/ecc-misc.c
++++ libgcrypt-1.6.3/cipher/ecc-misc.c
+@@ -79,7 +79,7 @@ _gcry_ecc_model2str (enum gcry_mpi_ec_mo
+     {
+     case MPI_EC_WEIERSTRASS:    str = "Weierstrass"; break;
+     case MPI_EC_MONTGOMERY:     str = "Montgomery";  break;
+-    case MPI_EC_TWISTEDEDWARDS: str = "Twisted Edwards"; break;
++    case MPI_EC_EDWARDS:        str = "Edwards"; break;
+     }
+   return str;
+ }
+@@ -252,7 +252,7 @@ _gcry_ecc_compute_public (mpi_point_t Q,
+ 
+   if (!d || !G || !ec->p || !ec->a)
+     return NULL;
+-  if (ec->model == MPI_EC_TWISTEDEDWARDS && !ec->b)
++  if (ec->model == MPI_EC_EDWARDS && !ec->b)
+     return NULL;
+ 
+   if (ec->dialect == ECC_DIALECT_ED25519
+Index: libgcrypt-1.6.3/cipher/ecc.c
+===================================================================
+--- libgcrypt-1.6.3.orig/cipher/ecc.c
++++ libgcrypt-1.6.3/cipher/ecc.c
+@@ -642,7 +642,7 @@ ecc_check_secret_key (gcry_sexp_t keypar
+   if (!curvename)
+     {
+       sk.E.model = ((flags & PUBKEY_FLAG_EDDSA)
+-               ? MPI_EC_TWISTEDEDWARDS
++               ? MPI_EC_EDWARDS
+                : MPI_EC_WEIERSTRASS);
+       sk.E.dialect = ((flags & PUBKEY_FLAG_EDDSA)
+                       ? ECC_DIALECT_ED25519
+@@ -774,7 +774,7 @@ ecc_sign (gcry_sexp_t *r_sig, gcry_sexp_
+   if (!curvename)
+     {
+       sk.E.model = ((ctx.flags & PUBKEY_FLAG_EDDSA)
+-                    ? MPI_EC_TWISTEDEDWARDS
++                    ? MPI_EC_EDWARDS
+                     : MPI_EC_WEIERSTRASS);
+       sk.E.dialect = ((ctx.flags & PUBKEY_FLAG_EDDSA)
+                       ? ECC_DIALECT_ED25519
+@@ -938,7 +938,7 @@ ecc_verify (gcry_sexp_t s_sig, gcry_sexp
+   if (!curvename)
+     {
+       pk.E.model = ((sigflags & PUBKEY_FLAG_EDDSA)
+-                    ? MPI_EC_TWISTEDEDWARDS
++                    ? MPI_EC_EDWARDS
+                     : MPI_EC_WEIERSTRASS);
+       pk.E.dialect = ((sigflags & PUBKEY_FLAG_EDDSA)
+                       ? ECC_DIALECT_ED25519
+@@ -1528,7 +1528,7 @@ compute_keygrip (gcry_md_hd_t md, gcry_s
+   if (!curvename)
+     {
+       model = ((flags & PUBKEY_FLAG_EDDSA)
+-               ? MPI_EC_TWISTEDEDWARDS
++               ? MPI_EC_EDWARDS
+                : MPI_EC_WEIERSTRASS);
+       dialect = ((flags & PUBKEY_FLAG_EDDSA)
+                  ? ECC_DIALECT_ED25519
+Index: libgcrypt-1.6.3/mpi/ec.c
+===================================================================
+--- libgcrypt-1.6.3.orig/mpi/ec.c
++++ libgcrypt-1.6.3/mpi/ec.c
+@@ -605,7 +605,7 @@ _gcry_mpi_ec_get_affine (gcry_mpi_t x, g
+       }
+       return -1;
+ 
+-    case MPI_EC_TWISTEDEDWARDS:
++    case MPI_EC_EDWARDS:
+       {
+         gcry_mpi_t z;
+ 
+@@ -725,7 +725,7 @@ dup_point_montgomery (mpi_point_t result
+ 
+ /*  RESULT = 2 * POINT  (Twisted Edwards version). */
+ static void
+-dup_point_twistededwards (mpi_point_t result, mpi_point_t point, mpi_ec_t ctx)
++dup_point_edwards (mpi_point_t result, mpi_point_t point, mpi_ec_t ctx)
+ {
+ #define X1 (point->x)
+ #define Y1 (point->y)
+@@ -811,8 +811,8 @@ _gcry_mpi_ec_dup_point (mpi_point_t resu
+     case MPI_EC_MONTGOMERY:
+       dup_point_montgomery (result, point, ctx);
+       break;
+-    case MPI_EC_TWISTEDEDWARDS:
+-      dup_point_twistededwards (result, point, ctx);
++    case MPI_EC_EDWARDS:
++      dup_point_edwards (result, point, ctx);
+       break;
+     }
+ }
+@@ -977,9 +977,9 @@ add_points_montgomery (mpi_point_t resul
+ 
+ /* RESULT = P1 + P2  (Twisted Edwards version).*/
+ static void
+-add_points_twistededwards (mpi_point_t result,
+-                           mpi_point_t p1, mpi_point_t p2,
+-                           mpi_ec_t ctx)
++add_points_edwards (mpi_point_t result,
++                    mpi_point_t p1, mpi_point_t p2,
++                    mpi_ec_t ctx)
+ {
+ #define X1 (p1->x)
+ #define Y1 (p1->y)
+@@ -1087,8 +1087,8 @@ _gcry_mpi_ec_add_points (mpi_point_t res
+     case MPI_EC_MONTGOMERY:
+       add_points_montgomery (result, p1, p2, ctx);
+       break;
+-    case MPI_EC_TWISTEDEDWARDS:
+-      add_points_twistededwards (result, p1, p2, ctx);
++    case MPI_EC_EDWARDS:
++      add_points_edwards (result, p1, p2, ctx);
+       break;
+     }
+ }
+@@ -1106,7 +1106,7 @@ _gcry_mpi_ec_mul_point (mpi_point_t resu
+   unsigned int i, loops;
+   mpi_point_struct p1, p2, p1inv;
+ 
+-  if (ctx->model == MPI_EC_TWISTEDEDWARDS)
++  if (ctx->model == MPI_EC_EDWARDS)
+     {
+       /* Simple left to right binary method.  GECC Algorithm 3.27 */
+       unsigned int nbits;
+@@ -1269,7 +1269,7 @@ _gcry_mpi_ec_curve_point (gcry_mpi_point
+       log_fatal ("%s: %s not yet supported\n",
+                  "_gcry_mpi_ec_curve_point", "Montgomery");
+       break;
+-    case MPI_EC_TWISTEDEDWARDS:
++    case MPI_EC_EDWARDS:
+       {
+         /* a · x^2 + y^2 - 1 - b · x^2 · y^2 == 0 */
+         ec_pow2 (x, x, ctx);
+Index: libgcrypt-1.6.3/src/mpi.h
+===================================================================
+--- libgcrypt-1.6.3.orig/src/mpi.h
++++ libgcrypt-1.6.3/src/mpi.h
+@@ -245,13 +245,18 @@ void _gcry_mpi_snatch_point (gcry_mpi_t
+ /* Models describing an elliptic curve.  */
+ enum gcry_mpi_ec_models
+   {
+-
++    /* The Short Weierstrass equation is
++          y^2 = x^3 + ax + b
++     */
+     MPI_EC_WEIERSTRASS = 0,
++    /* The Montgomery equation is
++          by^2 = x^3 + ax^2 + x
++     */
+     MPI_EC_MONTGOMERY,
+-    MPI_EC_TWISTEDEDWARDS
+-    /* The equation for Twisted Edwards curves is
++    /* The Twisted Edwards equation is
+           ax^2 + y^2 = 1 + bx^2y^2
+        Note that we use 'b' instead of the commonly used 'd'.  */
++    MPI_EC_EDWARDS
+   };
+ 
+ /* Dialects used with elliptic curves.  It is easier to keep the
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch b/meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch
new file mode 100644
index 0000000..8093a18
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch
@@ -0,0 +1,55 @@
+From 88e1358962e902ff1cbec8d53ba3eee46407851a Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 25 Nov 2015 12:46:19 +0900
+Subject: [PATCH] ecc: Constant-time multiplication for Weierstrass curve.
+
+* mpi/ec.c (_gcry_mpi_ec_mul_point): Use simple left-to-right binary
+method for Weierstrass curve when SCALAR is secure.
+
+Upstream-Status: Backport
+
+http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=88e1358962e902ff1cbec8d53ba3eee46407851a
+
+CVE: CVE-2015-7511 fix
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ mpi/ec.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+Index: libgcrypt-1.6.3/mpi/ec.c
+===================================================================
+--- libgcrypt-1.6.3.orig/mpi/ec.c
++++ libgcrypt-1.6.3/mpi/ec.c
+@@ -1106,16 +1106,27 @@ _gcry_mpi_ec_mul_point (mpi_point_t resu
+   unsigned int i, loops;
+   mpi_point_struct p1, p2, p1inv;
+ 
+-  if (ctx->model == MPI_EC_EDWARDS)
++  if (ctx->model == MPI_EC_EDWARDS
++      || (ctx->model == MPI_EC_WEIERSTRASS
++          && mpi_is_secure (scalar)))
+     {
+       /* Simple left to right binary method.  GECC Algorithm 3.27 */
+       unsigned int nbits;
+       int j;
+ 
+       nbits = mpi_get_nbits (scalar);
+-      mpi_set_ui (result->x, 0);
+-      mpi_set_ui (result->y, 1);
+-      mpi_set_ui (result->z, 1);
++      if (ctx->model == MPI_EC_WEIERSTRASS)
++        {
++          mpi_set_ui (result->x, 1);
++          mpi_set_ui (result->y, 1);
++          mpi_set_ui (result->z, 0);
++        }
++      else
++        {
++          mpi_set_ui (result->x, 0);
++          mpi_set_ui (result->y, 1);
++          mpi_set_ui (result->z, 1);
++        }
+ 
+       if (mpi_is_secure (scalar))
+         {
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
index cd06ce7..db89faf 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
@@ -1,4 +1,8 @@
 require libgcrypt.inc
 
+SRC_URI += "\
+        file://CVE-2015-7511_1.patch \
+        file://CVE-2015-7511_2.patch \
+        "
 SRC_URI[md5sum] = "de03b867d02fdf115a1bac8bb8b5c3a3"
 SRC_URI[sha256sum] = "69e94e1a7084d94e1a6ca26d436068cb74862d10a7353cfae579a2d88674ff09"
-- 
2.3.5


