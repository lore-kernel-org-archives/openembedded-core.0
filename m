Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3457306A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:10:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1R3A92U008343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Feb 2017 19:10:09 -0800 (PST)
Received: from yow-dellw-nn.wrs.com (128.224.56.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 26 Feb 2017 19:10:07 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 26 Feb 2017 22:10:02 -0500
Message-ID: <0988923aa78c2b42da736fea3b7aec83310bb43b.1488164498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1488164498.git.bruce.ashfield@windriver.com>
References: <cover.1488164498.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/4] linux-yocto: introduce 4.10 recipes
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
X-List-Received-Date: Mon, 27 Feb 2017 03:10:12 -0000
Content-Type: text/plain

The 4.10 kernel has been released, so we introduce the linux-yocto
variant.

This version supercedes the 4.4 and 4.8 versions in the tree, leaving us
with 4.1 (LTSI), 4.9 (LTS) and 4.10 (most recent) as the three active
versions.

Build tested against all qemu variants, core-image-kernel-dev + sato,
with musl and glibc as the C libraries.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 38 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 44 ++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.10.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
new file mode 100644
index 000000000000..150fda5473aa
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
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
+SRCREV_machine ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_meta ?= "805ea440c791acee4617820ab32e93f1ccbd9ae2"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.10"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
new file mode 100644
index 000000000000..4d4639a97f3d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -0,0 +1,25 @@
+KBRANCH ?= "standard/tiny/common-pc"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.10"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_meta ?= "805ea440c791acee4617820ab32e93f1ccbd9ae2"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "(qemux86$)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
new file mode 100644
index 000000000000..db6fa7eca5a2
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
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
+SRCREV_machine_qemuarm ?= "371697c9008e2f26edba9b4a3baaf327a530fb7f"
+SRCREV_machine_qemuarm64 ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_machine_qemumips ?= "ea0bdf9b515d2ceafaf333564594ca1bfbc0e50a"
+SRCREV_machine_qemuppc ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_machine_qemux86 ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_machine_qemux86-64 ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_machine_qemumips64 ?= "d5434bd8cfdbefbe4dcde9743e61383ce8a944c9"
+SRCREV_machine ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
+SRCREV_meta ?= "805ea440c791acee4617820ab32e93f1ccbd9ae2"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.10"
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


