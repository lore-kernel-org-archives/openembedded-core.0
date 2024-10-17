Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B454FD21251
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:23 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.44636.1729154782792200434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=L3R78bbc;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e7e73740so600346e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154781; x=1729759581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70+o0ofg/OggCGxLvCGoOH5ETDurb+U98ellNhc2uhc=;
        b=L3R78bbcIiyJ3RQCFE9KB9Jdl+oIhzaKml2skATwdVC3f8rI8FCMRRoAZPbNvXKRZC
         n2tVJdeNeGigsay0rtdDgGZga1uG4rPo7LHqELyXudRyuxe/4dSgWNr7psVsS1w4uFfb
         q9OANMTyRtsQfuBotVBa0BT64pqEtgrN6Sxj+/vPGyjJIOpbbMlDoRsHSb5svvsRS3VJ
         P492Sav/EsFORwzNu9exH9DYJHFThXo2iPIgwEmQoKiWVZgzwhnsMl6ddrZNz9gDNEkp
         NBIeXv2/kHzJge+dMF5HgsSGlg5Scaeifby0vvENwn3sJFCYq8VvMwL2ZKqOTTxld/Cd
         XYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154781; x=1729759581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70+o0ofg/OggCGxLvCGoOH5ETDurb+U98ellNhc2uhc=;
        b=DsXtMGQNAfXqk8rw8x8LCz1zYGXEbekoLyxo7Ad0wlS0aYCBrsKKPJGZg709Q2Y+J+
         swv6qCzgFYaio0pCUXYrAJX5MzOsZMritYaDLE4YScslDfMlF+Z9SiQ7tIEONSFcy0r7
         VtK7ysvLRMmSvZ+aKH2aLAfOQOQhoYZyey9O4uHvvLkyEfqagn+0OPzTiUnwMyfSpjca
         eHamMEi698NexXiOdYL7Hc80CcE3oRmYaMgfYDvCpt8wAruSFGN8L9biZpFffkdXHGer
         0pG3C03u+3ectn7k7cORio6Kiwmj5/7wTitheSwyUT2BU5QOyLpJdUfEQQiHdgVU2IvO
         z/0A==
X-Gm-Message-State: AOJu0YyITQI3WacWaj6k11z52Tmo353Hrv/MdJk3L5B2hVft+aG58Yyc
	x9PxoG+t/nDL6UMMQ2NIEeFeLkw58Tq/Yn6C5PaP05/dgJBOZnkItFEC+tGXxsYCUpX3h20ghv5
	t6aw=
X-Google-Smtp-Source: AGHT+IGzlMY45l4H9MmCoYjwcAiV3++gDXcOilg1ffh0Ilvj3RYp3ijscjG1JV/MXOTOIUr3wQUdNg==
X-Received: by 2002:a05:6512:6402:b0:539:e1c6:9d7f with SMTP id 2adb3069b0e04-539e1c69ec4mr11334155e87.25.1729154780801;
        Thu, 17 Oct 2024 01:46:20 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 04/11] oeqa selftest uki.py: add tests for uki.bbclass
Date: Thu, 17 Oct 2024 11:45:45 +0300
Message-ID: <20241017084552.182136-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205999

Tests builds and boots qemu into uki binary with systemd and sysvinit.
Due to depedency to x86 specific ovmf UEFI firmware, tests
are specific to x86 curently. UEFI firmware for ARM can be generated
via qemuarm64-secureboot machine in meta-arm and similar tests
on qemu will pass.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/uki.py           | 133 ++++++++++++++++++
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
new file mode 100644
index 0000000000..4121a094dc
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -0,0 +1,133 @@
+# Based on runqemu.py test file
+#
+# Copyright (c) 2017 Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
+from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.core.decorator import OETestTag
+import oe.types
+
+class UkiTest(OESelftestTestCase):
+    """Boot Unified Kernel Image (UKI) generated with uki.bbclass on UEFI firmware (omvf/edk2)"""
+
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
+    def test_uki_boot_systemd(self):
+        """Build and boot into UEFI firmware (omvf/edk2), systemd-boot, initrd without systemd, rootfs with systemd"""
+        image = "core-image-minimal"
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
+        cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
+        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
+            cmd += " kvm"
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
+MACHINE_FEATURES:append = " efi"
+IMAGE_CLASSES:append:pn-core-image-minimal = " uki"
+
+# uki embeds also an initrd
+INITRAMFS_IMAGE = "core-image-minimal-initramfs"
+
+# runqemu must not load kernel separately, it's in the uki
+QB_KERNEL_ROOT = ""
+QB_DEFAULT_KERNEL = "none"
+
+# boot command line provided via uki, not via bootloader
+UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
+""" % (image))
+
+        uki_filename = get_bb_var('UKI_FILENAME', image)
+
+        bitbake(image + " ovmf")
+        with runqemu(image, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+            # Verify from efivars that firmware was:
+            # x86_64, qemux86_64, ovmf = edk2
+            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
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
+
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
+    def test_uki_sysvinit(self):
+        """Build and boot into UEFI firmware (omvf/edk2), systemd-boot, initrd with sysvinit, rootfs with sysvinit"""
+        config = """
+# efi firmware must load systemd-boot, not grub
+EFI_PROVIDER = "systemd-boot"
+
+# image format must be wic, needs esp partition for firmware etc
+IMAGE_FSTYPES:pn-core-image-base:append = " wic"
+WKS_FILE = "efi-uki-bootdisk.wks.in"
+
+# efi, uki and systemd features must be enabled
+MACHINE_FEATURES:append = " efi"
+DISTRO_FEATURES_NATIVE:append = " systemd"
+IMAGE_CLASSES:append:pn-core-image-base = " uki"
+
+# uki embeds also an initrd, no systemd or udev
+INITRAMFS_IMAGE = "core-image-initramfs-boot"
+
+# runqemu must not load kernel separately, it's in the uki
+QB_KERNEL_ROOT = ""
+QB_DEFAULT_KERNEL = "none"
+
+# boot command line provided via uki, not via bootloader
+UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
+
+"""
+        self.append_config(config)
+        bitbake('core-image-base ovmf')
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-base') or ""
+        uki_filename = get_bb_var('UKI_FILENAME', 'core-image-base')
+        self.remove_config(config)
+
+        with runqemu('core-image-base', ssh=False,
+                     runqemuparams='%s slirp nographic ovmf' % (runqemu_params), image_fstype='wic') as qemu:
+            # Verify from efivars that firmware was:
+            # x86_64, qemux86_64, ovmf = edk2
+            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
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
diff --git a/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
new file mode 100644
index 0000000000..1ea9c8a845
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
@@ -0,0 +1,3 @@
+bootloader --ptable gpt --timeout=5
+part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 512M
+part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
-- 
2.34.1


