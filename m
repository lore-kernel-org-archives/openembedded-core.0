Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4BAC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 07:15:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.48318.1638774950776060064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 23:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iR9c2UhC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o20so38874308eds.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 23:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wpoXMFfrwDTkxQaqy8sdHYAqpuZdUmz1eijm3gsHQq0=;
        b=iR9c2UhCZVHBRXzofdmxaBHjMJ9XK6jXOiqeAdoTsbbhrkihED6v/acSF0WIdDwkGx
         6ahlD1x6VELH7Wx238Qxpwke/40Ul1lzRRApVxB2UkfP5SqloVMVh+uw1dRoyC83tvOJ
         03fkGZ1/LbNzG3lGn4QBYbmby70M7b5n9aXE8EH8Z+00SzQ/1RCwdBxT3S1BpzntauYE
         COjXEFM/lHp76aFJzJUdZg1qx5k5kOcOG4xESh7H3Gitv9mE9tmYLypaBPlIyCXEQQRk
         JKVvhEX5fnaW73yMvIc3Ejk1zrU2dhsBbtOtva2PlBa/KHSeChK+Uk+nyNisGjuaaAMg
         44zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wpoXMFfrwDTkxQaqy8sdHYAqpuZdUmz1eijm3gsHQq0=;
        b=SHLXTDry7dygutQKZblXybC+PgtGP85LDbEx3XWqMbIeMLwA07IxBAXxmfTre3WWN8
         Nl9oFQOvq+tzw8cXkydUzvFU7ijkT/EPzD7I0JUgx3xfESrOxPANVP1Fmt1LNMtj8LrG
         QnmrzETzechLadLatGYwAeHprkazmnCwaTs0rfgTemn/WANL0U/WRAkYMviBQ19xsaNz
         vAEm+RKUYEFhFd/dp88WcRsbC9tVPwi+QRh2wrlAV6CEzH2fc1ofAtvwFvn5ucb1ZmsK
         xwev+XLocm8EErg/zbBTKAqO0Mh5YtCfmlzWB9Qw3yB+TH8kAXHW7n+9JO7UeBO67vHr
         7OOw==
X-Gm-Message-State: AOAM531XAnIn4LWKi96EL9oNkadeoKb6UUvVIznKvjBBpZIFRU3Ff5PF
	AQBzEMZHzuj8TipoNDcFyUt8MSbPAUE=
X-Google-Smtp-Source: 
 ABdhPJwQ6rz02pMzkWAwqEZIMu29BzCCg6VU1GbYZEqpMWHsX4YkPzuMobd3j4E14dOX3DQ6Z7nO5A==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr52622030ede.390.1638774948651;
        Sun, 05 Dec 2021 23:15:48 -0800 (PST)
Received: from localhost.localdomain ([80.215.210.34])
        by smtp.gmail.com with ESMTPSA id
 z1sm7241276edq.54.2021.12.05.23.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 23:15:48 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@huawei.com>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com,
	akuster@mvista.com
Cc: Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [oe-core][dunfell][PATCH] libgcrypt: solve CVE-2021-33560 and
 CVE-2021-40528
Date: Mon,  6 Dec 2021 08:15:43 +0100
Message-Id: <20211206071543.7417-1-marta.rybczynska@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 07:15:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159207

This change fixes patches for two issues reported in a research
paper [1]: a side channel attack (*) and a cross-configuration
attack (**).

In this commit we add a fix for (*) that wasn't marked as a CVE
initially upstream. A fix of (**) previosly available in OE
backports is in fact fixing CVE-2021-40528, not CVE-2021-33560
as marked in the commit message.

We commit the accual fix for CVE-2021-33560 and rename the
existing fix with the correct CVE-2021-40528.

For details of the mismatch and the timeline see [2] (fix of the
documentation) and [3] (the related ticket upstream).

[1] https://eprint.iacr.org/2021/923.pdf
[2] https://dev.gnupg.org/rCb118681ebc4c9ea4b9da79b0f9541405a64f4c13
[3] https://dev.gnupg.org/T5328#149606

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../libgcrypt/files/CVE-2021-33560.patch      | 138 +++++++-----------
 .../libgcrypt/files/CVE-2021-40528.patch      | 109 ++++++++++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |   1 +
 3 files changed, 163 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2021-40528.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch b/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
