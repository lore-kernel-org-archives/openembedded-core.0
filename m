Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E05C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:52:28 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.116718.1738677141329186726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z/Z+3PNO;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-303548a933aso47713591fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738677139; x=1739281939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bCHfk4ZY0c/bCABeC25Cj5qk+XjMuLtvRBJLReqqzQ=;
        b=Z/Z+3PNOiwpr4KD7+m6LhPbF+IVoH306IJsyLEaq6hq2egeYg8pyyVXmuBmHESfi7h
         O6Nmk/eu2a0hn90cgy0EVZNKcAxwyFcfbn29g7w4WXG6paPjh617KGoV/ejX7g0jrMWu
         EzqoOEFTZ9tTm5wVfEj1ytTL4pRsthaA99JExg2nvbcC+oNY0LfrF5EW83qKyjXQ/B3e
         LjToIMgb6jTJDsxKdzaEtJdJFNTV4I8pbHVNBM504XONOfJf8rpMvuHxyVq+BRb1zjPQ
         IFlpb5cOlM2FOv77jZC97ZsQ+X69EdyZ6v7Fj4izoczEfghuAn6/f4WUyckmIKpjTNxU
         UGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677139; x=1739281939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bCHfk4ZY0c/bCABeC25Cj5qk+XjMuLtvRBJLReqqzQ=;
        b=NDqdlFL2VHRLdMoHqCLA3x5l4xkyQAF/1f9B299SZhzRQEW73i+fMiZxR3l+YB0hUv
         t7MerMtSwcKc4fPZA+upt3svEzsbdvi26zfV5FcsNw+aMPQJK+lfb/QRV1E/FeY4h+yt
         mqpMeUX/Qvzs/5hOKGic8/mX/CrVKHHoxNGlOuKm7kWt4hv1FHSVxuLgnNesXJ+fCXmV
         BShNwbAxK7piQXrQ21x/codbIhK0oPSxzQ+dCRcULYIiMjuGixjUne/tWaoCeelMDRfD
         w3usshH7+BXGdGUKM8miKhAjnCqnyY08lQ6eY2iJ94JrQ8y7Vu6bLa7HsxQYGIKubsSb
         16Uw==
X-Gm-Message-State: AOJu0YyicCt8EutbHY2Q1WX/1pqVnS25gBU6n9Wr3HUd8p1zPFUrLBy+
	i1JVRzWthxXA/ZzjF31qYFnI7vp6hX3VTkuLSeNvO64TcFmkx0fK5neH7hJQUHUnyEoJNMioDYN
	CLxU=
X-Gm-Gg: ASbGnctXUeC6Db1bB6BTxHZtusGF55FhE7i7szT33sTnp8yo94KRGH2Au2wUXGo1TkL
	WLBtpiaNdyBmr1QiKnc+5emW7KfcVbmGdOsXiUyX7qT197eMRG/oykVwe1zGRW7/B4E447N7JsF
	0naL20L2sdnieGmrYJuSztlGjG+qtLICRMMwI0K/I+Xd3hCIXPBlnQ8/H1iHs2Rg+pOA5s2DmL2
	sv+KxYhAHcFdpWhlTmtwQvjyzcDY8XKFFQ/Lnm6DxzwDiQvpsuztDnLh6W19KHhncHb3L/kWKu1
	o+d4MQfBBSFmWi3h8ZVI/C8zwoDwxBhnfZjzhztTIiMUEyYveDebRHPiEvtP
X-Google-Smtp-Source: AGHT+IG/wTOei/1FAe+UUiR5oB1TCmaxF+OooG9SkQIEdLLQiqnG9Ki8niyIQXZU1T0o3H0hizRvKA==
X-Received: by 2002:a05:651c:1149:b0:302:3e14:34c5 with SMTP id 38308e7fff4ca-307968e7cd0mr97458721fa.28.1738677139380;
        Tue, 04 Feb 2025 05:52:19 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7795sm18397161fa.79.2025.02.04.05.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:52:17 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] genericarm64.conf: allow overriding u-boot and qemuboot variables
Date: Tue,  4 Feb 2025 15:51:59 +0200
Message-ID: <20250204135159.1219199-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210793

Assignment in machine config can not be overwritten in local.conf
because former is evaluated later than latter. Use ?= conditional
assignment for u-boot and qemuboot variables so that they can be
overwritten in local.conf if a different test setup is wanted
for kernel, initrd and rootfs built for genericarm64 machine
config.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-yocto-bsp/conf/machine/genericarm64.conf | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto-bsp/conf/machine/genericarm64.conf
index b6dfb8042d..f5000402e5 100644
--- a/meta-yocto-bsp/conf/machine/genericarm64.conf
+++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
@@ -33,31 +33,31 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;ttyS1 115200;
 # Allow u-boot to be built for use with qemu-system-aarch64.
 # This u-boot is _not_ suitable for use with real hardware, and the expectation
 # of this machine is that real hardware comes with the firmware pre-loaded.
-UBOOT_MACHINE = "qemu_arm64_defconfig"
+UBOOT_MACHINE ?= "qemu_arm64_defconfig"
 
 # runqemu configuration to run a genericarm64 image inside a qemu-system-aarch64. You will need
 # to build u-boot explicitly.
 IMAGE_CLASSES += "qemuboot"
-QB_SYSTEM_NAME = "qemu-system-aarch64"
+QB_SYSTEM_NAME ?= "qemu-system-aarch64"
 # Boot the virtual machine with either an emulated Cortex-A76, or the host if using KVM
-QB_MACHINE = "-machine virt"
-QB_CPU = "-cpu cortex-a76"
-QB_CPU_KVM = "-cpu host -machine gic-version=3"
-QB_SMP = "-smp 4"
+QB_MACHINE ?= "-machine virt"
+QB_CPU ?= "-cpu cortex-a76"
+QB_CPU_KVM ?= "-cpu host -machine gic-version=3"
+QB_SMP ?= "-smp 4"
 # Boot into U-Boot and let that scan the disk for the next step, don't pass any kernel or filesystem hints
-QB_DEFAULT_BIOS = "u-boot.bin"
-QB_DEFAULT_KERNEL = "none"
-QB_DEFAULT_FSTYPE = "wic"
-QB_FSINFO = "wic:no-kernel-in-fs"
+QB_DEFAULT_BIOS ?= "u-boot.bin"
+QB_DEFAULT_KERNEL ?= "none"
+QB_DEFAULT_FSTYPE ?= "wic"
+QB_FSINFO ?= "wic:no-kernel-in-fs"
 # Mount the wic rootfs as a virtio block device
-QB_ROOTFS_OPT = "-drive id=root,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=root"
+QB_ROOTFS_OPT ?= "-drive id=root,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=root"
 # Virtio graphics
-QB_GRAPHICS = "-device virtio-gpu-pci"
+QB_GRAPHICS ?= "-device virtio-gpu-pci"
 # Virtio serial consoles
-QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
+QB_SERIAL_OPT ?= "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT ?= "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 # Virtio networking
-QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_TAP_OPT ?= "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 
 # If we're running testimage then we're in a qemu, so ensure u-boot is build
 TESTIMAGEDEPENDS:append = " u-boot:do_deploy"
-- 
2.43.0


