Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBABD78493
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w16GM2wr025771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Feb 2018 08:22:02 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:21:58 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:52 -0500
Message-ID: <b560a83b80ddb195c7b9678a51317f9074186043.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto: introduce 4.14 recipes
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
X-List-Received-Date: Tue, 06 Feb 2018 16:22:04 -0000
Content-Type: text/plain

This commit makes the 4.14 kernel available for use with the
Yocto configuration fragments and qemu* BSPs.

It has been tested for x86,arm,mips and powerpc against the
lsb, core* and glibc/mulsc test matrix.

This will serve as the LTS kernel in master, with others being
removed in subsequent commits.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 38 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 44 ++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.14.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
new file mode 100644
index 000000000000..669a2606aed8
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -0,0 +1,38 @@
+KBRANCH ?= "v4.14/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers, e.g. as dependency of
+# core-image-rt-sdk, core-image-rt.
+python () {
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
+SRCREV_machine ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_meta ?= "0e964663a7978bdb459c28f3777e1b6dfe97d93d"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.14.16"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
new file mode 100644
index 000000000000..bf4b0ac4f6c3
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -0,0 +1,25 @@
+KBRANCH ?= "v4.14/standard/tiny/common-pc"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.14.16"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_meta ?= "0e964663a7978bdb459c28f3777e1b6dfe97d93d"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
new file mode 100644
index 000000000000..e71046ee0c74
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -0,0 +1,44 @@
+KBRANCH ?= "v4.14/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v4.14/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v4.14/standard/qemuarm64"
+KBRANCH_qemumips ?= "v4.14/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v4.14/standard/qemuppc"
+KBRANCH_qemux86  ?= "v4.14/standard/base"
+KBRANCH_qemux86-64 ?= "v4.14/standard/base"
+KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "52cbbd4d3e216cbf0c12ae66f012103b20777884"
+SRCREV_machine_qemuarm64 ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_machine_qemumips ?= "900ca1bbd59fe4bf28a767e816d1883d173d7397"
+SRCREV_machine_qemuppc ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_machine_qemux86 ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_machine_qemux86-64 ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_machine_qemumips64 ?= "c6c6244d216a6c2f87c807d8e2e4bc42baa7c480"
+SRCREV_machine ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
+SRCREV_meta ?= "0e964663a7978bdb459c28f3777e1b6dfe97d93d"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.14.16"
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


