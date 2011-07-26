Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qlh3k-0003Ko-8f
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:48:29 +0200
Received: by rex (Postfix, from userid 1000)
	id D826120C71; Tue, 26 Jul 2011 13:44:07 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 13:44:05 +0100
Message-Id: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Tue, 26 Jul 2011 12:48:29 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/arm/arch-arm.inc         |   16 +++++-
 meta/conf/machine/include/arm/arch-armv4.inc       |   24 +++++++++
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |   40 ++++++++++++++
 meta/conf/machine/include/arm/arch-armv5.inc       |   51 ++++++++++++++++++
 meta/conf/machine/include/arm/arch-armv6.inc       |   32 +++++++++++
 meta/conf/machine/include/arm/arch-armv7.inc       |   55 ++++++++++++++++++++
 meta/conf/machine/include/arm/arch-armv7a.inc      |   54 +++++++++++++++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |    3 +
 .../conf/machine/include/arm/feature-arm-thumb.inc |   25 +++++++++
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |    6 ++
 meta/conf/machine/include/tune-arm1136jf-s.inc     |   14 +++---
 meta/conf/machine/include/tune-arm920t.inc         |   14 ++++--
 meta/conf/machine/include/tune-arm926ejs.inc       |   18 ++++---
 meta/conf/machine/include/tune-arm9tdmi.inc        |   14 ++++--
 meta/conf/machine/include/tune-armv7.inc           |    8 +---
 meta/conf/machine/include/tune-cortexa8.inc        |   21 ++++----
 meta/conf/machine/include/tune-cortexm1.inc        |   13 ++++-
 meta/conf/machine/include/tune-cortexm3.inc        |   18 +++++--
 meta/conf/machine/include/tune-cortexr4.inc        |   18 +++++--
 meta/conf/machine/include/tune-ep9312.inc          |   16 ++++--
 meta/conf/machine/include/tune-iwmmxt.inc          |   18 +++++--
 meta/conf/machine/include/tune-strongarm1100.inc   |   13 +++--
 meta/conf/machine/include/tune-xscale.inc          |   18 ++++--
 23 files changed, 435 insertions(+), 74 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv4.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv5-dsp.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv5.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv6.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv7.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv7a.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-thumb.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-vfp.inc

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index c517df6..4ea8b2b 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -1,3 +1,17 @@
-TUNE_ARCH = "arm"
+
+TUNEVALID[bigendian] = "Enable big-endian mode."
+
+ARMPKGARCH ??= "arm"
+ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "b", "", d)}"
+ARMPKGSFX_FPU ??= ""
+ARMPKGSFX_DSP ??= ""
+ARMPKGSFX_EABI ??= ""
+ARMPKGSFX_THUMB ??= ""
+
+TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
+TUNE_PKGARCH = "${@d.getVar('ARMPKGARCH', True)}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 
 ABIEXTENSION = "eabi"
