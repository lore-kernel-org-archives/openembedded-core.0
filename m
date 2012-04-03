Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q4-0001m0-VM
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlF0J019277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:15 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:14 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:03 -0500
Message-ID: <c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:25 -0000
Content-Type: text/plain

Cleanup the MIPS tunings to match the new tuning README file.  Also
add a MIPS specific README file to explain the MIPS specifical
architectural issues.

Finally correct the variant configurations within the tune-mips32.inc.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/mips/README        |   36 ++++++++++++++++++++++++
 meta/conf/machine/include/mips/arch-mips.inc |   38 ++++++++++++++++++++++++-
 meta/conf/machine/include/tune-mips32.inc    |   17 ++++++++---
 3 files changed, 84 insertions(+), 7 deletions(-)
 create mode 100644 meta/conf/machine/include/mips/README

diff --git a/meta/conf/machine/include/mips/README b/meta/conf/machine/include/mips/README
new file mode 100644
index 0000000..6a22739
--- /dev/null
+++ b/meta/conf/machine/include/mips/README
@@ -0,0 +1,36 @@
+2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
+  - Initial Version
+
+MIPS currently defines 12 ABIs.  Combinations of:
+ *) Big/Little Endian
+ *) Hardware/Software Floating Point
+ *) o32, n32, n64 ABI
+
+TUNE_ARCH, the GNU canonical arch, is defined as:
+
+mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}
+
+The package arch is defined in such a way to generated a standard naming
+scheme.  The scheme is: <mips variant>[-nf][-n32]
+
+TUNE_PKGARCH is defined as:
+
+${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}
+
+The following is a list of MIPS specific variables:
+
+MIPSPKGSFX_BYTE - This is defined as either blank and "64" for MIPS64 CPUs.
+
+MIPSPKGSFX_ENDIAN - For bigendian hardware this is blank, otherwise it's
+defined as "el".
+
+MIPSPKGSFX_VARIANT_tune-<tune> - In the default tunings it is set to the
+same value as TUNE_ARCH.  In custom, optimized tunings, the value should
+be modified to more precisely describe the tuning.
+
+MIPSPKGSFX_FPU - This defines if the floating point hardware is used by
+this tuning.  A "-nf" is added to the PKGARCH in this case.
+
+MIPSPKGSFX_ABI - This is used to specify an alternative ABI when the previous
+values are not enough to distringuish the package.  "-n32" is added when
+building for N32 ABI.
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index b7ded76..8758ecd 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -36,32 +36,66 @@ MIPSPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf",
 MIPSPKGSFX_ABI = "${@bb.utils.contains("TUNE_FEATURES", "n32", "-n32", "", d)}"
 
 TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
-TUNE_PKGARCH ?= "${TUNE_ARCH}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
+TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
 # Base tunes
 AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
 TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
 BASE_LIB_tune-mips = "lib"
+MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
+
 TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
 BASE_LIB_tune-mips64-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64-n32 = "mips64-n32"
+
 TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
 BASE_LIB_tune-mips64 = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
+
 TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
 BASE_LIB_tune-mipsel = "lib"
+MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
+
 TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
 BASE_LIB_tune-mips64el-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64el-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 = "mips64el-n32"
+
 TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
 BASE_LIB_tune-mips64el = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
+
 TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
 BASE_LIB_tune-mips-nf = "lib"
+MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
+
 TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
 BASE_LIB_tune-mips64-nf-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
+
 TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
 BASE_LIB_tune-mips64-nf = "lib64"
+MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
+
 TUNE_FEATURES_tune-mipsel-nf = "o32"
 BASE_LIB_tune-mipsel-nf = "lib"
+MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
+
 TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
 BASE_LIB_tune-mips64el-nf-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 = "mips64el-nf-n32"
+
 TUNE_FEATURES_tune-mips64el-nf = "n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
-
+MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 45d865e..93ed5ee 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -7,12 +7,19 @@ TUNE_CONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
 
 AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
+
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
+MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips mips32"
+
 TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
+MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
+PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
+
 TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf"
-TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf"
+MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
 
+TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
+MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mips32el"
+PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf mips32el-nf"
-- 
1.7.1



