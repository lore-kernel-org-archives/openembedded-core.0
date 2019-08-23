Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A53CF7F37A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 15:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A9133182C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:20 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id o0XHsmcs_t1j
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id CAA8B183CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A46C01E087
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 970691E086
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 8AB20725
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x7NFKJZw024228
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 17:20:19 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x7NFKJo0024227
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Aug 2019 17:20:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 17:20:16 +0200
Message-Id: <20190823152016.24179-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2] libffi: Make it build for MIPS o32
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
X-List-Received-Date: Fri, 23 Aug 2019 15:20:22 -0000
Content-Transfer-Encoding: 8bit

This solves the following errors:

  src/mips/o32.S: Assembler messages:
  src/mips/o32.S:286: Error: opcode not supported on this processor:
    mips32r2 (mips32r2) `s.d $f12,((16*4)-10*4)($fp)'
  src/mips/o32.S:287: Error: opcode not supported on this processor:
    mips32r2 (mips32r2) `s.d $f14,((16*4)-8*4)($fp)'

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Add Signed-off-by to the patch file.

 ...-missed-ifndef-for-__mips_soft_float.patch | 31 +++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.3~rc0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
new file mode 100644
index 0000000000..00a30a3554
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
@@ -0,0 +1,31 @@
+From 4149a7627a998731cc246d3f58a36808745d04c8 Mon Sep 17 00:00:00 2001
+From: Carl Hurd <carl@Carls-MacBook-Pro.local>
+Date: Wed, 18 Jul 2018 09:04:32 -0400
+Subject: [PATCH] Fixed missed #ifndef for __mips_soft_float
+
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/442]
+
+ src/mips/o32.S | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/mips/o32.S b/src/mips/o32.S
+index 44e74cb..799139b 100644
+--- a/src/mips/o32.S
++++ b/src/mips/o32.S
+@@ -282,9 +282,11 @@ $LCFI12:
+ 	li	$13, 1		# FFI_O32
+ 	bne	$16, $13, 1f	# Skip fp save if FFI_O32_SOFT_FLOAT
+ 	
++#ifndef __mips_soft_float
+ 	# Store all possible float/double registers.
+ 	s.d	$f12, FA_0_0_OFF2($fp)
+ 	s.d	$f14, FA_1_0_OFF2($fp)
++#endif
+ 1:
+ 	# prepare arguments for ffi_closure_mips_inner_O32
+ 	REG_L	a0, 4($15)	 # cif 
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/libffi/libffi_3.3~rc0.bb b/meta/recipes-support/libffi/libffi_3.3~rc0.bb
index dadde0b2a0..3e2845546e 100644
--- a/meta/recipes-support/libffi/libffi_3.3~rc0.bb
+++ b/meta/recipes-support/libffi/libffi_3.3~rc0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 
 SRC_URI = "https://github.com/libffi/libffi/releases/download/v3.3-rc0/libffi-3.3-rc0.tar.gz \
            file://not-win32.patch \
+           file://0001-Fixed-missed-ifndef-for-__mips_soft_float.patch \
            "
 SRC_URI[md5sum] = "8d2a82a78faf10a5e53c27d986e8f04e"
 SRC_URI[sha256sum] = "403d67aabf1c05157855ea2b1d9950263fb6316536c8c333f5b9ab1eb2f20ecf"
-- 
2.21.0


