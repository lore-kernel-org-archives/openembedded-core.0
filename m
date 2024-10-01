Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B8ECE7CF1
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:29:08 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.76649.1727771343271085598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I93UE4Ew;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so22990421fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771341; x=1728376141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ph6B0GC+X4VXkgg9zSlm0KU4kn6qEnM0IeTYSixch3g=;
        b=I93UE4EwmjCo02owDTsqZjuLxWX6jqg3FNr/nHdB4KbYD+KcZpVyOJlYxG/a/FA0jZ
         gmlGaexca87mMvdfmfiyV7fBeyEe1ArhW0YnyCuUBXuP1eORsyn6oyS2+rjAj0bGHfR3
         n1uuatuW1GYivZmGpmq3uNDO+Vk8AY1wQ9N7Aj6AdtA2f5IzxjMi/aHtckbGPW2MLVNv
         ikwE1GZESf8kW8ms/wnl8TPu1FRJT6xcUwcMlxVnpSnd9zyQl9hvENZkcAyESwHa7qSx
         DrhAKl3wu5hXxL55C0yH6VMEhQS6zPf5JMeI7m02fzOMwZNgJNM2T4zb2KVDMTdlPqjR
         zjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771341; x=1728376141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ph6B0GC+X4VXkgg9zSlm0KU4kn6qEnM0IeTYSixch3g=;
        b=thsQFf0Th0ktLrrI0GnC16XmNZQH/WmS+8CTrUMuM9ZU3AEpE7T2Lj9Wsc1J9FJzaa
         6Nu5TQCoF6JaUFNizInbY9SvSLRyIbL2Vvjnp75axVzb0sNljmP1Zv8F0xF1Me0uEtEF
         VyinR7i3q2MVpcDXWgBIC/qwLfP60xEOZVP0MAoh/W8dguGnu2vcCi9SnP/XMF4KlMYV
         oVjXcotC527JgIrXUuSz8LYYyevHuJ1UQ5dxHXstKY8OuwAxm2Hj16dTjvQCfCx6IbB3
         gz5KyTsTW6kjA6K+b8y4SWrEodi4TDkXouUY3R3WGYtIaw7EeUHmE9q+mds3yMoWDa3g
         z4NA==
X-Gm-Message-State: AOJu0YzNqQaRXXoWZ5l8MdQZlblR4VTjP+nTrtOFWiaCAJE7nIXhYi9g
	DYnPPqtAPP7FnT14JKo4Y0sFP4sfMN4jFloYr2phjEwmoM6yK+i1VIYmb6RysIHPXVt3z1NUx7Z
	P8Fg=
X-Google-Smtp-Source: AGHT+IENQNs29yqSxw3X3h1ledoimjwO3HHQW9u3UVYx5ERRVwm7JgFGj5KfUDBQwEex9qtLbzQEsw==
X-Received: by 2002:a05:651c:a0b:b0:2fa:bda2:ce34 with SMTP id 38308e7fff4ca-2fabda2cf9fmr52628211fa.36.1727771341329;
        Tue, 01 Oct 2024 01:29:01 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:28:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 07/11] oeqa selftest uki.py: add tests for uki.bbclass
Date: Tue,  1 Oct 2024 11:28:17 +0300
Message-ID: <20241001082821.26115-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205141

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


