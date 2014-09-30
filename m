Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFF556017E
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:39:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 30 Sep 2014 14:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,629,1406617200"; d="scan'208";a="611158250"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2014 14:39:45 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	ross.burton@intel.com, bruce.ashfield@windriver.com,
	dvhart@linux.intel.com, Openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 14:40:05 -0700
Message-Id: <9c2742ca226e51d4d369e9c761c270c8acbe7b2a.1412112668.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1412112668.git.nitin.a.kamble@intel.com>
References: <cover.1412112668.git.nitin.a.kamble@intel.com>
Subject: [Patch v2 1/1] kernel.bbclass: enable a link for external module building
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
X-List-Received-Date: Tue, 30 Sep 2014 21:39:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Even though the kernel-dev package provides the required support for
building external kernel modules on the target, some commonly used scripts
and utilities fail as they are not finding the kernel module build support
files at the desired location.

Create the /lib/modules/<kernel-version>/build link on target pointing to
the sources provided by the kernel-dev package, to fix the issue.

Fixes Bug:
[YOCTO #2968]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78b33ce..5ac4ff4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -213,6 +213,7 @@ kernel_do_install() {
 	#
 	kerneldir=${D}${KERNEL_SRC_PATH}
 	install -d $kerneldir
+	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
 
 	#
 	# Store the kernel version in sysroots for module-base.bbclass
@@ -346,7 +347,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-mod
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
-- 
1.8.1.4


