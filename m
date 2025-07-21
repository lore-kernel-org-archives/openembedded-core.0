Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569F6C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 01:52:19 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.30856.1753062733896399701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 18:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HaqH9F3b;
 spf=pass (domain: underview.tech, ip: 209.85.160.181, mailfrom: vince@underview.tech)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ab71ac933eso31770681cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753062732; x=1753667532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVyXIqnaRLTKZPu721o7FJUReWE4Ybj0ippXF9PwIqY=;
        b=HaqH9F3bH03alJk34avMgd8KOdoH11ppntKcTebR1+Z6FZC46mhf4OHTo4qADRW217
         ECD0ysn+xtA0z6U/6LFxGjR75yHnuZMAznkP9JI2EQaUqhP12LlHGJRXG9DsmE6x7FJ2
         20xtRYNmbos5vnulbCEK8zjdiFCYv9srTuKoAmY/gQHgz1sXPjN21txL0JXWhCOszSKA
         fAwntzvMlOKiUBRP9+4PFp7NTbV9qaM5uxFbdPkdBqGapn8QOs2gXuBDxsqiEUmSdESo
         d8fktRwjAU5vPJdAlsOrWzkjFRHUuHd13kB0Pzq5QETfzo6Z6YJpMSg5awW443s+0CdP
         +sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753062732; x=1753667532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVyXIqnaRLTKZPu721o7FJUReWE4Ybj0ippXF9PwIqY=;
        b=uqK7L8fSq3umciYoSiLtgamz+dFR8XD3Dun5GXL/d/ioLXomIVpi6CnZJ50/LZHyEk
         raf8eR1r6s5HuXSIxv1SXmGyV+GHJm8fgDO9wIMJ8SnDKfLkGkrbbxJpnfactRXXV8Zi
         Vn/OFyMt+XiaF4hGv4yCDps1D5n+rh2EmzZxSec5++v/zlKr2/Vsd+6oVkz2hwpfogp1
         mjoIaHe7tZpKj0NXLnMvfOp5p50fj7Wr3xI9zCXxlIT485wAgmY5aJ2+0oRCeETTaxmu
         CA01ZLhpygT0QQJrVx6TGVS//1pe2cu9aVBwlCOXQd/kYEimJC9pil6FddxGRddAlbkG
         sFmA==
X-Gm-Message-State: AOJu0YywhkGtLJKtC1Uov3DsRcg5nd7zzsQuAbBIjDNUQ55gLfjEPbZW
	tivs3IcpjjfK5z5UTjqTPh6BkiA8E6SlfwheaYdFVR9Siqrn0A0qzVmgyxHksHQpoCKSkctpFEI
	yLbhN
X-Gm-Gg: ASbGncv4l5f7w2KU6hUAmC3L2ZMkz6oTiwdzBPwg1zTf1muNwLlRRmuofw5Bn5HHkUr
	DnUd0lg/N7Yeonpt75ptxNkvvIsUvq6GAbiNBh7fSH4bSqS/tbNiuLFu2T0+YjqipWC2GHruCNF
	EjwATnSG8Ym7/L4jpvPvxLa2lCavV07AQ8lOBDMiBvUvW1uv11G1ri27xoMwM/l6U5KSR8LffXD
	GdKu3NMwIk2rh0F0EicUcX8VqcGMf08gYvt33nN7V9pO9ViVHpWi1/4uXeDLn1vvVRJF0Cl2atI
	DDDkL5fhCABFFIsKPQoPyBQi88q0Trn9Fuy+IJOzMA3nWRoQvBZvMg0/KAtBSao/EEUX4JT7TLR
	ogQEv+Ax5VHw=
X-Google-Smtp-Source: AGHT+IHfnlr1lF1hIANxicFe4NfeMDqLWeqAkdso+ijq3ADuRz6FfGR2IZ1/5cjMQbr5cz6W59b3hg==
X-Received: by 2002:ac8:7c47:0:b0:4ab:7daa:d84a with SMTP id d75a77b69052e-4ab93dc1722mr282904531cf.43.1753062732440;
        Sun, 20 Jul 2025 18:52:12 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::b05c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb49d0513sm36039741cf.33.2025.07.20.18.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:52:11 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 2/3] wks: add loader-bios to bootimg_pcbios source_params
Date: Sun, 20 Jul 2025 21:51:42 -0400
Message-ID: <20250721015141.3599063-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721015141.3599063-2-vince@underview.tech>
References: <20250721015141.3599063-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220651

source_params['loader-bios'] is required
for newer updates to bootimg_pcbios wics
plugin.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 2 +-
 meta-selftest/wic/overlayfs_etc.wks.in                  | 2 +-
 meta-selftest/wic/test_biosplusefi_plugin.wks           | 2 +-
 meta-selftest/wic/test_rawcopy_plugin.wks.in            | 2 +-
 scripts/lib/wic/canned-wks/common.wks.inc               | 2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks           | 2 +-
 scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks  | 2 +-
 scripts/lib/wic/help.py                                 | 4 ++--
 scripts/lib/wic/plugins/source/bootimg_biosplusefi.py   | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 4186b16517..b0471b59ed 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -2,7 +2,7 @@
 # long-description: This image contains boot partition and 3 rootfs partitions
 # created from core-image-minimal and wic-image-minimal image recipes.
 
