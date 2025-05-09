Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CC1C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:23 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1411.1746804254998874402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jWciZXIt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c3e7b390so2369200b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804254; x=1747409054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+ia9cClTpLhWnZONjq1YMKZx0rNCjtwEDAzCIBHD0g=;
        b=jWciZXItU90qLh6q8J7bksiPEXdn4FMb7TkbAUTLT0PX79ICVVKrddJkBqWKcy5C7Y
         xv1hQzSSAIRkq0TNBNMycT5f8JvosVBLP8hlmEkSN5Dzn0IBq23UbvOJ883LjbBomZyZ
         ERVLC6YHLKpBy1IN0anzHgQEKfR6VFcytJSCtdexeBVL1xDsmvgRK5Y6vwwPw/9hbGyE
         lQRZVzyf2tvtWer1q2vK++b1PXqZTI+1mf65xR3m1BtY5a6yuLA1sFjSm7x6Yemi4buu
         4ppp6vPyPYX7Hq927Z1bpAuTIBQFkNRH/BVAy7v1h7URp45FLcay4ikReU9eUq/uWt8F
         ORqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804254; x=1747409054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+ia9cClTpLhWnZONjq1YMKZx0rNCjtwEDAzCIBHD0g=;
        b=R92T1OveNSibfw1XvecU/Fsf3JMllKpQ3nDIFCFbkpEAw4BsF5AamgYcBVLGPXLz68
         c9yuunAoXyATNF0LtwWcQlzOY1WgkAgGc8jGqHY5WApyiiDiEDGPbtW+vAsRXQLtN2i6
         SNSqxv/+Iy4JWnWRq4tPwLWQLOC+ZKhUaFVxGv0lbiyqDH1pMoQpb4b+abjO9LFQNx8+
         T2VxBt1nu1Hw66cG8s68m9gnqTdaVT0z8zW/nw6eItajlp2HRcQlcwaca8W48hnel3d3
         oHz0q0/kHSjNpY8r2PueVPDrHV+rEzCF3vArxIPsH7KcE1ybVRNLN3VYNTdoly9+fRsL
         pKwg==
X-Gm-Message-State: AOJu0Yw3rOudIpBqpsWvuMK6vJx13Irf+MmSYFbjVq/z3kCOQ9X+H/Nq
	gCx6r44+4Azlo/wVfrjyqcWeV7pmf1npNzGeqkhZlxQtQqVUiMMpjQtII3MFhtqZwXR8e8tu943
	r
X-Gm-Gg: ASbGncu75wNkSvzXUoLzVQN+ZstMghABNAvx/T5rBhnWigCsEc+nD/nD5iMbp7WRAd6
	nDNupvfAdhJoMFWxlDgJGDyTFmda+NSCBsyzc13xTphGgePduiPnmCF/ra6jZhjFdtKOtP8LxSh
	akwm5Syxg4bUE2hjydW9WQV0LYB5UDoRtJVtgscEKtGEaeyR8iWeDlZnve3dyg2Usu+X294+dim
	E1dxngR+YTUWbtBydhDeGOmDcThmVzYrTfBK2Y70eiGMy/N3FbQV2BtdH3+FTj7BWItroPGEs78
	sC1yNzYIzth8PGlXfQ42kVq1Ylf4ZTRgX98D0Xi8H3U=
X-Google-Smtp-Source: AGHT+IFPmRZwAFSaI783knDJBDpnGPuA0Nha3DYxpHA0hIdldc5Y7ObcQZ21aP5+lRfg2awegrTjBA==
X-Received: by 2002:a05:6a21:110:b0:1f5:8eec:e521 with SMTP id adf61e73a8af0-215abb03ea5mr5521824637.15.1746804254140;
        Fri, 09 May 2025 08:24:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/17] cdrtools-native: fix booting EFI ISO live failed
Date: Fri,  9 May 2025 08:23:30 -0700
Message-ID: <d184f119c26983c2f15b47a25204049d0525c871.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216222

From: Hongxu Jia <hongxu.jia@windriver.com>

In ISO live, if the size of efi.img > 32MB, and copy EFI application
(bootx64.efi) to efi.img behind of kernel and initrd, UEFI system
could not find EFI application bootx64.efi

Using QEMU+OVMF to boot ISO live image, press ESC to enter UEFI shell:
...
Shell> ls FS0:\
Directory of: FS0:\
04/05/2011  23:00          12,985,344  bzImage
04/05/2011  23:00 <DIR>         2,048  EFI
04/05/2011  23:00          20,494,696  initrd
04/05/2011  23:00                  26  startup.nsh
          3 File(s)  33,480,066 bytes
          1 Dir(s)

Shell> ls FS0:\EFI
Directory of: FS0:\EFI
          0 File(s)           0 bytes
          0 Dir(s)