index c0d00485e6..bf26486d8b 100644
--- a/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
+++ b/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
@@ -1,109 +1,77 @@
-From 707c3c5c511ee70ad0e39ec613471f665305fbea Mon Sep 17 00:00:00 2001
+From e8b7f10be275bcedb5fc05ed4837a89bfd605c61 Mon Sep 17 00:00:00 2001
 From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 21 May 2021 11:15:07 +0900
-Subject: [PATCH] cipher: Fix ElGamal encryption for other implementations.
+Date: Tue, 13 Apr 2021 10:00:00 +0900
+Subject: [PATCH] cipher: Hardening ElGamal by introducing exponent blinding
+ too.
 
-* cipher/elgamal.c (gen_k): Remove support of smaller K.
-(do_encrypt): Never use smaller K.
-(sign): Folllow the change of gen_k.
+* cipher/elgamal.c (do_encrypt): Also do exponent blinding.
 
 --
 
-Cherry-pick master commit of:
-	632d80ef30e13de6926d503aa697f92b5dbfbc5e
+Base blinding had been introduced with USE_BLINDING.  This patch add
+exponent blinding as well to mitigate side-channel attack on mpi_powm.
 
-This change basically reverts encryption changes in two commits:
-
-	74386120dad6b3da62db37f7044267c8ef34689b
-	78531373a342aeb847950f404343a05e36022065
-
-Use of smaller K for ephemeral key in ElGamal encryption is only good,
-when we can guarantee that recipient's key is generated by our
-implementation (or compatible).
-
-For detail, please see:
-
-    Luca De Feo, Bertram Poettering, Alessandro Sorniotti,
-    "On the (in)security of ElGamal in OpenPGP";
-    in the proceedings of  CCS'2021.
-
-CVE-id: CVE-2021-33560
 GnuPG-bug-id: 5328
-Suggested-by: Luca De Feo, Bertram Poettering, Alessandro Sorniotti
 Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
 
 Upstream-Status: Backport
 CVE: CVE-2021-33560
-Signed-off-by: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
 ---
- cipher/elgamal.c | 24 ++++++------------------
- 1 file changed, 6 insertions(+), 18 deletions(-)
+ cipher/elgamal.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/cipher/elgamal.c b/cipher/elgamal.c
-index 4eb52d62..ae7a631e 100644
+index 4eb52d62..9835122f 100644
 --- a/cipher/elgamal.c
 +++ b/cipher/elgamal.c
