Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHOCL-0005MG-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 01:40:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39NVHIs029220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2012 16:31:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Mon, 9 Apr 2012 16:31:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Apr 2012 18:31:07 -0500
Message-ID: <a608dd6d5aec06056da9c20078b5cd171d6b6470.1334014014.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334014014.git.mark.hatle@windriver.com>
References: <cover.1334014014.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 1/1] tune-mips32: Update the default MIPS tuning to be mips32
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
X-List-Received-Date: Mon, 09 Apr 2012 23:40:37 -0000
Content-Type: text/plain

Previously the default mips tuning was defined as "mips1"
internally in the compiler.  Revise this and change to "mips32".

This eliminates the need for the mips32 specific tunings, which were
not being used anyway.  (They exists and were used, but were not
differentiated by package arch prior to a recent commit.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/mips/arch-mips.inc |   13 +++++++++----
 meta/conf/machine/include/tune-mips32.inc    |   24 +-----------------------
 2 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 8758ecd..c7768a1 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -28,6 +28,11 @@ TUNEVALID[fpu-hard] = "Use hardware FPU"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "-msoft-float", d)}"
 TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "soft", d)}"
 
+# mips32 is the default o32 tuning
+TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
+TUNE_CONFLICTS[mips32] = "n64 n32"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
+
 # Package naming
 MIPSPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
 MIPSPKGSFX_BYTE = "${@bb.utils.contains("TUNE_FEATURES", "n64" , "64", "", d)}"
@@ -40,7 +45,7 @@ TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPS
 
 # Base tunes
 AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
-TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
+TUNE_FEATURES_tune-mips = "mips32 o32 bigendian fpu-hard"
 BASE_LIB_tune-mips = "lib"
 MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
@@ -55,7 +60,7 @@ BASE_LIB_tune-mips64 = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
 
-TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
+TUNE_FEATURES_tune-mipsel = "mips32 o32 fpu-hard"
 BASE_LIB_tune-mipsel = "lib"
 MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
@@ -70,7 +75,7 @@ BASE_LIB_tune-mips64el = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
 
-TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
+TUNE_FEATURES_tune-mips-nf = "mips32 o32 bigendian"
 BASE_LIB_tune-mips-nf = "lib"
 MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
@@ -85,7 +90,7 @@ BASE_LIB_tune-mips64-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
 
-TUNE_FEATURES_tune-mipsel-nf = "o32"
+TUNE_FEATURES_tune-mipsel-nf = "mips32 o32"
 BASE_LIB_tune-mipsel-nf = "lib"
 MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 93ed5ee..f7bad90 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -1,25 +1,3 @@
-DEFAULTTUNE ?= "mips32"
+DEFAULTTUNE ?= "mips"
 
 require conf/machine/include/mips/arch-mips.inc
-
-TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
-TUNE_CONFLICTS[mips32] = "n64 n32"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
-
-AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
-
-TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips mips32"
-
-TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
-PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
-
-TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
-
-TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mips32el"
-PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf mips32el-nf"
-- 
1.7.1



