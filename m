Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uw-0001UW-DS
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264351"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:55 -0700
Message-Id: <7decbd80eccb19f762fd4916aed2e33e0490f467.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 06/13] linux-yocto: move common tasks to a common location
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2011 03:20:23 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

During the initial development of the linux-yocto recipes there were
several additional tasks that needed to be run in any inheriting
recipe. At that time, they didn't seem to fire if they were in the
include file versus the recipes themselves. As it turns out, these
tasks do work fine if placed in the linux-yocto.inc file, and the
rest of the recipes can be simplified as a result.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb |    8 +-------
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-------
 meta/recipes-kernel/linux/linux-yocto.inc          |    5 +++++
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   13 +------------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    8 +-------
 5 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb b/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
index 0ca53ae..d92a902 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
@@ -17,9 +17,8 @@ SRCREV_machine_qemux86-64 = "3c84c45ad3c3592f9c7ff4076de9bee417cd322e"
 SRCREV_machine = "439602eb6acd53d9beb8493710310214fc7bd749"
 SRCREV_meta = "e1f85a470934a0cf6abde5d95533e74501822c6b"
 
-PR = "r2"
+PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-SRCREV_FORMAT = "meta_machine"
 
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
 
@@ -34,11 +33,6 @@ python __anonymous () {
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.34.git;protocol=git;nocheckout=1;branch=${KBRANCH},wrs_meta;name=machine,meta"
 
 # Functionality flags
-KERNEL_REVISION_CHECKING ?= "t"
 KERNEL_FEATURES=features/netfilter
 
-# extra tasks
-addtask kernel_link_vmlinux after do_compile before do_install
-addtask validate_branches before do_patch after do_kernel_checkout
-
 require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index b296ef4..ebf6054 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -18,9 +18,8 @@ SRCREV_machine ?= "0b805cce57f61a244eb3b8fce460b14f1be442b3"
 SRCREV_machine_qemuppc ?= "48207085609f2b73a54e3c1ef4139894eef627af"
 SRCREV_meta ?= "3c9ebeed2598b74798a0c9247ef7c385e0cd96a7"
 
-PR = "r0"
+PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-SRCREV_FORMAT = "meta_machine"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
@@ -35,9 +34,4 @@ KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-# extra tasks
-addtask kernel_link_vmlinux after do_compile before do_install
-addtask validate_branches before do_patch after do_kernel_checkout
-addtask kernel_configcheck after do_configure before do_compile
-
 require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 11b77ce..09433fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -34,3 +34,8 @@ do_install_append(){
 		rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
 	fi
 }
+
+# extra tasks
+addtask kernel_link_vmlinux after do_compile before do_install
+addtask validate_branches before do_patch after do_kernel_checkout
+addtask kernel_configcheck after do_configure before do_compile
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 4199137..34e563c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -9,10 +9,8 @@ KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
 KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
-KMETA = meta
 
 LINUX_VERSION ?= "2.6.37"
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
 SRCREV_machine_qemuarm = "b3e53a090eaa23aa82e64fa0a563a93a2b4dbb5d"
 SRCREV_machine_qemumips = "91f2eb4a3b447476b36aac8e6e198d08c98e0680"
@@ -22,26 +20,17 @@ SRCREV_machine_qemux86-64 = "af2bfbe5f757361b5b027a24d67a93bfdfaaf33c"
 SRCREV_machine = "4ae8f8605c81c39b959948e23f7123294a5dfb3f"
 SRCREV_meta = "aeea99683c7283f1f3320bf2ee7085ee252d4e7e"
 
-PR = "r20"
+PR = "r21"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-SRCREV_FORMAT = "meta_machine"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags
-KERNEL_REVISION_CHECKING ?= "t"
 KERNEL_FEATURES="features/netfilter"
 KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-YOCTO_KERNEL_META_DATA=t
-
-# extra tasks
-addtask kernel_link_vmlinux after do_compile before do_install
-addtask validate_branches before do_patch after do_kernel_checkout
-addtask kernel_configcheck after do_configure before do_compile
-
 require linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index f504b74..b296558 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -20,9 +20,8 @@ SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
 SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
 SRCREV_meta ?= "3c9ebeed2598b74798a0c9247ef7c385e0cd96a7"
 
-PR = "r1"
+PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-SRCREV_FORMAT = "meta_machine"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
@@ -34,9 +33,4 @@ KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-# extra tasks
-addtask kernel_link_vmlinux after do_compile before do_install
-addtask validate_branches before do_patch after do_kernel_checkout
-addtask kernel_configcheck after do_configure before do_compile
-
 require linux-tools.inc
-- 
1.7.6



