Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DB1EEC29A
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:35 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6360.1771883429738537222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/60Dmu9;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89577f866d6so61573336d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883428; x=1772488228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF3uxXUk8lnfdOyMK/QowLhBUlO9fU7Q9Dw1rsZ3npc=;
        b=j/60Dmu9PuHA2fuFn2prhymK8BIyVZ5R8t384LzDoPuYovTZUytVzZHtjmpIBdDOHI
         dYcvud6MmrhdCsP2UWO91G/Lscud2rA84aB0oRMcOt8MV2+gaXYy3gpw/8VX7uvm1/KG
         ZFu6+7d23Z3aHkNJx+qpZfQMWT26Y7KhOXUPMORJWbzLmwEgqznJKAxlcKpglgAx61HD
         i88Iq9BtZjKoGrfQilQ8XBjZOUqe2IWVLcIEUzyzv4mTCeaznQ7ue3VwSOOiKVP3Cddz
         YAGHU4N44bNdAL6SeIXuc+cOjO/V/tIIvZw070YeawLui8xkg7/uJKbiF13DWut1Ryqs
         Vgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883428; x=1772488228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RF3uxXUk8lnfdOyMK/QowLhBUlO9fU7Q9Dw1rsZ3npc=;
        b=U7JKox0VEgGYhdwGzLyASkvFdaLs5XYeShRKay9DxG8ImwsXg7QG2iAffqtARb19l1
         UJYznK6ruJnhlHVAWWy1qVKA+3h+fuuSeLJY143D/gz3JOWeRoBgiqRWbTOau23xLFvn
         e3dj4Z5UehpKdk/5TSVzegZk0542RufSIUKS7+U8Mktn3SZ7i8NZSm521o3fXD/IXOxW
         3BPqsxewtZRSmVkbKcgrOqmMsRyR2dFvsvagSo7hevVjKpuorKvrJm7sPWYDcWcxmZUY
         Muc+6CHGoQWTr/kW0lu0lP82X81MqfaK+1Q4iWGuiyh4Q/XUrpXCfnWaVZl0+UvS3pdH
         QiGg==
X-Gm-Message-State: AOJu0YwsbtbuJLwMaEvFL3i0LRxamrRjTg90VUtMl7J9YVrgj74ejXln
	pS/hr0j34AJ8K12+eRr1I4TIS0+BjqByd6KX0UnORKLOwNhy6LlcVQf1gM09Gp+W
X-Gm-Gg: ATEYQzy5Vd1LGcJPq7C0vKoXX2tINHNvscGsCdeePzV3RXK3szbKjJwnz6YXzF4aSB5
	6exTyExZjYJv47DHCYOT6UCMzVeASaKH0sVozfGm6uEaMev9xW7U3y8nbuDLStVJRYXPS3+SThF
	YATnYdArwR3ZaH0CBQTXU+1mQlxW981f2Ggvh5IEQ7tgnxwx7IiRXdLK7dLFaZHWj79PGJdVEzV
	CAROjodlbeIrQyKhQN/d90I82A9vIhq3Wft76QF0fZL4WI9h6nZ3m5lZKb0m54AKmCncCf4BYWF
	Tf6L9TYmIwoWCrIBPbThP5raUXqGkW2VCEreKs+yjGUgUJJv9dKbwK0LvzRRw/2EsRCQb4skAVc
	efGWm+wAdV7iSzNUZvPeG+52C654OLFaXIyxZ78o2mnaRg9Cyfnlnu6vSUzB1kmApuJcBtxj7Kc
	+Zx1BYB94ELdh2O34mLnYI9LZPDSuzt2NR69bkHjfHOcjn84sTqvM5k2J2Uvo+6F8WbQ==
X-Received: by 2002:ad4:5e8c:0:b0:896:f4db:82c0 with SMTP id 6a1803df08f44-89965acdc2dmr222479806d6.1.1771883427968;
        Mon, 23 Feb 2026 13:50:27 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:27 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 04/10] wic: provide oe-core wks files
