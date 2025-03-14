Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E3C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:20:34 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.11885.1741951228181264736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=y1+hhg8W;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso19111371fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951226; x=1742556026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=y1+hhg8WcOF3a0H3D6zJVN8d5TyqSO1YFPP3d7cqpkuPGnpdLnvseRAVkuos1PAkDb
         JzNzQfZKr/32AwTU1ye9sKyLUQ7seTAEFskg0K4bfDcg3dQL3Z5uBNcTH/YxO4p/9a7f
         EoxeRnEoL6T80sxKCzR3gje16Or/EYXNqXZqD3dM/Yz0S4ZMysIpOTeJg69xIBaQaL7w
         rKZPn2F7gKcahrEnTjS8/0RMPhkLARa0FMMYAKWj7+fqiJfNPSUhLzRZcZ2KtGWhn/WW
         iFsErb8pn/Dhb6yPC+ERoqRt+UllCE2jL9RmW3MkVPGvH85N/v5fKpJYc6QP6272Wc1o
         lE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951226; x=1742556026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=A8eSNDwzAwJeLXrO4swvLSQ4ffETk/afpM0PNYr9cGGZQKkayAFO+JsXawYpI0ERV1
         I56Tq43UmJiOwTtKonDqeoYJvRPhoXWuSXxK+awThKnsQQxDzgo0XKAYHbqdEl3hCKmb
         Wsz9jI/HP1bc9tmsbg9X4Hw0LwgJkhGjeFE1/dOMMGITjWmxUZHpcHCPhXka8poPHg2U
         3AnPK2lpeYB3zzJe6n0Rar96GdxHK2GnaaqbfeZqnX1XsSljgrLSFXpXfDksgoujaMFX
         WjdGOt4ciPstgT62M+/NM55Oa1SZGL5JbAG/VeP3BT83aVJboZcKxxpQik0irecuwsuJ
         bszg==
X-Gm-Message-State: AOJu0YzkU5eug6u0S0DjrqUCjiavfLj/LSFchIevBEgYbuscPEAZiRhK
	uSfjOHEwOyxPW9fradD1atiUzhw3me+NqoPJchpM1YcTfB+vk3e/POVH9yRWmIXgygXuXBBmB7L
	Yy4Y=
X-Gm-Gg: ASbGncvbmSFh+j9lHZVFLS2mu2D5dEyYt9f33Y5JaFH1I10nx8Sm+/IRn+vT9jC3lgJ
	54k1EOhqfoDbAE2HwyrHHUv9W6RxdvI66+j3K/Wv0gof9wVONnzHH6vNczFiQR0FMI3wbxEkeGT
	BqUXDh2Slwg9zvkKafod0OUbI3UPOFj3Ad+JP7fgPDJvG+pvHrElq4xPiJzPvEO9vdl4WwNyHMN
	1oG/kp8c3g+fnZSDZAylwIO9ZjJWq1Vizv2ekYpCb7ARhFhKjYWcZS8E7lYGijlq08usmGOk/yx
	yI8u6So1xRZXOvKns2lCDsKOH/CABI0H6i9aGUkR+pS6ZMCIbmhxemhTpBl3UqeJESMh4ZryWEH
	c0cCZwT7qhZhLqMELpu1AKWAW
X-Google-Smtp-Source: AGHT+IF5n7i1F+gDNZZ/21sbcGtEICLA9cA23aFTFHrY9lQ0SbIr5qQ/7c46SPeaXtnBLMppS5Cd9g==
X-Received: by 2002:a05:651c:210c:b0:30b:c83e:720a with SMTP id 38308e7fff4ca-30c4a7538a1mr8173451fa.1.1741951226262;
        Fri, 14 Mar 2025 04:20:26 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d26e5sm5364391fa.20.2025.03.14.04.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:20:24 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 6/6] oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
Date: Fri, 14 Mar 2025 13:19:42 +0200
Message-ID: <20250314111942.304800-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212837

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


