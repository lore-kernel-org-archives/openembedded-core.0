Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgJBW-0004Gu-TQ for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:18:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFwf6k012663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12380-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFwQND012638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2011 16:57:40 +0100
Message-ID: <1310399860.20015.980.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [RFC PATCH 2/3] conf/machine: Overhaul tune include files
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
X-List-Received-Date: Mon, 11 Jul 2011 16:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is currently considerable confusion over how the tune files
operate and hwo these interact with the rest of the build system.

This update/overhaul changes things so the tune files are primarily
responsible for setting:

TUNE_ARCH - What was formerly set as TARGET_ARCH and is the value
that represents the architecture we're targetting.

TUNE_PKGARCH - The value that represents the tune configuration that
this set of tune parameters results in.

The tune files continue to be responsible for setting the compiler
flags as previously.

To determine the values for these fields, the tune code looks at
the values set in TUNE_FEATURES. Possible values that can be included
in this variable for a given tune file are shown in the TUNEVALID
variable.

This code allows several significant improvements:

1) The core can now always determine the target architecture value,
even when TARGET_ARCH needs to be reset to something different.

2) The tune code can allow for the definition of multilib configurations
which can be enabled in the TUNE_FEATURES variable by the multilib class.

3) Distros can easily configure/override specific tunable values
that they're specifically interested in.

4) Several versions of partial and buggy architecture support can be
rolled into one good implementation (e.g. the arm endianness support).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-yocto/conf/machine/beagleboard.conf         |    1 -
 meta/conf/bitbake.conf                           |   11 +++++++----
 meta/conf/machine/include/tune-arm1136jf-s.inc   |    2 ++
 meta/conf/machine/include/tune-arm920t.inc       |    2 ++
 meta/conf/machine/include/tune-arm926ejs.inc     |    2 ++
 meta/conf/machine/include/tune-arm9tdmi.inc      |    2 ++
 meta/conf/machine/include/tune-armv7.inc         |   16 ++++++++++++----
 meta/conf/machine/include/tune-atom.inc          |    8 ++++++--
 meta/conf/machine/include/tune-cortexa8.inc      |   10 +++++++---
 meta/conf/machine/include/tune-strongarm1100.inc |    2 ++
 meta/conf/machine/include/tune-thumb.inc         |   22 ++++------------------
 meta/conf/machine/qemux86.conf                   |    3 ++-
 12 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/meta-yocto/conf/machine/beagleboard.conf b/meta-yocto/conf/machine/beagleboard.conf
index fddacf9..0b3cebc 100644
--- a/meta-yocto/conf/machine/beagleboard.conf
+++ b/meta-yocto/conf/machine/beagleboard.conf
@@ -1,7 +1,6 @@
 #@TYPE: Machine
 #@NAME: Beagleboard machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/ board 
-TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xf86-lite"
 XSERVER = "xserver-xf86-lite \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 463991d..5258c91 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -76,7 +76,7 @@ HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
 HOST_EXEEXT = ""
 
-TARGET_ARCH = "INVALID"
+TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
@@ -90,9 +90,9 @@ SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), '']
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 
-BASE_PACKAGE_ARCH = "${HOST_ARCH}"
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
-MACHINE_ARCH = "${@[bb.data.getVar('BASE_PACKAGE_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
+BASE_PACKAGE_ARCH = "${TUNE_PKGARCH}"
+PACKAGE_ARCH = "${BASE_PACKAGE_PKGARCH}"
+MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${TARGET_ARCH}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
@@ -654,6 +654,9 @@ include conf/documentation.conf
 require conf/sanity.conf
 require conf/abi_version.conf
 
+TUNE_ARCH ?= "INVALID"
+TUNE_FEATURES ?= "${TUNE_FEATURES_tune-${TUNE_PKGARCH}}"
+
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 2ea3c9d..d18a7ba 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,3 +1,5 @@
+require conf/machine/include/arch-arm.inc
+
 TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s"
 TARGET_CC_ARCH += "${@['', '-mfloat-abi=softfp -mfpu=vfp'][(bb.data.getVar('TARGET_FPU', d, 1) == 'soft') and (bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') != -1)]}"
 FEED_ARCH = "armv6"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 564b557..3ee2e90 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,3 +1,5 @@
+require conf/machine/include/arch-arm.inc
+
 FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t" 
 TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 9d546c9..eeb63f4 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,3 +1,5 @@
+require conf/machine/include/arch-arm.inc
+
 FEED_ARCH = "armv5te"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te"
 # For gcc 3.x you need:
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index 5446ce8..a7dc1be 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -1,3 +1,5 @@
+require conf/machine/include/arch-arm.inc
+
 FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t"
 PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
