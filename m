Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVK-0001SZ-Qi
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="744876603"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:26:23 -0700
Message-Id: <a512af11039d59210f0cc3f50d5846682ca038d7.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 14:10:12 -0400
Date: Mon, 09 May 2011 22:26:22 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 19/30] linux-yocto: remove non-core (qemu) machine compatibility
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
X-List-Received-Date: Tue, 10 May 2011 05:29:10 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The machine configuration of the non-core (non-qemu) machines
exists in other layers. Moving the branch mappings, compatibility
and SRCREVs of these machines out of the main linux-yocto recipe
is the first step in that move.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 .../recipes-kernel/linux/linux-yocto-stable_git.bb |   10 +---------
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   11 +----------
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
index 93b06fd..66991ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
@@ -7,10 +7,6 @@ KMACHINE_qemux86-64  = "common_pc_64"
 KMACHINE_qemuppc  = "qemu_ppc32"
 KMACHINE_qemumips = "mti_malta32_be"
 KMACHINE_qemuarm  = "arm_versatile_926ejs"
-KMACHINE_atom-pc  = "atom-pc"
-KMACHINE_routerstationpro = "routerstationpro"
-KMACHINE_mpc8315e-rdb = "fsl-mpc8315e-rdb"
-KMACHINE_beagleboard = "beagleboard"
 
 LINUX_VERSION ?= "2.6.34"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
@@ -23,10 +19,6 @@ SRCREV_machine_qemumips = "c32d40f960e3c89d07f079bec4c96dcbfc749f0b"
 SRCREV_machine_qemuppc = "96d6bc31d3caaf62a966255479cc5cee0e76b1e9"
 SRCREV_machine_qemux86 = "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_machine_qemux86-64 = "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine_atom-pc = "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine_routerstationpro = "49745cd45c92a89e70c6e2334caa80818c134562"
-SRCREV_machine_mpc8315e-rdb = "a1c0ed6bf4060c10874b2a8547d81b3169dcf16a"
-SRCREV_machine_beagleboard = "ef7f944e773950d4016b7643f9ecf052bbe250cd"
 SRCREV_machine = "72ca49ab08b8eb475cec82a10049503602325791"
 SRCREV_meta = "ec26387cb168e9e0976999b528b5a9dd62e3157a"
 
@@ -34,7 +26,7 @@ PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|atom-pc|routerstationpro|mpc8315e-rdb|beagleboard)"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # this performs a fixup on historical kernel types with embedded _'s
 python __anonymous () {
diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 3b4e77e..d4f2ece 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -7,10 +7,6 @@ KMACHINE_qemux86-64  = "yocto/standard/common-pc-64/base"
 KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
 KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
 KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
-KMACHINE_atom-pc  = "yocto/standard/common-pc/atom-pc"
-KMACHINE_routerstationpro = "yocto/standard/routerstationpro"
-KMACHINE_mpc8315e-rdb = "yocto/standard/fsl-mpc8315e-rdb"
-KMACHINE_beagleboard = "yocto/standard/beagleboard"
 
 KBRANCH = ${KMACHINE}
 KMETA = meta
@@ -23,11 +19,6 @@ SRCREV_machine_qemumips = "f5d26f2eda2be8b942172cda8f27de33ebf38ec3"
 SRCREV_machine_qemuppc = "7eb6c68d977d9039a2b5a734172b064a9d19cdc1"
 SRCREV_machine_qemux86 = "ad62d1aab734513cd96c8f4517f816420a218e77"
 SRCREV_machine_qemux86-64 = "b906f358fd404a1e74a961f25079274e0d933ee1"
-SRCREV_machine_emenlow = "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
-SRCREV_machine_atom-pc = "b906f358fd404a1e74a961f25079274e0d933ee1"
-SRCREV_machine_routerstationpro = "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
-SRCREV_machine_mpc8315e-rdb = "53c800c244e73d81d2832f6da306eeae3b09e5dc"
-SRCREV_machine_beagleboard = "b906f358fd404a1e74a961f25079274e0d933ee1"
 SRCREV_machine = "b906f358fd404a1e74a961f25079274e0d933ee1"
 SRCREV_meta = "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
 
@@ -37,7 +28,7 @@ SRCREV_FORMAT = "meta_machine"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|mpc8315e-rdb|routerstationpro|beagleboard)"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags
 KERNEL_REVISION_CHECKING ?= "t"
-- 
1.7.1.1



