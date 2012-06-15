Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SfZae-00070t-Ny
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 18:41:41 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5FGUw2x021628;
	Fri, 15 Jun 2012 09:30:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jun 2012 12:30:54 -0400
Message-Id: <4c678307c8188f4956acf66d047d213e4417d0bf.1339777686.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339777686.git.bruce.ashfield@windriver.com>
References: <cover.1339777686.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339777686.git.bruce.ashfield@windriver.com>
References: <cover.1339777686.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] meta-skeleton: add linux-yocto-custom reference recipe
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
X-List-Received-Date: Fri, 15 Jun 2012 16:41:41 -0000

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
1.7.5.4



