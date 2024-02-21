Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4777C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 10:57:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10328.1708513051731427281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 02:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BD7FEC;
	Wed, 21 Feb 2024 02:58:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C0D273F73F;
	Wed, 21 Feb 2024 02:57:30 -0800 (PST)
From: ross.burton@arm.com
To: poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org
Subject: [RFC PATCH] Add genericarm64 MACHINE using upstream defconfig
Date: Wed, 21 Feb 2024 10:57:23 +0000
Message-Id: <20240221105723.1501833-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 10:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195966

From: Ross Burton <ross.burton@arm.com>

This is a new 64-bit "generic" Arm machine, that expects the hardware to
be SystemReady IR compatible. This is slightly forward-leaning as there's
not a _lot_ of SystemReady hardware in the wild, but most modern boards
are and the number will only grow.  Also, this is the only way to have a
'generic' machine as without standardised bootloaders and firmware it
would be impossible.

The base machine configuration isn't that exciting: it's a fully featured
machine that supports most things, booting via UEFI and an initramfs.

However, the kernel is more interesting.  This RFC uses the upstream defc=
onfig
because unlike some other platforms, the arm64 defconfig is actively
maintained with the goal of being a 'boots on most hardware' configuratio=
n.
My argument is: why would we duplicate that effort?

The "linux-yocto way" is configuration fragments and after a week of
hair-pulling I do actually have fragments that boot on a BeaglePlay, but
to say this was a tiresome and frustrating exercise would be understating=
 it.

So, a request for comments: is it acceptable to use the upstream defconfi=
g in
a reference BSP?  Personally I'm torn: the Yocto way is fragments not mon=
olithic
configs, but repeating the effort to fragmentise the configuration and th=
en
also have it sufficiently modular that it can be used in pieces - instead=
 of
just being a large file split up into smaller files - is a lot of effort =
for
what might end up being minimal gain.  My fear is we end up with a fragme=
nted
configuration that can't be easily modified without breaking some platfor=
ms,
and badly copies what the defconfig already does.

Ross
---
 meta-yocto-bsp/README.hardware.md             |  7 +++++
 meta-yocto-bsp/conf/machine/genericarm64.conf | 26 +++++++++++++++++++
 .../linux/linux-yocto_6.6.bbappend            |  9 +++++++
 meta-yocto-bsp/wic/genericarm64.wks.in        | 11 ++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 meta-yocto-bsp/conf/machine/genericarm64.conf
 create mode 100644 meta-yocto-bsp/wic/genericarm64.wks.in

diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.ha=
rdware.md
index a8f38cb21a6..58ebc328b56 100644
--- a/meta-yocto-bsp/README.hardware.md
+++ b/meta-yocto-bsp/README.hardware.md
@@ -29,6 +29,7 @@ The following boards are supported by the meta-yocto-bs=
p layer:
=20
   * Texas Instruments Beaglebone (beaglebone-yocto)
   * General IA platforms (genericx86 and genericx86-64)
+  * General 64-bit Arm SystemReady platforms (genericarm64)
=20
 For more information see the board's section below. The appropriate MACH=
INE
 variable value corresponding to the board is given in brackets.
@@ -126,6 +127,12 @@ USB Device:
        dd command to write the image to a USB stick.
=20
=20
+SystemReady Arm Platforms
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+TODO
+
+
 Texas Instruments Beaglebone (beaglebone-yocto)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto-b=
sp/conf/machine/genericarm64.conf
new file mode 100644
index 00000000000..2ea270d8b06
--- /dev/null
+++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
@@ -0,0 +1,26 @@
+#@TYPE: Machine
+#@NAME: genericarm64
+#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms, =
which
+#have working firmware and boot via EFI.
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Arm Base System Architecture says v8.0+ is allowed, but FEAT_CRC32 is =
required
+DEFAULTTUNE =3D "armv8a-crc"
+
+MACHINE_FEATURES =3D "acpi alsa bluetooth efi keyboard pci qemu-usermode=
 rtc screen usbhost vfat wifi"
+
+# Install all the kernel modules and all the firmware
+MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules linux-firmware"
+
+KERNEL_IMAGETYPE =3D "Image"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+INITRAMFS_IMAGE ?=3D "core-image-initramfs-boot"
+
+IMAGE_FSTYPES ?=3D "wic"
+WKS_FILE ?=3D "genericarm64.wks.in"
+
+EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
+
+# Try to bring up one physical serial console, or a virtualized serial c=
onsole
+SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend=
 b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
index 8e465c241e8..18f95de348f 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
@@ -1,19 +1,28 @@
 KBRANCH:genericx86  =3D "v6.6/standard/base"
+KBRANCH:genericarm64  =3D "v6.6/standard/base"
 KBRANCH:genericx86-64  =3D "v6.6/standard/base"
 KBRANCH:beaglebone-yocto =3D "v6.6/standard/beaglebone"
=20
+KMACHINE:genericarm64 ?=3D "genericarm64"
 KMACHINE:genericx86 ?=3D "common-pc"
 KMACHINE:genericx86-64 ?=3D "common-pc-64"
 KMACHINE:beaglebone-yocto ?=3D "beaglebone"
=20
+SRCREV_machine:genericarm64 ?=3D "332d4668fcc32826907d4f3c49388452060060=
89"
 SRCREV_machine:genericx86 ?=3D "332d4668fcc32826907d4f3c4938845206006089=
"
 SRCREV_machine:genericx86-64 ?=3D "332d4668fcc32826907d4f3c4938845206006=
089"
 SRCREV_machine:beaglebone-yocto ?=3D "332d4668fcc32826907d4f3c4938845206=
006089"
=20
+COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
 COMPATIBLE_MACHINE:genericx86 =3D "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 =3D "genericx86-64"
 COMPATIBLE_MACHINE:beaglebone-yocto =3D "beaglebone-yocto"
=20
+LINUX_VERSION:genericarm64 =3D "6.6.15"
 LINUX_VERSION:genericx86 =3D "6.6.15"
 LINUX_VERSION:genericx86-64 =3D "6.6.15"
 LINUX_VERSION:beaglebone-yocto =3D "6.6.15"
+
+# Use upstream defconfig for genericarm64
+KBUILD_DEFCONFIG:genericarm64 =3D "defconfig"
+KCONFIG_MODE:genericarm64 =3D "--alldefconfig"
diff --git a/meta-yocto-bsp/wic/genericarm64.wks.in b/meta-yocto-bsp/wic/=
genericarm64.wks.in
new file mode 100644
index 00000000000..417d4d88104
--- /dev/null
+++ b/meta-yocto-bsp/wic/genericarm64.wks.in
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R},initrd=3D${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --label b=
oot --active --align 1024 --use-uuid
+
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
+
+part swap --size 44 --label swap --fstype=3Dswap --use-uuid
+
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4"
--=20
2.34.1


