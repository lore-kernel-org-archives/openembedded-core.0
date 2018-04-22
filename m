Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 26F626079F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:08:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Apr 2018 01:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,311,1520924400"; d="scan'208";a="45123144"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 22 Apr 2018 01:08:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id F03EB5800A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2018 01:08:35 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:09:26 +0300
Message-Id: <1524384566-30715-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] machine: make inclusion of kernel-modules consistent
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
X-List-Received-Date: Sun, 22 Apr 2018 08:08:36 -0000

Now, only qemumips and qemumips64 include kernel-modules.
Make it consistent across the machines to avoid confusion.

[YOCTO #12383]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/machine/qemuarm.conf    | 1 +
 meta/conf/machine/qemuarm64.conf  | 1 +
 meta/conf/machine/qemuppc.conf    | 1 +
 meta/conf/machine/qemux86-64.conf | 1 +
 meta/conf/machine/qemux86.conf    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 9403b1e..c323520 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -9,6 +9,7 @@ require conf/machine/include/tune-arm926ejs.inc
 KERNEL_IMAGETYPE = "zImage"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 242889a..9646fff 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -8,6 +8,7 @@ require conf/machine/include/qemu.inc
 KERNEL_IMAGETYPE = "Image"
 
 SERIAL_CONSOLES ?= "38400;ttyAMA0 38400;hvc0"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 537b2f6..1011d23 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -10,6 +10,7 @@ TARGET_CC_KERNEL_ARCH = "-mno-spe"
 KERNEL_IMAGETYPE = "vmlinux"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-ppc"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index fcc4459..64db9e4 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -15,6 +15,7 @@ require conf/machine/include/qemuboot-x86.inc
 KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index c53f7a9..ea43421 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -14,6 +14,7 @@ require conf/machine/include/qemuboot-x86.inc
 KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
 XSERVER = "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-- 
2.4.0


