Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QkH7D-0005Ei-4E
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:54:11 +0200
Received: by rex (Postfix, from userid 1000)
	id 1C4BD201DD; Fri, 22 Jul 2011 15:50:00 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 15:49:55 +0100
Message-Id: <a10de4cf8b424ee95c8e283e75d486be5b3b8eac.1311345613.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] conf/machine/tune: Overhaul tune include file variables
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
X-List-Received-Date: Fri, 22 Jul 2011 14:54:11 -0000

There is currently consideradble confusion over how the tune files operate
and how these interact with the rest of the build system. This update/overhaul
changes things so the tune files are primarily resonsible for setting:

TUNE_ARCH - What was formerly set as TARGET_ARCH and is the value that
represents the architecture we're targetting.

TUNE_PKGARCH - The value that represents the tune confuration that this set
of tune parameters results in.

This allows the significant improvement that the core can now always determine
the target architecture value, even when TARGET_ARCH needs to be reset to
something different and likewise, there is one package architecture variable
the core can reference allowing simplification of the BASE_PACKAGE_ARCH, PACKAGE_ARCH
and FEED_ARCH variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass                      |   10 +++++++---
 meta/conf/bitbake.conf                           |    7 ++++---
 meta/conf/machine/include/tune-arm1136jf-s.inc   |    5 +++--
 meta/conf/machine/include/tune-arm920t.inc       |    5 +++--
 meta/conf/machine/include/tune-arm926ejs.inc     |    6 ++++--
 meta/conf/machine/include/tune-arm9tdmi.inc      |    5 +++--
 meta/conf/machine/include/tune-armv7.inc         |    5 +++--
 meta/conf/machine/include/tune-atom.inc          |    4 +++-
 meta/conf/machine/include/tune-c3.inc            |    6 ++++--
 meta/conf/machine/include/tune-cortexa8.inc      |    5 +++--
 meta/conf/machine/include/tune-cortexm1.inc      |    5 +++--
 meta/conf/machine/include/tune-cortexm3.inc      |    5 +++--
 meta/conf/machine/include/tune-cortexr4.inc      |    5 +++--
 meta/conf/machine/include/tune-ep9312.inc        |    5 +++--
 meta/conf/machine/include/tune-i586.inc          |    6 ++++++
 meta/conf/machine/include/tune-iwmmxt.inc        |    5 +++--
 meta/conf/machine/include/tune-mips32.inc        |    5 +++--
 meta/conf/machine/include/tune-ppc603e.inc       |    5 +++--
 meta/conf/machine/include/tune-ppce300c2.inc     |    4 +++-
 meta/conf/machine/include/tune-ppce500.inc       |    4 +++-
 meta/conf/machine/include/tune-ppce500mc.inc     |    5 +++--
 meta/conf/machine/include/tune-ppce500v2.inc     |    5 +++--
 meta/conf/machine/include/tune-sh3.inc           |    5 +++--
 meta/conf/machine/include/tune-sh4.inc           |    5 +++--
 meta/conf/machine/include/tune-strongarm1100.inc |    4 ++++
 meta/conf/machine/include/tune-supersparc.inc    |    5 +++--
 meta/conf/machine/include/tune-x86_64.inc        |    5 +++++
 meta/conf/machine/include/tune-xscale.inc        |    4 ++--
 meta/conf/machine/qemuarm.conf                   |    2 --
 meta/conf/machine/qemumips.conf                  |    2 --
 meta/conf/machine/qemuppc.conf                   |    2 --
 meta/conf/machine/qemux86-64.conf                |    3 +--
 meta/conf/machine/qemux86.conf                   |    4 +---
 33 files changed, 98 insertions(+), 60 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-i586.inc
 create mode 100644 meta/conf/machine/include/tune-x86_64.inc

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index acda1a9..b054146 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -147,9 +147,13 @@ def check_sanity(e):
     if (LooseVersion(__version__) < LooseVersion(minversion)):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, __version__)
 
