Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECE578215
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:07:17 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id 12so48467216wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PcO/pGgAxhB0StyJnQ6XhRBIbc7Oq8MGaXptPS90v8A=;
	b=jg6Eu3VX+6VboBqMETQYxLUcC/xCMzVRjiOJynjytO2rWJw0ryCRYkD7QZ5kPFXBj6
	Y0nr/x+8oVvxk937K922+K0aZFAIkK7hgupL+9wgfKMVZXNQDvBBkuRas/pk7Sksq+I8
	a2MHUu5t5n3EcflO5sgpeTM5Ai6ald7V2lljBlLTkGBtVfQ3YeM3LcVTksjdgMYnDz0F
	TxLgzRCYw+ir69yNoaVuCEkqwYC1QXqtfSufkjMkdDZfZ28Sq+ll7/jMk3fSS1s6Plcn
	l/coa66T1n9YJiXllezhikKqKEswWwU5oS6UYeF77Glnq1nB0EOL9q/a9sBwAdMaFbrY
	Kg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PcO/pGgAxhB0StyJnQ6XhRBIbc7Oq8MGaXptPS90v8A=;
	b=cG+FOhGwOUvnCjaHVym5PnSFNaS1EmiobfBIXIn34b5uacfS+5SRTuADiFrJk3JhVo
	p22DUfG8NynUKrGjYabpT8qX4nyxMVdw/HW0GWFoJdfmmkq1ki4+Euam+ihbbmmkUO4l
	FXUF3Vml87Wt8PnFbduHEfwvK41DyPvA2K6jAZIY8MnHMlROPOfG5S9UtGmyzqgw41NY
	RE7rH8a6wb4+XUR4BVN7Es3IGtDcrh7dzg7p3lOLESMT9WS0o8/aivfMydtvmdVj0dGs
	o5ra13akcC0H/OdrzXZW+ozRDR2KmpVMQlHj63miQlZ2fhFlLseD7qsg6yvGpzf5iVvd
	RvAQ==
X-Gm-Message-State: AIVw110wqQKdELJN6auGxLf4K7OCoarXRfy4KRccc8ZmyXRlTSKz1bxj
	uEdXmZas69f5mct98GM=
X-Received: by 10.28.109.26 with SMTP id i26mr3648522wmc.64.1500415637996;
	Tue, 18 Jul 2017 15:07:17 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x98sm5193449wrb.47.2017.07.18.15.07.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 15:07:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 23:07:09 +0100
Message-Id: <20170718220710.6362-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170718220710.6362-1-ross.burton@intel.com>
References: <20170718220710.6362-1-ross.burton@intel.com>
Subject: [PATCH][pyro 2/2] libgcrypt: fix CVE-2017-7526
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
X-List-Received-Date: Tue, 18 Jul 2017 22:07:18 -0000

Fixes CVE-2017-7526, 'flush+reload side-channel attack on RSA secret keys dubbed
"Sliding right into disaster"'.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libgcrypt/files/CVE-2017-7526.patch            | 455 +++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   1 +
 2 files changed, 456 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2017-7526.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2017-7526.patch b/meta/recipes-support/libgcrypt/files/CVE-2017-7526.patch