index 979d6fe..6f7062f 100644
--- a/meta/conf/machine/include/tune-armv7.inc
+++ b/meta/conf/machine/include/tune-armv7.inc
@@ -1,7 +1,15 @@
+require conf/machine/include/arch-arm.inc
+
+TUNE_PKGARCH = "armv7"
+TUNE_FEATURES_tune-armv7 ??= "hard-fpu"
+
 # valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
 # valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', `cortex-m1'
 # This will NOT compile programs in 'ARM' mode, which is what you really want
-TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
-FEED_ARCH = "armv7"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7"
-BASE_PACKAGE_ARCH = "armv7"
+TARGET_CC_ARCH += "-march=armv7"
+TARGET_CC_ARCH += "-mfpu=vfp -mfloat-abi=softfp"
+
+TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "hard-fpu", "hard", "soft" ,d)}"
+
+PACKAGE_EXTRA_ARCHS = "${TUNE_ARCH} armv4${ENDSUFX} armv4t${ENDSUFX} armv5te${ENDSUFX} armv6${ENDSUFX} armv7${ENDSUFX}"
+
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 399ea54..b00c223 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -1,5 +1,9 @@
-BASE_PACKAGE_ARCH = "core2"
+require conf/machine/include/arch-ia32.inc
+
+TUNE_PKGARCH = "core2"
+TUNE_FEATURES_tune-core2 ??= ""
+
 TARGET_CC_ARCH = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
-#MOBLIN_CFLAGS = "-Os -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables"
+TARGET_CC_ARCH_ml-tune-lib64 = "-m64 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
 
 PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586 i686 core2"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index a5b982a..74c1e9e 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,3 +1,8 @@
+require conf/machine/include/arch-arm.inc
+
+TUNE_PKGARCH = "armv7a"
+TUNE_FEATURES_tune-armv7a ??= "hard-fpu"
+
 # Instead of using -mfpu=vfp[2] we can use -mfpu=neon to make use of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
 # [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
 # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
@@ -8,6 +13,5 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
 # Other potentially useful options
 #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
 
-FEED_ARCH = "armv7a"
-BASE_PACKAGE_ARCH = "armv7a"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
+PACKAGE_EXTRA_ARCHS = "${TUNE_ARCH} armv4${ENDSUFX} armv4t${ENDSUFX} armv5te${ENDSUFX} armv6${ENDSUFX} armv7${ENDSUFX} armv7a${ENDSUFX}"
+
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index f136710..7e1e2f7 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -1,3 +1,5 @@
+require conf/machine/include/arch-arm.inc
+
 # This machine lists common configuration options for Strongarm 1100 devices
 # NOTE: The Zaurus Collie also has a Strongarm processor, but uses the 1110 type
 
diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
index a25cb53..548868f 100644
--- a/meta/conf/machine/include/tune-thumb.inc
+++ b/meta/conf/machine/include/tune-thumb.inc
@@ -1,32 +1,18 @@
-#tune file for thumb instructions
-
-ARM_INSTRUCTION_SET ?= "arm"
-# "arm" "thumb"
 #    The instruction set the compiler should use when generating application
 #    code.  The kernel is always compiled with arm code at present.  arm code
 #    is the original 32 bit ARM instruction set, thumb code is the 16 bit
 #    encoded RISC sub-set.  Thumb code is smaller (maybe 70% of the ARM size)
 #    but requires more instructions (140% for 70% smaller code) so may be
 #    slower.
+TARGET_CC_ARCH +=  "${@bb.utils.contains("TUNE_FEATURES", "thumb-instructions", "-mthumb", "-mno-thumb" ,d)}"
+OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb-instructions", ":thumb", "" ,d)}
 
-THUMB_INTERWORK ?= "yes"
-# "yes" "no"
 #    Whether to compile with code to allow interworking between the two
 #    instruction sets.  This allows thumb code to be executed on a primarily
 #    arm system and vice versa.  It is strongly recommended that DISTROs not
 #    turn this off - the actual cost is very small.
+TARGET_CC_ARCH +=  "${@bb.utils.contains("TUNE_FEATURES", "thumb-interwork", "-mthumb-interwork", "-mno-thumb-interwork" ,d)}"
+OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb-interwork", ":thumb-interwork", "" ,d)}
 
-OVERRIDE_THUMB = "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
-
-#    Compiler and linker options for application code and kernel code.  These
-#    options ensure that the compiler has the correct settings for the selected
-#    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-
-#
-TARGET_CC_ARCH +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
 TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -mno-thumb"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 8b14731..2eb885b 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,7 +2,8 @@
 #@NAME: common_pc
 #@DESCRIPTION: Machine configuration for running a common x86
 
-TARGET_ARCH = "i586"
+require conf/machine/include/arch-ia32.inc
+TUNE_PKGARCH = "i586"
 
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-- 
1.7.4.1