Date: Mon, 23 Feb 2026 16:50:02 -0500
Message-ID: <20260223215008.2062721-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223215008.2062721-1-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231704

By convention, wic will look for a "wic" directory in the top-level
of all BBLAYERS in order to find *wks files. oe-core was the only
exception; it stored its *wks files in scripts/lib/wic/canned-wks.
Take the *wks, *wks.in, *inc, and *cfg files that were in the old wks
location and place them in a "wic" top-level directory in the oe-core
layer, thereby following the convention of every other layer.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5
- rebase with master
- split patchset out again

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/classes-recipe/image_types_wic.bbclass |  2 +-
 meta/wic/common.wks.inc                     |  3 +++
 meta/wic/directdisk-bootloader-config.cfg   | 27 +++++++++++++++++++++
 meta/wic/directdisk-bootloader-config.wks   |  8 ++++++
 meta/wic/directdisk-gpt.wks                 | 10 ++++++++
 meta/wic/directdisk-multi-rootfs.wks        | 23 ++++++++++++++++++
 meta/wic/directdisk.wks                     |  8 ++++++
 meta/wic/efi-bootdisk.wks.in                |  3 +++
 meta/wic/efi-uki-bootdisk.wks.in            |  3 +++
 meta/wic/mkdisk-ufs.wks                     |  5 ++++
 meta/wic/mkefidisk.wks                      | 11 +++++++++
 meta/wic/mkhybridiso.wks                    |  7 ++++++
 meta/wic/qemuloongarch.wks                  |  3 +++
 meta/wic/qemuriscv.wks                      |  3 +++
 meta/wic/qemux86-directdisk.wks             |  8 ++++++
 meta/wic/sdimage-bootpart.wks               |  6 +++++
 meta/wic/systemd-bootdisk.wks               | 11 +++++++++
 17 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 meta/wic/common.wks.inc
 create mode 100644 meta/wic/directdisk-bootloader-config.cfg
 create mode 100644 meta/wic/directdisk-bootloader-config.wks
 create mode 100644 meta/wic/directdisk-gpt.wks
 create mode 100644 meta/wic/directdisk-multi-rootfs.wks
 create mode 100644 meta/wic/directdisk.wks
 create mode 100644 meta/wic/efi-bootdisk.wks.in
 create mode 100644 meta/wic/efi-uki-bootdisk.wks.in
 create mode 100644 meta/wic/mkdisk-ufs.wks
 create mode 100644 meta/wic/mkefidisk.wks
 create mode 100644 meta/wic/mkhybridiso.wks
 create mode 100644 meta/wic/qemuloongarch.wks
 create mode 100644 meta/wic/qemuriscv.wks
 create mode 100644 meta/wic/qemux86-directdisk.wks
 create mode 100644 meta/wic/sdimage-bootpart.wks
 create mode 100644 meta/wic/systemd-bootdisk.wks

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 675aa9751367..f2fd00e6d7ec 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -45,7 +45,7 @@ inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifa
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
-WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}"
 WKS_FULL_PATH = "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) or ''}"
 
 def wks_search(files, search_path):
