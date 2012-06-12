Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SeaBK-0000ga-Dr
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 01:07:26 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5CMujor010832;
	Tue, 12 Jun 2012 15:56:48 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 12 Jun 2012 18:56:25 -0400
Message-Id: <4ef1a66aa4949bec73eca78f3baaac97f7e69bd6.1339541557.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339541557.git.bruce.ashfield@windriver.com>
References: <cover.1339541557.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339541557.git.bruce.ashfield@windriver.com>
References: <cover.1339541557.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/3.4: create linux-yocto-rt recipe
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
X-List-Received-Date: Tue, 12 Jun 2012 23:07:26 -0000

Adding the 3.4 variant of the linux-yocto-rt recipe. This updates
to 3.4.1-rt9, and builds and boots on the supported targets.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |   32 +++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
new file mode 100644
index 0000000..81730ea
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -0,0 +1,32 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/preempt-rt/base"
+KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
+
+LINUX_VERSION ?= "3.4.1"
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "9dc5e97d144abb03deec411acb9c64883602cff9"
+SRCREV_machine_qemuppc ?= "241a41d6104df6916280f1273894bbd7fa7cdd71"
+SRCREV_meta ?= "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+# Omit broken machines from COMPATIBLE_MACHINE
+#   qemuppc hangs at boot
+#   qemumips panics at boot
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
+
+# Functionality flags
+KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/taskstats"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
+
+require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 9205901..af6130d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "4988a7e34bccd531b511c57f93358de9fcc672a0"
 SRCREV_machine_qemux86 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
 SRCREV_machine_qemux86-64 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
 SRCREV_machine ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
-SRCREV_meta ?= "978f876e4368cdd0ef781e74ea28a6771bf69b79"
+SRCREV_meta ?= "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



