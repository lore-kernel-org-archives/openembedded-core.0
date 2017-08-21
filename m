Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7312F78272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L2wRF8001419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 20 Aug 2017 19:58:27 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:17 -0400
Message-ID: <c46ff02e14174aa02c0e7907995aaadc6f4e2e02.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto: introduce 4.12 recipes
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:27 -0000
Content-Type: text/plain

The 4.12 kernel will be the default/reference for the fall 2017
release.

These recipes represent the introduction of 4.12.7 + related kernel
meta data. Existing functionality has been validated against this
new kernel version, and older versions will be removed in separate
commits.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 38 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 44 ++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.12.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
new file mode 100644
index 000000000000..bcb05a910013
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
+SRCREV_machine ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_meta ?= "b8983853109591bee91b268dccc075acfc7e45a2"
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
index 000000000000..299bf0b596fa
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
+SRCREV_machine ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_meta ?= "b8983853109591bee91b268dccc075acfc7e45a2"
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
index 000000000000..190d9f4f0040
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
+SRCREV_machine_qemuarm ?= "6eb15caf072384f62a3de67778f4f1e4b377b9c3"
+SRCREV_machine_qemuarm64 ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_machine_qemumips ?= "35a5713a9ee50a3aee884fcb236db197e73c97b5"
+SRCREV_machine_qemuppc ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_machine_qemux86 ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_machine_qemux86-64 ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_machine_qemumips64 ?= "30680adb38d14e55bc27f81fd45abf554f5f4845"
+SRCREV_machine ?= "918fc2fbdf48e86748a3600a5e79d1abcd71b92e"
+SRCREV_meta ?= "b8983853109591bee91b268dccc075acfc7e45a2"
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