-    # Check TARGET_ARCH is set
-    if data.getVar('TARGET_ARCH', e.data, True) == 'INVALID':
-        messages = messages + 'Please set TARGET_ARCH directly, or choose a MACHINE or DISTRO that does so.\n'
+    # Check TUNE_ARCH is set
+    if data.getVar('TUNE_ARCH', e.data, True) == 'INVALID':
+        messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
+
+    # Check TARGET_ARCH is set correctly
+    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
+        messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
     
     # Check TARGET_OS is set
     if data.getVar('TARGET_OS', e.data, True) == 'INVALID':
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e768df5..f95343f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -81,7 +81,8 @@ HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
 HOST_EXEEXT = ""
 
-TARGET_ARCH = "INVALID"
+TUNE_ARCH ??= "INVALID"
+TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
@@ -95,9 +96,9 @@ SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), '']
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 
-BASE_PACKAGE_ARCH = "${HOST_ARCH}"
+BASE_PACKAGE_ARCH = "${TUNE_PKGARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
-MACHINE_ARCH = "${@[bb.data.getVar('BASE_PACKAGE_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
+MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${TARGET_ARCH}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 2ea3c9d..bc90924 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,7 +1,8 @@
+TUNE_ARCH = "arm"
+
 TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s"
 TARGET_CC_ARCH += "${@['', '-mfloat-abi=softfp -mfpu=vfp'][(bb.data.getVar('TARGET_FPU', d, 1) == 'soft') and (bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') != -1)]}"
-FEED_ARCH = "armv6"
-BASE_PACKAGE_ARCH = "armv6"
+TUNE_PKGARCH = "armv6"
 
 ARM_INSTRUCTION_SET = "${@['thumb','arm'][bb.data.getVar('CPU_FEATURES', d, 1).find('thumb') == -1]}"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 564b557..2991e85 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,4 +1,5 @@
-FEED_ARCH = "armv4t"
-BASE_PACKAGE_ARCH = "armv4t" 
+TUNE_ARCH = "arm"
+
+TUNE_PKGARCH = "armv4t"
 TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 9d546c9..e54403b 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,7 +1,9 @@
-FEED_ARCH = "armv5te"
+TUNE_ARCH = "arm"
+
+TUNE_PKGARCH = "armv5te"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te"
 # For gcc 3.x you need:
 #TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ejs"
 # For gcc 4.x you need:
 TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ej-s"
-BASE_PACKAGE_ARCH = "armv5te"
+
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index 5446ce8..b75de3d 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -1,4 +1,5 @@
-FEED_ARCH = "armv4t"
-BASE_PACKAGE_ARCH = "armv4t"
+TUNE_ARCH = "arm"
+
+TUNE_PKGARCH = "armv4t"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
 TARGET_CC_ARCH = "-mcpu=arm9tdmi -mtune=arm9tdmi"
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
index 979d6fe..a6cc346 100644
--- a/meta/conf/machine/include/tune-armv7.inc
+++ b/meta/conf/machine/include/tune-armv7.inc
@@ -1,7 +1,8 @@
+TUNE_ARCH = "arm"
+
 # valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
 # valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', `cortex-m1'
 # This will NOT compile programs in 'ARM' mode, which is what you really want
 TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
-FEED_ARCH = "armv7"
+TUNE_PKGARCH = "armv7"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7"
-BASE_PACKAGE_ARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 399ea54..8141a67 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -1,4 +1,6 @@
-BASE_PACKAGE_ARCH = "core2"
+TUNE_ARCH = "i586"
+
+TUNE_PKGARCH = "core2"
 TARGET_CC_ARCH = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
 #MOBLIN_CFLAGS = "-Os -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables"
 
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index d33df5f..dd8dce1 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,4 +1,6 @@
+TUNE_ARCH = "i586"
+
+TUNE_PKGARCH = "i586"
+
 TARGET_CC_ARCH = "-march=c3 -mtune=c3"
 PACKAGE_EXTRA_ARCHS = "i386 i486 i586"
-BASE_PACKAGE_ARCH = "i586"
-FEED_ARCH = "i586"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index a5b982a..cf5b418 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,3 +1,5 @@
+TUNE_ARCH = "arm"
+
 # Instead of using -mfpu=vfp[2] we can use -mfpu=neon to make use of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
 # [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
 # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
@@ -8,6 +10,5 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
 # Other potentially useful options
 #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
 