+
+TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
+
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
new file mode 100644
index 0000000..c014d20
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "armv4"
+
+ARMPKGARCH ?= "armv4"
+
+TUNEVALID[armv4] = "Enable instructions for ARMv4"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
+
+require conf/machine/include/arm/arch-arm.inc
+require conf/machine/include/arm/feature-arm-thumb.inc
+
+# Little Endian
+AVAILTUNES += "armv4 armv4t"
+TUNE_FEATURES_tune-armv4 ?= "armv4"
+TUNE_FEATURES_tune-armv4t ?= "armv4 thumb"
+PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
+PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
+
+# Big Endian
+AVAILTUNES += "armv4b armv4tb"
+TUNE_FEATURES_tune-armv4b ?= "${TUNE_FEATURES_tune-armv4} bigendian"
+TUNE_FEATURES_tune-armv4tb ?= "${TUNE_FEATURES_tune-armv4t} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv4b = "armeb armv4b"
+PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4tb"
+
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
new file mode 100644
index 0000000..498a012
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -0,0 +1,40 @@
+ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
+
+require conf/machine/include/arm/arch-armv5.inc
+
+# Little Endian
+AVAILTUNES += "armv5e armv5te"
+TUNE_FEATURES_tune-armv5e ?= "armv5 dsp"
+TUNE_FEATURES_tune-armv5te ?= "armv5 dsp thumb"
+PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
+PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
+
+# Little Endian + VFP/DSP
+AVAILTUNES += "armv5e-vfp armv5te-vfp armv5ehf-vfp armv5tehf-vfp"
+TUNE_FEATURES_tune-armv5e-vfp ?= "armv5 vfp dsp"
+TUNE_FEATURES_tune-armv5te-vfp ?= "armv5 vfp dsp thumb"
+TUNE_FEATURES_tune-armv5ehf-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5tehf-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5e armv5e-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5e armv5te armv5e-vfp armv5te-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp} armv5ehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
+
+# Big Endian
+AVAILTUNES += "armv5eb armv5teb"
+TUNE_FEATURES_tune-armv5eb ?= "${TUNE_FEATURES_tune-armv5e} bigendian"
+TUNE_FEATURES_tune-armv5teb ?= "${TUNE_FEATURES_tune-armv5te} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv5eb = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5eb"
+PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5eb armv5teb"
+
+# Big Endian + VFP/DSP
+AVAILTUNES += "armv5eb-vfp armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp"
+TUNE_FEATURES_tune-armv5eb-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
+TUNE_FEATURES_tune-armv5teb-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
+TUNE_FEATURES_tune-armv5ehfb-vfp ?= "${TUNE_FEATURES_tune-armv5eb-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5tehfb-vfp ?= "${TUNE_FEATURES_tune-armv5teb-vfp} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5eb armv5eb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp} armv5ehfb-vfp armv5tehfb-vfp"
+
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
new file mode 100644
index 0000000..55cbe03
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -0,0 +1,51 @@
+DEFAULTTUNE ?= "armv5"
+
+ARMPKGARCH ?= "armv5"
+
+TUNEVALID[armv5] = "Enable instructions for ARMv5"
+TUNE_CONFLICTS[armv5] = "armv4"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
+
+ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
+
+require conf/machine/include/arm/arch-armv4.inc
+require conf/machine/include/arm/feature-arm-vfp.inc
+
+# Little Endian
+AVAILTUNES += "armv5 armv5t armv5e armv5te"
+TUNE_FEATURES_tune-armv5 ?= "armv5"
+TUNE_FEATURES_tune-armv5t ?= "armv5 thumb"
+PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
+PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
+
+# Little Endian + VFP/DSP
+AVAILTUNES += "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"
+TUNE_FEATURES_tune-armv5-vfp ?= "armv5 vfp"
+TUNE_FEATURES_tune-armv5t-vfp ?= "armv5 vfp"
+TUNE_FEATURES_tune-armv5hf-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5thf-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv5-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp = "armv5hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp = "armv5hf-vfp armv5thf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
+
+# Big Endian
+AVAILTUNES += "armv5b armv5tb"
+TUNE_FEATURES_tune-armv5b ?= "${TUNE_FEATURES_tune-armv5} bigendian"
+TUNE_FEATURES_tune-armv5tb ?= "${TUNE_FEATURES_tune-armv5t} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv5b = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5b"
+PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5b armv5tb"
+
+# Big Endian + VFP/DSP
+AVAILTUNES += "armv5b-vfp armv5tb-vfp armv5hfb-vfp armv5thfb-vfp"
+TUNE_FEATURES_tune-armv5b-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
+TUNE_FEATURES_tune-armv5tb-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
+TUNE_FEATURES_tune-armv5hfb-vfp ?= "${TUNE_FEATURES_tune-armv5b-vfp} callconvention-hard"
+TUNE_FEATURES_tune-armv5thfb-vfp ?= "${TUNE_FEATURES_tune-armv5tb-vfp} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5b-vfp armv5tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp = "armv5hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp = "armv5hfb-vfp armv5thfb-vfp"
+
+
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
new file mode 100644
index 0000000..20924c9
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -0,0 +1,32 @@
+DEFAULTTUNE ?= "armv6"
+
+ARMPKGARCH ?= "armv6"
+
+TUNEVALID[armv6] = "Enable instructions for ARMv6"
+TUNE_CONFLICTS[armv6] = "armv4 armv5"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
+
+require conf/machine/include/arm/arch-armv5-dsp.inc
+
+# Little Endian
+AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
+TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
+TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
+TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
+TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-vfp armv6t-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
+
+# Big Endian
+AVAILTUNES += "armv6b armv6tb armv6hfb armv6thfb"
+TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
+TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
+TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
+TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6tb} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6b-vfp armv6tb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
+
diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
new file mode 100644
index 0000000..8bc8d10
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7.inc
@@ -0,0 +1,55 @@
+DEFAULTTUNE ?= "armv7"
+
+ARMPKGARCH ?= "armv7"
+
+TUNEVALID[armv7] = "Enable instructions for ARMv7"
+TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
+
+require conf/machine/include/arm/arch-armv6.inc
+require conf/machine/include/arm/feature-arm-neon.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv7 armv7t armv7-neon armv7t-neon"
+TUNE_FEATURES_tune-armv7 ?= "armv7 vfp"
+TUNE_FEATURES_tune-armv7t ?= "armv7 vfp thumb"
+TUNE_FEATURES_tune-armv7-neon ?= "armv7 vfp neon"
+TUNE_FEATURES_tune-armv7t-neon ?= "armv7 vfp neon thumb"
+PACKAGE_EXTRA_ARCHS_tune-armv7 = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7t = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7-vfp armv7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-neon armv7at2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
+TUNE_FEATURES_tune-armv7hf ?= "${TUNE_FEATURES_tune-armv7} callconvention-hard"
+TUNE_FEATURES_tune-armv7thf ?= "${TUNE_FEATURES_tune-armv7t} callconvention-hard"
+TUNE_FEATURES_tune-armv7hf-neon ?= "${TUNE_FEATURES_tune-armv7-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7thf-neon ?= "${TUNE_FEATURES_tune_armv7t-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7hf-vfp armv7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7hf-vfp-neon armv7at2hf-vfp-neon"
+
+# Big Endian
+AVAILTUNES += "armv7b armv7tb armv7b-neon armv7tb-neon"
+TUNE_FEATURES_tune-armv7b ?= "${TUNE_FEATURES_tune-armv7} bigendian"
+TUNE_FEATURES_tune-armv7tb ?= "${TUNE_FEATURES_tune-armv7t} bigendian"
+TUNE_FEATURES_tune-armv7b-neon ?= "${TUNE_FEATURES_tune-armv7-neon} bigendian"
+TUNE_FEATURES_tune-armv7tb-neon ?= "${TUNE_FEATURES_tune-armv7t-neon} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7b = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7tb = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7b-vfp armv7t2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7b-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7b-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7tb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7b-vfp-neon armv7at2b-vfp-neon"
+
+# Big Endian + VFP
+AVAILTUNES += "armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon"
+TUNE_FEATURES_tune-armv7hfb ?= "${TUNE_FEATURES_tune-armv7b} callconvention-hard"
+TUNE_FEATURES_tune-armv7thfb ?= "${TUNE_FEATURES_tune-armv7tb} callconvention-hard"
+TUNE_FEATURES_tune-armv7hfb-neon ?= "${TUNE_FEATURES_tune-armv7b-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7thfb-neon ?= "${TUNE_FEATURES_tune_armv7tb-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv7hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7hfb-vfp armv7t2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7hfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7hfb-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7thfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7hfb-vfp-neon armv7at2hfb-vfp-neon"
+
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
new file mode 100644
index 0000000..ce9cee5
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -0,0 +1,54 @@
+DEFAULTTUNE ?= "armv7a"
+
+ARMPKGARCH ?= "armv7a"
+
+TUNEVALID[armv7-a] = "Enable instructions for ARMv7-a"
+TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
+
+require conf/machine/include/arm/arch-armv7.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv7a armv7at armv7a-neon armv7at-neon"
+TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
+TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
+TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
+TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
+PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
+TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune_armv7at-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7ahf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7ahf-vfp armv7at2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
+
+# Big Endian
+AVAILTUNES += "armv7ab armv7atb armv7ab-neon armv7atb-neon"
+TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
+TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
+TUNE_FEATURES_tune-armv7ab-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
+TUNE_FEATURES_tune-armv7atb-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7ab-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7ab-vfp armv7at2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-neon armv7at2b-vfp-neon"
+
+# Big Endian + VFP
+AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
+TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ab} callconvention-hard"
+TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7atb} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune_armv7atb-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7ahfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7ahfb-vfp armv7at2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
+
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
new file mode 100644
index 0000000..a7dac03
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -0,0 +1,3 @@
+TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "neon", "-mfpu=neon", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "" ,d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
new file mode 100644
index 0000000..9a607c6
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -0,0 +1,25 @@
+# The instruction set the compiler should use when generating application
+# code. The kernel is always compiled with arm code at present. arm code
+# is the original 32 bit ARM instruction set, thumb code is the 16 bit
+# encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
+# but requires more instructions (140% for 70% smaller code) so may be
+# slower.
+TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
+OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
+
+# Note armv7 will hit on armv7a as well
+ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t2", "", d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"
+
+# Whether to compile with code to allow interworking between the two
+# instruction sets. This allows thumb code to be executed on a primarily
+# arm system and vice versa. It is strongly recommended that DISTROs not
+# turn this off - the actual cost is very small.
+TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
+OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"
+
+TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -mno-thumb"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
new file mode 100644
index 0000000..29a925c
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -0,0 +1,6 @@
+TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
+
+TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 953f0dd..4f4a2eb 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -1,10 +1,10 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "arm1136jfs"
 
