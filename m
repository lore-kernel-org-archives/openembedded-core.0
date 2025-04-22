Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE5C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.41492.1745332524809757483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ntG61wXK;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so5359938e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332523; x=1745937323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=ntG61wXKmpLaTCT0LRZ4tn4908ReRLCXIa3TprgGuv4JUwbJWVCKgndNd4nwvDBBWt
         PYRP3ZSIYByj34ISdCLvNX0y/elbmZic9fDYDPIar2KZld5b2KZsdvZnTaR+WvLNIZpB
         OlJQ6QpoxPUyNVmLUXGDC6axxWgeiGrT3RvdW4BFHJAFWOUdO3JuqvnCHMBc2xysBIvY
         VqD1EoO9Aq6joDXYqjkg3s1j54RObvR2hlK074FRTaA0R+HgM4sTbMmwT5wLnmp4y2Gr
         eltr+Q6HOsKXOvG5KUiGCxDyKPJf5phQDdxBrKAs9xWfwV/OuA/VIFEPWJ5oqSMGplWU
         1NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332523; x=1745937323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=GzZ91HFzLMNsdchAPzR3ZbyzE3rGUaTNtGfmvsguNeJ46gxKlbIhcy99/x8jpbL7GS
         lgSApKkNBniRM7wlctmtiUc36oihrNt4eb/mohm26+mQhtCukSgcC7uu3qu+O4K+2vQB
         z4l/RnmqdavXrn2oZ5VDXuwW+3k2JMB9Ktdg+hi0YurdEZ50KJ6efuVe8gSt+GI7BHsc
         FmeDcJYDLZnRcAdRah3fX4tjG98t3EqBk3oqCRJb7qPyLw/fbkAYNwk0AllMMZmq815u
         deZ2YtzV1I+Vs4Inhk5/6EZWmlRLrlXpRj4A7esTZuV/P82ZZkvo9NQLnLKvQgeKPJV7
         Gw9A==
X-Gm-Message-State: AOJu0YwGbCTS87MT6VrV/7dbVipltjLwnPsBU8ufClwXGJDwkzKQuOe4
	FgqJGCP7ufjZ4apo4AiExI2W7PDUQp+JU99ffXhElea4sHLe7qdj1DWPmCzlyn2/JBw7eBUiGaY
	chWc=
X-Gm-Gg: ASbGncv4emHR0JwWadZoww7lCyzKJSacXWQkDjQALKs5zdMC1ObAu3KClYYBEaZZwZJ
	91FXANRaZp3z1OZpZRPicmMq8rBZHfeg3ktvUyTI9rtfSm9WVqknz65IPuU6aDPSgFSkw3GJIGb
	BaJZ+EqDEbo6x0hPMo8N1q/eFvxiA63bmX4TpLjFg/vItmDPp3sI9/lHXJ2+/bnl829ZsRgyhPp
	8C8W+5nkm9htu5I2AWW4CixtK9pyQy6p6DcLAFwplUIa1KTQzMMvDayuakFNw8tkF6vR1m5Istx
	SYx+CjVoNdemCjGgXsnJqRiZ8GvRcpIRu2JXRwRfpIhvEXp50LTQ0cI81nQku78SypFaiC/ePIx
	If7J3k2p6chIL/gfG+w==
X-Google-Smtp-Source: AGHT+IEaIx4oZxLArA9il9yOznbWvWrK3fExnVWbPc9Fb6wz1pBwPKi4kW2i5eZJBMMznJCIqOSGww==
X-Received: by 2002:a05:6512:3088:b0:549:b1c1:4d76 with SMTP id 2adb3069b0e04-54d6e61a6a7mr3985907e87.5.1745332522922;
        Tue, 22 Apr 2025 07:35:22 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 6/9] oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
Date: Tue, 22 Apr 2025 17:34:58 +0300
Message-ID: <20250422143501.99565-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215220

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