-FEED_ARCH = "armv7a"
-BASE_PACKAGE_ARCH = "armv7a"
+TUNE_PKGARCH = "armv7a"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index 6c4a70a..6dbfd2c 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -1,3 +1,4 @@
+TUNE_ARCH = "arm"
+
 TARGET_CC_ARCH = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
-FEED_ARCH = "armv6"
-BASE_PACKAGE_ARCH = "armv6"
+TUNE_PKGARCH = "armv6"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index 6da9aee..63959e4 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -1,4 +1,5 @@
+TUNE_ARCH = "arm"
+
 # valid options for -march: `armv7', `armv7-m'
 TARGET_CC_ARCH = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
-FEED_ARCH = "armv7"
-BASE_PACKAGE_ARCH = "armv7"
+TUNE_PKGARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index b8bb7f5..780a510 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -1,4 +1,5 @@
+TUNE_ARCH = "arm"
+
 # valid options for -march: `armv7', `armv7-r'
 TARGET_CC_ARCH = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
-FEED_ARCH = "armv7"
-BASE_PACKAGE_ARCH = "armv7"
+TUNE_PKGARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index e1515a0..81be6dd 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -1,8 +1,9 @@
+TUNE_ARCH = "arm"
+
 TARGET_CC_ARCH = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
 # add "-mfp=maverick" for newer gcc versions > 4.0
 
 #set arch to ep9312 for all generated packages
 PACKAGE_EXTRA_ARCHS = "arm armv4t ep9312"
-BASE_PACKAGE_ARCH = "ep9312"
-FEED_ARCH = "ep9312"
+TUNE_PKGARCH = "ep9312"
 
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
new file mode 100644
index 0000000..7ea8b4f
--- /dev/null
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -0,0 +1,6 @@
+TUNE_ARCH = "i586"
+
+TUNE_PKGARCH = "i586"
+TARGET_CC_ARCH = "-m32 -march=i586"
+
+PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 7191ab0..68e118a 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -1,7 +1,8 @@
+TUNE_ARCH = "arm"
+
 # Configurations for the Intel PXA27x Appications Processor Family. 
 # Please use tune-xscale for PXA255/PXA26x based processors.
 TARGET_CC_ARCH = "-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt"
-BASE_PACKAGE_ARCH = "iwmmxt"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te iwmmxt"
-FEED_ARCH = "iwmmxt"
+TUNE_PKGARCH = "iwmmxt"
 
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 67edca2..a7bcb50 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -1,3 +1,4 @@
+TUNE_ARCH = "mips"
+
 TARGET_CC_ARCH = "-march=mips32"
-FEED_ARCH = "${TARGET_ARCH}"
-BASE_PACKAGE_ARCH = "${TARGET_ARCH}"
+TUNE_PKGARCH = "mips"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index dc95d0d..daa1cd3 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -1,4 +1,5 @@
+TUNE_ARCH = "powerpc"
+
 TARGET_CC_ARCH = "-mcpu=603e  -mhard-float"
-BASE_PACKAGE_ARCH = "ppc603e"
-FEED_ARCH = "ppc603e"
+TUNE_PKGARCH = "ppc603e"
 PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index 3e552e6..a2989ae 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -1,3 +1,5 @@
+TUNE_ARCH = "powerpc"
+
 TARGET_CC_ARCH = "-mcpu=e300c2 -msoft-float"
-BASE_PACKAGE_ARCH = "ppce300"
+TUNE_PKGARCH = "ppce300"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 45e1f0d..8d67b86 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -1,4 +1,6 @@
+TUNE_ARCH = "powerpc"
+
 TARGET_CC_ARCH = "-mcpu=8540"
 BASE_PACKAGE_ARCH = "ppce500"
-FEED_ARCH = "ppce500"
+TUNE_PKGARCH = "ppce500"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 763ec1a..0cdcfa8 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -1,4 +1,5 @@
+TUNE_ARCH = "powerpc"
+
 TARGET_CC_ARCH = "-mcpu=e500mc"
-BASE_PACKAGE_ARCH = "ppce500mc"
-FEED_ARCH = "ppce500mc"
+TUNE_PKGARCH = "ppce500mc"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index d76dbc9..219bcaf 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -1,4 +1,5 @@
+TUNE_ARCH = "powerpc"
+
 TARGET_CC_ARCH = "-mcpu=8548 -mabi=spe -mspe"