-TUNE_CCARGS = "-march=armv6j -mtune=arm1136jf-s"
-TUNE_CCARGS += "${@['', '-mfloat-abi=softfp -mfpu=vfp'][(bb.data.getVar('TARGET_FPU', d, 1) == 'soft') and (bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') != -1)]}"
-TUNE_PKGARCH = "armv6"
+require conf/machine/include/arm/arch-armv6.inc
 
-ARM_INSTRUCTION_SET = "${@['thumb','arm'][bb.data.getVar('CPU_FEATURES', d, 1).find('thumb') == -1]}"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6"
+TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", "-mtune=arm1136jf-s", "", d)}"
 
-require conf/machine/include/tune-thumb.inc
+AVAILTUNES += "arm1136jfs"
+TUNE_FEATURES_tune-arm1136jfs = "${TUNE_FEATURES_tune-armv6} arm1136jfs"
+PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6}"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 6c87026..b7584ab 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,5 +1,11 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "arm920t"
+
+require conf/machine/include/arm/arch-armv4.inc
+
+TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm920t", "-mtune=arm920t", "", d)}"
+
+AVAILTUNES += "arm920t"
+TUNE_FEATURES_tune-arm920t = "${TUNE_FEATURES_tune-armv4t} arm920t"
+PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
 
