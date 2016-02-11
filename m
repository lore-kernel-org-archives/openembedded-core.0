Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7254731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:08:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1BF8Kmx010751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Feb 2016 07:08:20 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 11 Feb 2016 07:08:20 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Feb 2016 10:08:16 -0500
Message-ID: <4e7320cc81178fe17c870e987a526d3f29caf906.1455203165.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1455203165.git.bruce.ashfield@windriver.com>
References: <cover.1455203165.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto/4.1: galileo backports and support
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
X-List-Received-Date: Thu, 11 Feb 2016 15:08:20 -0000
Content-Type: text/plain

Updating the 4.1 branches with backported mainline support for the
galileo.

   a5327464dad9 iio: light: add support for ROHM BH1710/BH1715/BH1721/BH1750/BH1751 ambient light sensors
   7a868ce12675 pwm-pca9685: enable ACPI device found on Galileo Gen2
   9f169f0f6493 at24: enable ACPI device found on Galileo Gen2
   8b662e6343a1 gpio: pca953x: support ACPI devices found on Galileo Gen2
   a9939d26a6a0 gpio: pca953x: store driver_data for future use
   52355b7a7fee mfd: intel_quark_i2c_gpio: support devices behind i2c bus
   ba850c2a9965 mfd: intel_quark_i2c_gpio: load gpio driver first
   8b322e7df2bf mfd: core: redo ACPI matching of the children devices
   23c1fb4bc37d i2c / ACPI: Rework I2C device scanning
   f7eea071b03c gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found
   bdc90004c8d5 GPIO / ACPI: export acpi_gpiochip_request(free)_interrupts for module use
   447db37b6df9 gpio / ACPI: Add support for retrieving GpioInt resources from a device
   edce965b0881 i2c: fix leaked device refcount on of_find_i2c_* error path
   f9b93689fdf5 i2c: core: only use set_scl for bus recovery after calling prepare_recovery
   a10a703575bd i2c: core: Reduce stack size of acpi_i2c_space_handler()
   ad91512127cd i2c: core: fix typo in comment
   b16ba95782f1 i2c: check for proper length of the reg property
   028a8d9209b7 i2c: slave: add error messages to slave core
   58551fe2320d i2c / ACPI: Assign IRQ for devices that have GpioInt automatically
   85153945ad9e i2c / ACPI: Use 0 to indicate that device does not have interrupt assigned

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index dd932684182d..52a8a7f33542 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "42d44733dd06c224dd3e0b25579541b318007e6e"
+SRCREV_machine ?= "c0e9b50e9f871ae73a3efafebf2fe1ceb0adbe85"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 49b85ec1a5d7..d0970cb4c86d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine ?= "a5327464dad92042f79dd5fb12523d16780980fb"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 033fcd730654..12e1b82029ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2e57b0b4eba5545f8dcd6d204930acc9b16668cc"
-SRCREV_machine_qemuarm64 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
-SRCREV_machine_qemumips ?= "1da18606598d131831b2cb5db377c2379c26cab2"
-SRCREV_machine_qemuppc ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
-SRCREV_machine_qemux86 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
-SRCREV_machine_qemux86-64 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
-SRCREV_machine_qemumips64 ?= "a73051ce903a0a646e1c198b71b2ec8eb1091ed0"
-SRCREV_machine ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_qemuarm ?= "5f2bc8d122ac2247d5a01025f73d09ae723efb21"
+SRCREV_machine_qemuarm64 ?= "a5327464dad92042f79dd5fb12523d16780980fb"
+SRCREV_machine_qemumips ?= "6e4bc756e0289b9f1869bfb5d84f033df2437d0b"
+SRCREV_machine_qemuppc ?= "a5327464dad92042f79dd5fb12523d16780980fb"
+SRCREV_machine_qemux86 ?= "a5327464dad92042f79dd5fb12523d16780980fb"
+SRCREV_machine_qemux86-64 ?= "a5327464dad92042f79dd5fb12523d16780980fb"
+SRCREV_machine_qemumips64 ?= "e83d6e6fcfc04591109e470e55532d25a2a1bef1"
+SRCREV_machine ?= "a5327464dad92042f79dd5fb12523d16780980fb"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


