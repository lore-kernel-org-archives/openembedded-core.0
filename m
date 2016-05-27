Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0AA731D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 14:32:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4REWPSe018850
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 May 2016 07:32:25 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 May 2016 07:32:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 27 May 2016 10:32:20 -0400
Message-ID: <0c7d905fab7bbcbbd0ae78e84c9bec761b62cc1b.1464359230.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1464359230.git.bruce.ashfield@windriver.com>
References: <cover.1464359230.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: tom.zanussi@intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto:4.4: broxton backports
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
X-List-Received-Date: Fri, 27 May 2016 14:32:29 -0000
Content-Type: text/plain

Integrating the following mainline backports for better Broxton
support:

Adrian Hunter (3):
      mmc: sdhci: Remove SDHCI_SDR104_NEEDS_TUNING
      mmc: mmc: Attempt to flush cache before reset
      mmc: mmc: Fix partition switch timeout for some eMMCs

Andy Shevchenko (12):
      device property: always check for fwnode type
      device property: rename helper functions
      device property: refactor built-in properties support
      device property: keep single value inplace
      device property: improve readability of macros
      device property: return -EINVAL when property isn't found in ACPI
      device property: Fallback to secondary fwnode if primary misses the property
      mfd: core: propagate device properties to sub devices drivers
      mfd: intel-lpss: Pass HSUART configuration via properties
      device property: avoid allocations of 0 length
      lib/string: introduce match_string() helper
      device property: convert to use match_string() helper

Bamvor Jian Zhang (1):
      gpiolib: do not allow to insert an empty gpiochip

Christophe RICARD (2):
      ACPI: Rename acpi_gsi_get_irq_type to acpi_dev_get_irq_type and export symbol
      ACPI / gpio: Add irq_type when a GPIO is used as an interrupt

Dasaratharaman Chandramouli (1):
      intel_idle: Support for Intel Xeon Phi Processor x200 Product Family

Gwendal Grignou (1):
      mmc: core: Do regular power cycle when lacking eMMC HW reset support

Heikki Krogerus (4):
      device property: helper macros for property entry creation
      device property: the secondary fwnode needs to depend on the primary
      device property: fwnode->secondary may contain ERR_PTR(-ENODEV)
      device property: fix for a case of use-after-free

Len Brown (2):
      intel_idle: Add SKX support
      intel_idle: add BXT support

Linus Walleij (1):
      Revert "gpio: revert get() to non-errorprogating behaviour"

Mika Westerberg (7):
      pwm: lpss: Remove ->free() callback
      pwm: lpss: Rework the sequence of programming PWM_SW_UPDATE
      device property: Take a copy of the property set
      driver core: platform: Add support for built-in device properties
      mfd: intel-lpss: Add support for passing device properties
      mfd: intel-lpss: Pass SDA hold time to I2C host controller driver
      mfd: intel-lpss: Pass I2C configuration via properties on BXT

Qipeng Zha (1):
      pinctrl: intel: make the high level interrupt working

Richard Cochran (10):
      intel_idle: remove useless return from void function.
      intel_idle: Fix a helper function's return value.
      intel_idle: Remove redundant initialization calls.
      intel_idle: Fix deallocation order on the driver exit path.
      intel_idle: Fix dangling registration on error path.
      intel_idle: Avoid a double free of the per-CPU data.
      intel_idle: Setup the timer broadcast only on successful driver load.
      intel_idle: Don't overreact to a cpuidle registration failure.
      intel_idle: Propagate hot plug errors.
      intel_idle: Clean up all registered devices on exit.

Wolfram Sang (1):
      mmc: make MAN_BKOPS_EN message a debug

qipeng.zha (1):
      pwm: lpss: Update PWM setting for Broxton

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index f57ead8ef34a..a6f7dcca5ec4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bf2fbe7f2cdf44fc69e50fefbfdd58d41a03733a"
+SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
 SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index da88451b760f..e05b27a769d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.11"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_machine ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
 SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 4306bf8be98a..984a49c85e51 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "97c21d0b5ffa8eb1cb27a6f81b52ec53182ae087"
-SRCREV_machine_qemuarm64 ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
-SRCREV_machine_qemumips ?= "8763860e4da46b3cb1551e09d9ca46eedd2dd91a"
-SRCREV_machine_qemuppc ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
-SRCREV_machine_qemux86 ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
-SRCREV_machine_qemux86-64 ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
-SRCREV_machine_qemumips64 ?= "8974d9741cbcb21bf50ab49a6257e5773415fa5f"
-SRCREV_machine ?= "628bf627561c6285d99fb978e11d4c15fc29324b"
+SRCREV_machine_qemuarm ?= "b74c7523581ab748dfe475af384fcb40c4542d31"
+SRCREV_machine_qemuarm64 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
+SRCREV_machine_qemumips ?= "f5f23899a4afb7f095a480652edc082d6bd545b2"
+SRCREV_machine_qemuppc ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
+SRCREV_machine_qemux86 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
+SRCREV_machine_qemux86-64 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
+SRCREV_machine_qemumips64 ?= "7ce6e58742b2f1f79cc8b1a1fff8bc408a3b585e"
+SRCREV_machine ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
 SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


