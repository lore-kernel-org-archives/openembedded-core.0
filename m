Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TKHZV-0007pD-1C
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 01:44:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Oct 2012 16:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="221341968"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2012 16:31:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 16:31:36 -0700
Message-Id: <8f24cb81f8c517c1f0b2336d027f5e31a4614670.1349479383.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1349479383.git.dvhart@linux.intel.com>
References: <cover.1349479383.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1349479383.git.dvhart@linux.intel.com>
References: <cover.1349479383.git.dvhart@linux.intel.com>
Subject: [PATCH 1/2] linux-yocto-tiny: Add tiny recipe for the 3.4 linux-yocto kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 23:44:45 -0000

This recipe builds the "tiny" kernel type defined by the linux-yocto
meta-data. Support is defined for the qemux86 machine via
common-pc-tiny.scc in the linux-yocto meta branch. The resulting
kernel is 1.8 MB and boots to a serial console with with qemux86 and
core-image-minimal using the following command:

qemu -kernel tmp/deploy/images/bzImage-qemux86.bin -initrd tmp/deploy/images/core-image-minimal-qemux86.cpio.gz -append "root=/dev/ram0 console=ttyS0" -nographic

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |   26 +++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
new file mode 100644
index 0000000..ce9a12f
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -0,0 +1,26 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+# We need lzma (as CONFIG_KERNEL_LZMA=y)
+DEPENDS += "xz-native"
+
+KBRANCH_DEFAULT = "standard/tiny/base"
+KBRANCH = "${KBRANCH_DEFAULT}"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+LINUX_VERSION ?= "3.4.11"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_meta ?= "5bdc655034a58a7147176a8a882d81e2fd51e4b9"
+
+PR = "${INC_PR}.2"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
-- 
1.7.5.4



