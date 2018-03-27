Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2C6780BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2RF3RMl024777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:27 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:17 -0400
Message-ID: <2b4bd0fc88c1db3a690d6338b7fa2891e053aaa1.1522162765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/4.12: intel-socfpga, intel-pmc-core and ish support for CoffeeLake board
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:27 -0000
Content-Type: text/plain

Integrating a series of mainline backports to allow better 4.12 support
for the coffeelake board:

   97e710ef0545 driver: clk: socfpga: remove unused variable
   2852089a6b7f x86/cpu: Add Cannonlake to Intel family
   1af96090b1f4 ACPI / LPIT: Export lpit_read_residency_count_address()
   1e85b644ad5e ACPI / LPIT: Add Low Power Idle Table (LPIT) support
   3b931f776349 platform/x86: intel_pmc_core: Special case for Coffeelake
   5666379331a9 platform/x86: intel_pmc_core: Add CannonLake PCH support
   de9e9e9518ee platform/x86: intel_pmc_core: Read base address from LPIT
   f422abd33358 platform/x86: intel_pmc_core: Remove unused header file
   ec1ca0048923 platform/x86: intel_pmc_core: Convert to ICPU macro
   f894e2c0cfff platform/x86: intel_pmc_core: Substitute PCI with CPUID enumeration
   ce7b50cc047d platform/x86: intel_pmc_core: Refactor debugfs entries
   c9ca0426c9c8 platform/x86: intel_pmc_core: Fix file permission warnings
   17294194d03c platform/x86: intel_pmc_core: Change driver to a module
   7f142e82c8f0 platform/x86: intel_pmc_core: Fix kernel doc for pmc_dev
   d095df17ddf4 platform/x86: intel_pmc_core: Remove unused variable
   cdfd431ccc3d platform/x86: intel_pmc_core: Remove unused EXPORTED API
   c54edf864c58 platform/x86: intel_pmc_core: Make the driver PCH family agnostic
   5302f0bfbaed HID: intel-ish-hid: Enable Cannon Lake and Coffee Lake laptop/desktop
   7e5cc39c3f61 HID: intel-ish-hid: Enable Gemini Lake ish driver
   b00e0e88689f HID: intel-ish-hid: Enable Cannon Lake ish driver

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index a59ab20feb0b..ff730846f555 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e631b6433928b4b7f44b7ae2e97fe0a174aa0b44"
-SRCREV_meta ?= "0ca42aa3dc27efbf56993644bb37408f5c798eb0"
+SRCREV_machine ?= "bec5c846f002161d695171798f250c59e85ab821"
+SRCREV_meta ?= "f8f75cc4d9cb3195a2221b375cfc4f91ee211399"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index b0f7d77998f0..325857fa9d29 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.21"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_meta ?= "0ca42aa3dc27efbf56993644bb37408f5c798eb0"
+SRCREV_machine ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
+SRCREV_meta ?= "f8f75cc4d9cb3195a2221b375cfc4f91ee211399"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index c112ae4d2126..81079ce584cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d2bdc11312fc02d4ad34e044cf1bb88da2b85591"
-SRCREV_machine_qemuarm64 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_machine_qemumips ?= "15e9d4817db80cee890207e849776beeda7759e5"
-SRCREV_machine_qemuppc ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_machine_qemux86 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_machine_qemux86-64 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_machine_qemumips64 ?= "68bcd22421aa288aff3dc9cf3035539788b04353"
-SRCREV_machine ?= "1a600c736163e7350ee4da9172f5321d06a72889"
-SRCREV_meta ?= "0ca42aa3dc27efbf56993644bb37408f5c798eb0"
+SRCREV_machine_qemuarm ?= "fa1d1c94af290039f25b2b6fb0f419b4272e7156"
+SRCREV_machine_qemuarm64 ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
+SRCREV_machine_qemumips ?= "558d4b974687d421c5e8ff63a7d2660520f9dab0"
+SRCREV_machine_qemuppc ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
+SRCREV_machine_qemux86 ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
+SRCREV_machine_qemux86-64 ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
+SRCREV_machine_qemumips64 ?= "09bddd16543c2f4fa1bb5a535994975dd1457fe2"
+SRCREV_machine ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
+SRCREV_meta ?= "f8f75cc4d9cb3195a2221b375cfc4f91ee211399"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