...

In following case, add 64MB extra space to bootable image efi.img,
and the partition table of EFI is truncated to 26.3M

$ echo 'IMAGE_FSTYPES:pn-core-image-minimal = " live"' >> conf/local.conf
$ echo 'MACHINE_FEATURES:append = " efi pcbios"' >> conf/local.conf
$ echo '# 64MB extra space to bootable image efi.img' >> conf/local.conf
$ echo 'BOOTIMG_EXTRA_SPACE = "65535"' >> conf/local.conf
$ bitbake core-image-minimal
$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso
...
Device                                                                 Boot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 *        0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2        120  54079   53960 26.3M ef EFI (FAT-12/16/32)

According to page 11: `Figure 5 - Section Entry' in El Torito Bootable
CD-ROM Format Specification [1]. The sector count takes 2 byte which
means max sector count is 0xffff (65535), for 512-byte sector, the
size of bootable image is no more than 32MB (65536 * 512 / 1024 / 1024)

This commit truncate to 32MB if image size larger than 32MB, and
report a warning, then save the extra image sector count to
vendor unique selection criteria

After apply this commit, the partition table of EFI is truncated to 32M
$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso
...
Device                                                                 Boot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 *        0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2        120  65654   65535   32M ef EFI (FAT-12/16/32)

[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf

(From OE-Core rev: 259bb8907d8bfe1217e88a3b6935c160e5a92f8d)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cdrtools/cdrtools-native_3.01.bb          |  1 +
 ...ix-nsectors-exceeds-0xffff-situation.patch | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 085384064d..428202c258 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
 	file://riscv64-linux-gcc.rul \
 	file://gcc14-fix.patch \
+	file://0001-fix-nsectors-exceeds-0xffff-situation.patch \
 	"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch b/meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch
new file mode 100644
index 0000000000..8b0fbb3fe6
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch
@@ -0,0 +1,69 @@
+From ab6b5ee4c23099bf15ddd145fdf1ff4f5e34e802 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 26 Apr 2025 03:38:32 +0000
+Subject: [PATCH] fix nsectors exceeds 0xffff situation
+
+According to page 11: `Figure 5 - Section Entry' in El Torito Bootable
+CD-ROM Format Specification [1]. The sector count takes 2 byte which
+means max sector count is 0xffff (65535), for 512-byte sector, the
+size of bootable image is no more than 32MB (65536 * 512 / 1024 / 1024)
+
+If the size of efi.img > 32MB, the partition table will be truncated
+in ISO, which caused UEFI system or grub-efi read efi.img broken
+occasionally.
+
+In this patch, nsectors means sector count, if it exceeds 0xffff,
+truncate to 0xffff and set selection criteria type = 2, then save
+extra nsectors to vendor unique selection criteria
+
+[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf
+
+Upstream-Status: Inappropriate [upstream https://sourceforge.net/projects/cdrtools/ is not alive since 2019]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ mkisofs/eltorito.c | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/mkisofs/eltorito.c b/mkisofs/eltorito.c
+index 5dd04bc..a391003 100644
+--- a/mkisofs/eltorito.c
++++ b/mkisofs/eltorito.c
+@@ -568,6 +568,34 @@ fill_boot_desc(boot_desc_entry, boot_entry)
+ 	fprintf(stderr, "Extent of boot images is %d\n",
+ 				get_733(de->isorec.extent));
+ #endif
++
++	// Boot sectors exceeds 0xffff
++	if (nsectors > 0xffff) {
++		unsigned int extra_nsectors = nsectors - 0xffff;
++
++		fprintf(stderr, "Warning: Boot sectors 0x%x(%u) exceeds 0xffff(65535), save extra %u to pad2\n",
++		    nsectors, nsectors, extra_nsectors);
++
++		// Set nsectors to maximum 0xffff(65535)
++		nsectors = 0xffff;
++
++		// Offset     : 0C byte
++		// Type       : Byte
++		// Description: Selection criteria type. This defines a vendor unique format
++		// for bytes 0D-1F.
++		// The following formats is reserved by Yocto:
++		// 2 - Save extra sector count to vendor unique selection criteria
++		boot_desc_entry->pad2[0] = 2;
++
++
++		// Offset     : 0D-0E-0F-10 byte
++		// Type       : D Word
++		// Description: Save extra sector count to vendor unique selection criteria.
++		// It takes 4 bytes in pad2, starting at pad2[1]
++		set_731(&boot_desc_entry->pad2[1], extra_nsectors);
++
++	}
++
+ 	set_721(boot_desc_entry->nsect, (unsigned int) nsectors);
+ 	set_731(boot_desc_entry->bootoff,
+ 		(unsigned int) get_733(de->isorec.extent));
+-- 
+2.44.1
+
-- 
2.43.0


