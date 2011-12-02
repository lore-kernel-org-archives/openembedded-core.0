Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8s-0002b4-9V
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189779"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:44 -0800
Message-Id: <7d1cd6b59d217077ac77266fb691ede167e8ef3a.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/18] linux-yocto: remove 2.6.34 recipes
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:42 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

To limit the number of active recipes in master to 3 (v2.6.37, v3.0 and
-dev), the 2.6.34 recipe can now be removed. It is available in the
previous release branches and will continue to work, but won't be
updated as part of ongoing dev efforts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb |   38 ---------------
 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb    |   49 --------------------
 2 files changed, 0 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb b/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
deleted file mode 100644
index 2642325..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-inherit kernel
-require recipes-kernel/linux/linux-yocto.inc
-
-KMACHINE = "common-pc"
-KMACHINE_qemux86  = "common_pc"
-KMACHINE_qemux86-64  = "common_pc_64"
-
-LINUX_VERSION ?= "2.6.34"
-LINUX_KERNEL_TYPE = "preempt_rt"
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
-
-KMETA = wrs_meta
-KBRANCH = ${KMACHINE}-${LINUX_KERNEL_TYPE}
-
-SRCREV_machine_qemux86 = "439602eb6acd53d9beb8493710310214fc7bd749"
-SRCREV_machine_qemux86-64 = "3c84c45ad3c3592f9c7ff4076de9bee417cd322e"
-SRCREV_machine = "439602eb6acd53d9beb8493710310214fc7bd749"
-SRCREV_meta = "e1f85a470934a0cf6abde5d95533e74501822c6b"
-
-PR = "r3"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
-
-# this performs a fixup on the SRCREV for new/undefined BSPs
-python __anonymous () {
-    import bb, re, string
-
-    kerntype = string.replace(bb.data.expand("${LINUX_KERNEL_TYPE}", d), "_", "-")
-    d.setVar("LINUX_KERNEL_TYPE_EXTENSION", kerntype)
-}
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.34.git;protocol=git;nocheckout=1;branch=${KBRANCH},wrs_meta;name=machine,meta"
-
-# Functionality flags
-KERNEL_FEATURES=features/netfilter
-
-require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
deleted file mode 100644
index cbcfa56..0000000
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-inherit kernel
-require linux-yocto.inc
-
-KMACHINE = "common_pc"
-KMACHINE_qemux86  = "common_pc"
-KMACHINE_qemux86-64  = "common_pc_64"
-KMACHINE_qemuppc  = "qemu_ppc32"
-KMACHINE_qemumips = "mti_malta32_be"
-KMACHINE_qemuarm  = "arm_versatile_926ejs"
-
-LINUX_VERSION ?= "2.6.34"
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
-
-KMETA = wrs_meta
-KBRANCH = ${KMACHINE}-${LINUX_KERNEL_TYPE_EXTENSION}
-
-SRCREV_machine_qemuarm = "a2fb081b44d6368eff8d28e2fdb991c61b1f428e"
-SRCREV_machine_qemumips = "c32d40f960e3c89d07f079bec4c96dcbfc749f0b"
-SRCREV_machine_qemuppc = "96d6bc31d3caaf62a966255479cc5cee0e76b1e9"
-SRCREV_machine_qemux86 = "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine_qemux86-64 = "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine = "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_meta = "ec26387cb168e9e0976999b528b5a9dd62e3157a"
-
-PR = "r2"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-SRCREV_FORMAT = "meta_machine"
-
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
-
-# this performs a fixup on historical kernel types with embedded _'s
-python __anonymous () {
-    import bb, re, string
-
-    kerntype = string.replace(bb.data.expand("${LINUX_KERNEL_TYPE}", d), "_", "-")
-    d.setVar("LINUX_KERNEL_TYPE_EXTENSION", kerntype)
-}
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.34.git;protocol=git;nocheckout=1;branch=${KBRANCH},wrs_meta;name=machine,meta"
-
-# Functionality flags
-KERNEL_REVISION_CHECKING ?= "t"
-KERNEL_FEATURES=features/netfilter
-
-# extra tasks
-addtask kernel_link_vmlinux after do_compile before do_install
-addtask validate_branches before do_patch after do_kernel_checkout
-
-require linux-tools.inc
-- 
1.7.6.4



