Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47CF5761A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 15:21:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6LFLCwM010239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jul 2015 08:21:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 21 Jul 2015 08:21:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jul 2015 11:21:07 -0400
Message-ID: <a888ca8e0a3739cc603c0d286076ad926a88bacc.1437491325.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1437491325.git.bruce.ashfield@windriver.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto: introduce 4.1 versioned recipes
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
X-List-Received-Date: Tue, 21 Jul 2015 15:21:13 -0000
Content-Type: text/plain

Updating the linux-yocto kernel recipes to include a named/versioned 4.1
recipe. This will be the LTSI kernel, and the 3.14 and 3.19 kernels will
be removed in subsequent commites (once reference boards have transitioned).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 26 ++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 23 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 41 +++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.1.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
new file mode 100644
index 000000000000..1cefff871440
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -0,0 +1,26 @@
+KBRANCH ?= "standard/preempt-rt"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine ?= "fe1ee443489d4ab5ce04c903b0362ae565547bd1"
+SRCREV_meta ?= "45393dd54f5ad77d43014c407c2b3520da42f427"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.1.2"
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
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
new file mode 100644
index 000000000000..38167cc2e85e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -0,0 +1,23 @@
+KBRANCH ?= "standard/tiny/base"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "4.1.2"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
+SRCREV_meta ?= "45393dd54f5ad77d43014c407c2b3520da42f427"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
new file mode 100644
index 000000000000..a7a52cb62762
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -0,0 +1,41 @@
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
+SRCREV_machine_qemuarm ?= "c4df99c91fc947afb7010a11eceeef0e05bf964f"
+SRCREV_machine_qemuarm64 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
+SRCREV_machine_qemumips ?= "6a24f7e60b9b2ecc1579f5f767be5845086533e1"
+SRCREV_machine_qemuppc ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
+SRCREV_machine_qemux86 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
+SRCREV_machine_qemux86-64 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
+SRCREV_machine_qemumips64 ?= "5c2b3697082a4ec6641aa5a8eca3974ca609cecf"
+SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
+SRCREV_meta ?= "45393dd54f5ad77d43014c407c2b3520da42f427"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.1.2"
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
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.1.0


