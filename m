Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 500E67CF83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 13:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 06F2F180FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:56 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ZzBgf941OIP4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:50 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 23934182C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:50 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 085671A0A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:50 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E702E1A0A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:49 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:49 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id DB6032B6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:49 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x2BDtocO001388
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:55:50 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x2BDtog9001387
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2019 14:55:50 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 14:55:45 +0100
Message-Id: <20190311135545.1327-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20190311135545.1327-1-pkj@axis.com>
References: <20190311135545.1327-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] arm-tunes: Prefer the -mcpu option over -march
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
X-List-Received-Date: Mon, 11 Mar 2019 13:55:55 -0000

Tune files that inherit the arch definitions already define
appropriate -mcpu options, which are equivalent of the correct -march
and -mtune combinations. This is preferred since gcc is getting
stricter and stricter with option check semantics and can now find
incompatible -march and -mcpu options better with every release. It
does an internal feature consistency check and if it finds any
discrepancies between what -mcpu would expand to as compared to
-march, it will flag the options to be incompatible. For the naked eye
it looks wrong, but gcc will translate -mcpu to a given -march
internally and it might not match what we set in these arch files.

The effects are quite subtle, where this can result in configure tests
failing to compile due to these incompatible options and a feature
option getting disabled for a recipe for no reason.

E.g., with GCC 9, which can now detect that -mcpu=cortex-a5 and
-march=armv7-a are incompatible, many features in libstdc++ end up
disabled due to configure check failures, e.g., size_t size, ptrdiff_t
sizes, which in turn results in compiling libstdc++ with wanted
features disabled.

This is an alternative solution to the same problem originally
implemented by Khem Raj in commit ac83d22e, but this time only
affecting -mcpu and -march options without other side effects.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/arm/arch-arm.inc       | 5 +++++
 meta/conf/machine/include/arm/arch-armv4.inc     | 2 +-
 meta/conf/machine/include/arm/arch-armv5.inc     | 2 +-
 meta/conf/machine/include/arm/arch-armv6.inc     | 2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc    | 2 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc   | 2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc    | 2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 +-
 meta/conf/machine/include/tune-arm920t.inc       | 2 +-
 meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa15.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa17.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa32.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa35.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa5.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa53.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa7.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa72.inc     | 2 +-
 meta/conf/machine/include/tune-cortexa8.inc      | 2 +-
 meta/conf/machine/include/tune-cortexa9.inc      | 2 +-
 meta/conf/machine/include/tune-ep9312.inc        | 2 +-
 meta/conf/machine/include/tune-iwmmxt.inc        | 2 +-
 meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
 meta/conf/machine/include/tune-thunderx.inc      | 2 +-
 meta/conf/machine/include/tune-xscale.inc        | 2 +-
 26 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 99625d8417..1482c3ad03 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -11,6 +11,11 @@ ARMPKGSFX_THUMB ??= ""
 TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
 TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 
+# Prefer -mcpu= over -arch=
+TUNE_MCPU ??= ""
+TUNE_MARCH ??= ""
+TUNE_CCARGS .= "${@d.getVar('TUNE_MCPU') or d.getVar('TUNE_MARCH')}"
+
 ABIEXTENSION = "eabi"
 
 TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 47a7ad2830..4188ba0637 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
+TUNE_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4t', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index f9068af9de..ae8df32919 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
+TUNE_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 6c838e999c..dfa921fb9e 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv6hf"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
+TUNE_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 199e63f98a..614b37ecb8 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -3,7 +3,7 @@ ARM_INSTRUCTION_SET ?= "thumb"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
+TUNE_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index fc172d0cb0..2c44fecb83 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv7vethf"
 
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
+TUNE_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv7a.inc
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 22064559be..d06b449570 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "armv8a-crc"
 
 TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
+TUNE_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
 TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
 TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index c5de63e1cc..f03685356d 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6hf"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
 
 AVAILTUNES += "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index c6e74b6772..0cc8c3e00a 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
 
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 81bcda339b..cce873fb71 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
 
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index e9c2b8fcf5..21ec0b44eb 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 25e99f93d7..837184b5ee 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 40392f9bcc..339fbca491 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index 4bf7f774e1..e3ef2ceec8 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "cortexa32"
 
 
 TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
index 6ece810753..a83a260a4a 100644
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa35"
 
 TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index e9eddb407f..19fbd7830a 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index 9fb37ff639..8f6914e312 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa53"
 
 TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 52415d9c8b..ad8da1a164 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 4c2306c4fd..4fbeadc352 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa72"
 
 TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 8ee8de97f1..1dca0807b1 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 0cf323c960..02d0ce80f7 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index 84ca528d6d..206848d788 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index f27423cb2e..0f4e59a851 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 80cfb8ab8a..ec40eb9ab9 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
 
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 92adf2df1f..cb94c16788 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -3,7 +3,7 @@ AVAILTUNES += "thunderx thunderx_be"
 
 TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
 
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 0d07333955..0a228b7571 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
+TUNE_MCPU .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
 
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
-- 
2.12.0


