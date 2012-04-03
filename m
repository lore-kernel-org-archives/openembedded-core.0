Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q6-0001m2-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlF2o029703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:15 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:15 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:04 -0500
Message-ID: <23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 4/7] conf/machine/include: Cleanup PowerPC tunings to match README
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:26 -0000
Content-Type: text/plain

Cleanup the PowerPC tunings to match the new tuning README file.

Default PowerPC to using TUNE_PKGARCH = ${TUNE_PKGARCH_tune-<tune>}

Fix AVAILTUNE settings in ppc603e, and ppce500mc to be addative.

Correct potentially overlapping "spe" definitions in ppce500 and ppce500v2.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/powerpc/README           |   17 +++++++++++++++++
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   15 ++++++++-------
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 meta/conf/machine/include/tune-ppc603e.inc         |    4 ++--
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500.inc         |   10 +++++++---
 meta/conf/machine/include/tune-ppce500mc.inc       |    4 ++--
 meta/conf/machine/include/tune-ppce500v2.inc       |   10 +++++++---
 meta/conf/machine/include/tune-ppce5500.inc        |    4 ++--
 9 files changed, 47 insertions(+), 20 deletions(-)
 create mode 100644 meta/conf/machine/include/powerpc/README

diff --git a/meta/conf/machine/include/powerpc/README b/meta/conf/machine/include/powerpc/README
new file mode 100644
index 0000000..e87fb50
--- /dev/null
+++ b/meta/conf/machine/include/powerpc/README
@@ -0,0 +1,17 @@
+2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
+  - Initial revision
+
+There are 4 primary PowerPC ABIs.
+# *) Hard/Soft Floating Point
+# *) 32-bit/64-bit
+
+TUNE_ARCH is defined as either "powerpc" or "powerpc64" based on the m32 
+or m64 feature.
+
+May of the PowerPC package archictures are based on legacy Linux names.
+However, a general naming scheme should be similar to: ppc[64][<family>][-nf].
+(Note: the default package architectures are "powerpc" and "powerpc64".)
+
+TUNE_PKGARCH is defined as TUNE_PKGARCH_tune-${DEFAULTTUNE}.  All 
+PowerPC tunings are required to define TUNE_PKGARCH_tune-<tune>.
+
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c5fd6b7..12909d9 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -5,6 +5,9 @@
 
 DEFAULTTUNE ?= "powerpc"
 
+TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
+ABIEXTENSION ?= ""
+
 TUNEVALID[m32] = "Power ELF32 standard ABI"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
@@ -16,16 +19,14 @@ TUNEVALID[fpu-soft] = "Use software FPU."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
 TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
 
-ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
-
-PPCPKGSFX_FPU = "${@['', '-nf'][d.getVar('TARGET_FPU', True) in ['fpu-soft']]}"
-TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
-
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
+TUNE_FEATURES_tune-powerpc-nf = "m32 fpu-soft"
 BASE_LIB_tune-powerpc-nf = "lib"
+TUNE_PKGARCH_tune-powerpc-nf = "powerpc-nf"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
-TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
+
+TUNE_FEATURES_tune-powerpc = "m32 fpu-hard"
 BASE_LIB_tune-powerpc = "lib"
+TUNE_PKGARCH_tune-powerpc = "powerpc"
 PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 48cd08e..a5e9755 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -10,4 +10,5 @@ TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "",
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
+TUNE_PKGARCH_tune-powerpc64 = "powerpc64"
 PACKAGE_EXTRA_ARCHS_tune-powerpc64 = "powerpc64"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 02cebe7..6557c1d 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,10 +4,10 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
-TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 
-AVAILTUNES = "ppc603e"
+AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
+TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
 
 # glibc configure options to get 603e specific library (for sqrt)
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index 27ef4a8..aae8ac0 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -4,8 +4,8 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
-TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
+TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
 PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index feb1967..be43722 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,13 +4,17 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
-TUNE_PKGARCH_tune-ppce500 = "ppce500"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], "-mabi=spe -mspe -mfloat-gprs=single", "", d)}"
+TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500" , "spe" ], "ppc-efs", "", d)}"
 
-TARGET_FPU = "ppc-efs"
+# spe is defined potentially in two places, so we want to be sure it will
+# only write spe once to the ABIEXTENSIONS field.
+SPEABIEXTENSION = "${@bb.utils.contains("TUNE_FEATURES", "spe", "spe", "", d)}"
+ABIEXTENSION .= "${SPEABIEXTENSION}"
 
 AVAILTUNES += "ppce500"
 TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500"
+TUNE_PKGARCH_tune-ppce500 = "ppce500"
 PACKAGE_EXTRA_ARCHS_tune-ppce500 = "ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 51e6f53..0e09384 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,10 +4,10 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 
-AVAILTUNES = "ppce500mc"
+AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
+TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
 
 # glibc configure options to get e500mc specific library (for sqrt)
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index f0158d0..3fe47da 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,13 +4,17 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
-TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += '${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}'
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2", "spe" ], "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
+TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2" , "spe" ], "ppc-efd", "", d)}"
 
-TARGET_FPU = "ppc-efd"
+# spe is defined potentially in two places, so we want to be sure it will
+# only write spe once to the ABIEXTENSIONS field.
+SPEABIEXTENSION = "${@bb.utils.contains("TUNE_FEATURES", "spe", "spe", "", d)}"
+ABIEXTENSION .= "${SPEABIEXTENSION}"
 
 AVAILTUNES += "ppce500v2"
 TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
+TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "ppce500v2"
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
index fe8d79d..8ab0fc5 100644
--- a/meta/conf/machine/include/tune-ppce5500.inc
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -7,14 +7,14 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "-mcpu=e5500", ""
 
 AVAILTUNES += "ppce5500 ppc64e5500"
 TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
-PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
 BASE_LIB_tune-ppce5500 = "lib"
 TUNE_PKGARCH_tune-ppce5500 = "ppce5500"
+PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
 
 TUNE_FEATURES_tune-ppc64e5500 = "m64 fpu-hard e5500"
-PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
 BASE_LIB_tune-ppc64e5500 = "lib64"
 TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"
+PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
 
 # glibc configure options to get e5500 specific library (for sqrt)
 GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "--with-cpu=e5500", "", d)}"
-- 
1.7.1



