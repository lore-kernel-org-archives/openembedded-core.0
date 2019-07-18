Return-Path: <adrian.freihofer@siemens.com>
X-Greylist: delayed 816 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Jul 2019 21:49:22 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 634647EEAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 21:49:22 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6ILZlNg013971
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 23:35:47 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.32.124])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x6ILZiiR007403;
	Thu, 18 Jul 2019 23:35:44 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 5A18A23302D9;
	Thu, 18 Jul 2019 23:35:44 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 23:35:40 +0200
Message-Id: <20190718213540.6491-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] yocto-bsp: runqemu runs beaglebone-yocto
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
X-List-Received-Date: Thu, 18 Jul 2019 21:49:22 -0000

Append the necessary QB_ flags to the MACHINE configuration of
beaglebone-yocto. Using Qemu with "-machine virt" simplifies things
greatly because for this machine the dtb is compiled into qemu. Since
the beaglebone-yocto kernel config also supports this cpu architecture,
it just works. However, u-boot is not involved and the virt machine is
not 100% equal to a am335x SoC.

A MACHINE configuration suitable for Qemu as well as for the real
hardware allows to provide just one eSDK where both runqemu and devtool
build-image work. Otherwise a qemuarm and a beaglebord-yocto MACHINE
eSDK would be required to support development in Qemu as well as on real
hardware.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index 35814cd8f1..7c7b3059a9 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -20,7 +20,7 @@ WKS_FILE ?= "beaglebone-yocto.wks"
 IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
 
-SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
@@ -39,3 +39,21 @@ UBOOT_LOADADDRESS = "0x80008000"
 MACHINE_FEATURES = "usbgadget usbhost vfat alsa"
 
 IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO zImage am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+
+# support runqemu
+EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+IMAGE_CLASSES += "qemuboot"
+QB_DEFAULT_FSTYPE = "wic"
+QB_FSINFO = "wic:no-kernel-in-fs"
+QB_KERNEL_ROOT = "/dev/vda2"
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MEM = "-m 512"
+QB_MACHINE = "-machine virt"
+QB_CPU = "-cpu cortex-a15"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 systemd.mask=systemd-networkd"
+QB_OPT_APPEND = "-device virtio-rng-device"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+QB_SERIAL_OPT = ""
+QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-- 
2.11.0


