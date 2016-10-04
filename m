Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 54A6C71A0B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:31:35 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 1F0554747951
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 12:31:32 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 4 Oct 2016 12:31:34 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 4 Oct 2016 12:31:34 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2016 12:31:21 +0100
Message-ID: <1475580681-55081-10-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 9/9] arch-mips: Add mipsisa{32, 64}r6{el, } tunes
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
X-List-Received-Date: Tue, 04 Oct 2016 11:31:39 -0000
Content-Type: text/plain

Add support for MIPS Release 6 ISA and the various tune
configurations.

This patch adds the tunes for 32r6 and 64r6 n64 and not the n32
variants at the moment.

Release 6 onwards, the tuples are now
 - mipsisa32r6-linux-gnu
 - mipsisa32r6el-linux-gnu
 - mipsisa64r6-linux-gnuabi64
 - mipsisa64r6el-linux-gnuabi64
 - mipsisa64r6-linux-gnuabin32
 - mipsisa64r6el-linux-gnuabin32

For more details, check https://wiki.debian.org/Multiarch/Tuples

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/conf/machine/include/mips/README        | 19 ++++++++++++++++-
 meta/conf/machine/include/mips/arch-mips.inc | 10 ++++++++-
 meta/conf/machine/include/tune-mips32r6.inc  | 29 +++++++++++++++++++++++++
 meta/conf/machine/include/tune-mips64r6.inc  | 32 ++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 2 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-mips32r6.inc
 create mode 100644 meta/conf/machine/include/tune-mips64r6.inc

diff --git a/meta/conf/machine/include/mips/README b/meta/conf/machine/include/mips/README
index c375f31..62fa156 100644
--- a/meta/conf/machine/include/mips/README
+++ b/meta/conf/machine/include/mips/README
@@ -1,3 +1,6 @@
+2016/09/30 - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+  - Add Release 6 support
+
 2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
   - Initial Version
 
@@ -6,9 +9,14 @@ MIPS currently defines 12 ABIs.  Combinations of:
  *) Hardware/Software Floating Point
  *) o32, n32, n64 ABI
 
+Release 6 of the ISA is a major revision and doesn't build up on previous
+releases of the ISA.
+
+For more details about tuples, check https://wiki.debian.org/Multiarch/Tuples
+
 TUNE_ARCH, the GNU canonical arch, is defined as:
 
-mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}
+"mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}"
 
 The package arch is defined in such a way to generated a standard naming
 scheme.  The scheme is: <mips variant>[-nf][-n32]
@@ -34,3 +42,12 @@ that the tune is using a non-floating point ABI.
 MIPSPKGSFX_ABI - This is used to specify an alternative ABI when the previous
 values are not enough to distringuish the package.  "-n32" is added when
 building for N32 ABI.
+
+MIPSPKGSFX_R6 - This is used to specify the presence of release 6.
+"r6" is added in the tuple for release 6 of the isa.
+
+MIPSPKGSFX_64R6 - This is used to specify "isa" in the tuple.
+Release 6 onwards we use "mipsisa64" instead of just "mips64".
+
+MIPSPKGSFX_32R6 -  This is used to specify "isa32" in the tuple.
+Release 6 onwards we use "mipsisa32" instead of just "mips".
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 28d3b51..50c4c82 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -32,14 +32,22 @@ TUNEVALID[fpu-hard] = "Use hardware FPU"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' -mhard-float', ' -msoft-float', d)}"
 TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', '', 'soft', d)}"
 
+# MIPS r6 ABI
+TUNEVALID[r6] = "Use r6"
+TUNEVALID[mipsisa64r6] = "Use 64r6"
+TUNEVALID[mipsisa32r6] = "Use 32r6"
+
 # Package naming
 MIPSPKGSFX_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el', d)}"
 MIPSPKGSFX_BYTE = "${@bb.utils.contains('TUNE_FEATURES', 'n64' , '64', '', d)}"
 MIPSPKGSFX_BYTE .= "${@bb.utils.contains('TUNE_FEATURES', 'n32' , '64', '', d)}"
 MIPSPKGSFX_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard' , '', '-nf', d)}"
 MIPSPKGSFX_ABI = "${@bb.utils.contains('TUNE_FEATURES', 'n32', '-n32', '', d)}"