diff --git a/meta/wic/common.wks.inc b/meta/wic/common.wks.inc
new file mode 100644
index 000000000000..4a440ddafe64
--- /dev/null
+++ b/meta/wic/common.wks.inc
@@ -0,0 +1,3 @@
+# This file is included into 3 canned wks files from this directory
+part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
diff --git a/meta/wic/directdisk-bootloader-config.cfg b/meta/wic/directdisk-bootloader-config.cfg
new file mode 100644
index 000000000000..c58e74a853cb
--- /dev/null
+++ b/meta/wic/directdisk-bootloader-config.cfg
@@ -0,0 +1,27 @@
+# This is an example configuration file for syslinux.
+TIMEOUT 50
+ALLOWOPTIONS 1
+SERIAL 0 115200
+PROMPT 0
+
+UI vesamenu.c32
+menu title Select boot options
+menu tabmsg Press [Tab] to edit, [Return] to select
+
+DEFAULT Graphics console boot
+
+LABEL Graphics console boot
+KERNEL /vmlinuz
+APPEND label=boot rootwait
+
+LABEL Serial console boot
+KERNEL /vmlinuz
+APPEND label=boot rootwait console=ttyS0,115200
+
+LABEL Graphics console install
+KERNEL /vmlinuz
+APPEND label=install rootwait
+
+LABEL Serial console install
+KERNEL /vmlinuz
+APPEND label=install rootwait console=ttyS0,115200
diff --git a/meta/wic/directdisk-bootloader-config.wks b/meta/wic/directdisk-bootloader-config.wks
new file mode 100644
index 000000000000..3529e05c876e
--- /dev/null
+++ b/meta/wic/directdisk-bootloader-config.wks
@@ -0,0 +1,8 @@
+# short-description: Create a 'pcbios' direct disk image with custom bootloader config
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly dd to boot media. The bootloader configuration source is a user file.
+
+include common.wks.inc
+
+bootloader --configfile="directdisk-bootloader-config.cfg"
+
diff --git a/meta/wic/directdisk-gpt.wks b/meta/wic/directdisk-gpt.wks
new file mode 100644
index 000000000000..cb640056f199
--- /dev/null
+++ b/meta/wic/directdisk-gpt.wks
@@ -0,0 +1,10 @@
+# short-description: Create a 'pcbios' direct disk image
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly dd to boot media.
+
+
+part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+
+bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
+
diff --git a/meta/wic/directdisk-multi-rootfs.wks b/meta/wic/directdisk-multi-rootfs.wks
new file mode 100644
index 000000000000..4fd1999ffb69
--- /dev/null
+++ b/meta/wic/directdisk-multi-rootfs.wks
@@ -0,0 +1,23 @@
+# short-description: Create multi rootfs image using rootfs plugin
+# long-description: Creates a partitioned disk image with two rootfs partitions
+# using rootfs plugin.
+#
+# Partitions can use either
+#   - indirect rootfs references to image recipe(s):
+#     wic create directdisk-multi-indirect-recipes -e core-image-minimal \
+#         --rootfs-dir rootfs1=core-image-minimal
+#         --rootfs-dir rootfs2=core-image-minimal-dev
+#
+#   - or paths to rootfs directories:
+#     wic create directdisk-multi-rootfs \
+#         --rootfs-dir rootfs1=tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/
+#         --rootfs-dir rootfs2=tmp/work/qemux86_64-poky-linux/core-image-minimal-dev/1.0-r0/rootfs/
+#
+#   - or any combinations of -r and --rootfs command line options
+
+part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --rootfs-dir=rootfs1 --ondisk sda --fstype=ext4 --label platform --align 1024
+part /rescue --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext4 --label secondary --align 1024
+
+bootloader  --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
+
diff --git a/meta/wic/directdisk.wks b/meta/wic/directdisk.wks
new file mode 100644
index 000000000000..8c8e06b02c66
--- /dev/null
+++ b/meta/wic/directdisk.wks
@@ -0,0 +1,8 @@
+# short-description: Create a 'pcbios' direct disk image
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly dd to boot media.
+
+include common.wks.inc
+
+bootloader  --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
+
diff --git a/meta/wic/efi-bootdisk.wks.in b/meta/wic/efi-bootdisk.wks.in
new file mode 100644
index 000000000000..5211972955a5
--- /dev/null
+++ b/meta/wic/efi-bootdisk.wks.in
@@ -0,0 +1,3 @@
+bootloader --ptable gpt
+part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.2
+part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
diff --git a/meta/wic/efi-uki-bootdisk.wks.in b/meta/wic/efi-uki-bootdisk.wks.in
new file mode 100644
index 000000000000..cac0fa32cdab
--- /dev/null
+++ b/meta/wic/efi-uki-bootdisk.wks.in
@@ -0,0 +1,3 @@
+bootloader --ptable gpt --timeout=5
+part /boot --source bootimg_efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --overhead-factor=1
+part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
diff --git a/meta/wic/mkdisk-ufs.wks b/meta/wic/mkdisk-ufs.wks
new file mode 100644
index 000000000000..dfd2f3854890
--- /dev/null
+++ b/meta/wic/mkdisk-ufs.wks
@@ -0,0 +1,5 @@
+bootloader --ptable gpt
+
+part /boot --source rootfs --fstype=vfat --label boot --change-directory boot/
+part /     --source rootfs --fstype=ext4 --label root --exclude-path boot/
+part swap                  --fstype=swap --label swap --size 1M
diff --git a/meta/wic/mkefidisk.wks b/meta/wic/mkefidisk.wks
new file mode 100644
index 000000000000..16dfe76dfe27
--- /dev/null
+++ b/meta/wic/mkefidisk.wks
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source bootimg_efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
+
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+
+part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+
+bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
diff --git a/meta/wic/mkhybridiso.wks b/meta/wic/mkhybridiso.wks
new file mode 100644
index 000000000000..c3a030e5b40e
--- /dev/null
+++ b/meta/wic/mkhybridiso.wks
@@ -0,0 +1,7 @@
+# short-description: Create a hybrid ISO image
+# long-description: Creates an EFI and legacy bootable hybrid ISO image
+# which can be used on optical media as well as USB media.
+
+part /boot --source isoimage_isohybrid --sourceparams="loader=grub-efi,image_name=HYBRID_ISO_IMG" --ondisk cd --label HYBRIDISO
+
+bootloader  --timeout=15  --append=""
diff --git a/meta/wic/qemuloongarch.wks b/meta/wic/qemuloongarch.wks
new file mode 100644
index 000000000000..8465c7a8c0a2
--- /dev/null
+++ b/meta/wic/qemuloongarch.wks
@@ -0,0 +1,3 @@
+# short-description: Create qcow2 image for LoongArch QEMU machines
+
+part / --source rootfs --fstype=ext4 --label root --align 4096 --size 5G
diff --git a/meta/wic/qemuriscv.wks b/meta/wic/qemuriscv.wks
new file mode 100644
index 000000000000..12c68b706917
--- /dev/null
+++ b/meta/wic/qemuriscv.wks
@@ -0,0 +1,3 @@
+# short-description: Create qcow2 image for RISC-V QEMU machines
+
+part / --source rootfs --fstype=ext4 --label root --align 4096 --size 5G
diff --git a/meta/wic/qemux86-directdisk.wks b/meta/wic/qemux86-directdisk.wks
new file mode 100644
index 000000000000..808997611a4a
--- /dev/null
+++ b/meta/wic/qemux86-directdisk.wks
@@ -0,0 +1,8 @@
+# short-description: Create a qemu machine 'pcbios' direct disk image
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly use to boot a qemu machine.
+
+include common.wks.inc
+
+bootloader  --timeout=0  --append="rw oprofile.timer=1 rootfstype=ext4 console=tty console=ttyS0 "
+
diff --git a/meta/wic/sdimage-bootpart.wks b/meta/wic/sdimage-bootpart.wks
new file mode 100644
index 000000000000..f9f8044f7dc4
--- /dev/null
+++ b/meta/wic/sdimage-bootpart.wks
@@ -0,0 +1,6 @@
+# short-description: Create SD card image with a boot partition
+# long-description: Creates a partitioned SD card image. Boot files
+# are located in the first vfat partition.
+
+part /boot --source bootimg_partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16
+part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 4
diff --git a/meta/wic/systemd-bootdisk.wks b/meta/wic/systemd-bootdisk.wks
new file mode 100644
index 000000000000..3fb2c0e35f3a
--- /dev/null
+++ b/meta/wic/systemd-bootdisk.wks
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image with systemd-boot
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media. The selected bootloader is systemd-boot.
+
+part /boot --source bootimg_efi --sourceparams="loader=systemd-boot" --ondisk sda --label msdos --active --align 1024 --use-uuid
+
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+
+part swap --ondisk sda --size 44 --label swap1 --fstype=swap --use-uuid
+
+bootloader --ptable gpt --timeout=5 --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
2.51.0


