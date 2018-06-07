Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE1FA76086
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:09:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5728mGN011973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:09:03 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:08:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:28 -0400
Message-ID: <80628b18166fa08faabc912b0c8064fac40bec0a.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1528336755.git.bruce.ashfield@windriver.com>
References: <cover.1528336755.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/4.12: gcc8 + platform support
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
X-List-Received-Date: Thu, 07 Jun 2018 02:09:28 -0000
Content-Type: text/plain

Integrating the following changes to fix gcc8 issues, add perf support
for new platforms, and misc bug fixes:

   7e7ac3f0fda9 perf vendor events intel: Update Goldmont events to V12
   0a384f4a74bb perf intel-pt: Always set no branch for dummy event
   d55c0eebc474 perf intel-pt: Set no_aux_samples for the tracking event
   1f0b8b1b621f perf vendor events: Add Goldmont Plus V1 event file
   6b230bd7967e objtool, perf: Fix GCC 8 -Wrestrict error
   2eb720eab978 tools/lib/subcmd/pager.c: do not alias select() params
   16818d5811b1 clocksource/drivers/arm_arch_timer: Fix mem frame loop initialization
   0924074f300a of: dynamic: fix memory leak related to properties of __of_node_dup
   f6579a9e6a8e debugobjects: Make kmemleak ignore debug objects
   9184d19fa9ba intel-socfpga: dts: improve qspi node for rsu feature
   68846ecd1d27 intel-socfpga: dts: add rsu node to enable rsu driver
   9f174f4e95f7 FogBugz #514234: arm64: dts: stratix10: Add PL330 DMA to Stratix10 dts
   8a97ef8580e8 FogBugz #554835-3: Intel RSU binding documentation
   c850e5570554 FogBugz #554835-1: Add Stratix 10 SoC RSU Driver
   e030a1b198b4 FogBugz #549288-4: dts: add Stratix10 sdram ecc
   c25a3bffb901 FogBugz #549288-3: edac: Add support for Stratix10 SDRAM EDAC
   64430c11c84b FogBugz #549288-2: Add Stratix10 ECC Manager binding
   c34e0d995e50 FogBugz #549288-1: misc: Stratix10 Protected register access defines
   ac8afaba8d13 mtd: spi-nor: cadence-quadspi: Fix page fault kernel panic
   16431863e036 FogBugz #554812: fpga: stratix10: unitialized data
   1ee99e139667 arm64: dts: stratix10: Change pad skew values for EMAC0 PHY driver
   3269b14acb76 FogBugz #251539-2: dts: Add Altera Quad SPI Driver Device Tree Binding
   99a5d81c3ea7 FogBugz #251539-1: Add Altera Quad SPI Driver

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 5edc0fa40b4f..bee1452fe7aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "705d03507a0c10dcbf9cad3ff70f5d60b70f2d99"
+SRCREV_machine ?= "75a9dd36c291ce674ef6d14b74c5096de9f59ca3"
 SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 31307a638558..58a6b27144d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.24"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_machine ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
 SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 8d560127f0f3..12342c419474 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "45824c60ca37f414a5ac5783e970338db9a5a2af"
-SRCREV_machine_qemuarm64 ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
-SRCREV_machine_qemumips ?= "66f741b0b3d093e6b6df0f44120913ef3a259e23"
-SRCREV_machine_qemuppc ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
-SRCREV_machine_qemux86 ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
-SRCREV_machine_qemux86-64 ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
-SRCREV_machine_qemumips64 ?= "c5d838c9e26bd657b49dfe28b115e5bc4b580850"
-SRCREV_machine ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_machine_qemuarm ?= "e89109c66eecdd78402a6814219658cf48efeba7"
+SRCREV_machine_qemuarm64 ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
+SRCREV_machine_qemumips ?= "76f8650f009abea482c8b9b54a4f33510e0812d7"
+SRCREV_machine_qemuppc ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
+SRCREV_machine_qemux86 ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
+SRCREV_machine_qemux86-64 ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
+SRCREV_machine_qemumips64 ?= "eae7e3959377e0d5514df8add61df074450dbd38"
+SRCREV_machine ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
 SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


