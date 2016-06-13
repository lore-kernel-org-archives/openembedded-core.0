Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F56E60248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:56:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5DFubpl014930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Jun 2016 08:56:38 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 13 Jun 2016 08:56:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Jun 2016 11:56:30 -0400
Message-ID: <25016216d89a0ba1c72dea48e62eeaf83f9e9e22.1465833140.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465833140.git.bruce.ashfield@windriver.com>
References: <cover.1465833140.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/4.1: serial, mmc, mtd mainline backports
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
X-List-Received-Date: Mon, 13 Jun 2016 15:56:39 -0000
Content-Type: text/plain

Backporting the following commits for BXT and other device support:

b4acdc6d1ea9 serial: 8250_dw: Do not use readl/writel before checking port iotype
c439afb78cda serial: 8250_dw: Add support for big-endian MMIO accesses
9227cc288f7e serial: 8250_dw: Avoid serial_outx code duplicate with new dw8250_check_lcr()
9d608cf2b4c5 serial: 8250_dw: don't set UPF_BOOT_AUTOCONF flag
db4e65b3a854 serial: 8250_dw: cleanup dw8250_setup_port
f4885484ee87 serial: 8250_dw: cleanup dw8250_idma_filter
0912b12e5df0 serial: 8250_dw: rename and comment the fallback dma filter
3436bb74c86b serial: 8250_dw: proper support for UARTs without busy functionality
fac8ac4a8074 serial: 8250_dw: add dw8250_quirks function
0bba963bdd94 serial: 8250_dw: only setup the port from one place
d01850ea5471 serial: 8250_dw: hook the DMA in one place
585f11e24199 serial: 8250_dw: adapt to unified device property interface
df44bc6d8b61 serial: 8250_dw: add separate pointer for the uart_port to dw8250_probe
84e9183637e7 serial: 8250_dw: allow lower reference frequencies
70ce481f5678 serial:8250_dw: do not alter CTS and DCTS since AFE is enabled
739968950dc4 serial: 8250: Auto CTS control by HW if AFE enabled
074cdf88d099 serial: 8250_dw: support ACPI platforms with integrated DMA engine
0bb15fc79c22 serial: 8250_dma: no need to sync RX buffer
45082f48e5c6 dmaengine: idma: rename to INTEL_IDMA64
1f4c5fb48460 mmc: sdhci-acpi: Set MMC_CAP_AGGRESSIVE_PM for Broxton controllers
6963cc8f6e2e mmc: sdhci-pci: Set MMC_CAP_AGGRESSIVE_PM for Broxton controllers
aab588165ee4 mmc: sdhci-pci: Add support and PCI IDs for more Broxton host controllers
c51e080a85ac mmc: sdhci-acpi: Fix card detect race for Intel BXT/APL
fbbad4798f9c mmc: sdhci-pci: Fix card detect race for Intel BXT/APL
ce6717f7195e mmc: sdhci: Allow override of get_cd() called from sdhci_request()
abceeaf8efc8 mmc: sdhci: Allow override of mmc host operations
279c8ddf6b6d mmc: sdhci: make max-frequency property in device tree work
6e9d3ad3a003 mtd: spi-nor: add support for w25q128fw

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index a43007bb21c4..8e9b5c2df035 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f719f69e00afd9982fbbbe9995640cffabfea704"
-SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
+SRCREV_machine ?= "86876311e39eadc80c342a619906cb001ed1df0d"
+SRCREV_meta ?= "f0c7ef844e98c82db9ee90e20c0eff6596919ff5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index dd2b46675255..c48e2a649435 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.24"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
-SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
+SRCREV_machine ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
+SRCREV_meta ?= "f0c7ef844e98c82db9ee90e20c0eff6596919ff5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 50bb38a42700..9e83d76f80cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a7b999561115b0b84814a2a27fe3f8c5b0599b0d"
-SRCREV_machine_qemuarm64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
-SRCREV_machine_qemumips ?= "ce9d4e563925e65c7a4b73fd6027ed8d2a4fc5e4"
-SRCREV_machine_qemuppc ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
-SRCREV_machine_qemux86 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
-SRCREV_machine_qemux86-64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
-SRCREV_machine_qemumips64 ?= "75260c1966188a38e070420624ac65b188f77948"
-SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
-SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
+SRCREV_machine_qemuarm ?= "ec626d56541042b8bcc52c47891dd8acedb326c7"
+SRCREV_machine_qemuarm64 ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
+SRCREV_machine_qemumips ?= "95866476d89898fdb61804029352af74daa4a30d"
+SRCREV_machine_qemuppc ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
+SRCREV_machine_qemux86 ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
+SRCREV_machine_qemux86-64 ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
+SRCREV_machine_qemumips64 ?= "9824fc2399454b9c521b0b1bde075ac862357d41"
+SRCREV_machine ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
+SRCREV_meta ?= "f0c7ef844e98c82db9ee90e20c0eff6596919ff5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