-TUNE_PKGARCH = "armv4t"
-TUNE_CCARGS = "-march=armv4t -mtune=arm920t"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 543ab62..7f2cc4e 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,9 +1,11 @@
-require conf/machine/include/arm/arch-arm.inc
-
-TUNE_PKGARCH = "armv5te"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te"
-# For gcc 3.x you need:
-#TUNE_CCARGS = "-march=armv5te -mtune=arm926ejs"
-# For gcc 4.x you need:
-TUNE_CCARGS = "-march=armv5te -mtune=arm926ej-s"
+DEFAULTTUNE ?= "arm926ejs"
+
+require conf/machine/include/arm/arch-armv5-dsp.inc
+
+TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}"
+
+AVAILTUNES += "arm926ejs"
+TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
 
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index f1001ac..0dc5c26 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -1,5 +1,11 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "arm9tdmi"
+
+require conf/machine/include/arm/arch-armv4.inc
+
+TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", "-mtune=arm9tdmi", "", d)}"
+
+AVAILTUNES += "arm9tdmi"
+TUNE_FEATURES_tune-arm9tdmi = "${TUNE_FEATURES_tune-armv4t} arm9tdmi"
+PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
 
-TUNE_PKGARCH = "armv4t"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
-TUNE_CCARGS = "-mcpu=arm9tdmi -mtune=arm9tdmi"
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
index 8a68c0a..664c24b 100644
--- a/meta/conf/machine/include/tune-armv7.inc
+++ b/meta/conf/machine/include/tune-armv7.inc
@@ -1,8 +1,2 @@
-require conf/machine/include/arm/arch-arm.inc
+require conf/machine/include/arm/arch-armv7.inc
 
-# valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
-# valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', `cortex-m1'
-# This will NOT compile programs in 'ARM' mode, which is what you really want
-TUNE_CCARGS = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
-TUNE_PKGARCH = "armv7"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index ae50954..b07add4 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,15 +1,16 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "cortexa8-neon"
 
+require conf/machine/include/arm/arch-armv7a.inc
 
-# Instead of using -mfpu=vfp[2] we can use -mfpu=neon to make use of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
-# [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
-# [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
-# [3] https://support.codesourcery.com/GNUToolchain/kbentry29
+TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
 
