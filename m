Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27B7E731D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:44:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBIKikOY006346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Dec 2015 12:44:46 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 12:44:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 15:44:37 -0500
Message-ID: <019f38adf3086bba356b7d6175aafec2eaf4388a.1450471022.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450471022.git.bruce.ashfield@windriver.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto: remove 3.14 and 3.19 recipes
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
X-List-Received-Date: Fri, 18 Dec 2015 20:44:48 -0000
Content-Type: text/plain

In preparation for the introduction of new (supported) kernel versions,
we remove the 3.14 and 3.19 variants.

The kernel trees will still be available, but the recipes are removed
from master. These versions can still be built on older releases, or
with private copies of the recipes.

3.14 LTSI is replaced by the 4.1 LTSI kernel, and 3.19 will be replaced
by 4.4+.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 29 ---------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 23 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 23 ------------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 42 ----------------------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 42 ----------------------
 5 files changed, 159 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.19.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
deleted file mode 100644
index bfeabbec0354..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-KBRANCH ?= "standard/preempt-rt/base"
-KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine ?= "8281915527ba8d79e59906c02f28e7aa11424723"
-SRCREV_machine_qemuppc ?= "5e7d372ebc327f28656fc972fab55605eea8aec3"
-SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "3.14.36"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
deleted file mode 100644
index e13cb80ce51e..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-KBRANCH ?= "standard/tiny/base"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "3.14.36"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
-SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
deleted file mode 100644
index a6a58a2ed84f..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-KBRANCH ?= "standard/tiny/base"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "3.19.5"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_meta ?= "1016714868249d64fc16692fd7679672b1efa17b"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.19;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
deleted file mode 100644
index 809789bd43ec..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-KBRANCH ?= "standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "standard/qemuarm64"
-KBRANCH_qemumips ?= "standard/mti-malta32"
-KBRANCH_qemuppc  ?= "standard/qemuppc"
-KBRANCH_qemux86  ?= "standard/common-pc/base"
-KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "4817747912b5c50ce5c31ef25658340ca615e1b4"
-SRCREV_machine_qemuarm64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
-SRCREV_machine_qemumips ?= "6ed76ec26b120f65f8547c8612b7334bd2745ec9"
-SRCREV_machine_qemuppc ?= "a86ade84b2e142c0fd7536d96477107b6d07db5c"
-SRCREV_machine_qemux86 ?= "af1f7f586bd32d39c057f17606991b887eadb389"
-SRCREV_machine_qemux86-64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
-SRCREV_machine_qemumips64 ?= "a63d40b860a6d255005a541894d53729090b40ea"
-SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
-SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "3.14.36"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
deleted file mode 100644
index 753e14d5081c..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-KBRANCH ?= "standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "standard/qemuarm64"
-KBRANCH_qemumips ?= "standard/mti-malta32"
-KBRANCH_qemuppc  ?= "standard/qemuppc"
-KBRANCH_qemux86  ?= "standard/common-pc"
-KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "857048f10bfe7089ca6007e72431f1c098b07115"
-SRCREV_machine_qemuarm64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_machine_qemumips ?= "cedbbc7b5e72df2e820bb9e7885f12132c5e2fff"
-SRCREV_machine_qemuppc ?= "23a83386e10986a63e6cef712a045445499d002b"
-SRCREV_machine_qemux86 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_machine_qemux86-64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_machine_qemumips64 ?= "3eb70cea3532e22ab1b6da9864446621229e6616"
-SRCREV_machine ?= "151571a39785218a57c3ae3355cd63694890cc8d"
-SRCREV_meta ?= "1016714868249d64fc16692fd7679672b1efa17b"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.19;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "3.19.5"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.1.0


