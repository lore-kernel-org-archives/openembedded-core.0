Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603C7C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.341.1788364013482735194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k3LmuD8Q;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C67E61A195D
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95C356053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F57611C79905;
	Wed,  2 Sep 2026 17:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Pg2CMZ/mCmdd7KdM0zWX8gmrxfKuZSrfhXPZkNC48/c=;
	b=k3LmuD8QtEyAsByzs7BQARhrx7vUhms5KFEjWWWQCIQQHovGRvHR/GWyhd3UiT8cEDuuie
	rNyaARWz0TKQjr+loeS56ftRLQ83mco6C7rv5RnAS9tucLyfrFVGL64h0V8ZPg3mBeXA6u
	SZsjsrjPThz7zsExzQObT8BsG5b2P+pSNvZ6kKv9rVjmtjPrG0cG+ecTA71y3tBwVttfy9
	36Rv4v6v+VKBdk9aVdTmnPeyRw+EbOXuSXDXRoUK+FMPsfUVDOkOudJEY6d1uHUckpwkob
	1ml6cx5do6nOn6TmzXAm3XQ+LyWHT7VwSvI7N0B3A6Kyvk7z3u4zXhYwak7HqQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:49 +0200
Subject: [PATCH 7/8] libgcrypt: upgrade 1.12.2 -> 1.12.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-7-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=10884;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Ifk4xm7Li81s4M+W87Qzdsv34bPVJ5dqAZJG9ccrNp8=;
 b=UfhVEWG8UywwL47dLsu+ZW6cR9VMXWxYAGK8gkLBswRqbWSNWrlmT07LeqvbH4vIFDalgRB+1
 DWnMisSA2rmA2gLznfgjPtE6IvuZn7t9y9+jCzy5vJJ3Nv52PlgezX3
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244980

Changelog:

- Bug fixes:
   - Avoid theoretical drive-by loading of netapi32.dll and
     shell32.dll.  [T8375]
   - Validate hash algorithm for use with RSA modulus.  [T8376]
   - Validate parameters of Balloon KDF.  [T8374,T8383]
   - Validate parallelism of Argon2 KDF.  [T8373,T8382]
   - Fix parsing quoted parts and CRLF/LFCR in s-expression.  [T8371]
   - Support BUFLEN check for GCRYMPI_FMT_SSH.  [T8371]
   - Fix RSA PSS verify message length checking.  [rC0d64fc228f]
   - Avoid a NULL ptr deref due to a unsupported genkey flag for
     ECC.  [rC3b259530bc]
   - Assert 32 KiB input cap in gcm_ctr_encrypt.  [T8387]
   - Fix assertion failure in OCB when a buffered block becomes block
     65536.  [TT8389]
   - Fix OOB read in IMIT MAC verify of GOST28147.  [T8388]
   - Fix CMAC block-count truncation for 64 GiB writes.  [T8384]
   - Fix AEAD spurious byte-counter carry for 4 GiB adds.  [T8381]
   - Validate all KEM input lengths.  [T8259]
   - Add length check of DATALEN when parsing s-expression.  [T8267]
   - Only accept canonical value for S with EdDSA.  [T8386]
   - Only accept canonical signatures for RSA.  [T8392]
   - Fix an assertion failure for invalid small-order Ed25519 public
     keys.  [T8380]
   - Validate length of supplied receiver public-key length in DHKEM
     decapsulation.  [T8385]
   - Use a more strict value for the PKCS#1 minimal frame length.
     [T8393,T8394]

- Performance:
   - Use just strong random for the Dilithium signature nonce and the
     Kyber encapsulation coins.  [rC70ecc4e943,rCd7a3acc130]
   - Allow internal users to skip fast random poll for ciphers and
     hashes.  [rC75ff7a959b]
   - Speedup sntrup761 by defer reduction in polynomial multiplication,
     reading random with a single call, and reducing freeze helpers
     w/o division.  [rCbaa3a6376b,rC3f2f39bf75,rC317c661b16]
   - Avoid byte-wise load/store on RISC-V with Zicclsm.
     [rCe18a5eb650]
   - Use unaligned vector memory access on RSIV-V when supported.
     [rCecaa3572e1]
   - Add Intel SM4 instructions accelerated AVX512 and AVX2
     implementation.  [rC14d1a882aa,rCdf44b486ba]
   - Add Intel SM3 extension implementation.  [rC3f94b92e05]
   - Add Intel SHA512 extension implementation.  [rC0f8a34038d]

