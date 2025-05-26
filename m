Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD02C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:36:20 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.24707.1748248578323330376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 01:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FFkalFbY;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55324e35f49so251122e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248576; x=1748853376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2T77bfYVyCfAmV9km7HpWHOyprzOWi89Z7O0baXSd8=;
        b=FFkalFbYYg9HP5B8PaBqmrcxaUsY+U3rFRawkJWoVL6NCJV1/gu0neYVAq/6IkKhBM
         tdspYHK7qsZ5TRCkwKXOnbRnhPjIHmRz5RhApjP0Cd9KV0NS4s3ZU7j/ksUdITSGuVxl
         15SsZ8mJhwtHCS51efG/ALKCZWI9Nf5Y0aBm1X8DA/owkAZRylkfJwe8VeMD4Noe+cl9
         o6ME2fjbVoxH9qLpvXWc8r3GYb4kXHXZYnIXb0hyVgtaeeIR7i04UZAte5kP5jREJrzM
         gWJVJ/fICdlxnE5ohAMPcojlfEDNbzTatRV2mAw9R2vFWDInBd9cPHqbXVXnI2VYlOTd
         NxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248576; x=1748853376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2T77bfYVyCfAmV9km7HpWHOyprzOWi89Z7O0baXSd8=;
        b=cBRN/uw+lU9OPl8Ad2E+JUcar4xDC2WFbuEvP+lBMNpylvZ3sZ211+mDCKqPBTCNdO
         ojNg9oaMCe53AHCt5/3cJh8sDZ8H3PmyXPYpcQr9Blx9fod/Q7Snii9h++IWaqeikXMe
         gwhwfrsaKtmigJLLQJEH8dadFV9CxSnvwr639puTbuVc4q2d0QLqPFn1PQPWf6Xvv5qt
         l6VPXvJtqulX4t+RusXQ3SRs6rxdiloGl932z40hlyPKfXzyv/h4JplT0ZMFYv68+Wu5
         fOzNOOJTzyDEr619t0TGQvdpWcrel34N8i0+JfWUj5wCS2gO1m25njhD91b2aGvu92Rg
         MNAA==
X-Gm-Message-State: AOJu0YypMK3O/1XiKsMMmLl4VQ4ctbhVyl9vmYdUcoDU6LsM4nJbWO1x
	RfuDuM26fej4kyoaWuM5NyvIms5NKXTZr69eeXDhY0n5iahG7KnBIkf45DRDufmIbNMcIDm4Ha9
	0isUoBCU=
X-Gm-Gg: ASbGncurOqwefgaQRmFsjKTeobB+7J8dO4E8E/mYShBRK6hYCqz8HG5nKek8NObGWX2
	Q41SmwTJepAe2Z6rOgr7eS0UHJPkJzgiwXiqSqRz+fS05SEPW0DanOUg9RPvjRmrkhjanLH4Ess
	xwfKEsxgfYSVIiWY7BO0lHFFMo7C1/AllxkTMXNqNA/2tTrawB0VlawnAv8B7Z4vQ9arE1cH7ks
	/PhlxSS83WUpuIEUt4pQCGVYLw3SSWFCWptTdBueDNQdytyyzx/Q4xxroOrx4OjArCSccmJ4WbW
	4PpeywvdalEELUA5ufBljqipmGmqaVXZi8KKJdME9yZwy2+DhT6BVo2oUoGxMAOvEfrs/XJojIe
	pr/R4ph7XbGvqTyYsNp8AVaykNghU+VL99NFHeIQ=
X-Google-Smtp-Source: AGHT+IHwWiPoDk4NXrqaDXqrlE4LI3HRDO+1FPsS6En+7tMxquTRalrk3KMcQYYh7IuREUam0sXDBQ==
X-Received: by 2002:ac2:4c48:0:b0:54e:9cb0:5008 with SMTP id 2adb3069b0e04-5521c7b08b5mr2247815e87.32.1748248576368;
        Mon, 26 May 2025 01:36:16 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6502c667sm1271651fa.101.2025.05.26.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:36:15 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 4/4] oeqa selftest uboot.py: add qemu KVM test case
