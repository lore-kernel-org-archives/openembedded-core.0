Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QkH7E-0005FL-30
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:54:12 +0200
Received: by rex (Postfix, from userid 1000)
	id 047DC206FF; Fri, 22 Jul 2011 15:50:00 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 15:49:56 +0100
Message-Id: <3a3c69a1bc3cf0b6f6a3b13d86c12ed21798d48e.1311345613.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH
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
X-List-Received-Date: Fri, 22 Jul 2011 14:54:13 -0000

Since we're updating the tune file format, it makes sense to abstract
the compiler tune arguments at this point too. This means that should
these need to be overridden at any point, the original values can
still be obtained in a similar manner to the other TUNE* variables.

Whilst this isn't strictly necessary for any current need, its likely
good practise to standardise this behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                           |    4 +++-
 meta/conf/machine/include/tune-arm1136jf-s.inc   |    4 ++--
 meta/conf/machine/include/tune-arm920t.inc       |    2 +-
 meta/conf/machine/include/tune-arm926ejs.inc     |    4 ++--
 meta/conf/machine/include/tune-arm9tdmi.inc      |    2 +-
 meta/conf/machine/include/tune-armv7.inc         |    2 +-
 meta/conf/machine/include/tune-atom.inc          |    2 +-
 meta/conf/machine/include/tune-c3.inc            |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc      |    2 +-
 meta/conf/machine/include/tune-cortexm1.inc      |    2 +-
 meta/conf/machine/include/tune-cortexm3.inc      |    2 +-
 meta/conf/machine/include/tune-cortexr4.inc      |    2 +-
 meta/conf/machine/include/tune-ep9312.inc        |    2 +-
 meta/conf/machine/include/tune-i586.inc          |    2 +-
 meta/conf/machine/include/tune-iwmmxt.inc        |    2 +-
 meta/conf/machine/include/tune-mips32.inc        |    2 +-
 meta/conf/machine/include/tune-ppc603e.inc       |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc     |    2 +-
 meta/conf/machine/include/tune-ppce500.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc     |    2 +-
 meta/conf/machine/include/tune-ppce500v2.inc     |    2 +-
 meta/conf/machine/include/tune-sh3.inc           |    2 +-
 meta/conf/machine/include/tune-sh4.inc           |    2 +-
 meta/conf/machine/include/tune-strongarm1100.inc |    2 +-
 meta/conf/machine/include/tune-supersparc.inc    |    2 +-
 meta/conf/machine/include/tune-thumb.inc         |    2 +-
 meta/conf/machine/include/tune-x86_64.inc        |    2 +-
 meta/conf/machine/include/tune-xscale.inc        |    6 +++---
 28 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f95343f..2954faa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -82,12 +82,14 @@ HOST_CC_ARCH = "${TARGET_CC_ARCH}"
 HOST_EXEEXT = ""
 
 TUNE_ARCH ??= "INVALID"
+TUNE_CCARGS ??= ""
+
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
-TARGET_CC_ARCH = ""
+TARGET_CC_ARCH = "${TUNE_CCARGS}"
 
 SDK_ARCH = "${BUILD_ARCH}"
 SDK_OS = "${BUILD_OS}"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index bc90924..c1d0c07 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,7 +1,7 @@
 TUNE_ARCH = "arm"
 
-TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s"
-TARGET_CC_ARCH += "${@['', '-mfloat-abi=softfp -mfpu=vfp'][(bb.data.getVar('TARGET_FPU', d, 1) == 'soft') and (bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') != -1)]}"
+TUNE_CCARGS = "-march=armv6j -mtune=arm1136jf-s"
+TUNE_CCARGS += "${@['', '-mfloat-abi=softfp -mfpu=vfp'][(bb.data.getVar('TARGET_FPU', d, 1) == 'soft') and (bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') != -1)]}"
 TUNE_PKGARCH = "armv6"
 
 ARM_INSTRUCTION_SET = "${@['thumb','arm'][bb.data.getVar('CPU_FEATURES', d, 1).find('thumb') == -1]}"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 2991e85..3f30e2a 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "arm"
 
 TUNE_PKGARCH = "armv4t"
-TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
+TUNE_CCARGS = "-march=armv4t -mtune=arm920t"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index e54403b..049f57c 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ TUNE_ARCH = "arm"
 TUNE_PKGARCH = "armv5te"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te"
 # For gcc 3.x you need:
