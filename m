Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C26ECA100E
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:58:44 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.67784.1756778320434446786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=NhBUBuIu;
 spf=pass (domain: underview.tech, ip: 209.85.160.174, mailfrom: vince@underview.tech)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b30d09dab5so50916091cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756778319; x=1757383119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muIkAhajL310B+tHVnSzlhmDPJ+ZoBA5H89wnfQNDsE=;
        b=NhBUBuIuKHXwHy8U5sNIVZprhkO3mQky4vbaBpF4aKNu2eHYSFei0oHbzi9mQkpo6R
         re73C8LRTTRhRKtJcLaKNGYP0M8cquL4na8mWFfMNknPkMsxj2HCii4knzZGexgAIlTG
         3x4twckKZurNMNzG37JB2PUTh4yZ7EBzBxHTZphTrGFz/VJ+0jnHAT/atwFkKLk1SCWl
         hE5Il4wpmyga7fK0sdhVE08gsMtlYVcz3qK7Z5hEGekvnElDm54E1GtHXOwFkk6ytVbR
         VHMLbmKfWbK6ieeC7tdAyy7HJrC5fhVCDiPAzuok4XDhoLg24x0qU6psZ14eW2Lrl05I
         FtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756778319; x=1757383119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muIkAhajL310B+tHVnSzlhmDPJ+ZoBA5H89wnfQNDsE=;
        b=DZhU/yK26856xWKbeXpQA/0enD6DhcMEKQDWOHGFe0pbKR3qMn1HYs07cmUJV2dOKi
         kZ5qNKItVw5ch3gZeCUDHl6kCgeJXD6+urVgNc0nvrMyxqmGWMw2VFygBN/nP3E5mtSM
         UhWux3Pu27i/M+OUppHtSmA05W9ZfimiZ0LoM/MFOsbR50Wuh2X1CD/UcAga2OgfxCsu
         XsUhMXUtPyagiTJmvRHTCLjasrpM60/v1j3DBDvJ/F/WPE9hfQAJKKP4vABE3PcgjRDI
         j7TtHp4aM2ELrEKHRxSbQLEAnnGQh1vzofO4DCInaZjjiBpxXgZIksiOx/Bk4ZGPS3vZ
         1nHQ==
X-Gm-Message-State: AOJu0YyjumJDsezuUlcYTAXF1LAU4a3Xc8FW6ilMzMXN9lqznLHHdkHQ
	7cQuliPbpaD6AdMF1HXqTX/2nRqOtAgu8Cbch3YLoiMNyzNZl1gSmvjFqI8KL8/9ktMBORSHMJX
	FqxuYk0k=
X-Gm-Gg: ASbGncu2VYYlq57dzCeIEhMgvrzP7dShZAACJjqLvfqNgzGbxRM7f53zA/8H0dQKsxK
	wSAkR/0fYnF9gLjDGP3bjMDGtzh3x5WIY4GlBCCI6DxS/ZoIYpQIn6k1WXE94TEc14YjRx6Igkk
	vlY9o2aPbrt6oHyq+EJzH2bF2V0qosoDxnzvCN49qD6HK/bTrcH9GIBxPtlQnkFYhbSTcUJOXAk
	mjLD1V2FK7JPIzkoPYg5tdEkm5HrQH1UnuHZZ4Sny61kriGxw4DWc448eJ5ifqXwFM4Uv8FOU2R
	NQgW3b1cgMy9g92eetTawEf79Ma3sxosMVv1PdTFt975Nmi7i75r9A89X7ERc07UYNZcOKV+7j/
	CIqScWvt9kec=
X-Google-Smtp-Source: AGHT+IGWVzhNpLlqFKrbxlQTCZYUtxuc7rElOqdho1Zbdt7TAXRMDXTrOgC52oSjAVnvqmpWJ6QFkg==
X-Received: by 2002:a05:6214:622:b0:70f:a460:c454 with SMTP id 6a1803df08f44-70fac896f25mr122202156d6.34.1756778319042;
        Mon, 01 Sep 2025 18:58:39 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::7efe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720a30b79aesm4284666d6.0.2025.09.01.18.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:58:38 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 4/7] bootimg_biosplusefi: add grub only examples
Date: Mon,  1 Sep 2025 21:58:22 -0400
Message-ID: <20250902015825.2785789-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902015825.2785789-1-vince@underview.tech>
References: <20250902015825.2785789-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222686

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


