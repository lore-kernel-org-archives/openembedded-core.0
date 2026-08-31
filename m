Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19961C624CC
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25592.1788167058531810574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ubzMifvB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C050A4E41465
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 959BA60231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB30211C78AE2;
	Mon, 31 Aug 2026 11:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qtGx9oDg+mZe9IjNvnKZ18gPchM3j/EHG21Ng0LxxW0=;
	b=ubzMifvBw6nWZ/zkanNMNc1n+y2N/DTrBziR0U8mMzYiH4YawAguNmQAE2o+yMXtEdTtj5
	eXm5GCiA1Yy1+S8eUKmv5WuWa6WvueRJSNqUFGsk+V2hl6kw1Oqm3V+oxNeQCBd1hmSBco
	tOkj473aTSWFE6RM6jilaN+q9sKBZM35/YjXlFbfOTJcSnMhr79t4l5bKZKWfzwB3BISQh
	vmdOCghoy52fzBuN4obTPbu414CbcOp+Obp++4UKJQcnbjw2yCJittMvFm0wNEGZeX4m31
	UySekDxZb+fe5cn9JEhn05+8oxEZlhQQYlr2uPbDy3ZOR4CCwbmbyWFPph42Dw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:36 +0200
Subject: [PATCH 4/9] libgcrypt: upgrade 1.12.2 -> 1.12.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-4-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=17185;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=QxrZDTIfr6UaPDp0XlwEad/wvrqJIOxNRHHrD7gdlJE=;
 b=ch08fYy0PpaEcUNCYbcpFLgyjyiHcr7ZOi30b08NNcYS1UUC8eMMb10E/jhbD5Xazboa1iQ9B
 oT60Q36sPO+B844LiT3Wz+JfXvTAvcmzZqaK8rn7yMDFbkUf+jBKAVy
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244746

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

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../0001-libgcrypt-fix-m4-file-for-oe-core.patch   |   2 +-
 ...-tests-Fix-link-errors-for-t-thread-local.patch |  13 +--
 ...ile.am-fix-undefined-reference-to-pthread.patch |  11 +--
 .../libgcrypt/files/no-bench-slope.patch           |   2 +-
 .../libgcrypt/files/no-native-gpg-error.patch      |   4 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb |  56 -----------
 meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb | 106 +++++++++++++++++++++
 7 files changed, 119 insertions(+), 75 deletions(-)

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
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
deleted file mode 100644
index deb053031e6a..000000000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
-DESCRIPTION = "A cryptography library developed as a separated module of GnuPG. \
-It can also be used independently of GnuPG, but depends on its error-reporting \
-library Libgpg-error."
-HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
-BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
-LICENSE:${PN} = "BSD-3-Clause AND LGPL-2.1-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later AND LGPL-2.1-or-later"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
-                    file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
-                    file://LICENSES;md5=034b4e369944ad4b52a68368f1cf98b8 \
-                    "
-
-DEPENDS = "libgpg-error"
-
-UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
-           file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
-           file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
-           file://0001-tests-Fix-link-errors-for-t-thread-local.patch \
-           file://no-native-gpg-error.patch \
-           file://no-bench-slope.patch \
-           file://run-ptest \
-           "
-SRC_URI[sha256sum] = "7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e"
-
-BINCONFIG = "${bindir}/libgcrypt-config"
-
-inherit autotools texinfo binconfig-disabled pkgconfig ptest upstream-stable-release-point
-
-require recipes-support/gnupg/drop-unknown-suffix.inc
-
-EXTRA_OECONF = "--disable-asm"
-EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
-
-PACKAGECONFIG ??= "capabilities"
-PACKAGECONFIG[capabilities] = "--with-capabilities,--without-capabilities,libcap"
-
-do_configure:prepend () {
-	# Else this could be used in preference to the one in aclocal-copy
-	rm -f ${S}/m4/gpg-error.m4
-}
-
-do_install_ptest() {
-    cd tests
-    oe_runmake testdrv-build testdrv
-    install testdrv $(srcdir=${S}/tests ./testdrv-build --files | sort | uniq) ${D}${PTEST_PATH}
-}
-
-FILES:${PN}-dev += "${bindir}/hmac256 ${bindir}/dumpsexp"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
new file mode 100644
index 000000000000..af5f00dbfa53
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
@@ -0,0 +1,106 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSES
+# +++ LICENSES
+# @@ -61,6 +61,36 @@
+#  
+#  #+begin_quote
+#     Copyright (c) 2021-2022, Intel Corporation
+# +
+# +   Redistribution and use in source and binary forms, with or without
+# +   modification, are permitted provided that the following conditions are met:
+# +
+# +       * Redistributions of source code must retain the above copyright notice,
+# +         this list of conditions and the following disclaimer.
+# +       * Redistributions in binary form must reproduce the above copyright
+# +         notice, this list of conditions and the following disclaimer in the
+# +         documentation and/or other materials provided with the distribution.
+# +       * Neither the name of Intel Corporation nor the names of its contributors
+# +         may be used to endorse or promote products derived from this software
+# +         without specific prior written permission.
+# +
+# +   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# +   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# +   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# +   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
+# +   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+# +   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+# +   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+# +   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+# +   OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# +   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +#+end_quote
+# +
+# +  For files:
+# +  - cipher/sm3-intel-avx2-amd64.S
+# +
+# +#+begin_quote
+# +   Copyright (c) 2023-2024, Intel Corporation
+#  
+#     Redistribution and use in source and binary forms, with or without
+#     modification, are permitted provided that the following conditions are met:
+# 
+#
+
+SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
+DESCRIPTION = "A cryptography library developed as a separated module of GnuPG. \
+It can also be used independently of GnuPG, but depends on its error-reporting \
+library Libgpg-error."
+HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
+BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE:${PN} = "BSD-3-Clause AND LGPL-2.1-or-later"
+LICENSE:${PN}-dev = "GPL-2.0-or-later AND LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
+                    file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://LICENSES;md5=47e346a71a2593d19f741408407fe91f \
+                    "
+
+DEPENDS = "libgpg-error"
+
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
+           file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
+           file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://0001-tests-Fix-link-errors-for-t-thread-local.patch \
+           file://no-native-gpg-error.patch \
+           file://no-bench-slope.patch \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006"
+
+BINCONFIG = "${bindir}/libgcrypt-config"
+
+inherit autotools texinfo binconfig-disabled pkgconfig ptest upstream-stable-release-point
+
+require recipes-support/gnupg/drop-unknown-suffix.inc
+
+EXTRA_OECONF = "--disable-asm"
+EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
+
+PACKAGECONFIG ??= "capabilities"
+PACKAGECONFIG[capabilities] = "--with-capabilities,--without-capabilities,libcap"
+
+do_configure:prepend () {
+	# Else this could be used in preference to the one in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
+}
+
+do_install_ptest() {
+    cd tests
+    oe_runmake testdrv-build testdrv
+    install testdrv $(srcdir=${S}/tests ./testdrv-build --files | sort | uniq) ${D}${PTEST_PATH}
+}
+
+FILES:${PN}-dev += "${bindir}/hmac256 ${bindir}/dumpsexp"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.47.3


