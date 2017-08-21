Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42BF078200
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:13:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7LEDfln020813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Aug 2017 07:13:43 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 21 Aug 2017 07:13:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 21 Aug 2017 10:13:40 -0400
Message-ID: <1503324820-25505-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] linux-yocto: introduce 4.12 recipes
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
X-List-Received-Date: Mon, 21 Aug 2017 14:13:43 -0000
Content-Type: text/plain

The 4.12 kernel will be the default/reference for the fall 2017
release.

These recipes represent the introduction of 4.12.7 + related kernel
meta data. Existing functionality has been validated against this
new kernel version, and older versions will be removed in separate
commits.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v2: Adjusting the SRCREVs to fix a patch that no longer needed to be applied.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 38 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 44 ++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.12.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
new file mode 100644
index 000000000000..1020da642650
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -0,0 +1,38 @@
+KBRANCH ?= "standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers, e.g. as dependency of
+# core-image-rt-sdk, core-image-rt.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
+SRCREV_machine ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_meta ?= "baf6e3d9b8c6efd32cfaf75a9bb8d55a558f006d"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.12.7"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
new file mode 100644
index 000000000000..c79f97fdfdc9
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -0,0 +1,25 @@
+KBRANCH ?= "standard/tiny/common-pc"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.12.7"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_meta ?= "baf6e3d9b8c6efd32cfaf75a9bb8d55a558f006d"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "(qemux86$)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
new file mode 100644
index 000000000000..af655315134f
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -0,0 +1,44 @@
+KBRANCH ?= "standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "standard/qemuarm64"
+KBRANCH_qemumips ?= "standard/mti-malta32"
+KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemux86  ?= "standard/base"
+KBRANCH_qemux86-64 ?= "standard/base"
+KBRANCH_qemumips64 ?= "standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "c0fb11c222383b78e54006d1437fb0793c516b52"
+SRCREV_machine_qemuarm64 ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_machine_qemumips ?= "46de539c9f055febba1913e192e68d938c320b44"
+SRCREV_machine_qemuppc ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_machine_qemux86 ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_machine_qemux86-64 ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_machine_qemumips64 ?= "d4522d6bf30f82d928b77d9c16932615b535e50b"
+SRCREV_machine ?= "418f93c560a4d83d078cb96a639af71786da9187"
+SRCREV_meta ?= "baf6e3d9b8c6efd32cfaf75a9bb8d55a558f006d"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.12.7"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.5.0


