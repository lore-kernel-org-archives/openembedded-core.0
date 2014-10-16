Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 754C260DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:51:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G9p336024094
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:51:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 16 Oct 2014 02:51:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 17:48:34 +0800
Message-ID: <9fab5e221250480a69cf8946bfc84b84597752e0.1413452836.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413452836.git.kai.kang@windriver.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 2/3] gnupg: CVE-2013-4242
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
X-List-Received-Date: Thu, 16 Oct 2014 09:51:02 -0000
Content-Type: text/plain

GnuPG before 1.4.14, and Libgcrypt before 1.5.3 as used in GnuPG 2.0.x
and possibly other products, allows local users to obtain private RSA
keys via a cache side-channel attack involving the L3 cache, aka
Flush+Reload.

Patch from commit e2202ff2b704623efc6277fb5256e4e15bac5676 in
git://git.gnupg.org/libgcrypt.git

Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gnupg/gnupg-1.4.7/CVE-2013-4242.patch          | 62 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch
new file mode 100644
index 0000000..c9addca
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch
@@ -0,0 +1,62 @@
+From e2202ff2b704623efc6277fb5256e4e15bac5676 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 25 Jul 2013 11:17:52 +0200
+Subject: [PATCH] Mitigate a flush+reload cache attack on RSA secret
+ exponents.
+
+commit e2202ff2b704623efc6277fb5256e4e15bac5676 from
+git://git.gnupg.org/libgcrypt.git
+
+* mpi/mpi-pow.c (gcry_mpi_powm): Always perfrom the mpi_mul for
+exponents in secure memory.
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+--
+
+The attack is published as http://eprint.iacr.org/2013/448 :
+
+Flush+Reload: a High Resolution, Low Noise, L3 Cache Side-Channel
+Attack by Yuval Yarom and Katrina Falkner. 18 July 2013.
+
+  Flush+Reload is a cache side-channel attack that monitors access to
+  data in shared pages. In this paper we demonstrate how to use the
+  attack to extract private encryption keys from GnuPG.  The high
+  resolution and low noise of the Flush+Reload attack enables a spy
+  program to recover over 98% of the bits of the private key in a
+  single decryption or signing round. Unlike previous attacks, the
+  attack targets the last level L3 cache. Consequently, the spy
+  program and the victim do not need to share the execution core of
+  the CPU. The attack is not limited to a traditional OS and can be
+  used in a virtualised environment, where it can attack programs
+  executing in a different VM.
+
+Index: gnupg-1.4.7/mpi/mpi-pow.c
+===================================================================
+--- gnupg-1.4.7.orig/mpi/mpi-pow.c
++++ gnupg-1.4.7/mpi/mpi-pow.c
+@@ -212,7 +212,13 @@ mpi_powm( MPI res, MPI base, MPI exponen
+ 		tp = rp; rp = xp; xp = tp;
+ 		rsize = xsize;
+ 
+-		if( (mpi_limb_signed_t)e < 0 ) {
++            /* To mitigate the Yarom/Falkner flush+reload cache
++             * side-channel attack on the RSA secret exponent, we do
++             * the multiplication regardless of the value of the
++             * high-bit of E.  But to avoid this performance penalty
++             * we do it only if the exponent has been stored in secure
++             * memory and we can thus assume it is a secret exponent.  */
++		if (esec || (mpi_limb_signed_t)e < 0) {
+ 		    /*mpihelp_mul( xp, rp, rsize, bp, bsize );*/
+ 		    if( bsize < KARATSUBA_THRESHOLD ) {
+ 			mpihelp_mul( xp, rp, rsize, bp, bsize );
+@@ -227,6 +233,8 @@ mpi_powm( MPI res, MPI base, MPI exponen
+ 			mpihelp_divrem(xp + msize, 0, xp, xsize, mp, msize);
+ 			xsize = msize;
+ 		    }
++		}
++		if ( (mpi_limb_signed_t)e < 0 ) {
+ 
+ 		    tp = rp; rp = xp; xp = tp;
+ 		    rsize = xsize;
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index ddcc2c2..7be56fd 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
            file://curl_typeof_fix_backport.patch \
            file://CVE-2013-4351.patch \
            file://CVE-2013-4576.patch \
+           file://CVE-2013-4242.patch \
 	  "
 
 SRC_URI[md5sum] = "b06a141cca5cd1a55bbdd25ab833303c"
-- 
1.9.1


