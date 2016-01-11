Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F42F6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:58:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0BGwUQA004106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jan 2016 08:58:30 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Jan 2016 08:58:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Jan 2016 11:58:26 -0500
Message-ID: <f0a700ab1a298ba7f83fe0c525e600e3ae9dada3.1452531312.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1452531312.git.bruce.ashfield@windriver.com>
References: <cover.1452531312.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto: introduce v4.4 standard/preempt-rt/standard kernel
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
X-List-Received-Date: Mon, 11 Jan 2016 16:58:34 -0000
Content-Type: text/plain

The 4.4 kernel has been under test via linux-yocto-dev, and is the next
LTS/LTSI kernel.

So we take our -dev support and created a named/versioned recipe for use
in upcoming releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 27 +++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 23 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 42 +++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
new file mode 100644
index 000000000000..b7509bb58dfc
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -0,0 +1,27 @@
+KBRANCH ?= "standard/preempt-rt"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine ?= "86a9e1ab51b9acf71d9c2f39a9f02652886bd727"
+SRCREV_meta ?= "ad9d3f01300ba350563e17db00b2518302e172f6"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.4"
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
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
new file mode 100644
index 000000000000..d348c0a628f8
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -0,0 +1,23 @@
+KBRANCH ?= "standard/tiny/base"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.4"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
+SRCREV_meta ?= "ad9d3f01300ba350563e17db00b2518302e172f6"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
new file mode 100644
index 000000000000..a440cf7b26ce
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -0,0 +1,42 @@
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
+SRCREV_machine_qemuarm ?= "bcfc111e6c14b9f9d6ffa9d357651c0b4489835e"
+SRCREV_machine_qemuarm64 ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
+SRCREV_machine_qemumips ?= "9d9c37432e75eaeb2232e00cc3c2252440b709b3"
+SRCREV_machine_qemuppc ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
+SRCREV_machine_qemux86 ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
+SRCREV_machine_qemux86-64 ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
+SRCREV_machine_qemumips64 ?= "cb3a85329501f541ebfa08febb2f36edcbc6f253"
+SRCREV_machine ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
+SRCREV_meta ?= "ad9d3f01300ba350563e17db00b2518302e172f6"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.4"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
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
2.1.0


