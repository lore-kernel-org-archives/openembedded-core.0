Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81506CA0EC0
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 13:46:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.18144.1754315191600495558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 06:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fts3PEUm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458bece40fcso9444865e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754315189; x=1754919989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbGMXdpHmzw898yzv148hsbFQ/n09JJCdcBVMEuKuCU=;
        b=Fts3PEUmoW8mCP3ULoLc3RWuE/fuk/2yMMw7NXIKyPWnVwhWzD30+KTgOJfwbxQpZt
         1HO88Rbf9ksi84F1eke8gPIuOkz79wwVXpNClMHzIOCLG0NhFG7isJFI++ONFSDLLdQR
         4Px4cf11Ev66DmP8Wy9P5S36a6wR6Ma/U75Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315189; x=1754919989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbGMXdpHmzw898yzv148hsbFQ/n09JJCdcBVMEuKuCU=;
        b=O7SBoBGpM73sPTzL3uwX0I/JIU79qm5rbjbEMnA7DTYXLmUz7Yz/iJ0AImMHfqMruR
         CoNEX1f2SBHd6zC6GmXOpNmDtFEQoPMR7ahiwqYUZ3FdVwGG4G8BrQ2c4JADIgPeuXry
         Q+BWYJI5nQSqhQI+nU25Io/owT7F840C+IgdN/oqcMGSFv/JO+dH8HschiPkT/zDBRbd
         jZoN5zZlZAgkTUrIxMbJXffbcgcmVgurb78dV8Xj53oATxkIsFKKh2dK5Ch0KnLVsW7q
         DtoLr+MgLwjHsAAbU6i41yOQjcq8eEMNY0v0I+JkqGnCPy9wk4AptUxZRW8EI76EAmCS
         mSVw==
X-Gm-Message-State: AOJu0YyMohnRH6TG9Zx10sZ43m1LiZuyRCiNK5VqTVxwLrhrkovrr1IC
	kLYd6VWBg0ReA9brURC3jpbUHgmTYho0+fn8Ft+g3LBWbAo0Bcc5bCEfa5ioooc1VSDnE5niGvx
	kWBWD
X-Gm-Gg: ASbGncu40Q0rxr7ZpxHW+3sR7d3Menk4TyW1k2BEOFN8Si6LJg7hhSDK/qM8UyzDORN
	IsAN+MwV4NI/xZmJchZieMg7/SgiVKLoBt+jOoDvysgCGlfAQsFu+2SlfaaPOTLJsrIM0SOrMcE
	URWDCDsttpVP7viaqZ5k+wmbQZSczGHv2LJyHmd44fokUCM7+1eIRootXqosp6uuAZNUh4Q0AbU
	unBkW/JPwDGsxi3YProLMr6+qpcnfhAMVmpw12wuDjQ4YgpMmHA4opyplA9SAe59Z6z9ZXzPW3T
	iw1xkj+XZkfUGLYNru9z14znv2EhK/7vk/EpDMyxPfK6kzPTDoBz2fGXzqHV13QYxvrBfNkO62i
	+sdblxU6pJW5Lbo+xj2fXO/DoZDklNnr1cQ83uyZbGcR1L4qVaY4=
X-Google-Smtp-Source: AGHT+IHtGmFcXQqJz3qUo0kR6aZqB7UO6n+ZEP0HwvODspqFGjgXL2Rw1Njw65l7wC+4m/lWfZIJdA==
X-Received: by 2002:a05:600c:17d8:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-458b71903edmr46945815e9.8.1754315189436;
        Mon, 04 Aug 2025 06:46:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c76:58bb:66fc:3164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b4f9e952sm104869005e9.9.2025.08.04.06.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:46:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] bitbake/conf: Default to zstd compressed image output
Date: Mon,  4 Aug 2025 14:46:24 +0100
Message-ID: <20250804134624.1412716-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
References: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 13:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221431

Switch our default qemu images to use .zst compressed images by default
since this is the output format we release during the release process
and is the one that users would prefer to download. This makes the release
process use the actual generated output from the system and avoids post
processing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../multiconfig/multiconfig-image-packager_0.1.bb           | 2 +-
 meta/classes-recipe/qemuboot.bbclass                        | 2 +-
 meta/conf/bitbake.conf                                      | 4 ++--
 meta/conf/machine/include/qemu.inc                          | 2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
 meta/conf/machine/include/x86/x86-base.inc                  | 2 +-
 meta/lib/oeqa/selftest/cases/gdbserver.py                   | 1 +
 meta/lib/oeqa/selftest/cases/runqemu.py                     | 6 ++++++
 8 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
index d7785cee2e1..f6cf0a47c89 100644
--- a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
+++ b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 MCMACHINE:virtclass-mcextend-musl = "qemux86-64"
 MCMACHINE:virtclass-mcextend-tiny = "qemux86"
-MCIMGTYPE:virtclass-mcextend-musl = "ext4"
+MCIMGTYPE:virtclass-mcextend-musl = "ext4.zst"
 MCIMGTYPE:virtclass-mcextend-tiny = "cpio.gz"
 
 MC_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 0f80c60ab58..69cd12ec545 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -97,7 +97,7 @@ QB_MEM ?= "-m 256"
 QB_SMP ?= ""
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}", d)}"
-QB_DEFAULT_FSTYPE ?= "ext4"
+QB_DEFAULT_FSTYPE ?= "ext4.zst"
 QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_OPT_APPEND ?= ""
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fb26e72669c..fad397776e0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -839,8 +839,8 @@ include conf/bblock.conf
 
 DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
-IMAGE_FSTYPES ?= "tar.gz"
-IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
+IMAGE_FSTYPES ?= "tar.zst"
+IMAGE_FSTYPES_DEBUGFS ?= "tar.zst"
 
 INITRAMFS_FSTYPES ?= "cpio.gz"
 # The maximum size in Kbytes for the generated initramfs image size.
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index c143e37f710..79016ad9cce 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -8,7 +8,7 @@ MACHINE_FEATURES = "alsa bluetooth usbgadget screen vfat"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-IMAGE_FSTYPES += "tar.bz2 ext4"
+IMAGE_FSTYPES += "tar.zst ext4.zst"
 
 # Don't include kernels in standard images
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base = ""
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 65cbfd66ee4..35961272022 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -11,7 +11,7 @@ KEEPUIMAGE = "no"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
 
-IMAGE_FSTYPES += "ext4 wic.qcow2"
+IMAGE_FSTYPES += "ext4.zst wic.qcow2"
 
 WKS_FILE ?= "qemuriscv.wks"
 
diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index fc6c39148db..fc8200d8f09 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -8,7 +8,7 @@
 MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
                      acpi serial usbgadget alsa"
 
-IMAGE_FSTYPES ?= "wic"
+IMAGE_FSTYPES ?= "wic.zst"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index b6b7c5c4733..1c713331900 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -19,6 +19,7 @@ class GdbServerTest(OESelftestTestCase):
 
         features = """
 IMAGE_GEN_DEBUGFS = "1"
+IMAGE_FSTYPES += "tar.bz2"
 IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
 CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
         """
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 74d47a6db1b..7ed89e80de8 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -195,6 +195,12 @@ class QemuTest(OESelftestTestCase):
         cls.cmd_common = "runqemu nographic snapshot"
         cls.qemuboot_conf = "%s.qemuboot.conf" % (cls.image_link_name)
         cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
+
+        cls.write_config(cls,
+"""
+IMAGE_FSTYPES += "tar.bz2"
+""")
+
         bitbake(cls.recipe)
 
     def _start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeout):

