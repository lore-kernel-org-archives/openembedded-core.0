Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C5EC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 17:26:20 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.42954.1707067569893063939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 09:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=P1zZUn6O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240204172604f9eaf793dd12746685-_wihsw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240204172604f9eaf793dd12746685
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Feb 2024 18:26:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZVq6vD8t80HUdWVb+vXGyLEpw+4V+bCFjaT4zWyrZao=;
 b=P1zZUn6OkvhubGw8LZGrd5E8db1GVygr5WFzxYkiKD1+oPgG+3bI0vi3eD3l63FKekH6Aa
 ZpkORF6PVsE5jLJMlcTahVS+KTEhpMwS/q/9uRJP8VAz3AjGpvVMRxvTEOolLdApSei5u9mF
 4cUqOuSaoxVQYDlocQ6blAEdKeweE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: Upgrade 3.2.0 -> 3.2.1
Date: Sun,  4 Feb 2024 18:25:15 +0100
Message-Id: <20240204172515.449480-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 17:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194902

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2024-0727 and CVE-2023-6237

Removed included patch backports.

New module was implemented in tests and needs to be installed
to successfully pass 04-test_provider.t test.

Release information:
https://github.com/openssl/openssl/blob/openssl-3.2/NEWS.md#major-changes-between-openssl-320-and-openssl-321-30-jan-2024

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...x-mispelling-of-extension-test-macro.patch |  31 -----
 .../openssl/openssl/CVE-2023-6129.patch       | 113 ------------------
 .../openssl/openssl/aarch64-bti.patch         |  35 ------
 .../{openssl_3.2.0.bb => openssl_3.2.1.bb}    |   6 +-
 4 files changed, 2 insertions(+), 183 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.0.bb => openssl_3.2.1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch b/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
