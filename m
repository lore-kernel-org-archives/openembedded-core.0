Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AA4C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.21005.1742563559992319972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=K3VQGxid;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b159c84cso2245241e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563558; x=1743168358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=K3VQGxidbTSxLLWIdszNwEKDQDisN+dcg4EJYg4fFfqszV6E0hj9/bCCuQYu86yInT
         jlvLyIzq9b3lHtjeGE06/OFdBWvg75iMXao7Xg/YQO7B2E8w6uZrVnje21XXEO9oYRKt
         NYyeBG7CJ682pkfnKZSpgmtkfa+FMXHzgXqIuoEQ02BIDBavsyPwEiiczuGCPfEzRr1h
         k591y8j4BpN3T8WuZrw3d8jyIH5jEbj1elR70Ua7L9vaWyVSUULZEsN/xfJ755iFl7aW
         AyxfKUYNbtScS2Qs75mwAFyNwYYb0HDTWQnIxqbdVt22WBXuMxkA4e034I39CP4rBeY8
         58RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563558; x=1743168358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=I9F+iNq5WBPmb3/4R291tFSXb2us91DLQOPapNyZx25uSIXmVUwUMZXj7K3yuRbN4u
         lX2m3UHkSSWdFplLs0ec5UCusOWs/hwcozDqS5Jl6T+W31cECbeD9LMr4oMCj3SdlYlA
         wcAIiYdpcAlC3RYxKodHMy28jJ37kkTNZREaXXloqHP5yi3eB3KTtJJ/fe0ToMZ45eRJ
         GbPhSvkAr2R8WaANNNuAmgpurEbuNcIVx41pp0xBbi3GmZU7aWf2sAxSVQE/WDEcLvnu
         YhC7p2R/3QtNCnz/Q7sYkWd0xb0YCOJII1B57GFd5BGoUVO9GAM9ZVmMW2mtFu0AK8Ea
         xqWQ==
X-Gm-Message-State: AOJu0Yxtn0KQcO4ygqtUlLTWOVo+dFD8cIlxGbmvcYAPHIbc7+bXTOFK
	mp33RsxiLSlzh+qodLhiW2yDCniiGj9Cg7qBtBE+KhIr8C9YVtLsqU27gp8e1oewwqxARGZRMxx
	Y8/I=
X-Gm-Gg: ASbGncsWiCGlCMmQOPN/cSicYu1MveTohzgqz+c5JYvFGCAMf3aU0nqGhVK6uDi88d+
	wZI0tNlavBaviRPhjla36+LEaQnMKg1VJreYN2RP6q91XTZEhmUlqiBs6+CshfoMFCX7hkOCCvz
	cU0xbGNRv0iVCo4vPIsbahu15cXT1KekKBVzif1/Exwct+PKachNRes9qZhnZJcDmDWHT+E8l30
	zruw4FIqAjYTaS/B817Riz9zXxurgummnjyaAPPLH+Q8NH1cpeipVFCuUAmRfx1BS94UN4Gpje1
	zEzn222nC0V3QTyCtbc/VCYhAd5DOkdP/jdvgDwwlSMnWQGGcDlGy5U3maz9hpbb8HbyCM/gBNY
	iR/++VH+Fwlh17X4eDrN0sQ==
X-Google-Smtp-Source: AGHT+IG53m9DiN26LUU2DvWqOBN4ao3umdvuaV/Ai/tX0BiUbN1qsUcGLUrdNHlGW+tSasd6QTDcUg==
X-Received: by 2002:a05:6512:3d8c:b0:545:4d1:64c0 with SMTP id 2adb3069b0e04-54ad649536fmr1647170e87.27.1742563558067;
        Fri, 21 Mar 2025 06:25:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:56 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 07/11] oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
Date: Fri, 21 Mar 2025 15:25:13 +0200
Message-ID: <20250321132517.670372-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213463

Use core-image-initramfs-boot with systemd to boot via UKI on
arm/aarch64. Tested on qemuarm, qemuarm64 and genericarm64
on aarch64 build host. The machines have different image
and qemuboot configs so they need to be configured in test.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/uki.py | 76 +++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
index 9a1aa4e269..4830fb3403 100644
--- a/meta/lib/oeqa/selftest/cases/uki.py
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -139,3 +139,79 @@ IMAGE_CLASSES:remove = 'testimage'
             cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep '%s'" % (uki_filename)
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+
+    @skipIfNotArch(['aarch64', 'arm'])
+    @OETestTag("runqemu")
+    def test_uki_boot_systemd_initrd(self):
+        """Build and boot into UEFI firmware (u-boot), systemd-boot, initrd with systemd, rootfs with systemd"""
+        image = "core-image-base"
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
+        cmd = "runqemu %s nographic serial wic" % (runqemu_params)
+
+        self.write_config("""
+# efi firmware must load systemd-boot, not grub
+EFI_PROVIDER = "systemd-boot"
+
+# image format must be wic, needs esp partition for firmware etc
+IMAGE_FSTYPES:pn-%s:append = " wic"
+WKS_FILE = "efi-uki-bootdisk.wks.in"
+
+# efi, uki and systemd features must be enabled
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES += "systemd-initramfs"
+MACHINE_FEATURES:append = " efi"
+IMAGE_CLASSES:append:pn-core-image-base = " uki"
+
+# uki embeds also an initrd
+INITRAMFS_IMAGE = "core-image-initramfs-boot"
+
+# runqemu must not load kernel separately, it's in the uki
+QB_KERNEL_ROOT = ""
+QB_DEFAULT_KERNEL = "none"
+
+# u-boot, not all qemu* machines set this correctly
+QB_DEFAULT_BIOS = "u-boot.bin"
+# machines may not set this correctly
+QB_DEFAULT_FSTYPE = "wic"
+
+# u-boot needs to find ESP partition so use virtio block device instead of default scsi
+QB_ROOTFS_OPT = "-drive id=root,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=root"
+QB_DRIVE_TYPE = "/dev/vd"
+
+# boot command line provided via uki, not via bootloader
+UKI_CMDLINE = "rootwait root=LABEL=root"
+# enable if debug output is needed
+# UKI_CMDLINE += "systemd.log_level=debug systemd.log_target=console systemd.journald.forward_to_console=1"
+
+# disable kvm, breaks boot
+QEMU_USE_KVM = ""
+
+IMAGE_CLASSES:remove = 'testimage'
+""" % (image))
+
+        uki_filename = get_bb_var('UKI_FILENAME', image)
+
+        bitbake(image + " u-boot")
+        with runqemu(image, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+            # Verify from efivars that firmware was:
+            # aarch64
+            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'Das U-Boot'"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+
+            # Check that systemd-boot was the loader
+            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-boot"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+
+            # Check that systemd-stub was used
+            cmd = "echo $( cat /sys/firmware/efi/efivars/StubInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-stub"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+
+            # Check that the compiled uki file was booted into
+            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep '%s'" % (uki_filename)
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.43.0


