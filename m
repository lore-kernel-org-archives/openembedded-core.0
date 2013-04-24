Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UV0Ep-0002o8-Bp
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:00:00 +0200
Received: by mail-pa0-f44.google.com with SMTP id bi5so1202429pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CvFoUfBwjc21PMEfRvdHRI1s2PtwtIV41GiD4C1LX5s=;
	b=t0DFBq9njsf9mApQXCFc1OFpvWhBXR+Os0gkABxbDd+TAoIuret+JD3u2PSCFZ8esh
	xozS2i50TyXIkASBWUtfPNieBEE2BduKNVepx+uhq6oLPKA09cxJhVnQDn52JDB9a+WA
	8fYt7FH51+qL5ciCNWoSpNZTACCXQkutvYnfPdc4vpiOFzIuOAybYWTDDT/Afps3wkTt
	zh0sBAzeS/XVgQdkBGfdwfAslmQRGcZaMZsxzrXxUzD0Fv/d1wj0zOSdiEfo7JTtVTNe
	GHfr8AzqnXM6X3p0IWGBpUgPOHi1aX4qJ1ku73A4ajSqGIzjCGHRg4AM0aTTlWwhyO3G
	cRSw==
X-Received: by 10.68.184.132 with SMTP id eu4mr47773996pbc.87.1366810936629;
	Wed, 24 Apr 2013 06:42:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm3126138pbl.17.2013.04.24.06.42.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 06:42:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 15:42:12 +0200
Message-Id: <1366810932-7377-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1366810932-7377-1-git-send-email-Martin.Jansa@gmail.com>
References: <20130424102611.GH3217@jama>
	<1366810932-7377-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] conf/machine: use .= instead of += in TUNE_CCARGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 14:00:01 -0000
X-List-Received-Date: Wed, 24 Apr 2013 14:00:01 -0000

