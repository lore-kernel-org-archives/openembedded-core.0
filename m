Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 761566FA92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q8VW3a002954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 01:31:32 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 01:31:32 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 16:32:13 +0800
Message-ID: <90ee1fd80daec291d0e845782529736fd214cab2.1395822606.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395822606.git.jackie.huang@windriver.com>
References: <cover.1395822606.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnupg: CVE-2013-4576
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
X-List-Received-Date: Wed, 26 Mar 2014 08:31:32 -0000
Content-Type: text/plain

From: Yong Zhang <yong.zhang@windriver.com>

GnuPG 1.x before 1.4.16 generates RSA keys using sequences of introductions
with certain patterns that introduce a side channel, which allows physically
proximate attackers to extract RSA keys via a chosen-ciphertext attack and
acoustic cryptanalysis during decryption. NOTE: applications are not typically
expected to protect themselves from acoustic side-channel attacks, since this
is arguably the responsibility of the physical device. Accordingly, issues of
this type would not normally receive a CVE identifier. However, for this
issue, the developer has specified a security policy in which GnuPG should
offer side-channel resistance, and developer-specified security-policy
violations are within the scope of CVE.

Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../gnupg/gnupg-1.4.7/CVE-2013-4576.patch          |  153 ++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch
new file mode 100644
index 0000000..b1a22f5
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch
@@ -0,0 +1,153 @@
+Upstream-Status: Backport
+
+Index: gnupg-1.4.7/cipher/dsa.c
+===================================================================
+--- gnupg-1.4.7.orig/cipher/dsa.c	2006-12-12 02:27:21.000000000 +0800
++++ gnupg-1.4.7/cipher/dsa.c	2014-01-23 11:30:17.300915919 +0800
+@@ -287,6 +287,8 @@
+     MPI kinv;
+     MPI tmp;
+ 
++    mpi_normalize (hash);
++
+     /* select a random k with 0 < k < q */
+     k = gen_k( skey->q );
+ 
+Index: gnupg-1.4.7/cipher/elgamal.c
+===================================================================
+--- gnupg-1.4.7.orig/cipher/elgamal.c	2006-12-12 03:08:05.000000000 +0800
++++ gnupg-1.4.7/cipher/elgamal.c	2014-01-23 11:30:17.300915919 +0800
+@@ -376,6 +376,9 @@
+ {
+     MPI t1 = mpi_alloc_secure( mpi_get_nlimbs( skey->p ) );
+ 
++    mpi_normalize (a);
++    mpi_normalize (b);
++
+     /* output = b/(a^x) mod p */
+     mpi_powm( t1, a, skey->x, skey->p );
+     mpi_invm( t1, t1, skey->p );
+Index: gnupg-1.4.7/cipher/random.c
+===================================================================
+--- gnupg-1.4.7.orig/cipher/random.c	2006-11-03 18:09:39.000000000 +0800
++++ gnupg-1.4.7/cipher/random.c	2014-01-23 11:31:53.993495462 +0800
+@@ -273,6 +273,18 @@
+ }
+ 
+ 
++/* Randomize the MPI */ 
++void
++randomize_mpi (MPI mpi, size_t nbits, int level)
++{
++  unsigned char *buffer;
++
++  buffer = get_random_bits (nbits, level, mpi_is_secure (mpi));
++  mpi_set_buffer (mpi, buffer, (nbits+7)/8, 0);
++  xfree (buffer);
++}
++
++
+ int
+ random_is_faked()
+ {
+Index: gnupg-1.4.7/cipher/random.h
+===================================================================
+--- gnupg-1.4.7.orig/cipher/random.h	2006-02-09 19:29:29.000000000 +0800
++++ gnupg-1.4.7/cipher/random.h	2014-01-23 11:30:17.300915919 +0800
+@@ -32,6 +32,7 @@
+ int  random_is_faked(void);
+ void random_disable_locking (void);
+ void randomize_buffer( byte *buffer, size_t length, int level );
++void randomize_mpi (MPI mpi, size_t nbits, int level);
+ byte *get_random_bits( size_t nbits, int level, int secure );
+ void fast_random_poll( void );
+ 
+Index: gnupg-1.4.7/cipher/rsa.c
+===================================================================
+--- gnupg-1.4.7.orig/cipher/rsa.c	2006-12-12 03:09:00.000000000 +0800
++++ gnupg-1.4.7/cipher/rsa.c	2014-01-23 11:35:04.330639125 +0800
+@@ -301,9 +301,26 @@
+ #if 0
+     mpi_powm( output, input, skey->d, skey->n );
+ #else
+-    MPI m1   = mpi_alloc_secure( mpi_get_nlimbs(skey->n)+1 );
+-    MPI m2   = mpi_alloc_secure( mpi_get_nlimbs(skey->n)+1 );
+-    MPI h    = mpi_alloc_secure( mpi_get_nlimbs(skey->n)+1 );
++    int nlimbs = mpi_get_nlimbs (skey->n)+1;
++    MPI m1   = mpi_alloc_secure (nlimbs);
++    MPI m2   = mpi_alloc_secure (nlimbs);
++    MPI h    = mpi_alloc_secure (nlimbs);
++# if 1
++    MPI bdata= mpi_alloc_secure (nlimbs);
++    MPI r    = mpi_alloc_secure (nlimbs);
++# endif
++
++    /* Remove superfluous leading zeroes from INPUT.  */
++    mpi_normalize (input);
++
++# if 1 
++    /* Blind:  bdata = (data * r^e) mod n   */
++    randomize_mpi (r, mpi_get_nbits (skey->n), 0);
++    mpi_fdiv_r (r, r, skey->n);
++    mpi_powm (bdata, r, skey->e, skey->n);
++    mpi_mulm (bdata, bdata, input, skey->n);
++    input = bdata;
++# endif
+ 
+     /* m1 = c ^ (d mod (p-1)) mod p */
+     mpi_sub_ui( h, skey->p, 1  );
+@@ -321,8 +338,15 @@
+     /* m = m2 + h * p */
+     mpi_mul ( h, h, skey->p );
+     mpi_add ( output, m1, h );
+-    /* ready */
+-    
++
++# if 1
++    mpi_free (bdata);
++    /* Unblind: output = (output * r^(-1)) mod n  */
++    mpi_invm (r, r, skey->n);
++    mpi_mulm (output, output, r, skey->n);
++    mpi_free (r);
++# endif
++
+     mpi_free ( h );
+     mpi_free ( m1 );
+     mpi_free ( m2 );
+@@ -397,6 +421,7 @@
+ rsa_decrypt( int algo, MPI *result, MPI *data, MPI *skey )
+ {
+     RSA_secret_key sk;
++    MPI input;
+ 
+     if( algo != 1 && algo != 2 )
+ 	return G10ERR_PUBKEY_ALGO;
+@@ -407,8 +432,14 @@
+     sk.p = skey[3];
+     sk.q = skey[4];
+     sk.u = skey[5];
+-    *result = mpi_alloc_secure( mpi_get_nlimbs( sk.n ) );
+-    secret( *result, data[0], &sk );
++
++    /* Mitigates side-channel attacks (CVE-2013-4576).  */
++    input = mpi_alloc (0);
++    mpi_normalize (data[0]);
++    mpi_fdiv_r (input, data[0], sk.n);
++    *result = mpi_alloc_secure (mpi_get_nlimbs (sk.n));
++    secret (*result, input, &sk);
++    mpi_free (input);
+     return 0;
+ }
+ 
+Index: gnupg-1.4.7/g10/gpgv.c
+===================================================================
+--- gnupg-1.4.7.orig/g10/gpgv.c	2006-12-13 19:25:04.000000000 +0800
++++ gnupg-1.4.7/g10/gpgv.c	2014-01-23 11:30:17.300915919 +0800
+@@ -390,6 +390,7 @@
+ void random_dump_stats(void) {}
+ int quick_random_gen( int onoff ) { return -1;}
+ void randomize_buffer( byte *buffer, size_t length, int level ) {}
++void randomize_mpi (MPI mpi, size_t nbits, int level) {}
+ int random_is_faked() { return -1;}
+ byte *get_random_bits( size_t nbits, int level, int secure ) { return NULL;}
+ void set_random_seed_file( const char *name ) {}
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index 83d8fab..e8f797d 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -16,6 +16,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
            file://GnuPG1-CVE-2012-6085.patch \
            file://curl_typeof_fix_backport.patch \
            file://CVE-2013-4351.patch \
+           file://CVE-2013-4576.patch \
 	  "
 
 SRC_URI[md5sum] = "b06a141cca5cd1a55bbdd25ab833303c"
-- 
1.7.9.5