new file mode 100644
index 00000000000..384fa964ae5
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2017-7526.patch
@@ -0,0 +1,455 @@
+Flush+reload side-channel attack on RSA secret keys dubbed "Sliding right
+into disaster".
+
+CVE: CVE-2017-7526
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 12ee400c39e0ebb5fb819c3926d459c278fc99fd Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Tue, 4 Apr 2017 17:38:05 +0900
+Subject: [PATCH 1/5] mpi: Simplify mpi_powm.
+
+* mpi/mpi-pow.c (_gcry_mpi_powm): Simplify the loop.
+
+--
+
+This fix is not a solution for the problem reported (yet).  The
+problem is that the current algorithm of _gcry_mpi_powm depends on
+exponent and some information leaks is possible.
+
+Reported-by: Andreas Zankl <andreas.zankl@aisec.fraunhofer.de>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+(backport from master commit:
+719468e53133d3bdf12156c5bfdea2bf15f9f6f1)
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ mpi/mpi-pow.c | 105 +++++++++++++++++-----------------------------------------
+ 1 file changed, 30 insertions(+), 75 deletions(-)
+
+diff --git a/mpi/mpi-pow.c b/mpi/mpi-pow.c
+index a780ebd1..7b3dc318 100644
+--- a/mpi/mpi-pow.c
++++ b/mpi/mpi-pow.c
+@@ -609,12 +609,8 @@ _gcry_mpi_powm (gcry_mpi_t res,
+       if (e == 0)
+         {
+           j += c;
+-          i--;
+-          if ( i < 0 )
+-            {
+-              c = 0;
+-              break;
+-            }
++          if ( --i < 0 )
++            break;
+ 
+           e = ep[i];
+           c = BITS_PER_MPI_LIMB;
+@@ -629,38 +625,33 @@ _gcry_mpi_powm (gcry_mpi_t res,
+           c -= c0;
+           j += c0;
+ 
++          e0 = (e >> (BITS_PER_MPI_LIMB - W));
+           if (c >= W)
+-            {
+-              e0 = (e >> (BITS_PER_MPI_LIMB - W));
+-              e = (e << W);
+-              c -= W;
+-            }
++            c0 = 0;
+           else
+             {
+-              i--;
+-              if ( i < 0 )
++              if ( --i < 0 )
+                 {
+-                  e = (e >> (BITS_PER_MPI_LIMB - c));
+-                  break;
++                  e0 = (e >> (BITS_PER_MPI_LIMB - c));
++                  j += c - W;
++                  goto last_step;
++                }
++              else
++                {
++                  c0 = c;
++                  e = ep[i];
++                  c = BITS_PER_MPI_LIMB;
++                  e0 |= (e >> (BITS_PER_MPI_LIMB - (W - c0)));
+                 }
+-
+-              c0 = c;
+-              e0 = (e >> (BITS_PER_MPI_LIMB - W))
+-                | (ep[i] >> (BITS_PER_MPI_LIMB - W + c0));
+-              e = (ep[i] << (W - c0));
+-              c = BITS_PER_MPI_LIMB - W + c0;
+             }
+ 
++          e = e << (W - c0);
++          c -= (W - c0);
++
++        last_step:
+           count_trailing_zeros (c0, e0);
+           e0 = (e0 >> c0) >> 1;
+ 
+-          for (j += W - c0; j; j--)
+-            {
+-              mul_mod (xp, &xsize, rp, rsize, rp, rsize, mp, msize, &karactx);
+-              tp = rp; rp = xp; xp = tp;
+-              rsize = xsize;
+-            }
+-
+           /*
+            *  base_u <= precomp[e0]
+            *  base_u_size <= precomp_size[e0]
+@@ -677,25 +668,23 @@ _gcry_mpi_powm (gcry_mpi_t res,
+               u.d = precomp[k];
+ 
+               mpi_set_cond (&w, &u, k == e0);
+-              base_u_size |= (precomp_size[k] & ((mpi_size_t)0 - (k == e0)) );
++              base_u_size |= ( precomp_size[k] & ((mpi_size_t)0 - (k == e0)) );
+             }
+ 
+-          mul_mod (xp, &xsize, rp, rsize, base_u, base_u_size,
+-                   mp, msize, &karactx);
+-          tp = rp; rp = xp; xp = tp;
+-          rsize = xsize;
++          for (j += W - c0; j >= 0; j--)
++            {
++              mul_mod (xp, &xsize, rp, rsize,
++                       j == 0 ? base_u : rp, j == 0 ? base_u_size : rsize,
++                       mp, msize, &karactx);
++              tp = rp; rp = xp; xp = tp;
++              rsize = xsize;
++            }
+ 
+           j = c0;
++          if ( i < 0 )
++            break;
+         }
+ 
+-    if (c != 0)
+-      {
+-        j += c;
+-        count_trailing_zeros (c, e);
+-        e = (e >> c);
+-        j -= c;
+-      }
+-
+     while (j--)
+       {
+         mul_mod (xp, &xsize, rp, rsize, rp, rsize, mp, msize, &karactx);
+@@ -703,40 +692,6 @@ _gcry_mpi_powm (gcry_mpi_t res,
+         rsize = xsize;
+       }
+ 
+-    if (e != 0)
+-      {
+-        /*
+-         * base_u <= precomp[(e>>1)]
+-         * base_u_size <= precomp_size[(e>>1)]
+-         */
+-        base_u_size = 0;
+-        for (k = 0; k < (1<< (W - 1)); k++)
+-          {
+-            struct gcry_mpi w, u;
+-            w.alloced = w.nlimbs = precomp_size[k];
+-            u.alloced = u.nlimbs = precomp_size[k];
+-            w.sign = u.sign = 0;
+-            w.flags = u.flags = 0;
+-            w.d = base_u;
+-            u.d = precomp[k];
+-
+-            mpi_set_cond (&w, &u, k == (e>>1));
+-            base_u_size |= (precomp_size[k] & ((mpi_size_t)0 - (k == (e>>1))) );
+-          }
+-
+-        mul_mod (xp, &xsize, rp, rsize, base_u, base_u_size,
+-                 mp, msize, &karactx);
+-        tp = rp; rp = xp; xp = tp;
+-        rsize = xsize;
+-
+-        for (; c; c--)
+-          {
+-            mul_mod (xp, &xsize, rp, rsize, rp, rsize, mp, msize, &karactx);
+-            tp = rp; rp = xp; xp = tp;
+-            rsize = xsize;
+-          }
+-      }
+-
+     /* We shifted MOD, the modulo reduction argument, left
+        MOD_SHIFT_CNT steps.  Adjust the result by reducing it with the
+        original MOD.
+-- 
+2.11.0
+
+
+From a4b275c4d5378837e820fdc84f4ada876f9c8ccd Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Sat, 24 Jun 2017 20:46:20 +0900
+Subject: [PATCH 2/5] Same computation for square and multiply.
+
+* mpi/mpi-pow.c (_gcry_mpi_powm): Compare msize for max_u_size.  Move
+the assignment to base_u into the loop.  Copy content refered by RP to
+BASE_U except the last of the loop.
+
+--
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(backport from master commit:
+78130828e9a140a9de4dafadbc844dbb64cb709a)
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ mpi/mpi-pow.c | 50 +++++++++++++++++++++++++++++---------------------
+ 1 file changed, 29 insertions(+), 21 deletions(-)
+
+diff --git a/mpi/mpi-pow.c b/mpi/mpi-pow.c
+index 7b3dc318..3cba6903 100644
+--- a/mpi/mpi-pow.c
++++ b/mpi/mpi-pow.c
+@@ -573,6 +573,8 @@ _gcry_mpi_powm (gcry_mpi_t res,
+         MPN_COPY (precomp[i], rp, rsize);
+       }
+ 
++    if (msize > max_u_size)
++      max_u_size = msize;
+     base_u = mpi_alloc_limb_space (max_u_size, esec);
+     MPN_ZERO (base_u, max_u_size);
+ 
+@@ -619,6 +621,10 @@ _gcry_mpi_powm (gcry_mpi_t res,
+         {
+           int c0;
+           mpi_limb_t e0;
++          struct gcry_mpi w, u;
++          w.sign = u.sign = 0;
++          w.flags = u.flags = 0;
++          w.d = base_u;
+ 
+           count_leading_zeros (c0, e);
+           e = (e << c0);
+@@ -652,29 +658,31 @@ _gcry_mpi_powm (gcry_mpi_t res,
+           count_trailing_zeros (c0, e0);
+           e0 = (e0 >> c0) >> 1;
+ 
+-          /*
+-           *  base_u <= precomp[e0]
+-           *  base_u_size <= precomp_size[e0]
+-           */
+-          base_u_size = 0;
+-          for (k = 0; k < (1<< (W - 1)); k++)
+-            {
+-              struct gcry_mpi w, u;
+-              w.alloced = w.nlimbs = precomp_size[k];
+-              u.alloced = u.nlimbs = precomp_size[k];
+-              w.sign = u.sign = 0;
+-              w.flags = u.flags = 0;
+-              w.d = base_u;
+-              u.d = precomp[k];
+-
+-              mpi_set_cond (&w, &u, k == e0);
+-              base_u_size |= ( precomp_size[k] & ((mpi_size_t)0 - (k == e0)) );
+-            }
+-
+           for (j += W - c0; j >= 0; j--)
+             {
+-              mul_mod (xp, &xsize, rp, rsize,
+-                       j == 0 ? base_u : rp, j == 0 ? base_u_size : rsize,
++
++              /*
++               *  base_u <= precomp[e0]
++               *  base_u_size <= precomp_size[e0]
++               */
++              base_u_size = 0;
++              for (k = 0; k < (1<< (W - 1)); k++)
++                {
++                  w.alloced = w.nlimbs = precomp_size[k];
++                  u.alloced = u.nlimbs = precomp_size[k];
++                  u.d = precomp[k];
++
++                  mpi_set_cond (&w, &u, k == e0);
++                  base_u_size |= ( precomp_size[k] & (0UL - (k == e0)) );
++                }
++
++              w.alloced = w.nlimbs = rsize;
++              u.alloced = u.nlimbs = rsize;
++              u.d = rp;
++              mpi_set_cond (&w, &u, j != 0);
++              base_u_size ^= ((base_u_size ^ rsize)  & (0UL - (j != 0)));
++
++              mul_mod (xp, &xsize, rp, rsize, base_u, base_u_size,
+                        mp, msize, &karactx);
+               tp = rp; rp = xp; xp = tp;
+               rsize = xsize;
+-- 
+2.11.0
+
+
+From 129c1960e55603ec3f6fd1cd9cd51b22e9a9a7ef Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Thu, 29 Jun 2017 11:48:44 +0900
+Subject: [PATCH 3/5] rsa: Add exponent blinding.
+
+* cipher/rsa.c (secret): Blind secret D with randomized nonce R for
+mpi_powm computation.
+
+--
+
+Co-authored-by: Werner Koch <wk@gnupg.org>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+The paper describing attack: https://eprint.iacr.org/2017/627
+
+Sliding right into disaster: Left-to-right sliding windows leak
+by Daniel J. Bernstein and Joachim Breitner and Daniel Genkin and
+Leon Groot Bruinderink and Nadia Heninger and Tanja Lange and
+Christine van Vredendaal and Yuval Yarom
+
+  It is well known that constant-time implementations of modular
+  exponentiation cannot use sliding windows. However, software
+  libraries such as Libgcrypt, used by GnuPG, continue to use sliding
+  windows. It is widely believed that, even if the complete pattern of
+  squarings and multiplications is observed through a side-channel
+  attack, the number of exponent bits leaked is not sufficient to
+  carry out a full key-recovery attack against RSA. Specifically,
+  4-bit sliding windows leak only 40% of the bits, and 5-bit sliding
+  windows leak only 33% of the bits.
+
+  In this paper we demonstrate a complete break of RSA-1024 as
+  implemented in Libgcrypt. Our attack makes essential use of the fact
+  that Libgcrypt uses the left-to-right method for computing the
+  sliding-window expansion. We show for the first time that the
+  direction of the encoding matters: the pattern of squarings and
+  multiplications in left-to-right sliding windows leaks significantly
+  more information about exponent bits than for right-to-left. We show
+  how to incorporate this additional information into the
+  Heninger-Shacham algorithm for partial key reconstruction, and use
+  it to obtain very efficient full key recovery for RSA-1024. We also
+  provide strong evidence that the same attack works for RSA-2048 with
+  only moderately more computation.
+
+Exponent blinding is a kind of workaround to add noise.  Signal (leak)
+is still there for non-constant-time implementation.
+
+(backported from master commit:
+8725c99ffa41778f382ca97233183bcd687bb0ce)
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ cipher/rsa.c | 32 +++++++++++++++++++++++++-------
+ 1 file changed, 25 insertions(+), 7 deletions(-)
+
+diff --git a/cipher/rsa.c b/cipher/rsa.c
+index b6c73741..25e29b5c 100644
+--- a/cipher/rsa.c
++++ b/cipher/rsa.c
+@@ -1021,15 +1021,33 @@ secret (gcry_mpi_t output, gcry_mpi_t input, RSA_secret_key *skey )
+       gcry_mpi_t m1 = mpi_alloc_secure( mpi_get_nlimbs(skey->n)+1 );
+       gcry_mpi_t m2 = mpi_alloc_secure( mpi_get_nlimbs(skey->n)+1 );
+       gcry_mpi_t h  = mpi_alloc_secure( mpi_get_nlimbs(skey->n)+1 );
+-
+-      /* m1 = c ^ (d mod (p-1)) mod p */
++      gcry_mpi_t D_blind = mpi_alloc_secure ( mpi_get_nlimbs(skey->n) + 1 );
++      gcry_mpi_t r;
++      unsigned int r_nbits;
++
++      r_nbits = mpi_get_nbits (skey->p) / 4;
++      if (r_nbits < 96)
++        r_nbits = 96;
++      r = mpi_alloc_secure ((r_nbits + BITS_PER_MPI_LIMB-1)/BITS_PER_MPI_LIMB);
++
++      /* d_blind = (d mod (p-1)) + (p-1) * r */
++      /* m1 = c ^ d_blind mod p */
++      _gcry_mpi_randomize (r, r_nbits, GCRY_WEAK_RANDOM);
++      mpi_set_highbit (r, r_nbits - 1);
+       mpi_sub_ui( h, skey->p, 1  );
+-      mpi_fdiv_r( h, skey->d, h );
+-      mpi_powm( m1, input, h, skey->p );
+-      /* m2 = c ^ (d mod (q-1)) mod q */
++      mpi_mul ( D_blind, h, r );
++      mpi_fdiv_r ( h, skey->d, h );
++      mpi_add ( D_blind, D_blind, h );
++      mpi_powm( m1, input, D_blind, skey->p );
++      /* d_blind = (d mod (q-1)) + (q-1) * r */
++      /* m2 = c ^ d_blind mod q */
++      _gcry_mpi_randomize (r, r_nbits, GCRY_WEAK_RANDOM);
++      mpi_set_highbit (r, r_nbits - 1);
+       mpi_sub_ui( h, skey->q, 1  );
+-      mpi_fdiv_r( h, skey->d, h );
+-      mpi_powm( m2, input, h, skey->q );
++      mpi_mul ( D_blind, h, r );
++      mpi_fdiv_r ( h, skey->d, h );
++      mpi_add ( D_blind, D_blind, h );
++      mpi_powm( m2, input, D_blind, skey->q );
+       /* h = u * ( m2 - m1 ) mod q */
+       mpi_sub( h, m2, m1 );
+       if ( mpi_has_sign ( h ) )
+-- 
+2.11.0
+
+
+From 8e1a6289b7d11a8bf6c94affa06c9794e7216e26 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Thu, 29 Jun 2017 12:36:27 +0900
+Subject: [PATCH 4/5] rsa: Fix exponent blinding.
+
+* cipher/rsa.c (secret): Free D_BLIND.
+
+--
+
+Fixes-commit: a9f612def801c8145d551d995475e5d51a4c988c
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ cipher/rsa.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cipher/rsa.c b/cipher/rsa.c
+index 25e29b5c..33f92ebd 100644
+--- a/cipher/rsa.c
++++ b/cipher/rsa.c
+@@ -1057,6 +1057,7 @@ secret (gcry_mpi_t output, gcry_mpi_t input, RSA_secret_key *skey )
+       mpi_mul ( h, h, skey->p );
+       mpi_add ( output, m1, h );
+ 
++      mpi_free ( D_blind );
+       mpi_free ( h );
+       mpi_free ( m1 );
+       mpi_free ( m2 );
+-- 
+2.11.0
+
+
+From 4e5497752172edc444029af645f28cb88ce93906 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Thu, 29 Jun 2017 12:40:19 +0900
+Subject: [PATCH 5/5] rsa: More fix.
+
+* cipher/rsa.c (secret): Free R.
+
+--
+
+Fixes-commit: a9f612def801c8145d551d995475e5d51a4c988c
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ cipher/rsa.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cipher/rsa.c b/cipher/rsa.c
+index 33f92ebd..8d8d157b 100644
+--- a/cipher/rsa.c
++++ b/cipher/rsa.c
+@@ -1057,6 +1057,7 @@ secret (gcry_mpi_t output, gcry_mpi_t input, RSA_secret_key *skey )
+       mpi_mul ( h, h, skey->p );
+       mpi_add ( output, m1, h );
+ 
++      mpi_free ( r );
+       mpi_free ( D_blind );
+       mpi_free ( h );
+       mpi_free ( m1 );
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index e95c059c875..3403579a70f 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
            file://fix-undefined-reference-to-pthread.patch \
            file://0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch \
+           file://CVE-2017-7526.patch \
 "
 
 BINCONFIG = "${bindir}/libgcrypt-config"
-- 
2.11.0


