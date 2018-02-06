Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6CB7785D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w16GM88f025777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Feb 2018 08:22:08 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:22:04 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:58 -0500
Message-ID: <2082e6a9826811b237d907e4634568ddb609a2ed.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/4.4: drop recipe
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
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 36 -------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 23 -------------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 42 -----------------------
 3 files changed, 101 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
deleted file mode 100644
index 5fd13f13c90b..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ /dev/null
@@ -1,36 +0,0 @@
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
-SRCREV_machine ?= "d5efeeeb928a0111fc187fd1e8d03d2e4e35d4a0"
-SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.4.113"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
deleted file mode 100644
index 8a98189d4c74..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-KBRANCH ?= "standard/tiny/common-pc"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.4.113"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
deleted file mode 100644
index 97c16d59dd18..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
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
-KBRANCH_qemux86  ?= "standard/base"
-KBRANCH_qemux86-64 ?= "standard/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "400c0f39b954cd8fffdf53e6ec97852b73fea7af"
-SRCREV_machine_qemuarm64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemumips ?= "fb03a9472367b6c177729ac631326aafd5d17c92"
-SRCREV_machine_qemuppc ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemux86 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemux86-64 ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_machine_qemumips64 ?= "26b8ba186a6d39728fc1510bd2264110c75842f5"
-SRCREV_machine ?= "4d31a8b7661509ff1044abcf9050750cc2478e20"
-SRCREV_meta ?= "b149d14ccae8349ab33e101f6af233a12f4b17ba"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.4.113"
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
2.5.0


