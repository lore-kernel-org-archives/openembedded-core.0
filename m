Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2BECAC581
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.124.1757090538422980089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TejnOyhn;
 spf=pass (domain: underview.tech, ip: 209.85.219.43, mailfrom: vince@underview.tech)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7221ce7e814so17821646d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090537; x=1757695337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muIkAhajL310B+tHVnSzlhmDPJ+ZoBA5H89wnfQNDsE=;
        b=TejnOyhn6C7Mpe9VrPvLJsvMMljcSWgNDuA4tdRfjTa6TNKPra+Geu13PhjS4d9Q1W
         rHsxXoD84a+yxGtUovPE5trJznOL/0D7LB2xymwxCmzHuTlQ3UUX5/kzdSP6CR7t0Rph
         UYK0JGxVWkoGlXZSpDR3Jz6dAavX0yFSUzApH5l9qrZf0JtCRX+mnpNGzSxd5GTlESZH
         HO9svCA6k5XgYTjjPmZ7Ph1rozRrQVaWa72h+SPHk6zYy6jb1Di+svjty1GjmahAEYhE
         +GjdV5wtUroNIJQoyNRtd9bpo5MJqEAuOTBsJ1wUHpA4hbo8AlGblY88GQ/ahPYquOLK
         o9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090537; x=1757695337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muIkAhajL310B+tHVnSzlhmDPJ+ZoBA5H89wnfQNDsE=;
        b=e1PT5xKjpW8RJ36rdp5084wfJ3DgJGz+oz95/by/TD8alOUNr8qxfaTy6dy3KZga+s
         xQ92n/rARNMY4r07oh/1JPuIwF3dFUCbXd+GIS7MTdxCdjlAUsD/PEW+UvrPj+OF6I7N
         IVzx0Thr3sEdyF8J3JktJY8b74oQP17pa+G3tZD6l1cIX2A6xs48gzzvQjvPseoKIjSR
         mSwSlUUv48c73a5LgqoeZRC5PoyQEGMxWbDWe0gSrm6Ep1juFZIPSwU57UKKP4m+V6Fi
         KuQ4QBzIOri2Kh80qU6XkmNcs1QF1uKIxineAszLTR8Yc9lwgLL0qx3nJTN2qzp6V62W
         Vhew==
X-Gm-Message-State: AOJu0YyGxEPfL5u0Z+A1MUV3j8M8fSEqMZV+ap6O+kX1GjMb64g8AwLk
	+AYUlDikFjKD6ly89Zv1b5BRmFiGh3axoA863KY33gggkILOScC2midbAiGi9kn1varPJtAaLYt
	Q+BKs
X-Gm-Gg: ASbGncsuUgCjMmxvvHhtej6jPIsH92rifOvrUkesI0P6H+dTWoYEnRBxTOofxdB3cjB
	mx9KZpRLAiuQQh6qhK8spHRSnZmni83KbgGfRzraY4GoxnsXoAQ6kvnIBrkNsBNoppzn6htg+1V
	LO7oar2dY7d5OdjhUzvJfjNY0KlTzmF1MFqh/MnuqMbE8H1V3me+ROuCh2L7zXGFjIEYuhJmO/E
	meL+pqRMaDbrOs/9/S7NkMNQQ0vsXTX+kD1vSqhvMCCc00H3XsUWCjz2ZA1NVhnKJZSRomH7W9T
	Ljuv793mBGOKrkBeZ4gQYkMGj27IV+X6Ku0Bq4juzy33TBERYfhMu9X4/yc3X5D6x4SY3Qb/ErK
	naKh6NfrsRYg=
X-Google-Smtp-Source: AGHT+IGGAT4W/2oTdcxRy71EIPT4eK0eK2NMhUEYAfNvdK6sEXYugOv7tf7z36IQ30Tdmk4Sd572JA==
X-Received: by 2002:ad4:5767:0:b0:734:8eac:3541 with SMTP id 6a1803df08f44-7348eac386bmr17576206d6.63.1757090536888;
        Fri, 05 Sep 2025 09:42:16 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:16 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 5/8] bootimg_biosplusefi: add grub only examples
Date: Fri,  5 Sep 2025 12:41:33 -0400
Message-ID: <20250905164136.2896809-5-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
References: <20250905164136.2896809-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223021

Updates the comments section to explain
new usage of wic plugins.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../wic/plugins/source/bootimg_biosplusefi.py | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
index 4279ddded8..ad4c0e1768 100644
--- a/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
@@ -27,7 +27,7 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
     """
     Create MBR + EFI boot partition
 
-    This plugin creates a boot partition that contains both
+    This plugin creates a boot partition(s) that contains both
     legacy BIOS and EFI content. It will be able to boot from both.
     This is useful when managing PC fleet with some older machines
     without EFI support.
@@ -50,7 +50,9 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
     not turn the rootfs into an initramfs RAM image.
 
     This plugin is made to put everything into a single /boot partition so it
-    does not have the limitations listed above.
+    does not have the limitations listed above. Unless GRUB is the primary
+    bootloader. We have to seperate it into multiple partitions because
+    of core.img.
 
     The plugin is made so it does tries not to reimplement what's already
     been done in other plugins; as such it imports "bootimg_pcbios"
@@ -70,9 +72,33 @@ class BootimgBiosPlusEFIPlugin(SourcePlugin):
     Plugin options, such as "--sourceparams" can still be passed to a
     plugin, as long they does not cause issue in the other plugin.
 
-    Example wic configuration:
+    Example wic configurations:
+
+    ************ Example kickstart GRUB/Syslinux Hybrid Legacy Bios Or Newer UEFI Boot ************
     part /boot --source bootimg_biosplusefi --sourceparams="loader=grub-efi"\\
                --ondisk sda --label os_boot --active --align 1024 --use-uuid
+    ************ Example kickstart GRUB/Syslinux Hybrid Legacy Bios Or Newer UEFI Boot ************
+
+
+    ********************** Example kickstart GRUB Hybrid Legacy Bios Or Newer UEFI Boot **********************
+    # See https://wiki.archlinux.org/title/GPT_fdisk#Partition_type
+
+    part bios_boot --label bios_boot --fstype none --offset 1024 --fixed-size 1M \\
+                   --part-type 21686148-6449-6E6F-744E-656564454649 --source bootimg_biosplusefi \\
+                   --sourceparams="loader=grub-efi,loader-bios=grub,install-kernel-into-boot-dir=false"
+
+    part efi_system --label efi_system --fstype vfat --fixed-size 48M \\
+                    --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B --source bootimg_biosplusefi \\
+                    --sourceparams="loader=grub-efi,loader-bios=grub,install-kernel-into-boot-dir=false"
+
+    part grub_data --label grub_data --fstype ext4 --fixed-size 78M \\
+                   --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4 --source bootimg_biosplusefi \\
+                   --sourceparams="loader=grub-efi,loader-bios=grub,install-kernel-into-boot-dir=false"
+
+    part roots --label rootfs --fstype ext4 --source rootfs --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+
+    bootloader --ptable gpt --source bootimg_biosplusefi
+    ********************** Example kickstart GRUB Hybrid Legacy Bios Or Newer UEFI Boot **********************
     """
 
     name = 'bootimg_biosplusefi'
-- 
2.43.0


