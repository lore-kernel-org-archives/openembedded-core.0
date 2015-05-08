Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E48273F63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 03:36:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t483aHPd000776
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 May 2015 20:36:17 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 7 May 2015 20:36:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 May 2015 23:36:12 -0400
Message-ID: <98c01324c99744bf804c6d39d6055e32679cf84c.1431055930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431055930.git.bruce.ashfield@windriver.com>
References: <cover.1431055930.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/3.19: Braswell support and bug fixes
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
X-List-Received-Date: Fri, 08 May 2015 03:36:18 -0000
Content-Type: text/plain

Updating to include the following commits:

   a4d0c407cced dmaengine: dw: don't handle interrupt when dmaengine is not used
   e92b2ce791b2 dmaengine: dw: define DW_DMA_MAX_NR_MASTERS
   931304a6567e dmaengine: dw: provide DMA capabilities
   468bad4f7a6f dmaengine: dw: Split device_control
   b4afd7710db7 i2c: i801: Use managed pcim_* PCI device initialization and reservation
   d81a8a11ecba i2c: i801: Remove pci_enable_device() call from i801_resume()
   40e18604e70c i2c: i801: Use managed devm_* memory and irq allocation
   b54f65dbe57b i2c: i801: Remove i801_driver forward declaration
   e95740d4d079 i2c: i801: Don't break user-visible strings
   423e98721e04 ACPI: Introduce has_acpi_companion()
   291f620dc052 i2c: designware: Suppress error message if platform_get_irq() < 0
   cf5ff51a8e3f i2c: designware-pci: no need to provide clk_khz
   4f583ce420d3 i2c: designware-pci: remove Moorestown support
   e000c549c9d8 i2c: designware: Add Intel Baytrail PMIC I2C bus support
   7ffbd9ca19a7 i2c: designware: fixup return handling of wait_for_completion_timeout
   5758d5a1df32 i2c: designware: Do not calculate SCL timing parameters needlessly
   2f58fcae92db i2c: designware: Add i2c bus locking support
   84a73e51e900 i2c: designware: use {readl|writel}_relaxed instead of readl/writel
   f672bb8424e6 serial: 8250_dw: Fix get_mctrl behaviour
   91bd64585489 serial: 8250: add support for ACPI-probed serial port for X-Gene platform
   1190cba71f09 serial:8250:8250_pci: delete unneeded quirk entries
   6405a4b71451 serial:8250:8250_pci: fix redundant entry report for WCH_CH352_2S
   0a1a31bbbc19 serial: 8250_pci: remove one useless explicit type conversion
   4edc52a55f82 intel_idle: Add support for the Airmont Core in the Cherrytrail and Braswell SOCs
   934f85e8bfdb x86/irq, ACPI: Implement ACPI driver to support IOAPIC hotplug
   c6a3440252a8 ACPI / LPSS: check the result of ioremap()
   6aacc0c931b7 pinctrl: update direction_output function of cherryview driver
   cb4a43a2177d pinctrl: cherryview: Configure HiZ pins to be input when requested as GPIOs
   0df22c007ce1 pinctrl: intel: drop owner assignment from platform_drivers
   07b16f04700b pinctrl: cherryview: Save and restore pin configs over system sleep
   e8e5cfffa231 pinctrl: baytrail: Save pin context over system sleep
   04cb3cc0ff21 pinctrl: baytrail: Rework interrupt handling
   4cac25d2574d pinctrl: baytrail: Clear interrupt triggering from pins that are in GPIO mode
   eacab9ab234a pinctrl: baytrail: Relax GPIO request rules

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 1f91471dd622..50a426d665bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_machine ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
 SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 6ddbe8c59336..429c019ece79 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f9b327ff33521c08ed279891e2a2099b5504d0e"
-SRCREV_machine_qemuarm64 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
-SRCREV_machine_qemumips ?= "03b975caa49e6e1693d6fe5fec8f316e0481ead5"
-SRCREV_machine_qemuppc ?= "9a3edc9c341e6f57423f2b4b218b83a84fc2726d"
-SRCREV_machine_qemux86 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
-SRCREV_machine_qemux86-64 ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
-SRCREV_machine_qemumips64 ?= "f631de1c3df29a85a4b882acf19682fe05eec0f3"
-SRCREV_machine ?= "d5d30ba4d20e65c15df624ffce7a5cd38150348b"
+SRCREV_machine_qemuarm ?= "060c6306d0be2726638ab18bd68977de4c7a38e5"
+SRCREV_machine_qemuarm64 ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
+SRCREV_machine_qemumips ?= "4b206f611f6d4c35a27a44e24ba0cedfc71301ec"
+SRCREV_machine_qemuppc ?= "18e00694ed76d18bf020e3288a6fdce63412887d"
+SRCREV_machine_qemux86 ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
+SRCREV_machine_qemux86-64 ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
+SRCREV_machine_qemumips64 ?= "0e31a9b3e54a2c87645f34bcbbe704ac62c04602"
+SRCREV_machine ?= "0a0d499541e2bb13ecc1001d0947bed6106c26a6"
 SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
2.1.0


