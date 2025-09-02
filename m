Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8CCCA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:15:44 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.68270.1756779342776382464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=E+aNGptr;
 spf=pass (domain: underview.tech, ip: 209.85.219.46, mailfrom: vince@underview.tech)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7193fc78bc3so13555196d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756779341; x=1757384141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9u+z4a0bWl0ZkQqG95UaYSoma7jZekxtD2FL8P76j8=;
        b=E+aNGptruVUpZvaabrgfWStb7u9yyoMDwCYe2SIwBGfy0jJNSRcMsRkH/iHTud8NK9
         SX+9tMLIPzCYwcS+p8HmP/ZUf4Rf55ltFxGrg0BeYNRHJFM2va9lxJqfwyM4hyt5d4mn
         LFv9cw8Vvb+z32jbaXwokgi5SodsyqRTvXyKr8rUZzkoLAwCWWcRwdH1G79AutIDPmN6
         +HUX3Eok+lNLsb7kXOrR4R9HJI2zHleNNS2e7vQJwfKIHvTbjpsno+g7RIN9FCGEw7Dv
         XKx26s7lmdSp5WUXqP0xtqlFHSNyDgN9uIAdeiZqSnNkokTrPELcYv2tDJpPzA7M4Ctn
         4MQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779341; x=1757384141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9u+z4a0bWl0ZkQqG95UaYSoma7jZekxtD2FL8P76j8=;
        b=njJa+6heh72Q9N4aYhMQig10IrXDL0k/zR/HpxQlkYEFTZDgdfSe3BhjrOyMNFuPFd
         V8EmUv06hI0LMHWhARVldg4p3ycvli1WepPDpW8dw8D6OeRGSGLaJqwmKlKVi8msJqrj
         aXb6yhNurwwuxnY4enVIy7VpjkK91iHzhXOmVzl1togTWOnq8Mb/88Z/TG2dEMmufVgW
         PKjcLXf80nUuS7IapZd8396ob2mWlABtSzlHc2BHexgJT2qCgyxLAgDAexmjexQW6/VM
         QEZPOhMq5VYE2fbfA0a69ipcQdgGL918d71S+wku/XWn/O742rqNmeb5XLkSUp4jIJhQ
         wfIA==
X-Gm-Message-State: AOJu0YyHdIVx54uCsAomJGLquRi0WZXuwCBXCYBlCKcdL9NbDpriZsKZ
	TvX4J/d5yZNqQKM3uC3nMCNj5JYCaswG/TpDpNYskMv7Dlmcb7v2QDja34yCqRQzGKAqeaZxEXU
	1FpfIWmU=
X-Gm-Gg: ASbGncuM5B+i90aS7eWUOHl88rcOPK2PTGY6TQaJOZ4jD/jmzRN2GJ5giRuVYqlqcFb
	YWi313dAG2OAOVRqmeIQ2hT4LyjSwDZvrwGC4cUs9iS0gJx9rkgyNUvrnmIKyaB5spE4uHbLCih
	LR+EUmOtZ/YnNNEDdUrUpt6DbIzqXDDqjB8kmrD8PxoV1PR+1Y7nGj011O/CZfeCzfOjFY7PGCR
	5Jr3GEHluYAaTWAYlub03yUeU9Eq2n1rKK6n5uDwaWgVIqdUiZeH2hvko/hFU0zHFAAhoFNVhVg
	YurFyAYpzbVo2wdXlOJNo+61FQ1HcxrQxt0tAgj30lYvvvmPLC7sYD+xj08dWgEHpcqzVateBrD
	/cePEsOnvuSOlJFJyw/17TSKNGs1ixeKect9PcDNE/KBjYJ+7LhK6zvlY
X-Google-Smtp-Source: AGHT+IHEJfE59PvH3YTMKIFkpaS8kekES3us5m8uEYSV5/slhchSzbVtFRadfpBBTSTWbLL70E/Ykg==
X-Received: by 2002:a05:6214:252f:b0:70d:e2ba:62fa with SMTP id 6a1803df08f44-70fac9593f3mr123700706d6.60.1756779341535;
        Mon, 01 Sep 2025 19:15:41 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:90ff:fb15:d573:4b27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b55cf6c9sm4194436d6.49.2025.09.01.19.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:15:41 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v2 4/7] bootimg_biosplusefi: add grub only examples
Date: Mon,  1 Sep 2025 22:15:20 -0400
Message-Id: <20250902021523.25780-4-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902021523.25780-1-vince@underview.tech>
References: <20250902021523.25780-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222695

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
2.34.1


