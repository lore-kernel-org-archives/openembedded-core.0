Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E72CFB45C
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:27:20 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.13914.1728473231931864854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oY2zCnPQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53988c54ec8so7847257e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473230; x=1729078030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ph6B0GC+X4VXkgg9zSlm0KU4kn6qEnM0IeTYSixch3g=;
        b=oY2zCnPQIvnbCGvsghRI6OUdL4YDDO8tlq53qc3jhYl3BRvA7DCLz9QCXWgO1yR8yG
         VkmDrV+5ur1dA+tr5nqgQM5ckT/gaB800pAPtIyn2eiiYsWw6m+IdI9nYCNwed59vCYM
         mpFZGeljsuT368d2R3sF1yDYO+TCp+fioqUHat7FyKoiABo19xf9uvgLSR76BPtTcMFd
         0wZdpF5p2d+gdhBmgPkqSlaKsJyZVrigrzHhJbEBZy7KcGmisxhjNCbDTFJ/rtobiH0h
         JJKeQ0nDM1QxRa2+qV2MJR2Ab4DaELNd/O0cb8CEDRtVkeibVCokr5knCoZKBLEByuyZ
         VFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473230; x=1729078030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ph6B0GC+X4VXkgg9zSlm0KU4kn6qEnM0IeTYSixch3g=;
        b=hMkYWIUdR4DxUYpqNv/ozSgpNhBU0K1gdZmBScNRHc7gVr+HJmvcUYrQFR1qGme2iK
         tOlLLCESbKezi/TWwOW/sY0b7FIfzRJAkjtFL7KMgE/b7S0h6pmVxuQLFu1tOTajJzO+
         9bxaBox1aJd0doV5ly8RP+IlG8JFvXKr7YxFeoHEuNt+WF6Ho4146xQaIJVI33kdNxEa
         Enjby+83gVgZmJK3B1a0PricXC0YBPHlmyotfRzyzGU9ipH6E9+4LJrsscty7O1sKyvH
         e0jpqoHlHwa77DH6wSlWJtflX6/nxbXQXaY9Ye9RISzSnxjr1UpGCMLeSkG6xVBzxjnC
         0QUw==
X-Gm-Message-State: AOJu0Ywg3WqbJn2XpRyfkOptW0oCu4t8+Wwh/FDaIvofzvQC9vyZUAcD
	XOKRI4DGSvCmkKkpbyQH3L3ZuG/5HPVSFVNKD6K5x3MFWRInMkY1kxmhN39YlMlV1a4AU9fTiy/
	hrvQ=
X-Google-Smtp-Source: AGHT+IFlBN0PxmJR+fhZnoYw9CDV984rGQIvgxYk7C1ttVkkD8I2WDmjdFSVwK7nYdNVn5sb5Xu63w==
X-Received: by 2002:a05:6512:e91:b0:539:9527:3d59 with SMTP id 2adb3069b0e04-539c4966984mr1384621e87.52.1728473229954;
        Wed, 09 Oct 2024 04:27:09 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm1449220e87.223.2024.10.09.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:27:08 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 4/8] oeqa selftest uki.py: add tests for uki.bbclass
Date: Wed,  9 Oct 2024 14:26:30 +0300
Message-ID: <20241009112634.402123-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009112634.402123-1-mikko.rapeli@linaro.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205352

Tests builds and boots qemu into uki binary with systemd and sysvinit.
Due to depedency to x86 specific ovmf UEFI firmware, tests
are specific to x86 curently. UEFI firmware for ARM can be generated
via qemuarm64-secureboot machine in meta-arm and similar tests
on qemu will pass.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++++++++
 .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
 create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in

diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
new file mode 100644
index 0000000000..b0e6e52d64
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -0,0 +1,138 @@
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
+DISTRO_FEATURES:append = " uki"
+DISTRO_FEATURES:append = " systemd"
+DISTRO_FEATURES_NATIVE:append = " systemd"
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
+            # x86_64, qemux86_64 = edk2
+            # arm,  = u-boot
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
+            # x86_64, qemux86_64 = edk2
+            # arm,  = u-boot
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


