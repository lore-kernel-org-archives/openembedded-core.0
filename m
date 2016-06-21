Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B056673163
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:20:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5LFKVnQ026974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jun 2016 08:20:31 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 21 Jun 2016 08:20:30 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jun 2016 11:20:25 -0400
Message-ID: <da28081f88e3048a549590ed39f0ed75b0a2fdb6.1466522266.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1466522266.git.bruce.ashfield@windriver.com>
References: <cover.1466522266.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.1: driver, mmc and power backports
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

Backporting the following changes from the mainline kernel for improved
power, driver core and mmc support:

  x86 tsc_msr: Remove irqoff around MSR-based TSC enumeration
  x86 tsc_msr: Add Airmont reference clock values
  x86 tsc_msr: Correct Silvermont reference clock values
  x86 tsc_msr: Update comments, expand definitions
  x86 tsc_msr: Remove debugging messages
  x86 tsc_msr: Identify Intel-specific code
  mmc: block: Pause re-tuning while switched to the RPMB partition
  mmc: block: Always switch back to main area after RPMB access
  mmc: core: Add a facility to "pause" re-tuning
  mmc: block: Add new ioctl to send multi commands
  cpuidle: powernv/pseries: Auto-promotion of snooze to deeper idle state
  cpuidle: Do not use CPUIDLE_DRIVER_STATE_START in cpuidle.c
  cpuidle: Select a different state on tick_broadcast_enter() failures
  sched / idle: Call default_idle_call() from cpuidle_enter_state()
  sched / idle: Call idle_set_state() from cpuidle_enter_state()
  cpuidle: Fix the kerneldoc comment for cpuidle_enter_state()
  sched / idle: Eliminate the "reflect" check from cpuidle_idle_call()
  cpuidle: Check the sign of index in cpuidle_reflect()
  sched / idle: Move the default idle call code to a separate function
  powercap / RAPL: Add support for Broadwell-H
  module: add extra argument for parse_params() callback
  Driver core: wakeup the parent device before trying probe
  base:dd - Fix for typo in comment to function driver_deferred_probe_trigger().

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 034a86989010..c3f98540f63c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "774b26df9e2ddce26e1ead27b6925b2d260919dd"
+SRCREV_machine ?= "f0e560d7f32007af6285a71925d4176228730349"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index d34a6d7bbc08..fbe88fb98163 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
+SRCREV_machine ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9a31ddce25fa..22feae66cbff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9fc1d1bc96fc8483abacb38d3a6bdd64163494ac"
-SRCREV_machine_qemuarm64 ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
-SRCREV_machine_qemumips ?= "5117bb86942f16f5d6d1303350e0d3522bcc9c43"
-SRCREV_machine_qemuppc ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
-SRCREV_machine_qemux86 ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
-SRCREV_machine_qemux86-64 ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
-SRCREV_machine_qemumips64 ?= "d6904084bddb0cce44f29e0a6c6202a2f0b41671"
-SRCREV_machine ?= "994588340bf1d2d357f86fceec0e3239126b12ee"
+SRCREV_machine_qemuarm ?= "2c7cd362fe082b15edd99231eed992e0006fea60"
+SRCREV_machine_qemuarm64 ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
+SRCREV_machine_qemumips ?= "1805e843d9cefe16b1465acb836f17d10ed8471a"
+SRCREV_machine_qemuppc ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
+SRCREV_machine_qemux86 ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
+SRCREV_machine_qemux86-64 ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
+SRCREV_machine_qemumips64 ?= "e501ea70ace778a2e44568e18b6d2928cf4db05d"
+SRCREV_machine ?= "5cf0c81bca25e1d7617f988a08447cd1fafb1d83"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


