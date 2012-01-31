Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5EJ-0003hm-6a
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:22:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282297"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:45 -0800
Message-Id: <4654109df90adc25a2c443d5c4302cb7cf7fc836.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/19] linux-yocto: add kernel 3.2.2 support
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
X-List-Received-Date: Tue, 31 Jan 2012 04:24:48 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Adding initial support for the linux 3.2 kernel.

Although the branching and naming has changed slightly, the same BSPs and
features exist in this tree as have existed in previous linux-yocto versions.

Notable features of this update are:

  - streamlined branch naming
  - configuration and functionality split in the standard kernel
  - creation of the 'tiny' kernel type branch
  - audited kernel configurations with optional features documented
    in the meta branch
  - feature and BSP refreshes
  - 3.2-rt support refresh
  - qemu ppc graphics support

Build and boot testing has been performed on all emulated targets
(sato and core).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |   37 ++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |   41 +++++++++++++++++++++++
 2 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
new file mode 100644
index 0000000..9b0c1bf
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -0,0 +1,37 @@
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
+KBRANCH = "standard/preempt-rt/base"
+KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
+
+LINUX_VERSION ?= "3.2.2"
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+SRCREV_machine ?= "415af017cf163c63d7b1e6e929e4a9c9baf5ba6d"
+SRCREV_machine_qemuppc ?= "38345c1e41b15c49308a9adbdde95167eeaa05fa"
+SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+
+# Omit broken machines from COMPATIBLE_MACHINE
+#   qemuppc hangs at boot
+#   qemumips panics at boot
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
+
+# Functionality flags
+KERNEL_FEATURES=features/netfilter
+KERNEL_FEATURES_append=" features/taskstats"
+KERNEL_FEATURES_append_qemux86=" cfg/sound"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+
+require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
new file mode 100644
index 0000000..a80924d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -0,0 +1,41 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+KMACHINE = "common-pc"
+KMACHINE_qemux86  = "common-pc"
+KMACHINE_qemux86-64  = "common-pc-64"
+KMACHINE_qemuppc  = "qemu-ppc32"
+KMACHINE_qemumips = "mti-malta32-be"
+KMACHINE_qemuarm  = "arm-versatile-926ejs"
+
+KBRANCH = "standard/default/base"
+KBRANCH_qemux86  = "standard/default/common-pc/base"
+KBRANCH_qemux86-64  = "standard/default/common-pc-64/base"
+KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
+KBRANCH_qemumips = "standard/default/mti-malta32-be"
+KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
+
+LINUX_VERSION ?= "3.2.2"
+
+SRCREV_machine_qemuarm ?= "8d79190c307c7d41580beb77f83526ae3defcacc"
+SRCREV_machine_qemumips ?= "c88f8c4f3be717be33a8ad89a14731eb94932336"
+SRCREV_machine_qemuppc ?= "b8228f337002ad88f1e152d0c0c46c6035cd0428"
+SRCREV_machine_qemux86 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
+SRCREV_machine_qemux86-64 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
+SRCREV_machine ?= "417fc778a86e81303bab5883b919ee422ec51c04"
+SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+
+# Functionality flags
+KERNEL_FEATURES="features/netfilter"
+KERNEL_FEATURES_append=" features/taskstats"
+KERNEL_FEATURES_append_qemux86=" cfg/sound"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+
+require linux-tools.inc
-- 
1.7.6.5



