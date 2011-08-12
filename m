Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma6-0004e0-2v
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809734"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:08 -0700
Message-Id: <93d543eb60687804f5d377a4cfbdca1d7d3009d7.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/25] meta-rt: add linux-yocto-rt_3.0 recipe
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:02 -0000

From: Darren Hart <dvhart@linux.intel.com>

Add the initial linux-yocto-rt_3.0 recipe.

qemumips and qemuppc doesn't work quite yet, so they have been omitted from
COMPATIBLE_MACHINE.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb

diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
new file mode 100644
index 0000000..c8a175d
--- /dev/null
+++ b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -0,0 +1,46 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+KMACHINE = "common-pc"
+KMACHINE_qemux86  = "common-pc"
+KMACHINE_qemux86-64  = "common-pc-64"
+KMACHINE_qemuarm  = "arm-versatile-926ejs"
+KMACHINE_qemuppc  = "qemu-ppc32"
+KMACHINE_qemumips = "mti-malta32-be"
+
+KBRANCH = "yocto/standard/preempt-rt/base"
+KMETA = meta
+
+LINUX_VERSION ?= "3.0"
+LINUX_KERNEL_TYPE = "preempt-rt"
+LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
+
+SRCREV_machine = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
+SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+SRCREV_FORMAT = "meta_machine"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+
+# Omit broken machines from COMPATIBLE_MACHINE
+#   qemuppc hangs at boot
+#   qemumips panics at boot
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
1.7.3.4



