Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC72AC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:58:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43271.1782907117698373607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 04:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oV2FIwXl;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so17397025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907116; x=1783511916; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYgOMk5gfSwcM6S9B3hRpmvSjppXFnUuJF8I+jCMLj8=;
        b=oV2FIwXl5qpVYYcqRu02PPVM2oNpozIOfk/pc7JhLpP/XXjLccGh7ymaG+xaaq2WXo
         CA76U24NOWj/PX3pTWx11YmQN61B5uL7j8D3bCAWo26C5PSJc6NyZEjLyweAXqrBhZmM
         OSlm0KNMBkf82Tm76BTBIHOdBqBKRAeLz6K5TLG16QNedpyJuZwS9jy4DSnpywujHtOP
         34h69zywCsbbmU2GPQiksOqUQyTa5oej8mvKuVUAV3C14FshumQ2aip3bFpa3gBWFKKA
         qbkVqOBMmA8BEDDLlHCpNLo9P1mOgmu4OX5KJ2HGUgGCjz8q0otrIh7FOtvYpjP+7qFD
         Aurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907116; x=1783511916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYgOMk5gfSwcM6S9B3hRpmvSjppXFnUuJF8I+jCMLj8=;
        b=Z4S9ty6iVxdS8S4mp/JpuFrLalSLnwsb1KIOMLkljTEBhC1HISa+8QrOffMslvIQiB
         vKHQUJysgHafOE6joqUOrkR2+GJCRFIzNEsD/yAQRBZtwUFJ5nP1dSq2w+V8hRokGQVy
         KNaaXd6MBeB0fc1/4E7gzEILmxVg2n9B8R+c0nG72j04n/we0TC3qp6bm20FRENbh5dd
         R37iZ0ru+cyZaHFmmkOq9DMEGtMd5hfdFn2iz7ADm8PtYn+wkyjoJuZF9pzT6+zKVssT
         EgsIjeDmrAeWo7Zd1+/+rXWgORdQTtkbZypa7DbjLvZq8SRLPF6HbiCP0Y6tpdXDPDO1
         PJ3g==
X-Gm-Message-State: AOJu0YzRUEaooUonqYKrF77m/hJ9ORV5RA18h6B9f7xX6O3caHjWSdPy
	0GK3AlLtdycbHHrhcrYrlFY1m6TLk3gljYDCe6naevNRV4pyfxZevdOuDexxPw==
X-Gm-Gg: AfdE7cmzTlm664tGo7Nyk0VuP2sKIyMOXL/tbNzL1c76Z8MXw4tELHCwrl55hBOU6z6
	yxzy9fBM4Zui0+pnL46chSuzGsRQlQ347wstz8sovMEVFN3CD9dgIOpO2ZmCTQa4xwFBJFZHDda
	HGgoFRoIcx4Po9KLS0+bPSKBRJC9TGX94yCFc9jyuHu2rMXMN4/OB5IvcQ/AZHOSGXDR5zX+ZEH
	dXUsSBDknsR/unDvePzxr7QnACFS536i7DCuDm8GGNdVJ1Lzef0iWngYyiN6ByO/3m3JfAiizkw
	/fpGd5lFQl7dvtGt96+ILjf5r8Je5fwvl+aIlRQHUGOg4AEeN34y9UmjzIC1qjasy4XQsoIdrVs
	4/TKifzG+AguARaJQiip7hDS7maQuf3jElIj+XNmAjDpN1PaUTZG88PNF4qk/p1BuSpSKxOCqrI
	agaaNGLWTnOO6t9bOyg/Nh6kMRUmRzp6sgHkWi6WAWFf2YR6G3K88BI9MMaH4PWdk=
X-Received: by 2002:a05:600d:6454:20b0:493:a87f:52e5 with SMTP id 5b1f17b1804b1-493bc248efcmr62302525e9.10.1782907115886;
        Wed, 01 Jul 2026 04:58:35 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf98sm12680161f8f.22.2026.07.01.04.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:58:35 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 01 Jul 2026 12:58:13 +0100
Subject: [PATCH 3/3] qemuarmv8a32: add QEMU machine for AArch32 ARMv8-A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tune-a32-v1-3-a43f28b1d7a4@gmail.com>
References: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
In-Reply-To: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 11:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239980

Add a QEMU machine for exercising an AArch32-only ARMv8-A target
(Cortex-A32) under emulation, defaulting to the cortexa32-crypto tune.
QEMU has no Cortex-A32 model, so it runs on the 'virt' machine with
qemu-system-arm and -cpu max, which provides the ARMv8-A AArch32 feature
set including the crypto extensions needed by the crypto tune. The kernel
is built as a zImage and u-boot uses qemu_arm_defconfig, matching the
other 32-bit ARM QEMU machines.

Map KMACHINE to qemuarma15 so the existing linux-yocto BSP is reused, and
add qemuarmv8a32 to linux-yocto's COMPATIBLE_MACHINE so a kernel can be
built for it.

AI-Generated: Claude Code (Claude Opus 4.8)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
 meta/conf/machine/qemuarmv8a32.conf           | 36 +++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarmv8a32.conf b/meta/conf/machine/qemuarmv8a32.conf
new file mode 100644
index 000000000000..8e49a56ae720
--- /dev/null
+++ b/meta/conf/machine/qemuarmv8a32.conf
@@ -0,0 +1,36 @@
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
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MACHINE = "-machine virt"
+# QEMU doesn't know about Cortex-A32
+QB_CPU = "-cpu max"
+QB_SMP ?= "-smp 4"
+QB_CPU_KVM = "-cpu host -machine gic-version=3"
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
index 2b1298dedf9c..a818506bb6f3 100644
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


