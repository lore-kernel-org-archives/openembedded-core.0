Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B39C3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1430.1746804256938693439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JdlpC+ym;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399838db7fso2310108b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804256; x=1747409056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xltvyLvydcxqAjkT+dXW7hCNbpMkwauXAl2FL/2lg34=;
        b=JdlpC+ymrrrWTr1Tt4jwsHPz6HrpwoJXCG57U1T+edS8W61sSklP2ELNEpxBj4BCNa
         zvTEdGyZduptXwlpKFNPPkoQhoKYX2qHKyawx2kXBSi649FbNDEk1Ipj9AXYM6bL2XlG
         8ExLPKuKOMHlByjvy3HeOU2hjanaA7hGAlO3RYTJRXB4NYSdSS8QLp/reHyGgr7kZbkX
         +a6lkBH+chEZL43C2iRxGbFUYNmltrDo8XwQl0XBLPfyFwLiOFRt+ZdEMj5J1SjizJbA
         DNcB7gZlgVPTMrP/f28edlzRolcR7dcKPthCHJs2/DymL4d5pysJkHkls22yOGPhY29H
         kQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804256; x=1747409056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xltvyLvydcxqAjkT+dXW7hCNbpMkwauXAl2FL/2lg34=;
        b=UKaY4QjD2M7ZkE3MeyJH3FDEhqduGPLcGEKQU6bqTf1MPh7ecOCUE/JTRRZlmWxpzN
         No0G1APmdly12GeCNS4JzcdN4UXmpy1BOruyW4oq8zvsB8IqJIkaM31caUZSgX1kA26F
         pILVkP8fqBCfa1W391I/TR5Te15RWP0OcImaqknv/CubBUbbNlly++Tol3pYe7RHbCih
         jeCuFajM52rodcI9d8s2GqrBiGZFdaCDaf73706JI29gfjjBp7b1x05qlOi0laHL9Syy
         F2hwaeupOMgP20pbw9ykWjx5vWnGcr0oZT7FFmc8owzdRcqEN+oiUA1prUGUgq8EYe9y
         DHOg==
X-Gm-Message-State: AOJu0Ywpzh+GQZMT4VEA5Nv6a3EKUmfNsC5wxht5CfrPdXOazRpcNtA6
	ULKodX3Px4Brs1fqCtwJDusUtJXCSEjoiVibcOIlmQlL4oIymq2U4ExOi1Hs6KCYQ9MwC+D2v8J
	Y
X-Gm-Gg: ASbGncuwZ1Yy7ykHhPs30JPzboFGeoptEDnmY5RLYszskK83AQwtjixrXp7yXw4k/RO
	ltkY0RXu3xAMlYmyybD7LfljcTg6tcRm7HQe+Z3Rx0E/NLYmvfpHK4rax2gWYHEjRUxzMHwzml7
	vU4VoLs8UrMqAt/UH/qORb5nizEGldXM3FktA5MBc1JBeUK53bJXrWrICLte6+KlYHU+G5wPFyz
	M8uY2rkX4Wt/HIqKAzcWjNnQgYEmwH+mh6ZW/yMxIm4SUG27KdkVDc+jOgSQh799ALMQFuK+Lp4
	MY0BErK+lKPmRma0T5CYrUFOBGkqy9vU
X-Google-Smtp-Source: AGHT+IGPAXvO/7KJp36mLi9LgH3sxIGQgYHuvCZ59602OQgVqliUyvHQG+IXX5gxkiAcsRn2eIZq+g==
X-Received: by 2002:a05:6a00:3e20:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-740a9316019mr14015100b3a.4.1746804256079;
        Fri, 09 May 2025 08:24:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 15/17] syslinux: improve isohybrid to process extra sector count for ISO 9660 image
Date: Fri,  9 May 2025 08:23:31 -0700
Message-ID: <741d5ed1b906b8763d9f346481e980e2041c9c2a.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216223

From: Hongxu Jia <hongxu.jia@windriver.com>

Due to commit [cdrtools-native: fix booting EFI ISO live failed]
applied to improve mkisofs to fix nsectors exceeds 0xffff situation
which set selection criteria type = 2 and save extra nsectors to
vendor unique selection criteria

In following case, add 64MB extra space to bootable image efi.img,
and the partition table of EFI is truncated to 32M

$ echo 'IMAGE_FSTYPES:pn-core-image-minimal = " live"' >> conf/local.conf
$ echo 'MACHINE_FEATURES:append = " efi pcbios"' >> conf/local.conf
$ echo '# 64MB extra space to bootable image efi.img' >> conf/local.conf
$ echo 'BOOTIMG_EXTRA_SPACE = "65535"' >> conf/local.conf
$ bitbake core-image-minimal
$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso
...
Device                                                                 Boot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 *        0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2        120  65654   65535   32M ef EFI (FAT-12/16/32)

