Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9256BB3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 20:26:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2013 13:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,856,1371106800"; d="scan'208";a="399572794"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga002.jf.intel.com with ESMTP; 06 Sep 2013 13:26:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Fri,  6 Sep 2013 13:30:28 -0700
Message-Id: <6fbcf0525455de69c3ca8eab73a36fbaa0305cf8.1378498892.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e5bd7a223ff269bbd33766b5e6bd866cc2fa4dbb.1378498892.git.dvhart@linux.intel.com>
References: <e5bd7a223ff269bbd33766b5e6bd866cc2fa4dbb.1378498892.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1378498892.git.dvhart@linux.intel.com>
References: <cover.1378498892.git.dvhart@linux.intel.com>
Cc: yunguo.wei@windriver.com, Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/2] genericx86: Create a genericx86-common.inc base for the x86 BSPs
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
X-List-Received-Date: Fri, 06 Sep 2013 20:26:20 -0000

The genericx86 and genericx86-64 machines share a great deal in common
in terms of machine features, required packages, etc. Use a common
include file to simplify changes to both machine definitions and avoid
accidental omissions.

Replace the hard-coded XSERVER assignment with the XSERVER_IA32*
defines from ia32-base.inc.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: yunguo.wei@windriver.com
---
Changes since v1:
* Remove mga from XSERVER
* Remove duplication with ia32-base.inc
---
 meta-yocto-bsp/conf/machine/genericx86-64.conf     |   29 +-----------------
 meta-yocto-bsp/conf/machine/genericx86.conf        |   31 +-------------------
 .../conf/machine/include/genericx86-common.inc     |   20 +++++++++++++
 3 files changed, 22 insertions(+), 58 deletions(-)
 create mode 100644 meta-yocto-bsp/conf/machine/include/genericx86-common.inc

diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
index 7825bae..56e9bb6 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -4,31 +4,4 @@
 #@DESCRIPTION: Machine configuration for generic X86_64 (64-bit) PCs and servers. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
 
 include conf/machine/include/tune-x86_64.inc
-
-MACHINE_FEATURES = "screen keyboard pci usbhost ext2 ext3 x86 wifi acpi alsa efi pcbios"
-
-KERNEL_IMAGETYPE = "bzImage"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "3.10%"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-XSERVER ?= "xserver-xorg \
-           xserver-xorg-extension-glx \
-           xf86-input-mouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
-           xf86-input-synaptics \
-           xf86-video-fbdev \
-           xf86-video-modesetting \
-           xf86-video-vesa \
-           xf86-video-intel \
-           mesa-driver-i915 \
-           mesa-driver-i965"
-
-MACHINE_EXTRA_RRECOMMENDS = "kernel-modules eee-acpi-scripts linux-firmware v86d"
-
-IMAGE_FSTYPES ?= "ext3 cpio.gz live"
-
-GLIBC_ADDONS = "nptl"
-
-EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
+include conf/machine/include/genericx86-common.inc
diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
index ff5cbc9..9d29f62 100644
--- a/meta-yocto-bsp/conf/machine/genericx86.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86.conf
@@ -4,33 +4,4 @@
 #@DESCRIPTION: Machine configuration for generic X86 (32-bit) PCs. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
 
 include conf/machine/include/tune-atom.inc
-
-MACHINE_FEATURES = "screen keyboard pci usbhost ext2 ext3 x86 wifi acpi alsa"
-
-KERNEL_IMAGETYPE = "bzImage"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "3.10%"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-XSERVER ?= "xserver-xorg \
-           xserver-xorg-extension-glx \
-           xf86-input-mouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
-           xf86-input-synaptics \
-           xf86-video-fbdev \
-           xf86-video-modesetting \
-           xf86-video-vesa \
-           xf86-video-intel \
-           mesa-driver-i915 \
-           mesa-driver-i965"
-
-#MACHINE_EXTRA_RDEPENDS = "rt2860"
-
-MACHINE_EXTRA_RRECOMMENDS = "kernel-modules eee-acpi-scripts linux-firmware v86d"
-
-IMAGE_FSTYPES ?= "ext3 cpio.gz live"
-
-GLIBC_ADDONS = "nptl"
-
-EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
+include conf/machine/include/genericx86-common.inc
diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
new file mode 100644
index 0000000..67a880f
--- /dev/null
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -0,0 +1,20 @@
+include conf/machine/include/ia32-base.inc
+MACHINE_FEATURES += "wifi efi pcbios"
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "3.10%"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+XSERVER ?= "${XSERVER_IA32_BASE} \
+            ${XSERVER_IA32_EXT} \
+            ${XSERVER_IA32_I915} \
+            ${XSERVER_IA32_I965} \
+            ${XSERVER_IA32_FBDEV} \
+            ${XSERVER_IA32_VESA} \
+            ${XSERVER_IA32_MODESETTING} \
+           "
+
+MACHINE_EXTRA_RRECOMMENDS += "linux-firmware v86d"
+
+GLIBC_ADDONS = "nptl"
+
+EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
-- 
1.7.9.5


