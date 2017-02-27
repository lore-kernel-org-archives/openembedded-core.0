Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8F573070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:10:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1R3ADwm008346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Feb 2017 19:10:14 -0800 (PST)
Received: from yow-dellw-nn.wrs.com (128.224.56.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 26 Feb 2017 19:10:13 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 26 Feb 2017 22:10:05 -0500
Message-ID: <ebd2ca05bb2fff117f0467bb02762757c469ec6e.1488164498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1488164498.git.bruce.ashfield@windriver.com>
References: <cover.1488164498.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 4/4] linux-yocto: drop 4.4 recipes
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
X-List-Received-Date: Mon, 27 Feb 2017 03:10:15 -0000
Content-Type: text/plain

We have 4.1 (LTSI) 4.9 (LTS) and 4.10 as the three kernels in the
master branch. 4.4 is no longer needed and can be dropped.

This kernel will continue to get -stable updates as appropriate, but
won't get SRCREV updates to the master branch.

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
index 82f1a94f162f..000000000000
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
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?= "6622c6471016005d5588aa4338ce57aced713dcd"
-SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.4.41"
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
index 6cb580dc3e90..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-KBRANCH ?= "standard/tiny/common-pc"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.4.41"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "(qemux86$)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
deleted file mode 100644
index 34e0f38c030b..000000000000
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
-SRCREV_machine_qemuarm ?= "60287c1951ca7063bc19597eb5cabf834e660cfb"
-SRCREV_machine_qemuarm64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemumips ?= "143d659ae6d53623001e22c13a0286bd6d1723ca"
-SRCREV_machine_qemuppc ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemux86 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemux86-64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemumips64 ?= "c74cc42106745bab08de6263b9320ac029f2cca9"
-SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.4.41"
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


