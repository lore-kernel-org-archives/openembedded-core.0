Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA95CF3957
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:53 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.21528.1726756672328595353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=L1Qtale3;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53654e2ed93so1160055e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756670; x=1727361470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ls3jxLuz1JCKMCjAs0zwSaBBboNoGcmmpkKK9zS+Geg=;
        b=L1Qtale3C5VWslPAyff7WCmYlLiYgyTMkaXnGwSSXM63vi3N8pGzKd2h9b1wE9FEak
         d4XoQ+l3u6D1aCsa5JwovVvpcsz04tPhAh+JmAKjWu6wNG4fmuDIHOVA2WZISxz/J8vs
         dB4rShyaO3e5MXR0jiUuxhfuTvav7YwvK+bf+EsBmQT7dA5xxsgBiYXDKuwbmYEVKo7G
         QeS24HkyaPnfO6UyRnqApVh54DVXqEdUpxl1LSMIyJBAWqZAp/V78z3TuBr4bFdrVA82
         T/P0QRGQJTgylRHhMYjIPHESEwKmNvtNWygzcqfYajrBTUM8KKp5h3U/RJO8XcTngLiI
         QC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756670; x=1727361470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ls3jxLuz1JCKMCjAs0zwSaBBboNoGcmmpkKK9zS+Geg=;
        b=TntgSbv5dneVr2sGkkFQjqLLZwhyheRPpLE7/krRfDzbAz1nIOK+CEJ8uCIh2sMQer
         7fGM0Kja9laWWgv6+3FG1QCx+N98tB0ijq8yVT2T45S0LxMuoI1cw2kuxRXOdAGPNT01
         8Gondo0SQIJ/wsEApZZZpXJlCwuxXSxy/81zUWih+bJfnG6Rh/79dJwPi6yCorGpV+kl
         kJyicqy3ypHsNtsaeKSaHOtVLXxjUdvnokS24EzEp4d2018ODMZkKZ6wiQqdnaamkEij
         bIq+NVxJjkH2PkrTDW89llub/V5Rm/GEn7GHy/zX2TcvvzlL9c6Z3P1/ckVA+b8Ubjgg
         FGnw==
X-Gm-Message-State: AOJu0Ywttgu0jS9y0rT8Dx+dQdVVFYgXJUCl2t7p1KB553X6jQIT9MrN
	ud+xzqd1XhUVoM6grA9bEm0DJwb5ILxrCRexs7SievyZhqduTa5elG/gcd3NH2eMiCeSX3chePb
	5GsU=
X-Google-Smtp-Source: AGHT+IHg7Wi7/rhzigZGN6jR9l0Bv0sT/jtv3g7LjC0wNdy2OZ3a9ABos3/Pfa385Jj0JvZknbwXwA==
X-Received: by 2002:a05:6512:280d:b0:52e:7f09:aaae with SMTP id 2adb3069b0e04-53678fc85e7mr13767196e87.27.1726756670427;
        Thu, 19 Sep 2024 07:37:50 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:49 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 08/12] oeqa selftest uki.py: add tests for uki.bbclass
Date: Thu, 19 Sep 2024 17:37:02 +0300
Message-ID: <20240919143706.6074-9-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204700

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
index 0000000000..a2d2ad6efc
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
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image)
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
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-base')
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