-part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux" --ondisk sda --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 part /media --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label uuid-test --align 1024 --use-uuid --fsuuid 2c71ef06-a81d-4735-9d3a-379b69c6bdba
 part /mnt --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
index 8375d73a9c..89f2771e49 100644
--- a/meta-selftest/wic/overlayfs_etc.wks.in
+++ b/meta-selftest/wic/overlayfs_etc.wks.in
@@ -1,4 +1,4 @@
-part /boot --active --source bootimg_biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
+part /boot --active --source bootimg_biosplusefi --ondisk sda --sourceparams="loader=grub-efi,loader-bios=syslinux" --align 1024
 part / --source rootfs --ondisk sda --fstype=${OVERLAYFS_ROOTFS_TYPE} --use-uuid --align 1024
 part --ondisk sda --fstype=ext4 --size=5 --align 1024
 bootloader --ptable gpt --timeout=1 --append="rootfstype=${OVERLAYFS_ROOTFS_TYPE} console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
diff --git a/meta-selftest/wic/test_biosplusefi_plugin.wks b/meta-selftest/wic/test_biosplusefi_plugin.wks
index 4be6643a6f..ef31ad20c4 100644
--- a/meta-selftest/wic/test_biosplusefi_plugin.wks
+++ b/meta-selftest/wic/test_biosplusefi_plugin.wks
@@ -1,6 +1,6 @@
 # short-description: This file is used in oe-selftest wic module to test biosplusefi plugin
 
-part /boot --source bootimg_biosplusefi --sourceparams="loader=grub-efi" --active --align 1024 --use-uuid
+part /boot --source bootimg_biosplusefi --sourceparams="loader=grub-efi,loader-bios=syslinux" --active --align 1024 --use-uuid
 part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
 
 bootloader  --timeout=0 --append="console=ttyS0,115200n8"
diff --git a/meta-selftest/wic/test_rawcopy_plugin.wks.in b/meta-selftest/wic/test_rawcopy_plugin.wks.in
index ba324d9980..cb25acf0c6 100644
--- a/meta-selftest/wic/test_rawcopy_plugin.wks.in
+++ b/meta-selftest/wic/test_rawcopy_plugin.wks.in
@@ -1,6 +1,6 @@
 # short-description: This file is used in oe-selftest wic module to test rawcopy plugin
 
-part /boot --active --source bootimg_pcbios
+part /boot --active --source bootimg_pcbios --sourceparams="loader-bios=syslinux"
 part / --source rawcopy --sourceparams="file=${IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL}.ext4" --use-uuid
 
 bootloader  --timeout=0 --append="console=ttyS0,115200n8"
diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 4a440ddafe..673bd15725 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
-part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux" --ondisk sda --label boot --active --align 1024
 part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
index cb640056f1..07040d316c 100644
--- a/scripts/lib/wic/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
@@ -3,7 +3,7 @@
 # can directly dd to boot media.
 
 
-part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux" --ondisk sda --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 
 bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
diff --git a/scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks b/scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
index 4fd1999ffb..fb51a22283 100644
--- a/scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
@@ -15,7 +15,7 @@
 #
 #   - or any combinations of -r and --rootfs command line options
 
-part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux" --ondisk sda --label boot --active --align 1024
 part / --source rootfs --rootfs-dir=rootfs1 --ondisk sda --fstype=ext4 --label platform --align 1024
 part /rescue --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext4 --label secondary --align 1024
 
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 2e3061f343..5b170594bb 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -544,7 +544,7 @@ DESCRIPTION
     the --source param given to that partition.  For example, if the
     partition is set up like this:
 
-      part /boot --source bootimg_pcbios   ...
+      part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux" ...
 
     then the methods defined as class members of the plugin having the
     matching bootimg_pcbios .name class member would be used.
@@ -794,7 +794,7 @@ DESCRIPTION
 
      Here is a content of test.wks:
 
-     part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+     part /boot --source bootimg_pcbios --sourceparams="loader-bios=grub" --ondisk sda --label boot --active --align 1024
      part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
      bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
diff --git a/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
index 4279ddded8..2687217ad2 100644
--- a/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
@@ -71,7 +71,7 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
     plugin, as long they does not cause issue in the other plugin.
 
     Example wic configuration:
-    part /boot --source bootimg_biosplusefi --sourceparams="loader=grub-efi"\\
+    part /boot --source bootimg_biosplusefi --sourceparams="loader=grub-efi,loader-bios=syslinux" \\
                --ondisk sda --label os_boot --active --align 1024 --use-uuid
     """
 
-- 
2.43.0


