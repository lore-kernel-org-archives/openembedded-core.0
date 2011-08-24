Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QwKU0-0003IM-VG
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:55:33 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7OKoecE009007;
	Wed, 24 Aug 2011 13:50:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 24 Aug 2011 16:50:26 -0400
Message-Id: <c719a60cd75e9ec26249e6c282ba14d7c3d7dcdd.1314218754.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/4] linux-yocto-rt: update qemuppc support and streamline variables
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
X-List-Received-Date: Wed, 24 Aug 2011 20:55:33 -0000

Fixes [YOCTO #1391]
Fixes [YOCTO #1389]

qemuppc must have a dedicated branch for -rt support, since it has
board specific patches that are not suitable for a common location.
This fixes the boot by propagating some common fixes and by syncing
to the latest meta-configuration.

There are some variables that are now in linux-yocto.inc and need not
be defined by the kernel recipe itself, so we can safely remove them
with no impact on the build.

CC: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index c8a175d..61210de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -9,14 +9,14 @@ KMACHINE_qemuppc  = "qemu-ppc32"
 KMACHINE_qemumips = "mti-malta32-be"
 
 KBRANCH = "yocto/standard/preempt-rt/base"
-KMETA = meta
+KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
 LINUX_VERSION ?= "3.0"
 LINUX_KERNEL_TYPE = "preempt-rt"
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
-SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
+SRCREV_machine ?= "67ce0924042a2faa12b71ac3e92175c789c32af6"
+SRCREV_machine_qemuppc ?= "839638f4efda0c70c6f491161ab2c042f5bc3e66"
+SRCREV_meta ?= "13dbce30d6a647228bf5a9483a9b9c2da1514f78"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
@@ -30,14 +30,11 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckou
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_REVISION_CHECKING ?= "t"
 KERNEL_FEATURES=features/netfilter
 KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-YOCTO_KERNEL_META_DATA=t
-
 # extra tasks
 addtask kernel_link_vmlinux after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
-- 
1.7.4.1