Date: Mon, 26 May 2025 11:35:47 +0300
Message-ID: <20250526083548.413834-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526083548.413834-1-mikko.rapeli@linaro.org>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 08:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217260

Add a test case to boot target system via u-boot
using qemu with KVM. This was broken recently
and workaround proposed to u-boot. Test case
works with genericarm64 and qemuarm64 target machines
compiled and tested on aarch64 build host with KVM
support.

Test execution time with full sstate cache is
around 170 seconds. qemu boot itself takes just
a few seconds to full userspace.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 61 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

v4: use skipIfNotBuildArch, variable for image name except config where
    bitbake syntax causes python parsing errors when replacing variables,
    check that target host arch and build arch are the same for KVM to work,
    fixed QB_DRIVE_TYPE syntax to include /dev/ path,
    tested on aarch64 build machine and genericarm64 and qemuarm64 target machines

v1: https://lists.openembedded.org/g/openembedded-core/message/217107

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 96da4efb06..cd9c74f52f 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -6,8 +6,8 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
-from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars, runCmd
+from oeqa.core.decorator.data import skipIfNotArch, skipIfNotBuildArch
 from oeqa.core.decorator import OETestTag
 
 uboot_boot_patterns = {
@@ -41,3 +41,60 @@ QEMU_USE_KVM = "False"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(status, 1, msg=output)
             self.assertTrue("U-Boot" in output, msg=output)
+
+    @skipIfNotArch(['aarch64'])
+    @skipIfNotBuildArch(['aarch64'])
+    @OETestTag("runqemu")
+    def test_boot_uboot_kvm_to_full_target(self):
+        """
+        Tests building u-boot and booting it with QEMU and KVM.
+        Requires working KVM on build host. See "kvm-ok" output.
+        """
+
+        runCmd("kvm-ok")
+
+        image = "core-image-minimal"
+        vars = get_bb_vars(['HOST_ARCH', 'BUILD_ARCH'], image)
+        host_arch = vars['HOST_ARCH']
+        build_arch = vars['BUILD_ARCH']
+
+        self.assertEqual(host_arch, build_arch, 'HOST_ARCH %s and BUILD_ARCH %s must match for KVM' % (host_arch, build_arch))
+
+        self.write_config("""
+QEMU_USE_KVM = "1"
+
+# Using u-boot in EFI mode, need ESP partition for grub/systemd-boot/kernel etc
+IMAGE_FSTYPES:pn-core-image-minimal:append = " wic"
+
+# easiest to follow genericarm64 setup with wks file, initrd and EFI loader
+INITRAMFS_IMAGE = "core-image-initramfs-boot"
+EFI_PROVIDER = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd-boot", "grub-efi", d)}"
+WKS_FILE = "genericarm64.wks.in"
+
+# use wic image with ESP for u-boot, not ext4
+QB_DEFAULT_FSTYPE = "wic"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+QB_DEFAULT_BIOS = "u-boot.bin"
+
+# let u-boot or EFI loader load kernel from ESP
+QB_DEFAULT_KERNEL = "none"
+
+# virt pci, not scsi because support not in u-boot to find ESP
+QB_DRIVE_TYPE = "/dev/vd"
+# qemu usb causes u-boot reset atm
+QB_OPT_APPEND = ""
+""")
+        bitbake("virtual/bootloader %s" % image)
+
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
+        with runqemu(image, ssh=False, runqemuparams='nographic kvm %s' % runqemu_params) as qemu:
+
+            # boot to target and login worked, should have been fast with kvm
+            cmd = "dmesg"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(status, 1, msg=output)
+            # Machine is qemu
+            self.assertTrue("Machine model: linux,dummy-virt" in output, msg=output)
+            # with KVM enabled
+            self.assertTrue("KVM: hypervisor services detected" in output, msg=output)
-- 
2.43.0