-@@ -66,7 +66,7 @@ static const char *elg_names[] =
- 
+@@ -522,8 +522,9 @@ do_encrypt(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_public_key *pkey )
+ static void
+ decrypt (gcry_mpi_t output, gcry_mpi_t a, gcry_mpi_t b, ELG_secret_key *skey )
+ {
+-  gcry_mpi_t t1, t2, r;
++  gcry_mpi_t t1, t2, r, r1, h;
+   unsigned int nbits = mpi_get_nbits (skey->p);
++  gcry_mpi_t x_blind;
  
- static int test_keys (ELG_secret_key *sk, unsigned int nbits, int nodie);
--static gcry_mpi_t gen_k (gcry_mpi_t p, int small_k);
-+static gcry_mpi_t gen_k (gcry_mpi_t p);
- static gcry_err_code_t generate (ELG_secret_key *sk, unsigned nbits,
-                                  gcry_mpi_t **factors);
- static int  check_secret_key (ELG_secret_key *sk);
-@@ -189,11 +189,10 @@ test_keys ( ELG_secret_key *sk, unsigned int nbits, int nodie )
+   mpi_normalize (a);
+   mpi_normalize (b);
+@@ -534,20 +535,33 @@ decrypt (gcry_mpi_t output, gcry_mpi_t a, gcry_mpi_t b, ELG_secret_key *skey )
  
- /****************
-  * Generate a random secret exponent k from prime p, so that k is
-- * relatively prime to p-1.  With SMALL_K set, k will be selected for
-- * better encryption performance - this must never be used signing!
-+ * relatively prime to p-1.
-  */
- static gcry_mpi_t
--gen_k( gcry_mpi_t p, int small_k )
-+gen_k( gcry_mpi_t p )
- {
-   gcry_mpi_t k = mpi_alloc_secure( 0 );
-   gcry_mpi_t temp = mpi_alloc( mpi_get_nlimbs(p) );
-@@ -202,18 +201,7 @@ gen_k( gcry_mpi_t p, int small_k )
-   unsigned int nbits, nbytes;
-   char *rndbuf = NULL;
+   t2 = mpi_snew (nbits);
+   r  = mpi_new (nbits);
++  r1 = mpi_new (nbits);
++  h  = mpi_new (nbits);
++  x_blind = mpi_snew (nbits);
  
--  if (small_k)
--    {
--      /* Using a k much lesser than p is sufficient for encryption and
--       * it greatly improves the encryption performance.  We use
--       * Wiener's table and add a large safety margin. */
--      nbits = wiener_map( orig_nbits ) * 3 / 2;
--      if( nbits >= orig_nbits )
--        BUG();
--    }
--  else
--    nbits = orig_nbits;
--
-+  nbits = orig_nbits;
+   /* We need a random number of about the prime size.  The random
+      number merely needs to be unpredictable; thus we use level 0.  */
+   _gcry_mpi_randomize (r, nbits, GCRY_WEAK_RANDOM);
  
-   nbytes = (nbits+7)/8;
-   if( DBG_CIPHER )
-@@ -492,7 +480,7 @@ do_encrypt(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_public_key *pkey )
-    * error code.
-    */
++  /* Also, exponent blinding: x_blind = x + (p-1)*r1 */
++  _gcry_mpi_randomize (r1, nbits, GCRY_WEAK_RANDOM);
++  mpi_set_highbit (r1, nbits - 1);
++  mpi_sub_ui (h, skey->p, 1);
++  mpi_mul (x_blind, h, r1);
++  mpi_add (x_blind, skey->x, x_blind);
++
+   /* t1 = r^x mod p */
+-  mpi_powm (t1, r, skey->x, skey->p);
++  mpi_powm (t1, r, x_blind, skey->p);
+   /* t2 = (a * r)^-x mod p */
+   mpi_mulm (t2, a, r, skey->p);
+-  mpi_powm (t2, t2, skey->x, skey->p);
++  mpi_powm (t2, t2, x_blind, skey->p);
+   mpi_invm (t2, t2, skey->p);
+   /* t1 = (t1 * t2) mod p*/
+   mpi_mulm (t1, t1, t2, skey->p);
  
--  k = gen_k( pkey->p, 1 );
-+  k = gen_k( pkey->p );
-   mpi_powm (a, pkey->g, k, pkey->p);
++  mpi_free (x_blind);
++  mpi_free (h);
++  mpi_free (r1);
+   mpi_free (r);
+   mpi_free (t2);
  
-   /* b = (y^k * input) mod p
-@@ -594,7 +582,7 @@ sign(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_secret_key *skey )
-     *
-     */
-     mpi_sub_ui(p_1, p_1, 1);
--    k = gen_k( skey->p, 0 /* no small K ! */ );
-+    k = gen_k( skey->p );
-     mpi_powm( a, skey->g, k, skey->p );
-     mpi_mul(t, skey->x, a );
-     mpi_subm(t, input, t, p_1 );
 -- 
-2.30.2
+2.11.0
 
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2021-40528.patch b/meta/recipes-support/libgcrypt/files/CVE-2021-40528.patch
new file mode 100644
index 0000000000..b3a18bc5aa
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2021-40528.patch
@@ -0,0 +1,109 @@
+From 707c3c5c511ee70ad0e39ec613471f665305fbea Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 21 May 2021 11:15:07 +0900
+Subject: [PATCH] cipher: Fix ElGamal encryption for other implementations.
+
+* cipher/elgamal.c (gen_k): Remove support of smaller K.
+(do_encrypt): Never use smaller K.
+(sign): Folllow the change of gen_k.
+
+--
+
+Cherry-pick master commit of:
+	632d80ef30e13de6926d503aa697f92b5dbfbc5e
+
+This change basically reverts encryption changes in two commits:
+
+	74386120dad6b3da62db37f7044267c8ef34689b
+	78531373a342aeb847950f404343a05e36022065
+
+Use of smaller K for ephemeral key in ElGamal encryption is only good,
+when we can guarantee that recipient's key is generated by our
+implementation (or compatible).
+
+For detail, please see:
+
+    Luca De Feo, Bertram Poettering, Alessandro Sorniotti,
+    "On the (in)security of ElGamal in OpenPGP";
+    in the proceedings of  CCS'2021.
+
+CVE-id: CVE-2021-33560
+GnuPG-bug-id: 5328
+Suggested-by: Luca De Feo, Bertram Poettering, Alessandro Sorniotti
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-40528
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ cipher/elgamal.c | 24 ++++++------------------
+ 1 file changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/cipher/elgamal.c b/cipher/elgamal.c
+index 4eb52d62..ae7a631e 100644
+--- a/cipher/elgamal.c
++++ b/cipher/elgamal.c
+@@ -66,7 +66,7 @@ static const char *elg_names[] =
+ 
+ 
+ static int test_keys (ELG_secret_key *sk, unsigned int nbits, int nodie);
+-static gcry_mpi_t gen_k (gcry_mpi_t p, int small_k);
++static gcry_mpi_t gen_k (gcry_mpi_t p);
+ static gcry_err_code_t generate (ELG_secret_key *sk, unsigned nbits,
+                                  gcry_mpi_t **factors);
+ static int  check_secret_key (ELG_secret_key *sk);
+@@ -189,11 +189,10 @@ test_keys ( ELG_secret_key *sk, unsigned int nbits, int nodie )
+ 
+ /****************
+  * Generate a random secret exponent k from prime p, so that k is
+- * relatively prime to p-1.  With SMALL_K set, k will be selected for
+- * better encryption performance - this must never be used signing!
++ * relatively prime to p-1.
+  */
+ static gcry_mpi_t
+-gen_k( gcry_mpi_t p, int small_k )
++gen_k( gcry_mpi_t p )
+ {
+   gcry_mpi_t k = mpi_alloc_secure( 0 );
+   gcry_mpi_t temp = mpi_alloc( mpi_get_nlimbs(p) );
+@@ -202,18 +201,7 @@ gen_k( gcry_mpi_t p, int small_k )
+   unsigned int nbits, nbytes;
+   char *rndbuf = NULL;
+ 
+-  if (small_k)
+-    {
+-      /* Using a k much lesser than p is sufficient for encryption and
+-       * it greatly improves the encryption performance.  We use
+-       * Wiener's table and add a large safety margin. */
+-      nbits = wiener_map( orig_nbits ) * 3 / 2;
+-      if( nbits >= orig_nbits )
+-        BUG();
+-    }
+-  else
+-    nbits = orig_nbits;
+-
++  nbits = orig_nbits;
+ 
+   nbytes = (nbits+7)/8;
+   if( DBG_CIPHER )
+@@ -492,7 +480,7 @@ do_encrypt(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_public_key *pkey )
+    * error code.
+    */
+ 
+-  k = gen_k( pkey->p, 1 );
++  k = gen_k( pkey->p );
+   mpi_powm (a, pkey->g, k, pkey->p);
+ 
+   /* b = (y^k * input) mod p
+@@ -594,7 +582,7 @@ sign(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_secret_key *skey )
+     *
+     */
+     mpi_sub_ui(p_1, p_1, 1);
+-    k = gen_k( skey->p, 0 /* no small K ! */ );
++    k = gen_k( skey->p );
+     mpi_powm( a, skey->g, k, skey->p );
+     mpi_mul(t, skey->x, a );
+     mpi_subm(t, input, t, p_1 );
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 174b087b24..8045bab9ed 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
            file://determinism.patch \
            file://CVE-2021-33560.patch \
+           file://CVE-2021-40528.patch \
 "
 SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
 SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
-- 
2.33.0


