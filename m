Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SxRWa-0004Vo-9S
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 01:43:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2012 16:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="181376795"
Received: from unknown (HELO localhost) ([10.255.12.180])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2012 16:31:32 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 16:29:41 -0700
Message-Id: <c3edc1c41a90ba3917f41d8c6489bf049e19abe7.1344024266.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1344024266.git.dvhart@linux.intel.com>
References: <cover.1344024266.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 03 Aug 2012 23:43:20 -0000

There has been some confusion over proper use of the linux-yocto-custom
recipe. It is not intended to build as is from meta-skeleton. It should
be modified via a bbappend file to provide a Linux kernel config at the
very least.

Update the commentary to make this requirement more explicit. Add some
additional detail about how to create a bbappend file and how and when
to modify the various variables.

Clear COMPATIBLE_MACHINE so bitbake will not attempt to build the recipe
unless the user explicitly adds there machine to the variable, which
should encourage them to read the recipe comments before attempting to
build it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Bruce Ashfield <bruce.ashfield@windriver.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
---
 .../recipes-kernel/linux/linux-yocto-custom.bb     | 52 +++++++++++++++-------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 55f0c38..dd98228 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -1,17 +1,35 @@
 # linux-yocto-custom.bb:
 #
-#   Provides an example/minimal kernel recipe that uses the linux-yocto
-#   and oe-core kernel classes to apply a subset of yocto kernel 
-#   management to git managed kernel repositories.
+#   An example kernel recipe that uses the linux-yocto and oe-core
+#   kernel classes to apply a subset of yocto kernel management to git
+#   managed kernel repositories.
+#
+#   To use linux-yocto-custom in your layer, create a
+#   linux-yocto-custom.bb file containing at least the following lines:
+#
+#     FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+#     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
+#
+#   You must also provide a Linux kernel configuration. The most direct
+#   method is to copy your .config to files/defconfig in your layer,
+#   parallel to the linux-yocto-custom.bbappend file.
+#
+#   To use the yocto kernel tooling to generate a BSP configuration
+#   using modular configuration fragments, see the yocto-bsp and
+#   yocto-kernel tools documentation.
+#
+# Warning:
+#
+#   Building this example without providing a defconfig or BSP
+#   configuration will result in build or boot errors. This is not a
+#   bug.
+#
 #
 # Notes:
 #
-#   kconfig(s): the kernel must be configured with a defconfig, or via
-#               configuration fragment(s). Either of these can be added
-#               via bbappend.
-#   patches: patches can be merged into to the source git tree itself, added
-#            using standard bbappend syntax or controlled via .scc feature 
-#            descriptions (also via bbappends)
+#   patches: patches can be merged into to the source git tree itself,
+#            added via the SRC_URI, or controlled via a BSP
+#            configuration.
 #   
 #   example configuration addition:
 #            SRC_URI += "file://smp.cfg"
@@ -20,25 +38,25 @@
 #   example feature addition (for kernel v3.4 only):
 #            SRC_URI += "file://feature.scc"
 #
-# Warning:
-#
-#   Building the sample kernel tree (kernel.org) without providing any
-#   configuration will result in build or boot errors. This is not a bug
-#   it is a required element for creating a valid kernel.
-#    
 
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
+# Override SRC_URI in a bbappend file to point at a different source
+# tree if you do not want to build from Linus' tree.
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1"
 
 LINUX_VERSION ?= "3.4"
 LINUX_VERSION_EXTENSION ?= "-custom"
 
+# Override SRCREV to point to a different commit in a bbappend file to
+# build a different release of the Linux kernel.
 # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
 SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
 
-PR = "r0"
+PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+# Override COMPATIBLE_MACHINE to include your machine in a bbappend
+# file. Leaving it empty here ensures an early explicit build failure.
+COMPATIBLE_MACHINE = "(^$)"
-- 
1.7.11.2



