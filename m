Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA648793EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:45:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UDjr4O015874
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 06:45:53 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 06:45:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 09:45:42 -0400
Message-ID: <463ef4129f691aaaba8b02e93090e48f0411008b.1535636375.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535636375.git.bruce.ashfield@windriver.com>
References: <cover.1535636375.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto: drop 4.15 versioned recipe
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
X-List-Received-Date: Thu, 30 Aug 2018 13:45:53 -0000
Content-Type: text/plain

4.15 was part of the release as the 'newest' kernel. It is no longer
supported upstream, so there's no need to carry it into newer releases
since it will be replaced by 4.18.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 41 -------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 26 ------------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 47 ----------------------
 3 files changed, 114 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.15.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
deleted file mode 100644
index 75aa21055f86..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-KBRANCH ?= "v4.15/standard/preempt-rt/base"
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
-SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "4f95b5be8ca7af984b4abee7f6f9eeccd136a5cb"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.15.18"
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
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
deleted file mode 100644
index 392fc1c38a42..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-KBRANCH ?= "v4.15/standard/tiny/common-pc"
-KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.15.18"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "4f95b5be8ca7af984b4abee7f6f9eeccd136a5cb"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
deleted file mode 100644
index 14afc41c2081..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-KBRANCH ?= "v4.15/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
-KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
-KBRANCH_qemux86  ?= "v4.15/standard/base"
-KBRANCH_qemux86-64 ?= "v4.15/standard/base"
-KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "12c2b0077b13cf6a2f1096a0d51f3a6ed5cbbd3a"
-SRCREV_machine_qemuarm64 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_machine_qemumips ?= "c03f2971b07a79c5402f0d7126cc2cd856028e38"
-SRCREV_machine_qemuppc ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_machine_qemux86 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_machine_qemux86-64 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_machine_qemumips64 ?= "b98c113571c72a0d34832dd6fe5585529b32988b"
-SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "4f95b5be8ca7af984b4abee7f6f9eeccd136a5cb"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.15.18"
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