-#TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ejs"
+#TUNE_CCARGS = "-march=armv5te -mtune=arm926ejs"
 # For gcc 4.x you need:
-TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ej-s"
+TUNE_CCARGS = "-march=armv5te -mtune=arm926ej-s"
 
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index b75de3d..0ed2f40 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -2,4 +2,4 @@ TUNE_ARCH = "arm"
 
 TUNE_PKGARCH = "armv4t"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
-TARGET_CC_ARCH = "-mcpu=arm9tdmi -mtune=arm9tdmi"
+TUNE_CCARGS = "-mcpu=arm9tdmi -mtune=arm9tdmi"
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
index a6cc346..2e32323 100644
--- a/meta/conf/machine/include/tune-armv7.inc
+++ b/meta/conf/machine/include/tune-armv7.inc
@@ -3,6 +3,6 @@ TUNE_ARCH = "arm"
 # valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
 # valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', `cortex-m1'
 # This will NOT compile programs in 'ARM' mode, which is what you really want
-TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
+TUNE_CCARGS = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
 TUNE_PKGARCH = "armv7"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7"
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 8141a67..52acd12 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -1,7 +1,7 @@
 TUNE_ARCH = "i586"
 
 TUNE_PKGARCH = "core2"
-TARGET_CC_ARCH = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
+TUNE_CCARGS = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
 #MOBLIN_CFLAGS = "-Os -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables"
 
 PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586 i686 core2"
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index dd8dce1..dbe1e43 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -2,5 +2,5 @@ TUNE_ARCH = "i586"
 
 TUNE_PKGARCH = "i586"
 
-TARGET_CC_ARCH = "-march=c3 -mtune=c3"
+TUNE_CCARGS = "-march=c3 -mtune=c3"
 PACKAGE_EXTRA_ARCHS = "i386 i486 i586"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index cf5b418..9be423a 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -5,7 +5,7 @@ TUNE_ARCH = "arm"
 # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
 # [3] https://support.codesourcery.com/GNUToolchain/kbentry29
 
-TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -fno-tree-vectorize"
+TUNE_CCARGS = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -fno-tree-vectorize"
 
 # Other potentially useful options
 #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index 6dbfd2c..d0d3b2c 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -1,4 +1,4 @@
 TUNE_ARCH = "arm"
 
-TARGET_CC_ARCH = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
+TUNE_CCARGS = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
 TUNE_PKGARCH = "armv6"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index 63959e4..495c8f6 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "arm"
 
 # valid options for -march: `armv7', `armv7-m'
-TARGET_CC_ARCH = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
+TUNE_CCARGS = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
 TUNE_PKGARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index 780a510..c775e83 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "arm"
 
 # valid options for -march: `armv7', `armv7-r'
-TARGET_CC_ARCH = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
+TUNE_CCARGS = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
 TUNE_PKGARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 81be6dd..8c7fc5a 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -1,6 +1,6 @@
 TUNE_ARCH = "arm"
 
-TARGET_CC_ARCH = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
+TUNE_CCARGS = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
 # add "-mfp=maverick" for newer gcc versions > 4.0
 
 #set arch to ep9312 for all generated packages
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index 7ea8b4f..1dc44df 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,6 +1,6 @@
 TUNE_ARCH = "i586"
 
 TUNE_PKGARCH = "i586"
-TARGET_CC_ARCH = "-m32 -march=i586"
+TUNE_CCARGS = "-m32 -march=i586"
 
 PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 68e118a..236cede 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -2,7 +2,7 @@ TUNE_ARCH = "arm"
 
 # Configurations for the Intel PXA27x Appications Processor Family. 
 # Please use tune-xscale for PXA255/PXA26x based processors.
-TARGET_CC_ARCH = "-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt"
+TUNE_CCARGS = "-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te iwmmxt"
 TUNE_PKGARCH = "iwmmxt"
 
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index a7bcb50..182d16c 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -1,4 +1,4 @@
 TUNE_ARCH = "mips"
 
-TARGET_CC_ARCH = "-march=mips32"
+TUNE_CCARGS = "-march=mips32"
 TUNE_PKGARCH = "mips"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index daa1cd3..ec43cfe 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "powerpc"
 
-TARGET_CC_ARCH = "-mcpu=603e  -mhard-float"
+TUNE_CCARGS = "-mcpu=603e  -mhard-float"
 TUNE_PKGARCH = "ppc603e"
 PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index a2989ae..ac23242 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "powerpc"
 