* number of TUNE_CCARGS conditionals is important if we add
  extra space with each one in "else" branch

  I'm building for 2 MACHINEs one is cortexa9, second is cortexa8

  few months ago we added TUNE_CCARGS[vardepvalue] in bitbake.conf
  http://git.openembedded.org/openembedded-core/commit/?id=03f1e34ea3ce80931e9c3cd2ab22824f28a7233b

  which fixed some cases (like mentioned tune-xscale and tune-arm926ejs)
  where both had unused TUNE_CCARGS when common DEFAULTTUNE was used.

  with cortexa[89] it's different, because cortexa9 has one extra TUNE_CCARGS
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex-a9", "", d)}"
  which adds extra *space* even when not used because of '+=' and as result:

  $ bitbake-diffsigs tmp-eglibc/sstate-diff/1366797730/*/armv7*/adapterbase/*do_configure*
  basehash changed from f986789fb8fb3579ed6a3492cc8a8d10 to c851b5f838d945ee13072e9ad6725dca
  Variable TUNE_CCARGS value changed from
  ' -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon '
  to
  ' -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  '
  Hash for dependent task gcc-runtime_4.7.bb.do_populate_sysroot changed from bdeabf7a86958b9110b566344b7916de to 2be5618e6bc8c57ec9db5659bf217915
  Hash for dependent task eglibc_2.17.bb.do_populate_sysroot changed from b4f40fc62dde684acd0a574532a55360 to 97fcb426603d4a1c1099c0504d2ebf7d
  Hash for dependent task glib-2.0_2.34.3.bb.do_populate_sysroot changed from fd2f90b83098c34e88d649d70f6ea4f5 to ebd740bb94ea3eb0a914efda6fc82c4a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc         |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc         |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc         |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc        |  2 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc   |  2 +-
 meta/conf/machine/include/arm/feature-arm-thumb.inc  |  4 ++--
 meta/conf/machine/include/arm/feature-arm-vfp.inc    |  2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc         |  6 +++---
 meta/conf/machine/include/mips/arch-mips.inc         | 10 +++++-----
 meta/conf/machine/include/powerpc/arch-powerpc.inc   |  6 +++---
 meta/conf/machine/include/powerpc/arch-powerpc64.inc |  2 +-
 meta/conf/machine/include/sh/arch-sh.inc             |  2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc       |  2 +-
 meta/conf/machine/include/tune-arm920t.inc           |  2 +-
 meta/conf/machine/include/tune-arm926ejs.inc         |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc          |  2 +-
 meta/conf/machine/include/tune-c3.inc                |  2 +-
 meta/conf/machine/include/tune-core2.inc             |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc         |  2 +-
 meta/conf/machine/include/tune-cortexa7.inc          |  2 +-
 meta/conf/machine/include/tune-cortexa8.inc          |  2 +-
 meta/conf/machine/include/tune-cortexa9.inc          |  2 +-
 meta/conf/machine/include/tune-cortexm1.inc          |  2 +-
 meta/conf/machine/include/tune-cortexm3.inc          |  4 ++--
 meta/conf/machine/include/tune-cortexr4.inc          |  4 ++--
 meta/conf/machine/include/tune-ep9312.inc            |  2 +-
 meta/conf/machine/include/tune-i586.inc              |  2 +-
 meta/conf/machine/include/tune-iwmmxt.inc            |  2 +-
 meta/conf/machine/include/tune-mips32.inc            |  2 +-
 meta/conf/machine/include/tune-ppc476.inc            |  2 +-
 meta/conf/machine/include/tune-ppc603e.inc           |  2 +-
 meta/conf/machine/include/tune-ppce300c2.inc         |  2 +-
 meta/conf/machine/include/tune-ppce300c3.inc         |  2 +-
 meta/conf/machine/include/tune-ppce500.inc           |  4 ++--
 meta/conf/machine/include/tune-ppce500mc.inc         |  2 +-
 meta/conf/machine/include/tune-ppce500v2.inc         |  4 ++--
 meta/conf/machine/include/tune-ppce5500.inc          |  2 +-
 meta/conf/machine/include/tune-ppce6500.inc          |  2 +-
 meta/conf/machine/include/tune-sh3.inc               |  2 +-
 meta/conf/machine/include/tune-sh4.inc               |  4 ++--
 meta/conf/machine/include/tune-strongarm1100.inc     |  2 +-
 meta/conf/machine/include/tune-xscale.inc            |  2 +-
 42 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 5940467..c33c816 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", " -march=armv4${ARMPKGSFX_THUMB}", "", d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 33fe401..9e8d1fa 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv5", " -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv5", "armv5:", "" ,d)}"
 
 ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 882400e..0adf73f 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv6"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", " -march=armv6", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv6", "armv6:", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index e876f33..bf3eace 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv7a"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", " -march=armv7-a", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "armv7a:", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index a7dac03..df4027e 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,3 @@
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "neon", "-mfpu=neon", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "neon", " -mfpu=neon", "" ,d)}"
 ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "" ,d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index d094529..bd754be 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -6,7 +6,7 @@
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
 ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${ARM_THUMB_M_OPT}", "", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
 # Note armv7 will hit on armv7a as well
@@ -20,7 +20,7 @@ ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ],
 # arm system and vice versa. It is strongly recommended that DISTROs not
 # turn this off - the actual cost is very small.
 TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", " -mno-thumb-interwork", " -mthumb-interwork", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"
 
 TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -marm"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 29a925c..dbc7e28 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -2,5 +2,5 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index a817bfd..aa83896 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -13,7 +13,7 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m32", " -m32", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86:", "" ,d)}"
 
 # x32 ABI
@@ -21,7 +21,7 @@ TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
 TUNECONFLICTS[mx32] = "m64 m32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", "" ,d)}"
 ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", " -mx32", "", d)}"
 TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
 TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 
@@ -29,7 +29,7 @@ TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
 TUNECONFLICTS[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m64", " -m64", "", d)}"
 
 # Default Tune configurations
 AVAILTUNES += "x86"
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index c390ff9..02626d3 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -8,25 +8,25 @@ DEFAULTTUNE ?= "mips"
 
 # Endianess
 TUNEVALID[bigendian] = "Enable big-endian mode"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -meb", " -mel", d)}"
 
 # ABI flags
 TUNEVALID[o32] = "MIPS o32 ABI"
 TUNECONFLICTS[o32] = "n32 n64"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "o32", " -mabi=32", "", d)}"
 
 TUNEVALID[n32] = "MIPS64 n32 ABI"
 TUNECONFLICTS[n32] = "o32 n64"
 ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "n32", "n32", "" ,d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=n32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "n32", " -mabi=n32", "", d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
 TUNECONFLICTS[n64] = "o32 n32"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-mabi=64", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "n64", " -mabi=64", "", d)}"
 
 # Floating point
 TUNEVALID[fpu-hard] = "Use hardware FPU"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "-msoft-float", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", " -mhard-float", " -msoft-float", d)}"
 TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "soft", d)}"
 
 # Package naming
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index ae81cde..036ca3c 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -9,14 +9,14 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 ABIEXTENSION ?= ""
 
 TUNEVALID[m32] = "Power ELF32 standard ABI"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m32", " -m32", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
 
 TUNEVALID[fpu-hard] = "Use hardware FPU."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", " -mhard-float", "", d)}"
 
 TUNEVALID[fpu-soft] = "Use software FPU."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", " -msoft-float", "", d)}"
 TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
 
 TUNEVALID[altivec] = "Altivec"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index f9e2b2a..8476dec 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNECONFLICTS[m64] = "m32 nf"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m64", " -m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
 
 AVAILTUNES += "powerpc64"
diff --git a/meta/conf/machine/include/sh/arch-sh.inc b/meta/conf/machine/include/sh/arch-sh.inc
index cde59fe..64d4cac 100644
--- a/meta/conf/machine/include/sh/arch-sh.inc
+++ b/meta/conf/machine/include/sh/arch-sh.inc
@@ -6,4 +6,4 @@ TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 
 TUNEVALID[bigendian] = "Enabled big-endian mode."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-mb", "-ml", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mb", " -ml", d)}"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 63aca06..4a131b6 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", "-mtune=arm1136jf-s", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", " -mtune=arm1136jf-s", "", d)}"
 
 AVAILTUNES += "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index f72f184..5cadcc7 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm920t", "-mtune=arm920t", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm920t", " -mtune=arm920t", "", d)}"
 
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 009d378..335e4e0 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", " -mtune=arm926ej-s", "", d)}"
 
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index ee79b52..dee57c9 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", "-mtune=arm9tdmi", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", " -mtune=arm9tdmi", "", d)}"
 
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index 79bb67b..18865b7 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -2,7 +2,7 @@ require conf/machine/include/ia32/arch-ia32.inc
 
 TUNEVALID[c3] = "VIA Cyrix III or VIA C3 specific optimizations"
 TUNECONFLICTS[c3] = "m64 mx32"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "c3", "-march=c3 -mtune=c3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "c3", " -march=c3 -mtune=c3", "", d)}"
 
 AVAILTUNES += "c3"
 TUNE_FEATURES_tune-c3 = "${TUNE_FEATURES_tune-x86} c3"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 338ba73..85b6924 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/tune-i586.inc
 
 # Extra tune features
 TUNEVALID[core2] = "Enable core2 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "core2", "-march=core2 -msse3 -mtune=generic -mfpmath=sse", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "core2", " -march=core2 -msse3 -mtune=generic -mfpmath=sse", "", d)}"
 
 # Extra tune selections
 AVAILTUNES += "core2"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 282c54e..5529777 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-mtune=cortex-a15", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -mtune=cortex-a15", "", d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 9898e8e..f02f0a2 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", "-mtune=cortex-a7", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -mtune=cortex-a7", "", d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 36894e4..771537f 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", " -mtune=cortex-a8", "", d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index bac8718..700394b 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex-a9", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", " -mtune=cortex-a9", "", d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index e7e18e2..3b65279 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", "-mtune=cortex-m1", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", " -mtune=cortex-m1", "", d)}"
 
 AVAILTUNES += "cortexm1"
 ARMPKGARCH_tune-cortexm1 = "cortexm1"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index a5f0b55..cbc4c0d 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -3,10 +3,10 @@ DEFAULTTUNE ?= "cortexm3"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm3", "-mtune=cortex-m3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexm3", " -mtune=cortex-m3", "", d)}"
 
 TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7m", "-march=armv7-m", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7m", " -march=armv7-m", "", d)}"
 
 AVAILTUNES += "cortexm3"
 ARMPKGARCH_tune-cortexm3 = "armv7m"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index 3f38b6c..57b6717 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -3,10 +3,10 @@ DEFAULTTUNE ?= "cortexr4"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexr4", "-mtune=cortex-r4", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexr4", " -mtune=cortex-r4", "", d)}"
 
 TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-r", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7r", " -march=armv7-r", "", d)}"
 
 AVAILTUNES += "cortexr4"
 ARMPKGARCH_tune-cortexr4 = "armv7r"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index fbf6939..b19b438 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ep9312", "-march=ep9312 -mtune=ep9312", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ep9312", " -march=ep9312 -mtune=ep9312", "", d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index afa9c92..4542b9b 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -4,7 +4,7 @@ require conf/machine/include/ia32/arch-ia32.inc
 
 # Extra tune features
 TUNEVALID[i586] = "Enable i586 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "i586", "-march=i586", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "i586", " -march=i586", "", d)}"
 
 # Extra tune selections
 AVAILTUNES += "i586"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index f1671ed..748ca0d 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", "-march=iwmmxt -mtune=iwmmxt", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", " -march=iwmmxt -mtune=iwmmxt", "", d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 03cd411..ae326ce 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -4,7 +4,7 @@ require conf/machine/include/mips/arch-mips.inc
 
 TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNECONFLICTS[mips32] = "n64 n32"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mips32", " -march=mips32", "", d)}"
 
 AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
 
diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/tune-ppc476.inc
index 5d10261..4ed185d 100644
--- a/meta/conf/machine/include/tune-ppc476.inc
+++ b/meta/conf/machine/include/tune-ppc476.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc476"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc476] = "Enable ppc476 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-mcpu=476", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppc476", " -mcpu=476", "", d)}"
 
 AVAILTUNES += "ppc476"
 TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 6557c1d..d744a00 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc603e"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", " -mcpu=603e", "", d)}"
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index aae8ac0..05a9505 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce300c2"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", " -mcpu=e300c2", "", d)}"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/tune-ppce300c3.inc
index 3f5ac26..9431222 100644
--- a/meta/conf/machine/include/tune-ppce300c3.inc
+++ b/meta/conf/machine/include/tune-ppce300c3.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce300c3"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "-mcpu=e300c3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", " -mcpu=e300c3", "", d)}"
 
 AVAILTUNES += "ppce300c3"
 TUNE_FEATURES_tune-ppce300c3 = "m32 fpu-soft ppce300c3"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index be43722..70c1f8b 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -3,10 +3,10 @@ DEFAULTTUNE ?= "ppce500"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", " -mcpu=8540", "", d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], "-mabi=spe -mspe -mfloat-gprs=single", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], " -mabi=spe -mspe -mfloat-gprs=single", "", d)}"
 TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500" , "spe" ], "ppc-efs", "", d)}"
 
 # spe is defined potentially in two places, so we want to be sure it will
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 0e09384..744d8e5 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce500mc"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", " -mcpu=e500mc", "", d)}"
 
 AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 3fe47da..d014d70 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -3,10 +3,10 @@ DEFAULTTUNE ?= "ppce500v2"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", " -mcpu=8548", "", d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2", "spe" ], "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2", "spe" ], " -mabi=spe -mspe -mfloat-gprs=double", "", d)}"
 TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2" , "spe" ], "ppc-efd", "", d)}"
 
 # spe is defined potentially in two places, so we want to be sure it will
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
index 8ab0fc5..25231ef 100644
--- a/meta/conf/machine/include/tune-ppce5500.inc
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce5500"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[e5500] = "Enable Freescale e5500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "-mcpu=e5500", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "e5500", " -mcpu=e5500", "", d)}"
 
 AVAILTUNES += "ppce5500 ppc64e5500"
 TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
index 982a7a4..1603bb4 100644
--- a/meta/conf/machine/include/tune-ppce6500.inc
+++ b/meta/conf/machine/include/tune-ppce6500.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce6500"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[e6500] = "Enable Freescale e6500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "-mcpu=e6500", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "e6500", " -mcpu=e6500", "", d)}"
 
 AVAILTUNES += "ppce6500 ppc64e6500"
 TUNE_FEATURES_tune-ppce6500 = "m32 fpu-hard e6500 altivec"
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
index 70bb10b..c5ed7ba 100644
--- a/meta/conf/machine/include/tune-sh3.inc
+++ b/meta/conf/machine/include/tune-sh3.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "sh3"
 require conf/machine/include/sh/arch-sh.inc
 
 TUNEVALID[sh3] = "Enable SH3 optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "sh3", "-m3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "sh3", " -m3", "", d)}"
 
 AVAILTUNES += "sh3 sh3eb"
 TUNE_FEATURES_tune-sh3 = "sh3"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
index 00cfc3d..56e23b9 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/tune-sh4.inc
@@ -4,13 +4,13 @@ DEFAULTTUNE ?= "sh4"
 require conf/machine/include/sh/arch-sh.inc
 
 TUNEVALID[sh4] = "Enable SH4 optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "sh4", "-m4", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "sh4", " -m4", "", d)}"
 
 # NOTE: If you want to optimize to sh4a, conf/machine/include/tune-sh4a.inc.
 # But it is not compatible for sh4.
 # The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
 TUNEVALID[sh4a] = "Enable SH4a optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "sh4a", "-m4a", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "sh4a", " -m4a", "", d)}"
 
 AVAILTUNES += "sh4 sh4eb sh4a sh4aeb"
 TUNE_FEATURES_tune-sh4 = "sh4"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index a4be117..ea2fba8 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "strongarm", "-mtune=strongarm1100", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "strongarm", " -mtune=strongarm1100", "", d)}"
 
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 150bb1a..0c5ca8d 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "xscale", " -mtune=xscale", "", d)}"
 
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
-- 
1.8.2.1



