Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66B396BBAB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s88Jtcaf019765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:38 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:21 -0400
Message-ID: <105459b23aac5a2737152d830b1744e8da024c3b.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/3.10: baytrail i/o updates
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:46 -0000
Content-Type: text/plain

Updating the 3.10 kernel with baytrail feature backports:

   e313fe1374d spi/pxa2xx: fix incorrect SW mode chipselect setting for BayTrail LPSS SPI
   da387aea86a8 spi/pxa2xx: change default supported DMA burst size to 1
   119e77242d80 spi/pxa2xx: fix runtime PM enabling order
   ac2ff9de705c spi/pxa2xx: Prevent DMA from transferring too many bytes
   2260921e859c spi: pxa2xx: remove unnecessary OOM messages
   59f141f4a558 spi/pxa2xx-pci: Add PCI mode support for BayTrail LPSS SPI
   25c8232cbb66 spi: remove DEFINE_PCI_DEVICE_TABLE macro
   6eb21efb3641 i2c: designware-pci: set ideal HCNT, LCNT and SDA hold time value
   4e2bd3da1739 i2c: designware-pci: add 10-bit addressing mode functionality for BYT I2C
   7b813400820f i2c: designware-pci: Add Baytrail PCI IDs
   5fe4585c09d1 usb: gadget: udc-core: move sysfs_notify() to a workqueue
   cdbdda47494a usb: gadget: don't fail when DMA isn't present
   8c1914c2e3bc mmc: sdhci: add DDR50 1.8V mode support for BayTrail eMMC Controller
   5ad460bf8d4a mmc: sdhci: Preset value not supported in Baytrail eMMC
   3359f2b4d2d4 mmc: sdhci: Allow for irq being shared
   0663d41d3b8c 8250_dw: Support all baudrates on baytrail
   1866808f61bf serial: 8250_pci: add support for Intel BayTrail
   472c007ce197 serial: 8250: don't change the fifo trigger level when using dma
   fadb6c538a2b serial: 8250_dma: check the result of TX buffer mapping
   e48701bee23b dmaengine: dw: don't perform DMA when dmaengine_submit is called
   9fda0d3bfdd8 dmaengine: dw: introduce dwc_dostart_first_queued() helper
   a0b8d0199e8f dma: dw: Add suspend and resume handling for PCI mode DW_DMAC.
   f1c1bd979f71 pwm: lpss: Fix const qualifier and sparse warnings
   d6aa3e78c2ea pwm: lpss: Add support for PCI devices
   a8fe7a1badcd pwm: add support for Intel Low Power Subsystem PWM
   cd9e2e0a810c ACPI / LPSS: Add Intel BayTrail ACPI mode PWM
   b8dab93f3e79 pwm: Add sysfs interface

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index de405a54e307..ec155089a8fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "c373b342af7bcbeda346df9598a5b1e9784d362f"
-SRCREV_machine_qemuppc ?= "767da5a30782cc1bc6522cef8aa5fd8130ecc06c"
-SRCREV_meta ?= "199943142f7e0a283240246ee6c02f4376b315f0"
+SRCREV_machine ?= "1dfc94848e05989ab6c5fde2080f35546d81e798"
+SRCREV_machine_qemuppc ?= "81334ed6f11da157e13c306c48f3d49a051d9d89"
+SRCREV_meta ?= "bacd863f7d1ce9135b8dde4394120f66707c7747"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 76448e1ba049..08b295ba629c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.10.43"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
-SRCREV_meta ?= "199943142f7e0a283240246ee6c02f4376b315f0"
+SRCREV_machine ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
+SRCREV_meta ?= "bacd863f7d1ce9135b8dde4394120f66707c7747"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 125ffe7e38bc..44b6464258d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "db489eed7f5c86037358cc9d0fefa7b90dbbaa86"
-SRCREV_machine_qemumips ?= "780aac11b3f20ed2f5df3f173b0d02b28a6eb96b"
-SRCREV_machine_qemuppc ?= "48a9dec5fc4cc9c19d12866c6ec560a83df21d85"
-SRCREV_machine_qemux86 ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
-SRCREV_machine_qemux86-64 ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
-SRCREV_machine_qemumips64 ?= "d4b0d6f727167d7946e03dbfb50fef0891207bd1"
-SRCREV_machine ?= "aa677a2d02677ec92d59a8c36d001cf2f5cf3260"
-SRCREV_meta ?= "199943142f7e0a283240246ee6c02f4376b315f0"
+SRCREV_machine_qemuarm ?= "cf951fb02f9eb89bd36f30fd6d426d6a06be8739"
+SRCREV_machine_qemumips ?= "82c743bcc8103c82f8cb673eb810a9329a9441d7"
+SRCREV_machine_qemuppc ?= "1deb0e97e9262b02b3ff9b707b13c42c8fa95a13"
+SRCREV_machine_qemux86 ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
+SRCREV_machine_qemux86-64 ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
+SRCREV_machine_qemumips64 ?= "8affc1996043dfe2061953c074c714a9885fde6e"
+SRCREV_machine ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
+SRCREV_meta ?= "bacd863f7d1ce9135b8dde4394120f66707c7747"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


