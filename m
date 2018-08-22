Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id AB06F792D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:03 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id r69-v6so1913790oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jFTPWMUaP8tELjD49uXJ9jw+TuVYg9KOmYfxUs0WuMA=;
	b=nao6mPMvtQaM1wSrU6DahUUt3XgP34lBaW5hCcUQRI1ZwsHRrC9RmvZw9S6XpQIt7O
	C/GJIOR872fHC6t+rkZLBCdQ0pTAaeT92RmG1n4cNggTTz+Q+50YQqPXcaPfHB0RysZT
	AtgHclq9VKH4JgkRBeuqwkRIzyXtY363jJS+eK9prhOPMtOKKxukfdG86Jn1zeWwbiqa
	LLVDSZf5RbWL2lp/QuU3V+lUOLceSsoT/pgPrC7GvakIDubZiC1XwhzaJ8HcxM+F5WR+
	lXXAzuj480LKDdN3i4gT1yajKRuuBAt+c92w2bHRLzjrgLNHRQaTcVbQZOa6ZHwdTtyS
	GvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jFTPWMUaP8tELjD49uXJ9jw+TuVYg9KOmYfxUs0WuMA=;
	b=Ag5YSRxImJEiBDeWJjXtGbdIZKNuRdV8aWTT0az9RcobmwUyReTc0c1mrxDatdsFu/
	A79+7ybyfHCT/ic/uueP3qJaxdIxOJ0904GH/ETx+kZlfJdhqgmaROW/yBNRHR1CbPgb
	eL7H+nM45WuQ3VPkbff/KzfePhHHvgOaRDiOqgrrGoyO20FLeJhyvk2R5uN6MlNkWbxB
	BaQ39I+rPeY+ObvNMd45jxVleQu774XNQy2HO4I/K133nbIoURoaclxZtutFjuhsTl5W
	0CKfrGeiIVNNrQ0ZL3AogFC7CbyOokhquvXhxuEyohiDo06qLZaBqAZWNZqTNijWhExT
	s5xg==
X-Gm-Message-State: APzg51CEq3v1Q+ivbu5Zh28EoX0DzWpeWm+jl3VXzglsjDBQZktKBrwf
	T6e7duKBPT4laoSxIFlOyMYlSo40ots=
X-Google-Smtp-Source: ANB0VdbDvnyq6grH6xiQ5GlFyr9ALXdD0HVizxUnYAILbQs1lb2zuY8qunXfqoGJKIVwcmXPTbqmng==
X-Received: by 2002:a54:4618:: with SMTP id
	p24-v6mr3615470oip.172.1534936684534; 
	Wed, 22 Aug 2018 04:18:04 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.18.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:04 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:55 +0530
Message-Id: <1534936615-11658-19-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 19/19] libgcrypt: CVE-2018-0495
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:03 -0000

From: Ferret on Shark <shark_admin@mvista.co>

ecc: Add blinding for ECDSA.

* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Blind secret D with
randomized nonce B.

--

CVE-id: CVE-2018-0495

Affects libgcrypt < 1.7.10 and libgcrypt < 1.8.3

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libgcrypt/files/CVE-2018-0495.patch            | 76 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch b/meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch
new file mode 100644
index 0000000..c16bd3a
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch
@@ -0,0 +1,76 @@
+From 9010d1576e278a4274ad3f4aa15776c28f6ba965 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 13 Jun 2018 15:28:58 +0900
+Subject: [PATCH] ecc: Add blinding for ECDSA.
+
+* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Blind secret D with
+randomized nonce B.
+
+--
+
+Reported-by: Keegan Ryan <Keegan.Ryan@nccgroup.trust>
+CVE-id: CVE-2018-0495
+
+Upstream-Status: Backport [http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=9010d1576e278a4274ad3f4aa15776c28f6ba965]
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ cipher/ecc-ecdsa.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
+index 1484830b..140e8c09 100644
+--- a/cipher/ecc-ecdsa.c
++++ b/cipher/ecc-ecdsa.c
+@@ -50,6 +50,8 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+   const void *abuf;
+   unsigned int abits, qbits;
+   mpi_ec_t ctx;
++  gcry_mpi_t b;                /* Random number needed for blinding.  */
++  gcry_mpi_t bi;               /* multiplicative inverse of B.        */
+ 
+   if (DBG_CIPHER)
+     log_mpidump ("ecdsa sign hash  ", input );
+@@ -61,6 +63,15 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+   if (rc)
+     return rc;
+ 
++  b  = mpi_snew (qbits);
++  bi = mpi_snew (qbits);
++  do
++    {
++      _gcry_mpi_randomize (b, qbits, GCRY_WEAK_RANDOM);
++      mpi_mod (b, b, skey->E.n);
++    }
++  while (!mpi_invm (bi, b, skey->E.n));
++
+   k = NULL;
+   dr = mpi_alloc (0);
+   sum = mpi_alloc (0);
+@@ -115,8 +126,11 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+         }
+       while (!mpi_cmp_ui (r, 0));
+ 
+-      mpi_mulm (dr, skey->d, r, skey->E.n); /* dr = d*r mod n  */
+-      mpi_addm (sum, hash, dr, skey->E.n);  /* sum = hash + (d*r) mod n  */
++      mpi_mulm (dr, b, skey->d, skey->E.n);
++      mpi_mulm (dr, dr, r, skey->E.n);      /* dr = d*r mod n (blinded with b) */
++      mpi_mulm (sum, b, hash, skey->E.n);
++      mpi_addm (sum, sum, dr, skey->E.n);   /* sum = hash + (d*r) mod n  (blinded with b) */
++      mpi_mulm (sum, bi, sum, skey->E.n);   /* undo blinding by b^-1 */
+       mpi_invm (k_1, k, skey->E.n);         /* k_1 = k^(-1) mod n  */
+       mpi_mulm (s, k_1, sum, skey->E.n);    /* s = k^(-1)*(hash+(d*r)) mod n */
+     }
+@@ -129,6 +143,8 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+     }
+ 
+  leave:
++  mpi_free (b);
++  mpi_free (bi);
+   _gcry_mpi_ec_free (ctx);
+   point_free (&I);
+   mpi_free (x);
+-- 
+2.13.3
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
index b36e653..9d036c8 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://CVE-2018-0495.patch \
 "
 SRC_URI[md5sum] = "cfb0b5c79eab07686b6898160a407139"
 SRC_URI[sha256sum] = "c8064cae7558144b13ef0eb87093412380efa16c4ee30ad12ecb54886a524c07"
-- 
2.7.4


