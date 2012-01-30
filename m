Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RrxYL-00017K-Br
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:10:13 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0UK2DFv017744;
	Mon, 30 Jan 2012 12:02:15 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 30 Jan 2012 15:02:11 -0500
Message-Id: <525881af94a4a14a38d21d589e72dfc1acdd096e.1327952323.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: add kernel 3.2.2 support
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
X-List-Received-Date: Mon, 30 Jan 2012 20:10:13 -0000

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
1.7.4.1



