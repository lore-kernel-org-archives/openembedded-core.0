Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD7573174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:20:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5LFKTJ6017005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Jun 2016 08:20:29 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 21 Jun 2016 08:20:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jun 2016 11:20:23 -0400
Message-ID: <1178d9f3be603c79a131b4eb02b765314ca22c18.1466522266.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1466522266.git.bruce.ashfield@windriver.com>
References: <cover.1466522266.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/4.1: tpm2, pinctrl, powercap and watchdog backports
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
X-List-Received-Date: Tue, 21 Jun 2016 15:20:30 -0000
Content-Type: text/plain

Backporting the following changes from the mainline kernel to enhance/add
support for tpm2, pinctrl, powercap and watchdog:

   634eecdb20b watchdog: omap_wdt: fix null pointer dereference
   79dcc6dabe63 Watchdog: Fix parent of watchdog_devices
   94a2e8f1d47e watchdog: st_wdt: Update IP layout information to include Clocksource
   3a74938a9610 watchdog: st_wdt: Add new driver for ST's LPC Watchdog
   fb6b94faa82c watchdog: digicolor: driver for Conexant Digicolor CX92755 SoC
   22fb7b1353dd watchdog: omap_wdt: early_enable module parameter
   aa70c2480483 watchdog: omap_wdt: implement get_timeleft
   47b7a1a5f70f watchdog: docs: omap_wdt also understands nowayout
   9d833b82f706 watchdog: omap: put struct watchdog_device into driver data
   87ded7189286 watchdog: omap: use watchdog_init_timeout instead of open coding it
   abccc104fcad watchdog: da9062: DA9062 watchdog driver
   95f8b1024989 pinctrl: intel: fix offset calculation issue of register PAD_OWN
   8e6606474fa0 pinctrl: intel: fix bug of register offset calculation
   2423468cb317 MAINTAINERS: add new maintainer for TPM DEVICE DRIVER
   cf94113f05a6 sysfs: added __compat_only_sysfs_link_entry_to_kobj()
   cdb63d5cd801 tpm: fix missing migratable flag in sealing functionality for TPM2
   95f738feaafe keys, trusted: seal/unseal with TPM 2.0 chips
   92eb9052fd50 tpm: seal/unseal for TPM 2.0
   d9c7bb89ec85 keys, trusted: move struct trusted_key_options to trusted-type.h
   a3b394e91b31 tpm: introduce tpm_buf
   bd68d3a21139 tpm: move the PPI attributes to character device directory.
   54fb01659b83 tpm, tpm_crb: fix unaligned read of the command buffer address
   0ab522f5ef11 powercap / RAPL: disable the 2nd power limit properly
   9ba8c36e9ea7 thermal/powerclamp: remove cpu whitelist
   2971561c8fc9 thermal/powerclamp: add cpu id for Skylake u/y
   cec457da34d0 thermal/powerclamp: add cpu id for denlow platform
   fc30ea2abdc5 thermal/powerclamp: add cpu id for skylake h/s
   3eea18356747 intel powerclamp: support Knights Landing

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 9eaecd4075c1..456ae80e85d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "576bba030082fcdcdf9e58a285c92558f27d1e73"
+SRCREV_machine ?= "8fd10e4d4113e72bf46e5bc9eb15c8ccf32bc15a"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 7e0f66fa84cd..77da5de8adc7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
+SRCREV_machine ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 667212f1df18..0ab26e63a85c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a6899b7c294ed25d9d37afde858cdd52f41f86b0"
-SRCREV_machine_qemuarm64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemumips ?= "69936a9614608b7aa893ae78bd69e5cc197816c3"
-SRCREV_machine_qemuppc ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemux86 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemux86-64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
-SRCREV_machine_qemumips64 ?= "f0eb9eabbeafa5eadf66893822ea42d80e04afbd"
-SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
+SRCREV_machine_qemuarm ?= "4f0e75ff79949f2924a5103079ce1fc5e0a1d244"
+SRCREV_machine_qemuarm64 ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
+SRCREV_machine_qemumips ?= "332b2b5ef3de2ec31ff8d7687ff7b60892c2b052"
+SRCREV_machine_qemuppc ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
+SRCREV_machine_qemux86 ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
+SRCREV_machine_qemux86-64 ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
+SRCREV_machine_qemumips64 ?= "5133c3b201f3cee041b0911928672d2f1a2c8c9a"
+SRCREV_machine ?= "e634eecdb20b865f5b3d94e2006832c3e6e85358"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


