Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QreR0-0005VE-V0
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:13:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37688724"
Received: from unknown (HELO localhost) ([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 16:08:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: bruce.ashfield@windriver.com, tom.zanussi@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 16:08:14 -0700
Message-Id: <cb482c67ae6481427ba41c227629de7b42910397.1313092152.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
Subject: [PATCH 01/10] meta-rt: refresh linux-yocto-rt recipe
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

Rename the recipe to match the linux-yocto recipe renames using the kernel
version in the PV portion of the filename.

Add the SRCREVs to the recipe as was done with the core linux-yocto recipes.

Add qemux86 as it is also present in the linux-yocto-2.6.34.git repository.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta-rt/conf/layer.conf                            |    6 ------
 ...to-rt_stablegit.bb => linux-yocto-rt_2.6.34.bb} |   12 +++++++++---
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-rt/recipes-kernel/{linux-yocto-rt_stablegit.bb => linux-yocto-rt_2.6.34.bb} (65%)

diff --git a/meta-rt/conf/layer.conf b/meta-rt/conf/layer.conf
index 94ebc02..f105405 100644
--- a/meta-rt/conf/layer.conf
+++ b/meta-rt/conf/layer.conf
@@ -15,9 +15,3 @@ BBFILE_PRIORITY_rt = "8"
 # specified kernel providers and leave it up to the kernel recipe to 
 # determine COMPATIBLE_MACHINE.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
-
-# preempt_rt SRCREVs, one for meta, one per machine
-SRCREV_meta_pn-linux-yocto-rt ?= "b0615811ce38836d1ade230e3bdb1efaaa68471f"
-SRCREV_machine_pn-linux-yocto-rt_qemux86-64 ?= "f49444f06875894389e640bcda6c3f6ceb1f0c3e"
-SRCREV_machine_pn-linux-yocto-rt_atom-pc ?= "78dacaf8222c9492ba17f652989ef3466423bdc2"
-
diff --git a/meta-rt/recipes-kernel/linux-yocto-rt_stablegit.bb b/meta-rt/recipes-kernel/linux-yocto-rt_2.6.34.bb
similarity index 65%
rename from meta-rt/recipes-kernel/linux-yocto-rt_stablegit.bb
rename to meta-rt/recipes-kernel/linux-yocto-rt_2.6.34.bb
index cba1321..01a6761 100644
--- a/meta-rt/recipes-kernel/linux-yocto-rt_stablegit.bb
+++ b/meta-rt/recipes-kernel/linux-yocto-rt_2.6.34.bb
@@ -1,6 +1,7 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
+KMACHINE_qemux86  = "common_pc"
 KMACHINE_qemux86-64  = "common_pc_64"
 KMACHINE_atom-pc  = "atom-pc"
 
@@ -11,11 +12,16 @@ LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
 KMETA = wrs_meta
 KBRANCH = ${KMACHINE}-${LINUX_KERNEL_TYPE}
 
-PR = "r1"
+SRCREV_machine_qemux86 = "439602eb6acd53d9beb8493710310214fc7bd749"
+SRCREV_machine_qemux86-64 = "3c84c45ad3c3592f9c7ff4076de9bee417cd322e"
+SRCREV_machine_atom-pc = "269d71029adcf4d1dbf8441f091d824478d8c87d"
+SRCREV_meta = "e1f85a470934a0cf6abde5d95533e74501822c6b"
+
+PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-COMPATIBLE_MACHINE = "(qemux86-64|atom-pc)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|atom-pc)"
 
 # this performs a fixup on the SRCREV for new/undefined BSPs
 python __anonymous () {
@@ -25,7 +31,7 @@ python __anonymous () {
     bb.data.setVar("LINUX_KERNEL_TYPE_EXTENSION", kerntype, d)
 }
 
-SRC_URI = "git://git.yoctoproject.org/linux-2.6-windriver.git;protocol=git;nocheckout=1;branch=${KBRANCH},wrs_meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.34.git;protocol=git;nocheckout=1;branch=${KBRANCH},wrs_meta;name=machine,meta"
 
 # Functionality flags
 KERNEL_REVISION_CHECKING ?= "t"
-- 
1.7.6



