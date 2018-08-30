Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C65A7793F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:45:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UDjsWX001155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 06:45:54 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 06:45:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 09:45:43 -0400
Message-ID: <4720a733c158a6a8596d1e939042dd705e16d493.1535636375.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535636375.git.bruce.ashfield@windriver.com>
References: <cover.1535636375.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/4.12: drop versioned recipes
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
X-List-Received-Date: Thu, 30 Aug 2018 13:45:54 -0000
Content-Type: text/plain

While the 4.12 kernel will continue to get updates, that will happen
in maintenance branches. So we drop the 4.12 versioned recipes to make
it clear that 4.14 and 4.18 are the active kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 38 ------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 25 ------------
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 46 ----------------------
 3 files changed, 109 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.12.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
deleted file mode 100644
index a6a8b60e1b0f..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-KBRANCH ?= "standard/preempt-rt/base"
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
-SRCREV_machine ?= "ef88c3326f62cec4b98340324ddbe7f7f7704fd5"
-SRCREV_meta ?= "2ae65226f64ed5c888d60eef76b6249db678d060"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.12.28"
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
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
deleted file mode 100644
index cb4ef3a659c1..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-KBRANCH ?= "standard/tiny/common-pc"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.12.28"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
-SRCREV_meta ?= "2ae65226f64ed5c888d60eef76b6249db678d060"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
deleted file mode 100644
index 0aea05b83f2a..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-KBRANCH ?= "standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "standard/qemuarm64"
-KBRANCH_qemumips ?= "standard/mti-malta32"
-KBRANCH_qemuppc  ?= "standard/qemuppc"
-KBRANCH_qemux86  ?= "standard/base"
-KBRANCH_qemux86-64 ?= "standard/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "b84ecefc243a6ed67d8b6020394963de1240a9f0"
-SRCREV_machine_qemuarm64 ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
-SRCREV_machine_qemumips ?= "15b1ab68f73fa60dd95a74c640e87e05fad1716d"
-SRCREV_machine_qemuppc ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
-SRCREV_machine_qemux86 ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
-SRCREV_machine_qemux86-64 ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
-SRCREV_machine_qemumips64 ?= "57a3f72a020fc84f2da5b0b4c5de4cdbc22b3284"
-SRCREV_machine ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
-SRCREV_meta ?= "2ae65226f64ed5c888d60eef76b6249db678d060"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-
-DEPENDS += "openssl-native util-linux-native"
-
-LINUX_VERSION ?= "4.12.28"
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


