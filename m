Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PsW9c-0001bE-OT
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Feb 2011 09:02:28 +0100
Received: by wwe15 with SMTP id 15so260474wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Feb 2011 00:01:08 -0800 (PST)
Received: by 10.227.153.197 with SMTP id l5mr425415wbw.75.1298534467944;
	Thu, 24 Feb 2011 00:01:07 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x1sm1286232wbh.8.2011.02.24.00.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Feb 2011 00:01:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Feb 2011 09:01:05 +0100
Message-Id: <1298534465-21119-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] remove non-qemu machines
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 08:02:28 -0000

As per TSC decision OE-core will only have qemu machines. This leaves the conf/machine/include file intact

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/atom-pc.conf          |   44 -------------------------------
 meta/conf/machine/beagleboard.conf      |   37 --------------------------
 meta/conf/machine/mpc8315e-rdb.conf     |   20 --------------
 meta/conf/machine/routerstationpro.conf |   24 -----------------
 4 files changed, 0 insertions(+), 125 deletions(-)
 delete mode 100644 meta/conf/machine/atom-pc.conf
 delete mode 100644 meta/conf/machine/beagleboard.conf
 delete mode 100644 meta/conf/machine/mpc8315e-rdb.conf
 delete mode 100644 meta/conf/machine/routerstationpro.conf

diff --git a/meta/conf/machine/atom-pc.conf b/meta/conf/machine/atom-pc.conf
deleted file mode 100644
index 58c9b0d..0000000
--- a/meta/conf/machine/atom-pc.conf
+++ /dev/null
@@ -1,44 +0,0 @@
-#@TYPE: Machine
-#@NAME: Atom-PC
-
-#@DESCRIPTION: Machine configuration for Intel Atom based PCs. Currently supported machines are the Asus eee901, Acer Aspire One, Toshiba NB305, and Intel BlackSand development board.
-
-TARGET_ARCH = "i586"
-
-include conf/machine/include/tune-atom.inc
-
-MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost ext2 ext3 x86 wifi \
-                    acpi"
-
-KERNEL_IMAGETYPE = "bzImage"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-stable"
-#PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-PREFERRED_PROVIDER_virtual/libgl  ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
-XSERVER ?= "xserver-xf86-dri-lite \
-           xf86-input-mouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
-           xf86-input-synaptics \
-           xf86-video-intel \
-           mesa-dri-driver-i915"
-
-#MACHINE_EXTRA_RDEPENDS = "rt2860"
-
-MACHINE_EXTRA_RRECOMMENDS = "kernel-modules eee-acpi-scripts"
-
-GUI_MACHINE_CLASS = "bigscreen"
-
-IMAGE_ROOTFS_SIZE_ext3 = "500000"
-
-IMAGE_FSTYPES ?= "ext3 cpio.gz"
-
-APPEND += "usbcore.autosuspend=1"
-
-GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
-
-EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
diff --git a/meta/conf/machine/beagleboard.conf b/meta/conf/machine/beagleboard.conf
deleted file mode 100644
index 41351e7..0000000
--- a/meta/conf/machine/beagleboard.conf
+++ /dev/null
@@ -1,37 +0,0 @@
-#@TYPE: Machine
-#@NAME: Beagleboard machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/ board 
-TARGET_ARCH = "arm"
-
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-XSERVER = "xserver-kdrive-fbdev"
-
-# Only has DVI connector for external screen
-GUI_MACHINE_CLASS = "bigscreen"
-
-#Ship all kernel modules till the board support has matured enough
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-
-# Allow for MMC booting (required by the NAND-less Beagleboard XM)
-EXTRA_IMAGEDEPENDS += "u-boot x-load"
-
-#include conf/machine/include/tune-arm1136jf-s.inc
-include conf/machine/include/tune-cortexa8.inc
-
-IMAGE_FSTYPES += "tar.bz2 jffs2"
-EXTRA_IMAGECMD_jffs2 = "-lnp "
-
-# Guesswork
-SERIAL_CONSOLE = "115200 ttyO2"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
-
-KERNEL_IMAGETYPE = "uImage"
-
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
-
-
-# and sdio
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat alsa"
diff --git a/meta/conf/machine/mpc8315e-rdb.conf b/meta/conf/machine/mpc8315e-rdb.conf
deleted file mode 100644
index 578751c..0000000
--- a/meta/conf/machine/mpc8315e-rdb.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-#@TYPE: Machine
-#@DESCRIPTION: Machine configuration for running 
-
-TARGET_ARCH = "powerpc"
-TARGET_FPU = "spe"
-
-require conf/machine/include/tune-ppc603e.inc
-
-KERNEL_IMAGETYPE = "uImage"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_FEATURES = "kernel26 keyboard pci ext2 ext3 serial"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
-
-UBOOT_ENTRYPOINT = "0x00000000"
-
-KERNEL_DEVICETREE = "${S}/arch/powerpc/boot/dts/mpc8315erdb.dts"
diff --git a/meta/conf/machine/routerstationpro.conf b/meta/conf/machine/routerstationpro.conf
deleted file mode 100644
index 9e5036d..0000000
--- a/meta/conf/machine/routerstationpro.conf
+++ /dev/null
@@ -1,24 +0,0 @@
-#@TYPE: Machine
-#@NAME: mti_malta32_be MIPS
-#@DESCRIPTION: mti_malta32_be
-
-TARGET_ARCH = "mips"
-
-require conf/machine/include/tune-mips32.inc
-
-MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost ext2 ext3 \
-                    serial usbgadget"
-
-KERNEL_IMAGETYPE = "vmlinux"
-KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-
-IMAGE_ROOTFS_SIZE_ext3 = "2000000"
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
-
-- 
1.6.6.1



