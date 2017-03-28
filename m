Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E57777B1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:58:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2SCwEQ7020691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Mar 2017 05:58:14 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 28 Mar 2017 05:58:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Mar 2017 08:58:07 -0400
Message-ID: <15fc06fcec149b142965c862627800936401b469.1490705726.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1490705726.git.bruce.ashfield@windriver.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto: drop 4.8 recipes
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
X-List-Received-Date: Tue, 28 Mar 2017 12:58:13 -0000
Content-Type: text/plain

We have 4.1 (LTSI), 4.4 (LTS), 4.9 (LTS/LTSI) and 4.10 available in
master. 4.8 is no longer required, so we drop the recipe to keep
the version selection under control.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 38 --------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 25 -------------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 44 -----------------------
 3 files changed, 107 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
deleted file mode 100644
index f99f200598d3..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
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
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?= "ffd0a071c2df55ecb2bb1f101465df93a81093b5"
-SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.8.18"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
deleted file mode 100644
index 18ef51788fd3..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-KBRANCH ?= "standard/tiny/common-pc"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.8.18"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "db2e91ce904f32347ccf739de969b4216cbcaf92"
-SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "(qemux86$)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
deleted file mode 100644
index 4c89183a3512..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
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
-SRCREV_machine_qemuarm ?= "c0123490bb9b454a43c3573e2573b491e0c09701"
-SRCREV_machine_qemuarm64 ?= "304f750aa5be0bf66f70720d68f16865d912ff9f"
-SRCREV_machine_qemumips ?= "aa15b7a291ca18d08fd640932efad673f6b278c3"
-SRCREV_machine_qemuppc ?= "d2c3ea488fe179898ae853cb9565cb7ac62291c6"
-SRCREV_machine_qemux86 ?= "c50f695341260d4757af64d809390610aae213e1"
-SRCREV_machine_qemux86-64 ?= "c50f695341260d4757af64d809390610aae213e1"
-SRCREV_machine_qemumips64 ?= "40a880b0f21aa09f3b52d68969339d80f9cc10ad"
-SRCREV_machine ?= "c50f695341260d4757af64d809390610aae213e1"
-SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "4.8.18"
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


