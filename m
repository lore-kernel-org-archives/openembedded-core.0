Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81DFE7002B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 02:41:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5S2f85b009684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Jun 2016 19:41:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 27 Jun 2016 19:41:07 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 27 Jun 2016 22:40:58 -0400
Message-ID: <addf12dd40c53bc4070a794533510b81c8930195.1467081585.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467081584.git.bruce.ashfield@windriver.com>
References: <cover.1467081584.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/4.1: SPI, MFD, alsa and perf backports
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
X-List-Received-Date: Tue, 28 Jun 2016 02:41:09 -0000
Content-Type: text/plain

Backporting the following mainline support for enhanced/improved support
on BXT based platforms.

  spi: pxa2xx: Fix too early chipselect deassert
  spi: pxa2xx: Update comment in int_transfer_complete()
  spi: pxa2xx: Print actual DMA/PIO transfer mode in debug messages
  spi: atmel: remove warning when !CONFIG_PM_SLEEP
  spi: fix kernel-doc warnings in spi.h
  spi: expose spi_master and spi_device statistics via sysfs
  spi: meson: Fix module autoload for OF platform driver
  spi: bcm2835: BUG: fix wrong use of PAGE_MASK
  spi: bcm2835: fix overflow in calculation of transfer time
  spi: bcm2835: bcm2835_dma_release() can be static
  spi: bcm2835: fix kbuild compile warnings/errors and a typo
  spi: bcm2835: enable dma modes for transfers meeting certain conditions
  spi: bcm2835: fallback to interrupt for polling timeouts exceeding 2 jiffies
  spi: spi-pxa2xx: Remove unused legacy null dma buffer and allocation for it
  mfd: intel-lpss: Save register context on suspend
  mfd: intel-lpss: Pass I2C configuration via properties on BXT
  perf/x86: Fix time_shift in perf_event_mmap_page
  perf/x86: Improve accuracy of perf/sched clock
  ALSA: hda - Move send_cmd / get_response to hdac_bus_ops
  ALSA: hda - Merge codec and controller helpers
  ALSA: hda - moved alloc/free stream pages function to controller library
  ALSA: hda - Add DSP loader to core library code
  ALSA: hda - Add the controller helper codes to hda-core module
  ALSA: hda - Handle error from get_response bus ops directly
  Revert "ALSA: hda - fix number of devices query on hotplug"

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 456ae80e85d8..034a86989010 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8fd10e4d4113e72bf46e5bc9eb15c8ccf32bc15a"
+SRCREV_machine ?= "774b26df9e2ddce26e1ead27b6925b2d260919dd"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 77da5de8adc7..d34a6d7bbc08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
+SRCREV_machine ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 0ab26e63a85c..9a31ddce25fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f0e75ff79949f2924a5103079ce1fc5e0a1d244"
-SRCREV_machine_qemuarm64 ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
-SRCREV_machine_qemumips ?= "332b2b5ef3de2ec31ff8d7687ff7b60892c2b052"
-SRCREV_machine_qemuppc ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
-SRCREV_machine_qemux86 ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
-SRCREV_machine_qemux86-64 ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
-SRCREV_machine_qemumips64 ?= "5133c3b201f3cee041b0911928672d2f1a2c8c9a"
-SRCREV_machine ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
+SRCREV_machine_qemuarm ?= "9fc1d1bc96fc8483abacb38d3a6bdd64163494ac"
+SRCREV_machine_qemuarm64 ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
+SRCREV_machine_qemumips ?= "5117bb86942f16f5d6d1303350e0d3522bcc9c43"
+SRCREV_machine_qemuppc ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
+SRCREV_machine_qemux86 ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
+SRCREV_machine_qemux86-64 ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
+SRCREV_machine_qemumips64 ?= "d6904084bddb0cce44f29e0a6c6202a2f0b41671"
+SRCREV_machine ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


