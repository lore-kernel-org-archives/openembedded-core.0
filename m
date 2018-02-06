Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DAC0678555
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w16GM3Mx003369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Feb 2018 08:22:04 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:21:59 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:53 -0500
Message-ID: <9c618956cda395a9c8fd101fba7f87af8dbd2304.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto: introduce 4.15 recipes
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

This commit makes the 4.15 kernel available for use with the
Yocto configuration fragments and qemu* BSPs.

It has been tested for x86,arm,mips and powerpc against the lsb, core*
and glibc/mulsc test matrix.

This will serve as the "latest" kernel in master, with others being
removed in subsequent commits.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 38 +++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 47 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 47 ++++++++++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.15.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
new file mode 100644
index 000000000000..31f8c23cef52
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -0,0 +1,38 @@
+KBRANCH ?= "v4.15/standard/preempt-rt/base"
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
+SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.15"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
new file mode 100644
index 000000000000..7a6696c71a68
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
@@ -0,0 +1,25 @@
+KBRANCH ?= "v4.15/standard/tiny/common-pc"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.15"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
+SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
new file mode 100644
index 000000000000..60b7e600d24d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -0,0 +1,47 @@
+KBRANCH ?= "v4.15/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
+KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
+KBRANCH_qemux86  ?= "v4.15/standard/base"
+KBRANCH_qemux86-64 ?= "v4.15/standard/base"
+KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
+SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
+SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
+SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.15"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
new file mode 100644
index 000000000000..60b7e600d24d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -0,0 +1,47 @@
+KBRANCH ?= "v4.15/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
+KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
+KBRANCH_qemux86  ?= "v4.15/standard/base"
+KBRANCH_qemux86-64 ?= "v4.15/standard/base"
+KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
+SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
+SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
+SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
+SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.15"
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


