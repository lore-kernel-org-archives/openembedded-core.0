Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0C1278548
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w16GM93F003403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Feb 2018 08:22:09 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:22:05 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:59 -0500
Message-ID: <0db9116b3644dfc07d3139d4c2d7d9d777829d96.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/4.9: drop recipe
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
X-List-Received-Date: Tue, 06 Feb 2018 16:22:08 -0000
Content-Type: text/plain

As was previously announced, anything older than 4.14 is being
dropped in the master/release branches to better support newer
processors and to ensure that safe/secure kernels are the
defaults for all builds. The time required to update the older
kernels with constant updates (more than just CVEs) is not
justified in new releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 38 --------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 25 -------------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 44 -----------------------
 3 files changed, 107 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.9.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
deleted file mode 100644
index 0519bb9acced..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
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
-SRCREV_machine ?= "7b2a74f272ef0a6e292b259872d47e891d7b2a20"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.9.78"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
deleted file mode 100644
index 5c9a26098863..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-KBRANCH ?= "standard/tiny/common-pc"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.9.78"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
deleted file mode 100644
index 871d87000373..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ /dev/null
@@ -1,44 +0,0 @@
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
-SRCREV_machine_qemuarm ?= "801a684d5e769ca18e6ad9758806a528eccdcb73"
-SRCREV_machine_qemuarm64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemumips ?= "8235c7fda39963abbf6347390fd460e18a7e47b5"
-SRCREV_machine_qemuppc ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemux86 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemux86-64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemumips64 ?= "bd9d169cd29aa5f2397ff383cd29f84a1043a693"
-SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.9.78"
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


