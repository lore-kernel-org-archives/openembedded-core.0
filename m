Return-Path: <Zubair.Kakakhel@imgtec.com>
X-Greylist: delayed 942 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Sep 2016 14:03:40 UTC
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3618460938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:03:40 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id DEF98FA54FBD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:47:54 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 23 Sep 2016 14:47:57 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 14:47:50 +0100
Message-ID: <1474638470-53738-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v3] arch-mips: Add mips64r2 tunes
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
X-List-Received-Date: Fri, 23 Sep 2016 14:03:44 -0000
Content-Type: text/plain

Add MIPS64r2 optimizations

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V2 -> V3
Removed the unnecessary restructuring of the base tunings.

V1 -> V2
Fixed a subtle bug in the include files for tune-mips64.inc which
resulted in a build failure for multi-lib configuration.
---
 meta/conf/machine/include/tune-mips64r2.inc | 84 +++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-mips64r2.inc

diff --git a/meta/conf/machine/include/tune-mips64r2.inc b/meta/conf/machine/include/tune-mips64r2.inc
new file mode 100644
index 0000000..75d7535
--- /dev/null
+++ b/meta/conf/machine/include/tune-mips64r2.inc
@@ -0,0 +1,84 @@
+DEFAULTTUNE ?= "mips64r2"
+
+require conf/machine/include/tune-mips64.inc
+
+TUNEVALID[mips64r2] = "Enable mips64r2 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips64r2', ' -march=mips64r2', '', d)}"
+
+# Base tunes
+AVAILTUNES += "mips64r2 mips64r2el"
+
+TUNE_FEATURES_tune-mips64r2 = "${TUNE_FEATURES_tune-mips64} mips64r2"
+BASE_LIB_tune-mips64r2 = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64r2 = "mips64r2"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2 = "mips64 mips64r2"
+
+TUNE_FEATURES_tune-mips64r2el = "${TUNE_FEATURES_tune-mips64el} mips64r2"
+BASE_LIB_tune-mips64r2el = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64r2el = "mips64r2el"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2el = "mips64el mips64r2el"
+
+# MIPS 64r2 Soft Float
+AVAILTUNES += "mips64r2-nf mips64r2el-nf"
+
+TUNE_FEATURES_tune-mips64r2-nf = "${TUNE_FEATURES_tune-mips64-nf} mips64r2"
+BASE_LIB_tune-mips64r2-nf = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64r2-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf = "mips64-nf mips64r2-nf"
+
+TUNE_FEATURES_tune-mips64r2el-nf = "${TUNE_FEATURES_tune-mips64el-nf} mips64r2"
+BASE_LIB_tune-mips64r2el-nf = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64r2el-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf = "mips64el-nf mips64r2el-nf"
+
+# MIPS 64r2 n32
+AVAILTUNES += "mips64r2-n32 mips64r2el-n32"
+
+TUNE_FEATURES_tune-mips64r2-n32 = "${TUNE_FEATURES_tune-mips64-n32} mips64r2"
+BASE_LIB_tune-mips64r2-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64r2-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2-n32 = "mips64-n32 mips64r2-n32"
+
+TUNE_FEATURES_tune-mips64r2el-n32 = "${TUNE_FEATURES_tune-mips64el-n32} mips64r2"
+BASE_LIB_tune-mips64r2el-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64r2el-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2el-n32 = "mips64el-n32 mips64r2el-n32"
+
+# MIPS 64r2 n32 and Soft Float
+AVAILTUNES += "mips64r2-nf-n32 mips64r2el-nf-n32"
+
+TUNE_FEATURES_tune-mips64r2-nf-n32 = "${TUNE_FEATURES_tune-mips64-nf-n32} mips64r2"
+BASE_LIB_tune-mips64r2-nf-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64r2-nf-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-n32 = "mips64-nf-n32 mips64r2-nf-n32"
+
+TUNE_FEATURES_tune-mips64r2el-nf-n32 = "${TUNE_FEATURES_tune-mips64el-nf-n32} mips64r2"
+BASE_LIB_tune-mips64r2el-nf-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-n32 = "mips64el-nf-n32 mips64r2el-nf-n32"
+
+# MIPS 64r2 o32
+AVAILTUNES += "mips64r2-o32 mips64r2el-o32"
+
+TUNE_FEATURES_tune-mips64r2-o32 = "${TUNE_FEATURES_tune-mips64-o32} mips64r2"
+BASE_LIB_tune-mips64r2-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64r2-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2-o32 = "mips mips64-o32 mips64r2-o32"
+
+TUNE_FEATURES_tune-mips64r2el-o32 = "${TUNE_FEATURES_tune-mips64el-o32} mips64r2"
+BASE_LIB_tune-mips64r2el-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64r2el-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2el-o32 = "mipsel mips64el-o32 mips64r2el-o32"
+
+# MIPS 64r2 o32 and Soft Float
+AVAILTUNES += "mips64r2-nf-o32 mips64r2el-nf-o32"
+
+TUNE_FEATURES_tune-mips64r2-nf-o32 = "${TUNE_FEATURES_tune-mips64-nf-o32} mips64r2"
+BASE_LIB_tune-mips64r2-nf-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64r2-nf-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-o32 = "mips-nf mips64r2-nf-o32"
+
+TUNE_FEATURES_tune-mips64r2el-nf-o32 = "${TUNE_FEATURES_tune-mips64el-nf-o32} mips64r2"
+BASE_LIB_tune-mips64r2el-nf-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-o32 = "mipsel-nf mips64r2el-nf-o32"
-- 
1.9.1