After applying this patch to process extra sector count, the partition
table of EFI is 90.3M

$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso
...
Device                                                                 Boot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 *        0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2        120 185151  185032 90.3M ef EFI (FAT-12/16/32)

[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf

(From OE-Core rev: b4e112ed7e6ba5a6c6df530d696485a588831851)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-count-from-section-entry-for-EFI-ca.patch | 104 ++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch b/meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch
new file mode 100644
index 0000000000..5422d9b2de
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch
@@ -0,0 +1,104 @@
+From 79a26046d178ae132cb88ba75de7141bd169ff16 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 26 Apr 2025 10:45:08 +0800
+Subject: [PATCH] Add extra sector count from section entry for EFI catalogue
+
+According to page 11: `Figure 5 - Section Entry' in El Torito Bootable
+CD-ROM Format Specification [1]. The sector count tooks 2 byte which
+means max sector count is 0xffff (65535), for 512-byte sector, the
+size of bootable image is no more than 32MB (65536 * 512 / 1024 / 1024)
+
+If the size of efi.img > 32MB, the partition table will be truncated
+in ISO, which caused UEFI system or grub-efi read efi.img broken
+occasionally.
+
+This patch extend efi_count, mac_count and count to 4 byte int, if
+Yocto defines `Selection criteria type = 2', add extra sector count
+to original sector count as total count; for other situation, still use
+original sector count as usual
+
+[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ utils/isohybrid.c | 48 ++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 43 insertions(+), 5 deletions(-)
+
+diff --git a/utils/isohybrid.c b/utils/isohybrid.c
+index a9e38d4..1bbfd45 100644
+--- a/utils/isohybrid.c
++++ b/utils/isohybrid.c
+@@ -76,7 +76,7 @@ uint32_t de_lba = 0;
+ uint16_t de_seg = 0, de_count = 0, de_mbz2 = 0;
+ uint8_t de_boot = 0, de_media = 0, de_sys = 0, de_mbz1 = 0;
+ uint32_t efi_lba = 0, mac_lba = 0;
+-uint16_t efi_count = 0, mac_count = 0;
++uint32_t efi_count = 0, mac_count = 0;
+ uint8_t efi_boot = 0, efi_media = 0, efi_sys = 0;
+ 
+ int apm_parts = 3;
+@@ -552,17 +552,55 @@ read_efi_section(const uint8_t *buf)
+ }
+ 
+ int
+-read_efi_catalogue(const uint8_t *buf, uint16_t *count, uint32_t *lba)
++read_efi_catalogue(const uint8_t *buf, uint32_t *count, uint32_t *lba)
+ {
++    uint16_t _count = 0;
++
++    // Jump to offset 6 byte
+     buf += 6;
+ 
+-    memcpy(count, buf, 2);
+-    *count = lendian_short(*count);
++    *count = 0;
++
++    // Offset     : 6-7 byte
++    // Type       : Word
++    // Description: Sector Count, the number of virtual/emulated sectors
++    // the system will store at Load Segment during the initial boot procedure
++    memcpy(&_count, buf, 2);
++    _count = lendian_short(_count);
+     buf += 2;
+ 
++    // Offset     : 8-0B byte
++    // Type       : D Word
++    // Description: Load RBA. This is the start address of the virtual disk. CD’s use
++    // Relative/Logical block addressing.
+     memcpy(lba, buf, 4);
+     *lba = lendian_int(*lba);
+-    buf += 6;
++    buf += 4;
++
++    // Offset     : 0C byte
++    // Type       : Byte
++    // Description: Selection criteria type. This defines a vendor unique format
++    // for bytes 0D-1F.
++    // The following formats have currently been assigned:
++    // 0 - No selection criteria
++    // 1 - Language and Version Information (IBM)
++    // 2 - Save extra sector count to vendor unique selection criteria (Yocto)
++    // 3-FF - Reserved
++    unsigned char slection_criteria_type = *buf;
++    buf += 1;
++
++    // Offset     : 0D-0E-0F-10 byte
++    // Type       : D Word
++    // Description: Selection criteria type = 2, reserved by Yocto,
++    // save extra sector count to vendor unique selection criteria
++    if (slection_criteria_type == 2) {
++        memcpy(count, buf, 4);
++        *count = lendian_int(*count);
++        buf += 4;
++    }
++
++    // total count = sector count + extra sector count
++    *count += _count;
+ 
+     return 0;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 7cf737170c..2522205fa1 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0013-remove-clean-script.patch \
            file://0014-Fix-reproducibility-issues.patch \
            file://0001-ext2_fs.h-do-not-carry-an-outdated-copy.patch \
+           file://0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch \
            "
 
 SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
-- 
2.43.0


