Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC55D71A8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsWxL026301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:33 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:32 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:17 -0500
Message-ID: <a032b30d8e0024d4c85bffb0cb05817bde958f90.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/14] kernel: introduce linux-yocto v4.9 recipes
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:34 -0000
Content-Type: text/plain

Introducing the 4.9 kernel recipes. 4.9 will be a LTSI kernel, so we
introduce these recipes with the intent that they'll replace 4.1 as
the LTSI kernel, and other older kernels (i.e 4.4/4.8)  once 4.9
shown to be stable.

linux-yocto-tiny and linux-yocto-rt are also part of this commit, but
are placeholders while we wait for their content to be available. They
will build, but provide nothing above the standard kernel at the
moment.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 38 ++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 25 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 44 +++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.9.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
new file mode 100644
index 000000000000..2f1c6523147c
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
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
+SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_meta ?= "c56f2da94e4773ea25eebfd14200164ef21730a3"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.9"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
new file mode 100644
index 000000000000..62df631f3539
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -0,0 +1,25 @@
+KBRANCH ?= "standard/tiny/common-pc"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.9"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_meta ?= "c56f2da94e4773ea25eebfd14200164ef21730a3"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "(qemux86$)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
new file mode 100644
index 000000000000..d84400a323eb
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
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
+SRCREV_machine_qemuarm ?= "0fda844a4c8da3d987b8173128c2b14948133b2e"
+SRCREV_machine_qemuarm64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_machine_qemumips ?= "22f2f6de114cf1fc58e068d1aff220d633aeaddf"
+SRCREV_machine_qemuppc ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_machine_qemux86 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_machine_qemux86-64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_machine_qemumips64 ?= "3183d61d4d00d8b7faf10d11b3da8cf3db432e6f"
+SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
+SRCREV_meta ?= "c56f2da94e4773ea25eebfd14200164ef21730a3"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.9"
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


