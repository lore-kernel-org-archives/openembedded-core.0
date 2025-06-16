Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97A7C7115E
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:29:30 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.21722.1750040968030965430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55G2TQ6A027430
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:29:27 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] qemuriscv: Dynamically configure qemu CPU
Date: Sun, 15 Jun 2025 21:29:23 -0500
Message-Id: <1750040965-15015-5-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218758

From: Mark Hatle <mark.hatle@amd.com>

Use TUNE_FEATURES to dynamically configure the QEMU emulated CPU for the
options selected by the DEFAULTTUNE.

Note: OpenSBI currently requires 'c' (compressed instructions) or it will
not work.

Change the base device configuration to use a different variable to select
the emulate devices.  This will allow a user to override or append the
QB_OPT_APPEND without the riscv32 override getting in the way.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 65cbfd66ee..91a84cdd39 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,7 +27,6 @@ UBOOT_ENTRYPOINT:riscv64 = "0x80200000"
 # qemuboot options
 QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
-QB_CPU:riscv64 ?= "-cpu rva22s64"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
@@ -36,5 +35,31 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 QB_GRAPHICS = "-device bochs-display"
-QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-QB_OPT_APPEND:riscv32 = "-device virtio-tablet-pci -device virtio-keyboard-pci"
+QB_OPT_APPEND = "${RV_QEMU_ISA} ${RV_QEMU_DEVICES}"
+
+RV_QEMU_DEVICES = "-device qemu-xhci -device usb-tablet -device usb-kbd"
+RV_QEMU_DEVICES:riscv32 = "-device virtio-tablet-pci -device virtio-keyboard-pci"
+
+RV_QEMU_ISA = "-cpu "
+# Choose rv32 or rv64
+RV_QEMU_ISA .= "${@bb.utils.contains("TUNE_FEATURES", "rv 32", "rv32", "", d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains("TUNE_FEATURES", "rv 64", "rv64", "", d)}"
+# Disable all of the default extensions we don't support
+RV_QEMU_ISA .= ",zihintntl=false,zihintpause=false,zawrs=false,zfa=false,svadu=false,zicntr=false,zihpm=false"
+RV_QEMU_ISA .= ",zicboz=false,zicbop=false,zmmul=false,sstc=false,h=false"
+# Dynamically enable the extensions based on TUNE_FEATURES
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "m",         ",m=true",        ",m=false",        d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "a",         ",a=true",        ",a=false",        d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains_any("TUNE_FEATURES", "f d",       ",f=true",        ",f=false",        d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "d",         ",d=true",        ",d=false",        d)}"
+# OpenSBI fails to boot without 'c'
+#RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "c",         ",c=true",        ",c=false",        d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "v",         ",v=true",        ",v=false",        d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "zicbom",    ",zicbom=true",   ",zicbom=false",   d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", ",zicsr=true",    ",zicsr=false",    d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "zifencei",  ",zifencei=true", ",zifencei=false", d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba",     ",zba=true",      ",zba=false",      d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",     ",zbb=true",      ",zbb=false",      d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains    ("TUNE_FEATURES", "zbc",       ",zbc=true",      ",zbc=false",      d)}"
+RV_QEMU_ISA .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs",     ",zbs=true",      ",zbs=false",      d)}"
+
-- 
2.34.1


