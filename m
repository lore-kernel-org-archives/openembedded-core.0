Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkK5g-0001sa-DP for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 20:04:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI0dRT030433
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:00:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29510-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:00:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI0VeV030426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:00:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
Date: Fri, 22 Jul 2011 19:00:28 +0100
Message-ID: <1311357628.2344.153.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH 5/3] conf/machine/include: Start to fill out architecture specific tune include files and tune features
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
X-List-Received-Date: Fri, 22 Jul 2011 18:04:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These changes revolve around the idea of tune features. These are represented by
'flag' strings that are included in the TUNE_FEATURES variable.

Any string included in TUNE_FEATURES should also add a TUNEVALID[<name>] entry so
we can know which flags are available in TUNE_FEATURES and have documentation about
what the flags do. We will add sanity code to error if flags are listed in
TUNE_FEATURES but are not documented in TUNEVALID.

A given tune configuration will want to define one or more predetermined sets of
_FEATURE flag lists. These are defined in the form TUNE_FEATURES_tune-<name>.
For defined tune configuation, <name> should be added to the AVAILTUNE list so that
we can determine what tune configurations are available. Flags cannot be used in this
case as with TUNEVALID since its useful to be able to build up tune lists from other
TUNE_FEATURES_tune-yyy options.

A given tune configuration may also define PACKAGE_EXTRA_ARCHS_tune-<name> and
BASE_LIB_tune-<name> to control the multilib location. All options can be overridden
by the distro or local user configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 47ce023..61312bc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -83,6 +83,8 @@ HOST_EXEEXT = ""
 
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
+TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
+PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}"
 
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "INVALID"
@@ -100,7 +102,7 @@ SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
-PACKAGE_EXTRA_ARCHS ??= "${TARGET_ARCH}"
+PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
 # since machine specific packages are handled using multimachine
diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
new file mode 100644
index 0000000..e773d14
--- a/dev/null
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -0,0 +1 @@
+TUNE_ARCH = "arm"
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
new file mode 100644
index 0000000..3a9d0bc
--- a/dev/null
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -0,0 +1,29 @@
+#
+# IA32 Architecture definition
+#
+
+DEFAULTTUNE = "x86"
+TARGET_FPU = "hard"
+
+# ELF32 ABI
+TUNEVALID[m32] = "IA32 ELF32 standard ABI"
+TUNECONFLICTS[m32] = "m64"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "i586", "" ,d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
+
+# ELF64 ABI
+TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
+TUNECONFLICT[m64] = "m32"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "x86_64", "" ,d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
+
+# Default Tune configurations
+AVAILTUNES += "x86"
+TUNE_FEATURES_tune-x86 ?= "m32"
+BASE_LIB_tune-x86 = "lib"
+PACKAGE_EXTRA_ARCHS_tune-x86 = "x86"
+
+AVAILTUNES += "x86-64"
+TUNE_FEATURES_tune-x86-64 ?= "m64"
+BASE_LIB_tune-x86-64 = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
\ No newline at end of file
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
new file mode 100644
index 0000000..f7f4eed
--- a/dev/null
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -0,0 +1 @@
+TUNE_ARCH = "mips"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
new file mode 100644
index 0000000..5ab81d4
--- a/dev/null
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -0,0 +1 @@
+TUNE_ARCH = "powerpc"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index c1d0c07..953f0dd 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_CCARGS = "-march=armv6j -mtune=arm1136jf-s"
 TUNE_CCARGS += "${@['', '-mfloat-abi=softfp -mfpu=vfp'][(bb.data.getVar('TARGET_FPU', d, 1) == 'soft') and (bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') != -1)]}"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 3f30e2a..6c87026 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_PKGARCH = "armv4t"
 TUNE_CCARGS = "-march=armv4t -mtune=arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 049f57c..543ab62 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_PKGARCH = "armv5te"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index 0ed2f40..f1001ac 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_PKGARCH = "armv4t"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
