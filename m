Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QreR6-0005VL-JR
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:13:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37688730"
Received: from unknown (HELO localhost) ([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: bruce.ashfield@windriver.com, tom.zanussi@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 16:08:17 -0700
Message-Id: <21924dcdc775dde5b7144cf26367663dbc0cfaeb.1313092152.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
Subject: [PATCH 04/10] meta-rt: add linux-yocto-rt_3.0 recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 23:13:12 -0000

Add the initial linux-yocto-rt_3.0 recipe.

TODO: replace the AUTOREV with real commit ids.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb |   55 ++++++++++++++++++++
 1 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb

diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
new file mode 100644
index 0000000..7eaeb0f
--- /dev/null
+++ b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -0,0 +1,55 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+KMACHINE = "yocto/standard/preempt-rt/base"
+KMACHINE_qemux86  = "common-pc"
+KMACHINE_qemux86-64  = "common-pc-64"
+KMACHINE_qemuarm  = "arm-versatile-926ejs"
+# qemuppc hangs at boot
+#KMACHINE_qemuppc  = "qemu-ppc32"
+# qemumips panics at boot
+#KMACHINE_qemumips = "mti-malta32-be"
+
+KBRANCH = ${KMACHINE}
+KBRANCH_qemux86 = "yocto/standard/preempt-rt/base"
+KBRANCH_qemux86-64 = "yocto/standard/preempt-rt/base"
+KBRANCH_qemuarm  = "yocto/standard/preempt-rt/base"
+#KBRANCH_qemuppc  = "yocto/standard/preempt-rt/base"
+#KBRANCH_qemumips = "yocto/standard/preempt-rt/base"
+KMETA = meta
+
+LINUX_VERSION ?= "3.0"
+LINUX_KERNEL_TYPE = "preempt-rt"
+LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
+
+SRCREV_machine_qemux86 = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+SRCREV_machine_qemux86-64 = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+SRCREV_machine_qemuarm = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+#SRCREV_machine_qemuppc = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+#SRCREV_machine_qemumips = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+SRCREV_machine = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+SRCREV_FORMAT = "meta_machine"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
+
+# Functionality flags
+KERNEL_REVISION_CHECKING ?= "t"
+KERNEL_FEATURES=features/netfilter
+KERNEL_FEATURES_append=" features/taskstats"
+KERNEL_FEATURES_append_qemux86=" cfg/sound"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+
+YOCTO_KERNEL_META_DATA=t
+
+# extra tasks
+addtask kernel_link_vmlinux after do_compile before do_install
+addtask validate_branches before do_patch after do_kernel_checkout
+addtask kernel_configcheck after do_configure before do_compile
+
+require recipes-kernel/linux/linux-tools.inc
-- 
1.7.6



