Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id D725979882
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:49 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 5125E24E0D54;
	Thu, 20 Sep 2018 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476171; bh=VmsEIUWBVRJ7xtuVpHRSecePqTxcASnMtovZztbIB/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijnHRgy5GoqDyfwvq3bP7C4VpuGt5LA5PEtx/HlxKLOgQ+PUcAWmf49Z9LUXB2Kuj
	TYGLqeDNHKuQ/+NHa+hvDln/aeXgQshC32p34JlLV2B7bxgReoS032EUMkRkIattw3
	NIti46V4KnGfODwwooxAILX84iMrGcaIwQNCo/dSdbvFcYbEPtJ6a+Fp6semaNbBxh
	yVFgnMvZx3MFWaryvp3nE8aE0PGKxnUXgpyWERnmnnuTVRE+yx/G/f7sXaVcbG9ff/
	EhdSTkQzAYI7BDBN8PosmzazBDb88M0VZQTJuAzW5vVLL8ZcA8MVKY2605H0qsXNaF
	AjOutPOkMXQAg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id A23ED3AB4;
	Thu, 20 Sep 2018 13:42:49 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:27 +0300
Message-Id: <20180920204232.10583-5-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
Cc: Antoine Tenart <antoine.tenart@bootlin.com>,
	linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 4/9] nspr: Add ARC support
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:49 -0000

From: Antoine Tenart <antoine.tenart@bootlin.com>

[Alexey: Rebased on top of other patches like RiscV, NIOS2 etc]

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

Changes v1 -> v2:

 * Added upstream status

 .../nspr/nspr/0004-Add-ARC-support.patch           | 88 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.19.bb             |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch

diff --git a/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch b/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
new file mode 100644
index 0000000000..9d686017df
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
@@ -0,0 +1,88 @@
+From 6cb5b0be8837222a1e01745f2cf57cd0e593186d Mon Sep 17 00:00:00 2001
+From: Antoine Tenart <antoine.tenart@free-electrons.com>
+Date: Mon, 23 Oct 2017 10:28:20 +0200
+Subject: [PATCH] Add ARC support
+
+[Alexey: Rebased on top of other patches like RiscV, NIOS2 etc].
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+
+Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1492378 ]
+---
+ pr/include/md/_linux.cfg | 45 ++++++++++++++++++++++++++++++++++++++++
+ pr/include/md/_linux.h   |  2 ++
+ 2 files changed, 47 insertions(+)
+
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index fec8525378dc..5f4fa0eac783 100644
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -1157,6 +1157,51 @@
+ #define PR_BYTES_PER_WORD_LOG2  3
+ #define PR_BYTES_PER_DWORD_LOG2 3
+ 
++#elif defined(__arc__)
++
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
+index 8e04fad479a1..628b1217e9c8 100644
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
+@@ -63,6 +63,8 @@
+ #define _PR_SI_ARCHITECTURE "riscv32"
+ #elif defined(__riscv) && (__riscv_xlen == 64)
+ #define _PR_SI_ARCHITECTURE "riscv64"
++#elif defined(__arc__)
++#define _PR_SI_ARCHITECTURE "arc"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
index b5264be2a0..0212be7f40 100644
--- a/meta/recipes-support/nspr/nspr_4.19.bb
+++ b/meta/recipes-support/nspr/nspr_4.19.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
+           file://0004-Add-ARC-support.patch \
            file://nspr.pc.in \
 "
 
-- 
2.16.2