+MIPSPKGSFX_R6 = "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'r6', '', d)}"
+MIPSPKGSFX_64R6 = "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6', 'isa', '', d)}"
+MIPSPKGSFX_32R6 = "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', 'isa32', '', d)}"
 
-TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
+TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}"
 TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
 # Base tunes
diff --git a/meta/conf/machine/include/tune-mips32r6.inc b/meta/conf/machine/include/tune-mips32r6.inc
new file mode 100644
index 0000000..4721319
--- /dev/null
+++ b/meta/conf/machine/include/tune-mips32r6.inc
@@ -0,0 +1,29 @@
+DEFAULTTUNE ?= "mipsisa32r6el"
+
+require conf/machine/include/mips/arch-mips.inc
+
+TUNEVALID[mipsisa32r6] = "Enable mipsisa32r6 specific processor optimizations"
+TUNECONFLICTS[mipsisa32r6] = "n64 n32"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', ' -march=mips32r6', '', d)}"
+
+# Base Tunes
+AVAILTUNES += "mipsisa32r6 mipsisa32r6el"
+
+TUNE_FEATURES_tune-mipsisa32r6 = "bigendian mipsisa32r6 fpu-hard r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa32r6 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6 = "mipsisa32r6"
+
+TUNE_FEATURES_tune-mipsisa32r6el = "fpu-hard mipsisa32r6 r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa32r6el = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6el = "mipsisa32r6el"
+
+# Soft Float
+AVAILTUNES += "mipsisa32r6-nf mipsisa32r6el-nf"
+
+TUNE_FEATURES_tune-mipsisa32r6-nf = "bigendian mipsisa32r6 r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa32r6-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6-nf = "mipsisa32r6-nf"
+
+TUNE_FEATURES_tune-mipsisa32r6el-nf = "mipsisa32r6 r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa32r6el-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6el-nf = "mipsisa32r6el-nf"
diff --git a/meta/conf/machine/include/tune-mips64r6.inc b/meta/conf/machine/include/tune-mips64r6.inc
new file mode 100644
index 0000000..f0ad564
--- /dev/null
+++ b/meta/conf/machine/include/tune-mips64r6.inc
@@ -0,0 +1,32 @@
+DEFAULTTUNE ?= "mipsisa64r6el"
+
+require conf/machine/include/mips/arch-mips.inc
+
+TUNEVALID[mipsisa64r6] = "Enable mipsisa64r6 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6', ' -march=mips64r6', '', d)}"
+
+# Base Tunes
+AVAILTUNES += "mipsisa64r6 mipsisa64r6el"
+
+TUNE_FEATURES_tune-mipsisa64r6 = "bigendian fpu-hard n64 mipsisa64r6 r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6 = "${TUNE_ARCH}"
+BASE_LIB_tune-mipsisa64r6 = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6 = "mipsisa64r6"
+
+TUNE_FEATURES_tune-mipsisa64r6el = "fpu-hard r6 n64 mipsisa64r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6el = "${TUNE_ARCH}"
+BASE_LIB_tune-mipsisa64r6el = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6el = "mipsisa64r6el"
+
+# Soft Float
+AVAILTUNES += "mipsisa64r6-nf mipsisa64r6el-nf"
+
+TUNE_FEATURES_tune-mipsisa64r6-nf = "bigendian r6 n64 mipsisa64r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6-nf = "${TUNE_ARCH}"
+BASE_LIB_tune-mipsisa64r6-nf = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf = "mipsisa64r6"
+
+TUNE_FEATURES_tune-mipsisa64r6el-nf = "r6 n64 mipsisa64r6"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-nf = "${TUNE_ARCH}"
+BASE_LIB_tune-mipsisa64r6el-nf = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6el-nf = "mipsisa64r6el-nf"
-- 
1.9.1


