Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E87DC6C11C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:40:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3eiJU021580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:40:44 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:40:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:25 -0500
Message-ID: <2738a52c66548232cb1fea3b2c1025e90b110435.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/17] linux-yocto: drop 4.14 recipes
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
X-List-Received-Date: Mon, 17 Dec 2018 03:40:44 -0000
Content-Type: text/plain

4.19 will replace 4.14 as the LTS kernel, so we drop the 4.14
recipes to enforce this update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 41 -------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 28 -------------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 47 ----------------------
 3 files changed, 116 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.14.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
deleted file mode 100644
index 4189fc8d173c..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-KBRANCH ?= "v4.14/standard/preempt-rt/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# Skip processing of this recipe if it is not explicitly specified as the
-# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
-# to build multiple virtual/kernel providers, e.g. as dependency of
-# core-image-rt-sdk, core-image-rt.
-python () {
-    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?= "82ac7b2b8048b537481bf16b8acda1cc9bfe9565"
-SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.14.79"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
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
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
deleted file mode 100644
index 71f5c4716a17..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-KBRANCH ?= "v4.14/standard/tiny/base"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.14.79"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "6ce17eae5d962b30846a5258956246438d68d60a"
-SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
deleted file mode 100644
index 65b24440982d..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-KBRANCH ?= "v4.14/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v4.14/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v4.14/standard/qemuarm64"
-KBRANCH_qemumips ?= "v4.14/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v4.14/standard/qemuppc"
-KBRANCH_qemux86  ?= "v4.14/standard/base"
-KBRANCH_qemux86-64 ?= "v4.14/standard/base"
-KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "8752b8421efe8b5a478f17fbffacf4af974ec703"
-SRCREV_machine_qemuarm64 ?= "ac66474ba7f7e93d16ae3ea005f214113bb127c5"
-SRCREV_machine_qemumips ?= "ab031b267e2a79fcd48da5d10d503f4d065f4821"
-SRCREV_machine_qemuppc ?= "f47c3945e8dd230ea37771bcacc836245fc79d22"
-SRCREV_machine_qemux86 ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
-SRCREV_machine_qemux86-64 ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
-SRCREV_machine_qemumips64 ?= "8063a7258fc670a361fed85b858fabb237485f1c"
-SRCREV_machine ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
-SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.14.79"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
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
2.5.0


