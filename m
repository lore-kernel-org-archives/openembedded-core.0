Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RRRpE-0000Ff-M0
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 18:02:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2011 08:55:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="77331582"
Received: from unknown (HELO localhost) ([10.255.15.232])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2011 08:55:37 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 10:59:07 -0600
Message-Id: <8b14562502b9ccb4f72807a051e5b195ca31a25c.1321634793.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1321634793.git.tom.zanussi@intel.com>
References: <cover.1321634793.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Fri, 18 Nov 2011 17:02:04 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The meta-intel BSPs currently have a number of machine settings common
to all - factor these out into a common include file.

Also add several new intel-specific XSERVER variables for building
XSERVER variables in BSPs.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/machine/include/ia32-base.inc |   58 +++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/ia32-base.inc

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
new file mode 100644
index 0000000..5cf2f4f
--- /dev/null
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -0,0 +1,58 @@
+#
+# base machine settings for ia32-architecture BSPs
+#
+
+#
+# common settings for Intel-based machines
+#
+MACHINE_FEATURES += "kernel26 screen keyboard pci usbhost ext2 ext3 x86 \
+                     acpi serial usbgadget"
+
+MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "grub"
+
+IMAGE_FSTYPES += "ext3 cpio.gz live"
+
+KERNEL_IMAGETYPE ?= "bzImage"
+
+SERIAL_CONSOLE ?= "115200 ttyS0"
+
+#
+# glibc-related variables
+#
+GLIBC_ADDONS ?= "nptl"
+GLIBC_EXTRA_OECONF += "--with-tls"
+
+#
+# kernel-related variables
+#
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "3.0%"
+PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
+
+#
+# XSERVER subcomponents, used to build the XSERVER variable
+#
+XSERVER_IA32_BASE = "xserver-xorg \
+           xf86-input-mouse \
+           xf86-input-keyboard \
+           xf86-input-evdev \
+           xf86-input-synaptics \
+           mesa-dri \
+           "
+
+XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
+           xserver-xorg-extension-dri2 \
+           xserver-xorg-extension-glx \
+           xserver-xorg-extension-extmod \
+           xserver-xorg-extension-dbe \
+           xserver-xorg-module-libint10 \
+           "
+
+XSERVER_IA32_I915 = "xf86-video-intel \
+           mesa-dri-driver-i965 \
+           "
+
+XSERVER_IA32_EMGD = "emgd-driver-bin"
+
+XSERVER_IA32_VESA = "xf86-video-vesa"
-- 
1.7.0.4



