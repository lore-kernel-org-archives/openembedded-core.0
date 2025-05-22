Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB963C54F2E
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 13:41:49 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.24223.1747921304467685169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 06:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Tza/tx2z;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551efcb745eso6140178e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747921303; x=1748526103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGbRSpk+6J6LvdN+BrsYwKjqv9SLszmpHOiD/IQOlI0=;
        b=Tza/tx2zB8+t3W+BHODPT5O8unbUG007str66SpSLpJ3vxLK4A297hrWPNRiUmgJ31
         0RpuOQyKkqpVBMWNbHJ/z//v51S9eI8++7QiUJCu1eqKl14EACPw0bMc2uFAq+SNG2a/
         p2L5D+/YzwhPWB+PEb14Uh4/XGw6RBXSfhM52WHloHnjAELjxJEEI9asV7f0o0gzHwn6
         4xv7XGwAd+JeY0LpalVBMvOsMmP/uaXS5xQNfwWVyje6J/9WQX5P3BCBSkEmmWuOUQO7
         J1Gzs85KG352kxhbrdYnPHqwNUtGu0qxm9L4k9XXPv7yny3dg63RZtynmZITPJ+5s3Hn
         vW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921303; x=1748526103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGbRSpk+6J6LvdN+BrsYwKjqv9SLszmpHOiD/IQOlI0=;
        b=KQo5BwnW6MDLVx46xwyiLnvLBKbapiJb/HzBzueBN/WfN58O2ey5n8jXfyNKQahcTm
         lQb4gJrFInOWiVKJTXzbKi86q3VGl+j8i8CQSHcNtzJMSvDSfw5U32YzodzGIzFpgap2
         7N51UoVI0ajV2rhy5AcCEXrclSat44WK6FMTxx1nu6zKDsEvW1dtqFvui/AnK9S+JeZS
         dftBTiyRoW8DzhWYUbua2YT7m6YRqMCV3p+KJFUEqHUDn/UdnaY8DaviZ+1wT1KpbFUw
         7CJhL12uT/QRqD/zojkLjDdNpQ5I8BullX32TcqFVmjiLRD+S2eRFyTEQyLXuZhD/LN0
         yAtQ==
X-Gm-Message-State: AOJu0YwMMf9iJh86+Z263qajHTonc1mIbeGz6hccQVdF001TCIhIOWhr
	me0qO9+tCZqemw3gt2Chm3ixHJveYru+UmgXEzuLoaCDmEjyZX3X07X/Qe+MyCqqPq/2DJkhUYX
	wJ4tE6mTbyhI+
X-Gm-Gg: ASbGnctwi+miEajuNLdbeuDRcJSKL1pEEKCyn5KF4IutXQNZzVSHtgXsbUa3Za/ukZe
	7NjbJUknwZT5qqAcLHtdjvRNtshZ7v8e/LqBSv6xo1EvKbiQM3SXu+NA9Uz75VvWcIhF4vN8G5D
	Ku4g29NrjXajCJMdRcGYvD6nCrfBWZrZelQCx7N1jk0zshvIpKQbYWC4NPoVC3jwNPgM99Qk5b8
	glmdaCNuDD7uB+Kvv5Ie3QfzuSkAGOfuccrCNZ8xL6XsoS7apqXIRjy84xdo/qFIB8kycc3l2ys
	p/eNNvswg609uSZPXl65oaBADVNSQp1yyI3lePl2gyo6yXsQPMhH9o//doXSd5VLEG9Ou/uGxxJ
	XidxdZvaPLVwMWW8G+FFuG5bNVT7v
X-Google-Smtp-Source: AGHT+IFIENZafwysglUwf3QKblsLsxsMC1SvygTkxA+lV8CQWxRp4f3q+UzDzDRYosQFthxgWzVzfg==
X-Received: by 2002:ac2:4e07:0:b0:550:e04d:2b81 with SMTP id 2adb3069b0e04-550e71d6d08mr8015156e87.27.1747921302499;
        Thu, 22 May 2025 06:41:42 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15f8fsm3410312e87.37.2025.05.22.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:41:42 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test case
Date: Thu, 22 May 2025 16:41:16 +0300
Message-ID: <20250522134116.254270-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522134116.254270-1-mikko.rapeli@linaro.org>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 13:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217107

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
 meta/lib/oeqa/selftest/cases/uboot.py | 55 ++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 39e48f8bdb..982822b389 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -6,8 +6,8 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var
-from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
+from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
 from oeqa.core.decorator import OETestTag
 
 uboot_boot_patterns = {
@@ -42,3 +42,54 @@ QEMU_USE_KVM = "False"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(status, 1, msg=output)
             self.assertTrue("U-Boot" in output, msg=output)
+
+    @skipIfNotArch(['aarch64'])
+    # Also works on genericarm64 but no way to encode that currently
+    @skipIfNotMachine('qemuarm64', 'KVM depends that host and target architectures match, e.g. aarch64 and qemuarm64')
+    @OETestTag("runqemu")
+    def test_boot_uboot_kvm_to_full_target(self):
+        """
+        Tests building u-boot and booting it with QEMU and KVM.
+        Requires working KVM on build host. See "kvm-ok" output.
+        """
+
+        runCmd("kvm-ok")
+
+        self.write_config("""
+QEMU_USE_KVM = "1"
+
+# Using u-boot in EFI mode, need ESP partition for grub/systemd-boot/kernel etc
+IMAGE_FSTYPES:pn-core-image-minimal:append = " wic"
+
+# easiest to follow genericarm64 setup with wks file, initrd and EFI loader
+INITRAMFS_IMAGE="core-image-initramfs-boot"
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
+QB_DRIVE_TYPE = "vd"
+# qemu usb causes u-boot reset atm
+QB_OPT_APPEND = ""
+""")
+        bitbake("virtual/bootloader core-image-minimal")
+
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic kvm %s' % runqemu_params) as qemu:
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


