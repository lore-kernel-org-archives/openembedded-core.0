Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D017AC369A7
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.1470.1743784199496018275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eo4r7uWm;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499c5d9691so2549272e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784198; x=1744388998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=eo4r7uWmTCBoNEMh4tWX7w404qRidjQAezVkBRilvfPon1ly09U5Jpksb6HwWBQTbc
         V57ozrEW7zXoFTmg6T6D8t5b7dRIQbvLfK7/lswbNVpAW9K5pWN3QbDhGvrgPzDA6WZv
         S+v3E7tWJF/yMYS3SGCs5ZYnek+GR2VK+ajWwGhOySIP7Tnt0VAyWqTSkvSNvoRu6XSC
         H+yKlRskjhyWVX+BQ5mBBGgCPUdyJQdLX271sQoSwvguZUCrMnj7NM2et1JcyvV/zlmC
         KTDH4FL9b3bvhEnsNvkDoPlwHe4Nuxtwwy+0z1TKiTbPorXacXDbOPj3ssCMpSv0aXn4
         Hk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784198; x=1744388998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mowHB+GyPObXHHUyFruDF08rUA0X5sNItOs/AzldHBM=;
        b=xBDuRS5K9Vwzze8q8Mo5lLSCWkvnxfO8cgzVdpx1jUwvx4C+EVYLMguoXBdCojVsW2
         u6SiUMZgReKrtC9DrQQdwe4eUDsydCdFUl+epXaWsp2DwqUUXU3ADrd/ylgCGoqAzBhE
         k/CJ4Mczi4aMJ91jWq1hBmacrscV6ZVUWE/yn41eE7p2VvUgYbEk1B7lv1lqHbvm2jsv
         H92/XuPYs30GNCb5pfiEkes8yuXsL+MBDC1c3FFPTk8aTvFPo86uoE/xYsUBbyrxebzv
         pKYiSJZZ8nzUIWe9+ZhuJnT/qIfAVm5FcdItAwgLzRzcREl6+gSPZA5cBXjW7IvEZW3b
         /y/w==
X-Gm-Message-State: AOJu0YywKJwY6RUlXgQDdyaettH2VvmpXtCCy6TQaE7zQoUZfWbnoLua
	5nJ5kM59OoLwWuWm/XYLOTGi2VoUl4vypMeU/t7jj5IEblS9pmz2vdNiH0/m+CrpnsRt3GWLcoD
	HzK4=
X-Gm-Gg: ASbGnctm4yOVqwDkG8ochqZHaB1ZJaAVAadu9f7Mq6a0P7tykahi7S0XNEwXFfVxgFc
	sJC3RPUVcz8gVvX5cNJUw8SYgDKVYU48z6LaImcgazyJdC9H02y+ZYnVOgIKg/3qIlg1XkgTouD
	x6/rNnoavsRzT6XSAVYZ4l2Ksl7KTrdLBzvGrH+WdTaxU7w21tDS9069ZD/lLKHnbSQJ8TGOPFt
	XzP2u7rPGsKIDOuV/z+3r9fg9OGKFG5DFyIslHJhK3cgGGvcwIQC4jjJYwV/Ak+Z2Kq6dmOYNlM
	l2ZUrZj/L3nf78NgdEC65Wd/YZE8SB8r4hL0TRTj3NtdyALGuwl1tiAWgjKIr4EsitIOsgM2kKl
	y8+dqZ9N47Uv6gHLwf4JIoA==
X-Google-Smtp-Source: AGHT+IFRfvSlNLwzWRErflZTxQuKvPgZmR5bzlTNNLMWUJdzZg/9L60PVWMLt9sbK3g3zJGXltiijQ==
X-Received: by 2002:a05:6512:b1d:b0:545:746:f36a with SMTP id 2adb3069b0e04-54c2278b039mr1142732e87.34.1743784197658;
        Fri, 04 Apr 2025 09:29:57 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:57 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 07/11] oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
Date: Fri,  4 Apr 2025 19:29:28 +0300
Message-ID: <20250404162932.447699-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214358

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


