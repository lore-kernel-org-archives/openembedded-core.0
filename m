Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O0-0008Qv-AI
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103308"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:40:00 -0700
Message-Id: <9cd816e59dbb4bfa56be09ac422cfce9f9095808.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 16/23] meta-skeleton: add linux-yocto-custom reference recipe
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:57 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Adding a skeleton/refrence recipe for using a subset of the yocto
kernel tools against kernel git repositories.

Sample/reference configuration fragments, features and a patch are
provided and documented in the recipe.

From the recipe itself:

   Provides an example/minimal kernel recipe that uses the linux-yocto
   and oe-core kernel classes to apply a subset of yocto kernel
   management to git managed kernel repositories.

 Notes:

   kconfig(s): the kernel must be configured with a defconfig, or via
               configuration fragment(s). Either of these can be added
               via bbappend.
   patches: patches can be merged into to the source git tree itself, added
            using standard bbappend syntax or controlled via .scc feature
            descriptions (also via bbappends)

   example configuration addition:
            SRC_URI += "file://smp.cfg"
   example patch addition (for kernel v3.4 only):
            SRC_URI += "file://0001-linux-version-tweak.patch
   example feature addition (for kernel v3.4 only):
            SRC_URI += "file://feature.scc"

 Warning:

   Building the sample kernel tree (kernel.org) without providing any
   configuration will result in build or boot errors. This is not a bug
   it is a required element for creating a valid kernel.

[YOCTO #2397]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../recipes-kernel/linux/linux-yocto-custom.bb     |   46 ++++++++++++++++++++
 .../0001-linux-version-tweak.patch                 |   26 +++++++++++
 .../linux/linux-yocto-custom/feature.scc           |    1 +
 .../linux/linux-yocto-custom/smp.cfg               |    1 +
 4 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc
 create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
new file mode 100644
index 0000000..1438ad8
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -0,0 +1,46 @@
+# linux-yocto-custom.bb:
+#
+#   Provides an example/minimal kernel recipe that uses the linux-yocto
+#   and oe-core kernel classes to apply a subset of yocto kernel 
+#   management to git managed kernel repositories.
+#
+# Notes:
+#
+#   kconfig(s): the kernel must be configured with a defconfig, or via
+#               configuration fragment(s). Either of these can be added
+#               via bbappend.
+#   patches: patches can be merged into to the source git tree itself, added
+#            using standard bbappend syntax or controlled via .scc feature 
+#            descriptions (also via bbappends)
+#   
+#   example configuration addition:
+#            SRC_URI += "file://smp.cfg"
+#   example patch addition (for kernel v3.4 only):
+#            SRC_URI += "file://0001-linux-version-tweak.patch
+#   example feature addition (for kernel v3.4 only):
+#            SRC_URI += "file://feature.scc"
+#
+# Warning:
+#
+#   Building the sample kernel tree (kernel.org) without providing any
+#   configuration will result in build or boot errors. This is not a bug
+#   it is a required element for creating a valid kernel.
+#    
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1"
+
+LINUX_VERSION ?= "3.4"
+LINUX_VERSION_EXTENSION ?= "-custom"
+
+# tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
+SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+
+require recipes-kernel/linux/linux-tools.inc
diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
new file mode 100644
index 0000000..c9562da
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
@@ -0,0 +1,26 @@
+From 5a55943a6bbb10a79994a0b18071b2427dffb15f Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Mon, 11 Jun 2012 15:31:42 -0400
+Subject: [PATCH] linux: version tweak
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a687963..f5b1ac3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,7 +2,7 @@ VERSION = 3
+ PATCHLEVEL = 4
+ SUBLEVEL = 0
+ EXTRAVERSION =
+-NAME = Saber-toothed Squirrel
++NAME = Saber-toothed Squirrel-custom
+ 
+ # *DOCUMENTATION*
+ # To see a list of typical targets execute "make help"
+-- 
+1.7.5.4
+
diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc
new file mode 100644
index 0000000..aad5af4
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc
@@ -0,0 +1 @@
+patch 0001-linux-version-tweak.patch
diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg
new file mode 100644
index 0000000..0c26a86
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg
@@ -0,0 +1 @@
+# CONFIG_SMP is not set
-- 
1.7.7.6



