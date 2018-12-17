Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC9D279CC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:40:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBH3e8T8003604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:40:18 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:57 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:23 -0500
Message-ID: <7556c25b67a543c02cf700f435abb402158d7d8a.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/17] linux-yocto: introduce 4.19 recipes
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
X-List-Received-Date: Mon, 17 Dec 2018 03:40:43 -0000
Content-Type: text/plain

Introduce the 4.19 linux kernel as the reference for LTS and eventually
LSB distros. For now, we keep the other versions around until the h/w
reference BSPs are updated and 4.20+ are available as the "latest"
kernel. This avoid updating qemu* to 4.19 as the default for a small
transition window.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 43 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 32 +++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 48 ++++++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.19.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
new file mode 100644
index 000000000000..06caf06d1c62
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -0,0 +1,43 @@
+KBRANCH ?= "v4.19/standard/preempt-rt/base"
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
+SRCREV_machine ?= "36ac11d2cb46f951843586935292c628d304e113"
+SRCREV_meta ?= "f7bff5bff6ef6ceadfb4661a6ef3ed1f95bd6b2b"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.19.5"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
new file mode 100644
index 000000000000..c25202fb5f06
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v4.19/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.19.5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine_qemuarm ?= "afd1ddee4ec8cc65d585e2c75bbcf31d9650c827"
+SRCREV_machine ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
+SRCREV_meta ?= "f7bff5bff6ef6ceadfb4661a6ef3ed1f95bd6b2b"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
new file mode 100644
index 000000000000..815c92b93ae7
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -0,0 +1,48 @@
+KBRANCH ?= "v4.19/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v4.19/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v4.19/standard/qemuarm64"
+KBRANCH_qemumips ?= "v4.19/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v4.19/standard/qemuppc"
+KBRANCH_qemux86  ?= "v4.19/standard/base"
+KBRANCH_qemux86-64 ?= "v4.19/standard/base"
+KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "a14b08c3446dfab88ff97d84a9ba70db11287290"
+SRCREV_machine_qemuarm64 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
+SRCREV_machine_qemumips ?= "69975293fac754567a3ebdd0aa914d461e218b70"
+SRCREV_machine_qemuppc ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
+SRCREV_machine_qemux86 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
+SRCREV_machine_qemux86-64 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
+SRCREV_machine_qemumips64 ?= "8c14832341502679afbfb370d48b977ecf363c82"
+SRCREV_machine ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
+SRCREV_meta ?= "f7bff5bff6ef6ceadfb4661a6ef3ed1f95bd6b2b"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LINUX_VERSION ?= "4.19.5"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
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