index 2e32323..8a68c0a 100644
--- a/meta/conf/machine/include/tune-armv7.inc
+++ b/meta/conf/machine/include/tune-armv7.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 # valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
 # valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', `cortex-m1'
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 52acd12..5e1bb74 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -1,7 +1,2 @@
-TUNE_ARCH = "i586"
-
-TUNE_PKGARCH = "core2"
-TUNE_CCARGS = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
-#MOBLIN_CFLAGS = "-Os -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables"
-
-PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586 i686 core2"
+# Atom tunings are the same as core2 for now...
+require conf/machine/include/tune-core2.inc
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index dbe1e43..e1569f5 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "i586"
+require conf/machine/include/ia32/arch-ia32.inc
 
 TUNE_PKGARCH = "i586"
 
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
new file mode 100644
index 0000000..e94c290
--- a/dev/null
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -0,0 +1,21 @@
+require conf/machine/include/tune-i586.inc
+
+DEFAULTTUNE = "core2"
+TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "m32", "i686", "x86_64", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "m32", "core2", "core2-64", d)}"
+
+# Extra tune features
+TUNEVALID[core2] = "Enable core2 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "core2", "-march=core2 -msse3 -mtune=generic -mfpmath=sse", "", d)}"
+
+# Extra tune selections
+AVAILTUNES += "core2"
+TUNE_FEATURES_tune-core2 ?= "${TUNE_FEATURES_tune-x86} core2"
+BASE_LIB_tune-core2 = "lib"
+PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586 i686 core2"
+
+AVAILTUNES += "core2-64"
+TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
+BASE_LIB_tune-core2-64 = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
+
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 9be423a..ae50954 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,4 +1,5 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
+
 
 # Instead of using -mfpu=vfp[2] we can use -mfpu=neon to make use of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
 # [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index d0d3b2c..b944db4 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_CCARGS = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
 TUNE_PKGARCH = "armv6"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index 495c8f6..a77cbdd 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 # valid options for -march: `armv7', `armv7-m'
 TUNE_CCARGS = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index c775e83..c9193ca 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 # valid options for -march: `armv7', `armv7-r'
 TUNE_CCARGS = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 8c7fc5a..e04a00a 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_CCARGS = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
 # add "-mfp=maverick" for newer gcc versions > 4.0
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index 1dc44df..88c9221 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,6 +1,15 @@
-TUNE_ARCH = "i586"
+require conf/machine/include/ia32/arch-ia32.inc
 
+DEFAULTTUNE = "i586"
 TUNE_PKGARCH = "i586"
-TUNE_CCARGS = "-m32 -march=i586"
 
-PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586"
+# Extra tune features
+TUNEVALID[i586] = "Enable i586 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "i586", "-march=i586", "", d)}"
+
+# Extra tune selections
+AVAILTUNES += "i586"
+TUNE_FEATURES_tune-i586 ?= "${TUNE_FEATURES_tune-x86} i586"
+BASE_LIB_tune-i586 = "lib"
+PACKAGE_EXTRA_ARCHS_tune-i586 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586"
+
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 236cede..6bb76d5 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 # Configurations for the Intel PXA27x Appications Processor Family. 
 # Please use tune-xscale for PXA255/PXA26x based processors.
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 182d16c..28b0047 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "mips"
+require conf/machine/include/mips/arch-mips.inc
 
 TUNE_CCARGS = "-march=mips32"
 TUNE_PKGARCH = "mips"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index ec43cfe..61c0669 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "powerpc"
+require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNE_CCARGS = "-mcpu=603e  -mhard-float"
 TUNE_PKGARCH = "ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index ac23242..a38e97c 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "powerpc"
+require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNE_CCARGS = "-mcpu=e300c2 -msoft-float"
 TUNE_PKGARCH = "ppce300"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index a342cfb..22208f0 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "powerpc"
+require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNE_CCARGS = "-mcpu=8540"
 BASE_PACKAGE_ARCH = "ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 497c1a4..182d019 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "powerpc"
+require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNE_CCARGS = "-mcpu=e500mc"
 TUNE_PKGARCH = "ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 1c56829..daf2d58 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "powerpc"
+require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNE_CCARGS = "-mcpu=8548 -mabi=spe -mspe"
 TUNE_PKGARCH = "ppce500v2"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index ec29053..2b76069 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 TUNE_PKGARCH = "arm"
 
diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
index 08ff30a..04b0f96 100644
--- a/meta/conf/machine/include/tune-x86_64.inc
+++ b/meta/conf/machine/include/tune-x86_64.inc
@@ -1,5 +1,3 @@
-TUNE_ARCH = "x86_64"
-
-TUNE_PKGARCH = "x86_64"
-TUNE_CCARGS = "-m64"
+require conf/machine/include/ia32/arch-ia32.inc
 
+DEFAULTTUNE = "x86-64"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 9618a8b..71dba5b 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,4 +1,4 @@
-TUNE_ARCH = "arm"
+require conf/machine/include/arm/arch-arm.inc
 
 INHERIT += "siteinfo"
 