-TARGET_CC_ARCH = "-mcpu=e300c2 -msoft-float"
+TUNE_CCARGS = "-mcpu=e300c2 -msoft-float"
 TUNE_PKGARCH = "ppce300"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 8d67b86..a342cfb 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -1,6 +1,6 @@
 TUNE_ARCH = "powerpc"
 
-TARGET_CC_ARCH = "-mcpu=8540"
+TUNE_CCARGS = "-mcpu=8540"
 BASE_PACKAGE_ARCH = "ppce500"
 TUNE_PKGARCH = "ppce500"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 0cdcfa8..497c1a4 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "powerpc"
 
-TARGET_CC_ARCH = "-mcpu=e500mc"
+TUNE_CCARGS = "-mcpu=e500mc"
 TUNE_PKGARCH = "ppce500mc"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 219bcaf..1c56829 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "powerpc"
 
-TARGET_CC_ARCH = "-mcpu=8548 -mabi=spe -mspe"
+TUNE_CCARGS = "-mcpu=8548 -mabi=spe -mspe"
 TUNE_PKGARCH = "ppce500v2"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
index 45ad6de..dd12cd4 100644
--- a/meta/conf/machine/include/tune-sh3.inc
+++ b/meta/conf/machine/include/tune-sh3.inc
@@ -1,4 +1,4 @@
 TUNE_ARCH = "sh3"
 
-TARGET_CC_ARCH = "-ml -m3"
+TUNE_CCARGS = "-ml -m3"
 TUNE_PKGARCH = "sh3"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
index 3d89d49..473122c 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/tune-sh4.inc
@@ -4,5 +4,5 @@ TUNE_ARCH = "sh4"
 # But it is not compatible for sh4.
 # The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
 
-TARGET_CC_ARCH = "-ml -m4"
+TUNE_CCARGS = "-ml -m4"
 TUNE_PKGARCH = "sh4"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 2d4ce38..ec29053 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -5,5 +5,5 @@ TUNE_PKGARCH = "arm"
 # This machine lists common configuration options for Strongarm 1100 devices
 # NOTE: The Zaurus Collie also has a Strongarm processor, but uses the 1110 type
 
-TARGET_CC_ARCH = "-march=armv4 -mtune=strongarm1100"
+TUNE_CCARGS = "-march=armv4 -mtune=strongarm1100"
 
diff --git a/meta/conf/machine/include/tune-supersparc.inc b/meta/conf/machine/include/tune-supersparc.inc
index 7eaa736..0faa361 100644
--- a/meta/conf/machine/include/tune-supersparc.inc
+++ b/meta/conf/machine/include/tune-supersparc.inc
@@ -1,4 +1,4 @@
 TUNE_ARCH = "sparc"
 
-TARGET_CC_ARCH = "-mcpu=supersparc"
+TUNE_CCARGS = "-mcpu=supersparc"
 TUNE_PKGARCH = "supersparc"
diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
index a25cb53..9f6ce95 100644
--- a/meta/conf/machine/include/tune-thumb.inc
+++ b/meta/conf/machine/include/tune-thumb.inc
@@ -27,6 +27,6 @@ ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][bb.data.
 ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
 
 #
-TARGET_CC_ARCH +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
+TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
 TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -mno-thumb"
 
diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
index d7665ec..08ff30a 100644
--- a/meta/conf/machine/include/tune-x86_64.inc
+++ b/meta/conf/machine/include/tune-x86_64.inc
@@ -1,5 +1,5 @@
 TUNE_ARCH = "x86_64"
 
 TUNE_PKGARCH = "x86_64"
-TARGET_CC_ARCH = "-m64"
+TUNE_CCARGS = "-m64"
 
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 69c60f5..9618a8b 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -2,12 +2,12 @@ TUNE_ARCH = "arm"
 
 INHERIT += "siteinfo"
 
-TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
+TUNE_CCARGS = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
 TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
-TARGET_CC_ARCH_pn-webkit-gtk = "-march=armv4t"
-TARGET_CC_ARCH_pn-cairo = "-march=armv4t"
+TUNE_CCARGS_pn-webkit-gtk = "-march=armv4t"
+TUNE_CCARGS_pn-cairo = "-march=armv4t"
-- 
1.7.4.1