-BASE_PACKAGE_ARCH = "ppce500v2"
-FEED_ARCH = "ppce500v2"
+TUNE_PKGARCH = "ppce500v2"
 PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
index 32801a6..45ad6de 100644
--- a/meta/conf/machine/include/tune-sh3.inc
+++ b/meta/conf/machine/include/tune-sh3.inc
@@ -1,3 +1,4 @@
+TUNE_ARCH = "sh3"
+
 TARGET_CC_ARCH = "-ml -m3"
-FEED_ARCH = "sh3"
-BASE_PACKAGE_ARCH = "sh3"
+TUNE_PKGARCH = "sh3"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
index 51b4069..3d89d49 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/tune-sh4.inc
@@ -1,7 +1,8 @@
+TUNE_ARCH = "sh4"
+
 # NOTE: If you want to optimize to sh4a, conf/machine/include/tune-sh4a.inc.
 # But it is not compatible for sh4.
 # The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
 
 TARGET_CC_ARCH = "-ml -m4"
-FEED_ARCH = "sh4"
-BASE_PACKAGE_ARCH = "sh4"
+TUNE_PKGARCH = "sh4"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index f136710..2d4ce38 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -1,3 +1,7 @@
+TUNE_ARCH = "arm"
+
+TUNE_PKGARCH = "arm"
+
 # This machine lists common configuration options for Strongarm 1100 devices
 # NOTE: The Zaurus Collie also has a Strongarm processor, but uses the 1110 type
 
diff --git a/meta/conf/machine/include/tune-supersparc.inc b/meta/conf/machine/include/tune-supersparc.inc
index a402e7c..7eaa736 100644
--- a/meta/conf/machine/include/tune-supersparc.inc
+++ b/meta/conf/machine/include/tune-supersparc.inc
@@ -1,3 +1,4 @@
+TUNE_ARCH = "sparc"
+
 TARGET_CC_ARCH = "-mcpu=supersparc"
-BASE_PACKAGE_ARCH = "supersparc"
-FEED_ARCH = "supersparc" 
+TUNE_PKGARCH = "supersparc"
diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
new file mode 100644
index 0000000..d7665ec
--- /dev/null
+++ b/meta/conf/machine/include/tune-x86_64.inc
@@ -0,0 +1,5 @@
+TUNE_ARCH = "x86_64"
+
+TUNE_PKGARCH = "x86_64"
+TARGET_CC_ARCH = "-m64"
+
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index cfdcc99..69c60f5 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,10 +1,10 @@
-FEED_ARCH = "armv5te"
+TUNE_ARCH = "arm"
 
 INHERIT += "siteinfo"
 
 TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
-BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 9fb1893..526d713 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -2,8 +2,6 @@
 #@NAME: arm_versaile_926ejs
 #@DESCRIPTION: arm_versaile_926ejs
 
-TARGET_ARCH = "arm"
-
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-arm926ejs.inc
 #require conf/machine/include/tune-arm1136jf-s.inc
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 283ae1e..ce1c419 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -2,8 +2,6 @@
 #@NAME: mti_malta32_be MIPS
 #@DESCRIPTION: mti_malta32_be
 
-TARGET_ARCH = "mips"
-
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-mips32.inc
 
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index bfbcc7f..dacc802 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -2,8 +2,6 @@
 #@NAME: qemu PPC Emulator setup
 #@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
 
-TARGET_ARCH = "powerpc"
-
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-xlib"
 
 require conf/machine/include/qemu.inc
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index ca91388..46d7d12 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -10,6 +10,7 @@ PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
 
+require conf/machine/include/tune-x86_64.inc
 require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
@@ -31,5 +32,3 @@ GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
-
-TARGET_CC_ARCH = "-m64"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 8b14731..5d0d03e 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,13 +2,12 @@
 #@NAME: common_pc
 #@DESCRIPTION: Machine configuration for running a common x86
 
-TARGET_ARCH = "i586"
-
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
 
+require conf/machine/include/tune-i586.inc
 require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
@@ -31,4 +30,3 @@ GLIBC_EXTRA_OECONF = "--with-tls"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-TARGET_CC_ARCH = "-march=i586"
-- 
1.7.4.1