-TUNE_CCARGS = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -fno-tree-vectorize"
+AVAILTUNES += "cortexa8 cortexa8t"
+TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} coretexa8"
+TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} coretexa8"
+TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
 
-# Other potentially useful options
-#-ftree-vectorize -ffast-math -fno-omit-frame-pointer
+PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
 
-TUNE_PKGARCH = "armv7a"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index b944db4..493025d 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -1,4 +1,11 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "cortexm1"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", "-mtune=cortex-m1", "", d)}"
+
+AVAILTUNES += "cortexm1"
+TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} coretexm1"
+PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
 
-TUNE_CCARGS = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
-TUNE_PKGARCH = "armv6"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index a77cbdd..f774fa6 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -1,5 +1,15 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "cortexm3"
+ARMPKGARCH ?= "armv7m"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm3", "-mtune=cortex-m3", "", d)}"
+
+TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7m", "-march=armv7-m", "", d)}"
+
+AVAILTUNES += "cortexm3"
+TUNE_FEATURES_tune-cortexm3 = "armv7m vfp coretexm3"
+PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m"
 
-# valid options for -march: `armv7', `armv7-m'
-TUNE_CCARGS = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
-TUNE_PKGARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index c9193ca..738f5af 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -1,5 +1,15 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "cortexr4"
+ARMPKGARCH ?= "armv7r"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexr4", "-mtune=cortex-r4", "", d)}"
+
+TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-m", "", d)}"
+
+AVAILTUNES += "cortexr4"
+TUNE_FEATURES_tune-cortexr4 = "armv7r vfp coretexr4"
+PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r"
 
-# valid options for -march: `armv7', `armv7-r'
-TUNE_CCARGS = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
-TUNE_PKGARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index e04a00a..f10123f 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -1,9 +1,13 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "ep9312"
+ARMPKGARCH ?= "ep9312"
 
-TUNE_CCARGS = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
-# add "-mfp=maverick" for newer gcc versions > 4.0
+require conf/machine/include/arm/arch-armv4.inc
+
+TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ep9312", "-march=ep9312 -mtune=ep9312", "", d)}"
+
+AVAILTUNES += "ep9312"
+TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
+PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
 
-#set arch to ep9312 for all generated packages
-PACKAGE_EXTRA_ARCHS = "arm armv4t ep9312"
-TUNE_PKGARCH = "ep9312"
 
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 6bb76d5..14f5955 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -1,8 +1,16 @@
-require conf/machine/include/arm/arch-arm.inc
-
 # Configurations for the Intel PXA27x Appications Processor Family. 
 # Please use tune-xscale for PXA255/PXA26x based processors.
-TUNE_CCARGS = "-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te iwmmxt"
-TUNE_PKGARCH = "iwmmxt"
+
+DEFAULTTUNE ?= "iwmmxt"
+ARMPKGARCH ?= "iwmmxt"
+
+require conf/machine/include/arm/arch-armv5-dsp.inc
+
+TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", "-march=iwmmxt -mtune=iwmmxt", "", d)}"
+
+AVAILTUNES += "iwmmxt"
+TUNE_FEATURES_tune-iwmmxt = "thumb iwmmxt"
+PACKAGE_EXTRA_ARCHS_tune-iwmmxt = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} iwmmxt"
+
 
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 2b76069..66bab8e 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -1,9 +1,12 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "strongarm"
 
-TUNE_PKGARCH = "arm"
+require conf/machine/include/arm/arch-armv4.inc
 
-# This machine lists common configuration options for Strongarm 1100 devices
-# NOTE: The Zaurus Collie also has a Strongarm processor, but uses the 1110 type
+TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "strongarm", "-mtune=strongarm1100", "", d)}"
+
+AVAILTUNES += "strongarm"
+TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm"
+PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4}"
 
-TUNE_CCARGS = "-march=armv4 -mtune=strongarm1100"
 
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 71dba5b..0303320 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,11 +1,17 @@
-require conf/machine/include/arm/arch-arm.inc
+DEFAULTTUNE ?= "xscale"
 
-INHERIT += "siteinfo"
+require conf/machine/include/arm/arch-armv5-dsp.inc
 
-TUNE_CCARGS = "-march=armv5te -mtune=xscale"
-TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
-TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
-PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
+
+AVAILTUNES += "xscale"
+TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
+PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
+
+AVAILTUNES += "xscale-be"
+TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5teb} xscale"
+PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
-- 
1.7.4.1