deleted file mode 100644
index 1d217bd8e3..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b51031b05f72923ff1cf3b6a4767450dee89d7f4 Mon Sep 17 00:00:00 2001
-From: Grant Nichol <me@grantnichol.com>
-Date: Fri, 22 Dec 2023 23:46:39 -0600
-Subject: [PATCH] riscv: Fix mispelling of extension test macro
-
-When refactoring the riscv extension test macros,
-RISCV_HAS_ZKND_AND_ZKNE was mispelled.
-
-CLA: trivial
-Upstream-Status: Backport [https://github.com/openssl/openssl/pull/23139]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
-index 564d6d6..4cf1361 100644
---- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
-+++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
-@@ -225,7 +225,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
- # define PROV_CIPHER_HW_select_xts()                                           \
- if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
-     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
--if (RISCV_HAS_ZKND_ZKNE())                                                     \
-+if (RISCV_HAS_ZKND_AND_ZKNE())                                                 \
-     return &aes_xts_rv32i_zknd_zkne;
- # else
- /* The generic case */
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
deleted file mode 100644
index c2cbedd1b7..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 5b139f95c9a47a55a0c54100f3837b1eee942b04 Mon Sep 17 00:00:00 2001
-From: Rohan McLure <rmclure@linux.ibm.com>
-Date: Thu, 4 Jan 2024 10:25:50 +0100
-Subject: [PATCH] poly1305-ppc.pl: Fix vector register clobbering
-
-Fixes CVE-2023-6129
-
-The POLY1305 MAC (message authentication code) implementation in OpenSSL for
-PowerPC CPUs saves the the contents of vector registers in different order
-than they are restored. Thus the contents of some of these vector registers
-is corrupted when returning to the caller. The vulnerable code is used only
-on newer PowerPC processors supporting the PowerISA 2.07 instructions.
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/23200)
-
-(cherry picked from commit 8d847a3ffd4f0b17ee33962cf69c36224925b34f)
-
-CVE: CVE-2023-6129
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- crypto/poly1305/asm/poly1305-ppc.pl | 42 ++++++++++++++---------------
- 1 file changed, 21 insertions(+), 21 deletions(-)
-
-diff --git a/crypto/poly1305/asm/poly1305-ppc.pl b/crypto/poly1305/asm/poly1305-ppc.pl
-index 9f86134d923fb..2e601bb9c24be 100755
---- a/crypto/poly1305/asm/poly1305-ppc.pl
-+++ b/crypto/poly1305/asm/poly1305-ppc.pl
-@@ -744,7 +744,7 @@
- my $LOCALS= 6*$SIZE_T;
- my $VSXFRAME = $LOCALS + 6*$SIZE_T;
-    $VSXFRAME += 128;	# local variables
--   $VSXFRAME += 13*16;	# v20-v31 offload
-+   $VSXFRAME += 12*16;	# v20-v31 offload
- 
- my $BIG_ENDIAN = ($flavour !~ /le/) ? 4 : 0;
- 
-@@ -919,12 +919,12 @@
- 	addi	r11,r11,32
- 	stvx	v22,r10,$sp
- 	addi	r10,r10,32
--	stvx	v23,r10,$sp
--	addi	r10,r10,32
--	stvx	v24,r11,$sp
-+	stvx	v23,r11,$sp
- 	addi	r11,r11,32
--	stvx	v25,r10,$sp
-+	stvx	v24,r10,$sp
- 	addi	r10,r10,32
-+	stvx	v25,r11,$sp
-+	addi	r11,r11,32
- 	stvx	v26,r10,$sp
- 	addi	r10,r10,32
- 	stvx	v27,r11,$sp
-@@ -1153,12 +1153,12 @@
- 	addi	r11,r11,32
- 	stvx	v22,r10,$sp
- 	addi	r10,r10,32
--	stvx	v23,r10,$sp
--	addi	r10,r10,32
--	stvx	v24,r11,$sp
-+	stvx	v23,r11,$sp
- 	addi	r11,r11,32
--	stvx	v25,r10,$sp
-+	stvx	v24,r10,$sp
- 	addi	r10,r10,32
-+	stvx	v25,r11,$sp
-+	addi	r11,r11,32
- 	stvx	v26,r10,$sp
- 	addi	r10,r10,32
- 	stvx	v27,r11,$sp
-@@ -1899,26 +1899,26 @@
- 	mtspr	256,r12				# restore vrsave
- 	lvx	v20,r10,$sp
- 	addi	r10,r10,32
--	lvx	v21,r10,$sp
--	addi	r10,r10,32
--	lvx	v22,r11,$sp
-+	lvx	v21,r11,$sp
- 	addi	r11,r11,32
--	lvx	v23,r10,$sp
-+	lvx	v22,r10,$sp
- 	addi	r10,r10,32
--	lvx	v24,r11,$sp
-+	lvx	v23,r11,$sp
- 	addi	r11,r11,32
--	lvx	v25,r10,$sp
-+	lvx	v24,r10,$sp
- 	addi	r10,r10,32
--	lvx	v26,r11,$sp
-+	lvx	v25,r11,$sp
- 	addi	r11,r11,32
--	lvx	v27,r10,$sp
-+	lvx	v26,r10,$sp
- 	addi	r10,r10,32
--	lvx	v28,r11,$sp
-+	lvx	v27,r11,$sp
- 	addi	r11,r11,32
--	lvx	v29,r10,$sp
-+	lvx	v28,r10,$sp
- 	addi	r10,r10,32
--	lvx	v30,r11,$sp
--	lvx	v31,r10,$sp
-+	lvx	v29,r11,$sp
-+	addi	r11,r11,32
-+	lvx	v30,r10,$sp
-+	lvx	v31,r11,$sp
- 	$POP	r27,`$VSXFRAME-$SIZE_T*5`($sp)
- 	$POP	r28,`$VSXFRAME-$SIZE_T*4`($sp)
- 	$POP	r29,`$VSXFRAME-$SIZE_T*3`($sp)
diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch b/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
deleted file mode 100644
index 2a16debb76..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ad347c9ff0fd93bdd2fa2085611c65b88e94829f Mon Sep 17 00:00:00 2001
-From: "fangming.fang" <fangming.fang@arm.com>
-Date: Thu, 7 Dec 2023 06:17:51 +0000
-Subject: [PATCH] Enable BTI feature for md5 on aarch64
-
-Fixes: #22959
-
-Reviewed-by: Tom Cosgrove <tom.cosgrove@arm.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/22971)
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- crypto/md5/asm/md5-aarch64.pl | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/crypto/md5/asm/md5-aarch64.pl b/crypto/md5/asm/md5-aarch64.pl
-index 3200a0fa9bff0..5a8608069691d 100755
---- a/crypto/md5/asm/md5-aarch64.pl
-+++ b/crypto/md5/asm/md5-aarch64.pl
-@@ -28,10 +28,13 @@
- *STDOUT=*OUT;
- 
- $code .= <<EOF;
-+#include "arm_arch.h"
-+
- .text
- .globl  ossl_md5_block_asm_data_order
- .type   ossl_md5_block_asm_data_order,\@function
- ossl_md5_block_asm_data_order:
-+        AARCH64_VALID_CALL_TARGET
-         // Save all callee-saved registers
-         stp     x19,x20,[sp,#-80]!
-         stp     x21,x22,[sp,#16]
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_3.2.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index b2cdf761fc..549fa4cd94 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -12,16 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://aarch64-bti.patch \
-           file://0001-riscv-Fix-mispelling-of-extension-test-macro.patch \
-           file://CVE-2023-6129.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e"
+SRC_URI[sha256sum] = "83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -189,6 +186,7 @@ PTEST_BUILD_HOST_PATTERN = "perl_version ="
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
+	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
 
 	# Prune the build tree
-- 
2.30.2


