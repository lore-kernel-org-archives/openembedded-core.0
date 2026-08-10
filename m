Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C90C5B560
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:11:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23470.1786338683743621741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hZO1cfH+;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe377a217so825811f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 22:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786338682; x=1786943482; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Hh09P+S/N0vrQ+8vqE7/N7AE5LXPSQOHDQYGQ03KY=;
        b=hZO1cfH+Vl6Wbit2AIUVyNyO08/xXssH516DcGVdvywZo8SZ15wJ4B8NkZq0SJ42EH
         Eor8jjsqPwcivvpA36rkShJ5j7bOx0n8kxj4zazPFgn4h0gC2OKcOzsszuRspp8BZGEt
         o/ytzPUJvdoJge7RwSuifZHbCT8+UENnHBI/V/2sFFyVvxJ1OpRYd3B7XchBHzuI/lYl
         JyziWm1juvQqCcCbpsjoKsz97VtAyoHz7txftMpMe/8iN7b5hGPcc+ofaNMmXd8LWSgt
         JzvrJGW20nHebm8Y2MQtB0fpGVJwezwTAZynRaXSF3A4NCNDZG6gAsZqppa9CwapFDW1
         jMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338682; x=1786943482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/Hh09P+S/N0vrQ+8vqE7/N7AE5LXPSQOHDQYGQ03KY=;
        b=FAI7zMniEe6nSHKN4rSQ45azVntrsacwHAD0vu+JAnOlLlcpMZoP7ok58zgqHCRM3Z
         p2xgogOrQ0+6bEoCTROpqm+7SFXTpZamUXHU+qb62ZBYZii+JZbbG4EimSSjsnIyzCA0
         o8ed1QnwlYfPpW3WkcSYkVY+X3FfYNzBucx3KHQyp6mS9tV1fwN5uqkdePu7i3P07qRW
         l5VZ+GRnpds0lNbhiPSDn7NLMQJsNi+uldlB0Ts04oCksviXSK0chWxJLoknbH1V3bjz
         Hz+KM8gOhHYpQ0TrAxxZBNAdVbRrzF1RdwPIPs/OVLUK4dsQujV27FA3XRH5XscWPFv/
         cZZw==
X-Gm-Message-State: AOJu0Yx3VAPLN74mbSBX/UskKrISc61pusOb4+ynI4IBXar2+VEBdmZK
	WCLE5kQHfVStzLfuvpwti7fGkiGfC/o5xzW1B9KwqqrGk0rGBJKJq8Zv2Kd1QA==
X-Gm-Gg: AR+sD12TfqwBDRGA7Mzxas92yFL3Bka1DxtOrN8V9lwj9PwCzXWEsEO18sOUKG22tl3
	7i4orhcqMGsPZpmVPoRLeNxqZjQJQWE/Bxn/fsx6xuEXljHzNGLR7uKM1on2UDUtEL02/LlAYKH
	YdZIVmhFQNnCALL5Oi6XWon65tjpUVGR2Bvse+2WbRdNy4eos/T+SGcEJnQbh0/AY7TisCJfwfd
	9t0mJIIspkf4Hbb3k2r16VUGYVTHE9jVrBAnmY+OhG9/mLUAWnrwCwP3IYfKVddByxN6vlaS61h
	Nk9AOzczNDEU0aGtOR7GZLFFRFhVDTC0kswEnpORzNEYRO6ep25BrFhvsRuaFu96OzsWPx04qRC
	kjYll44pnB1KRPt0H4VL0h7zce7AtCZBVETIdYN83XexRXwFWIU4+X310QerIm9Q2c1cETTNG7Y
	jBO0/IUH8zl84O42wMMl67wb6BJX1PWypnWxm7o0mFptPCqwTI2mmvGhKlFtQX2gSI0ws88r9od
	LZhaNo/qldQoqAKpi0ZPdhqAMN6/cpCbNNqw0I=
X-Received: by 2002:a05:600c:35c8:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499593ba192mr370218485e9.1.1786338681630;
        Sun, 09 Aug 2026 22:11:21 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422016fsm315556305e9.8.2026.08.09.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:11:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 10 Aug 2026 06:11:08 +0100
Subject: [PATCH v2 2/2] qemuarmv8a32: add QEMU machine for AArch32 ARMv8-A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-tune-a32-v2-2-52045fd54937@gmail.com>
References: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
In-Reply-To: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>, Jon Mason <jdmason@kudzu.us>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 05:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243107

Add a QEMU machine for exercising an AArch32-only ARMv8-A target
(Cortex-A32) under emulation, defaulting to the cortexa32-crypto tune.
QEMU has no Cortex-A32 model, so it runs on the 'virt' machine with
qemu-system-aarch64 using the Cortex-A32's AArch64-capable sibling, the
Cortex-A35, with 'aarch64=off' so the guest is AArch32-only. This
provides the ARMv8-A AArch32 feature set including the crypto extensions
needed by the crypto tune, and the same binary supports KVM on AArch64
hosts whose CPUs implement AArch32 at EL1 via '-cpu host,aarch64=off'.
The kernel is built as a zImage and u-boot uses qemu_arm_defconfig,
matching the other 32-bit ARM QEMU machines.

Map KMACHINE to qemuarma15 so the existing linux-yocto BSP is reused, and
add qemuarmv8a32 to linux-yocto's COMPATIBLE_MACHINE so a kernel can be
built for it.

AI-Generated: Claude Code (Claude Opus 4.8, Claude Fable 5)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
 meta/conf/machine/qemuarmv8a32.conf           | 38 +++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  2 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarmv8a32.conf b/meta/conf/machine/qemuarmv8a32.conf
new file mode 100644
index 000000000000..f2a591b48014
--- /dev/null
+++ b/meta/conf/machine/qemuarmv8a32.conf
@@ -0,0 +1,38 @@
+#@TYPE: Machine
+#@NAME: QEMU ARMv8 AArch32 machine on Cortex-A32
+#@DESCRIPTION: Machine configuration for running an AArch32 system on QEMU
+
+DEFAULTTUNE = "cortexa32-crypto"
+
+require conf/machine/include/arm/armv8a/tune-cortexa32.inc
+require conf/machine/include/qemu.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
+UBOOT_MACHINE ?= "qemu_arm_defconfig"
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+
+# For runqemu
+# QEMU has no Cortex-A32 model; use its AArch64-capable sibling, the
+# Cortex-A35, with AArch64 disabled so the guest is AArch32-only ARMv8-A.
+# KVM needs an AArch64 host whose CPU supports AArch32 at EL1.
+QB_SYSTEM_NAME = "qemu-system-aarch64"
+QB_MACHINE = "-machine virt"
+QB_CPU = "-cpu cortex-a35,aarch64=off"
+QB_SMP ?= "-smp 4"
+QB_CPU_KVM = "-cpu host,aarch64=off -machine gic-version=3"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_GRAPHICS = "-device virtio-gpu-pci"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
+# Virtio Networking support
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+# Virtio block device
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=disk0"
+# Virtio serial console
+QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
+
+KMACHINE:qemuarmv8a32 = "qemuarma15"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index e510ff01aaf1..0951a60dde8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -52,7 +52,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarmv8a32|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"

-- 
2.43.0