- Other:
   - kyber: Accept and return a seed using the gcry_pk_genkey API.
     [rCe099ccfea9]
   - Add curve "ietf25" as alternative to "Curve25519" with exact
     RFC-8410 semantics.  The name "X25519" was already used as an
     alias, thus this new name.
   - Add straight-line speculation hardening for function ends.
     [rC9b684f4a44]
   - Fix constant time memequal check for SM2.  [T8395]
   - Add post-quantum algorithm benchmarking to bench-slope.
   - Due to the minor API updates and but with no newer branch
     released the SO name has been updated.

License-Update: Added a file with BSD-3 license and Intel Copyright
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../files/0001-libgcrypt-fix-m4-file-for-oe-core.patch      |  2 +-
 .../0001-tests-Fix-link-errors-for-t-thread-local.patch     | 13 +++++--------
 ...sts-Makefile.am-fix-undefined-reference-to-pthread.patch | 11 ++++-------
 meta/recipes-support/libgcrypt/files/no-bench-slope.patch   |  2 +-
 .../libgcrypt/files/no-native-gpg-error.patch               |  4 ++--
 .../libgcrypt/{libgcrypt_1.12.2.bb => libgcrypt_1.12.3.bb}  |  4 ++--
 6 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index e60507e63672..ad071e07f5a5 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 3bc536529c9bbe1e62d1c1127abee6183ed64298 Mon Sep 17 00:00:00 2001
+From 4f27b68f509c94739d8d7c5e5c8bc1b0b17259ad Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 19a925c2c616..6200ac0a3124 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From 4a8d31b6e1af1d2764e159d5825ad2241a74fe7b Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
@@ -21,18 +21,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4800135..f0f7adb 100644
+index 3baaf48..cc2fd6b 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -102,7 +102,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -103,7 +103,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
 -t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
 +t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
- 
- # Build a version of the test driver for the build platform.
--- 
-2.34.1
-
+ t_cipher_internal_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
+ t_sntrup761_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 090948c3c5b1..924ece8b8ecd 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From a3496435dcc223a914eec5e61e853934fd4eb635 Mon Sep 17 00:00:00 2001
+From 6322f759b58ba78d5b01c09c19d91571e999334c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 93daf3c..4800135 100644
+index 8c468b4..3baaf48 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -100,7 +100,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -101,7 +101,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -26,7 +26,7 @@ index 93daf3c..4800135 100644
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
-@@ -122,7 +122,7 @@ else
+@@ -125,7 +125,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -35,6 +35,3 @@ index 93daf3c..4800135 100644
  endif
  
  # xcheck uses our new testdrv instead of the automake test runner.
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 606cca1344ca..849f8b0361c8 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 254821a620c1f7d6542c23dbe555e7c02637a3f8 Mon Sep 17 00:00:00 2001
+From 50bfe58f1ffa6a8519377f4c10e5d41133d8782a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index 98874ce12a9f..f22f6993a248 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From a7778057e08273041c48e10ff2f4c7dcce9220c1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 26 Aug 2022 15:23:37 +0100
 Subject: [PATCH] libgcrypt: rewrite ptest
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index bfca4c2..634b718 100644
+index 7743258..bffa3cc 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
index deb053031e6a..a7f814722804 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
@@ -12,7 +12,7 @@ LICENSE:${PN}-dev = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
-                    file://LICENSES;md5=034b4e369944ad4b52a68368f1cf98b8 \
+                    file://LICENSES;md5=47e346a71a2593d19f741408407fe91f \
                     "
 
 DEPENDS = "libgpg-error"
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e"
+SRC_URI[sha256sum] = "98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 

-- 
2.47.3


