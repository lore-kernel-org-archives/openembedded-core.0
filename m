Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qlh3k-0003Kp-Uq
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:48:29 +0200
Received: by rex (Postfix, from userid 1000)
	id B2B9F20D65; Tue, 26 Jul 2011 13:44:08 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 13:44:06 +0100
Message-Id: <b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] Add basic Mips core tune config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 12:48:29 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/mips/arch-mips.inc |   64 +++++++++++++++++++++++++-
 meta/conf/machine/include/tune-mips32.inc    |   10 +++-
 2 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index f7f4eed..071e6b5 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -1 +1,63 @@
-TUNE_ARCH = "mips"
+# MIPS Architecture definition
+# 12 defined ABIs, all combinations of:
+# *) Big/Little Endian
+# *) Hardware/Software Floating Point
+# *) o32, n32, n64 ABI
+
+DEFAULTTUNE ?= "mips"
+
+# Endianess
+TUNEVALID[bigendian] = "Enable big-endian mode"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel", d)}"
+
+# ABI flags
+TUNEVALID[o32] = "MIPS o32 ABI"
+TUNECONFLICT[o32] = "n32 n64"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=32", "", d)}"
+
+TUNEVALID[n32] = "MIPS64 n32 ABI"
+TUNECONFLICT[n32] = "o32 n64"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=n32", "", d)}"
+
+TUNEVALID[n64] = "MIPS64 n64 ABI"
+TUNECONFLICT[n64] = "o32 n32"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-mabi=64", "", d)}"
+
+# Floating point
+TUNEVALID[fpu-hard] = "Use hardware FPU"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "-msoft-float", d)}"
+TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "soft", d)}"
+
+# Package naming
+MIPSPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
+MIPSPKGSFX_BYTE = "${@bb.utils.contains("TUNE_FEATURES", "n64" , "64", "", d)}"
+
+TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
+
+# Base tunes
+AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
+TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
+BASE_LIB_tune-mips = "lib"
+TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
+BASE_LIB_tune-mips64-n32 = "lib32"
+TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
+BASE_LIB_tune-mips64 = "lib64"
+TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
+BASE_LIB_tune-mipsel = "lib"
+TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
+BASE_LIB_tune-mips64el-n32 = "lib32"
+TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
+BASE_LIB_tune-mips64el = "lib64"
+TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
+BASE_LIB_tune-mips-nf = "lib"
+TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
+BASE_LIB_tune-mips64-nf-n32 = "lib32"
+TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
+BASE_LIB_tune-mips64-nf = "lib64"
+TUNE_FEATURES_tune-mipsel-nf = "o32"
+BASE_LIB_tune-mipsel-nf = "lib"
+TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
+BASE_LIB_tune-mips64el-nf-n32 = "lib32"
+TUNE_FEATURES_tune-mips64el-nf = "n64"
+BASE_LIB_tune-mips64el-nf = "lib64"
+
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 28b0047..1f913df 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -1,4 +1,10 @@
+DEFAULTTUNE ?= "mips32"
+
 require conf/machine/include/mips/arch-mips.inc
 
-TUNE_CCARGS = "-march=mips32"
-TUNE_PKGARCH = "mips"
+TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
+
+AVAILTUNES += "mips32"
+TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
-- 
1.7.4.1



