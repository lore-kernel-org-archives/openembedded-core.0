Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32646ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:27:04 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.51803.1661624800344116481
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YsuVNL6t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 72so4530551pfx.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=RyMcXTytVSNUVmZrR8TQrsgD2eugg3EpATeFB7Uk07o=;
        b=YsuVNL6twsjlmM1oxv08QIyBZlVwNZNA3SBIcz1nKZFFt7hdeSbQzLTL4tUEg1k9gP
         6JVm1P4ua4XqPINgY4NUhBDfAQUMmTOFoANWIkQiz6nExLZFgX8+5/60gCHusKmTfgoy
         s7j9NLsqYdArpRqiG8WO1bdve2mxkQ06IriOVej1z/65eWQVnz19djlNnDr1RwhaNFJV
         ZfgK453kXLtyh4l6o7rER1j1S10E4P3IBUne2KpIxqzWlW29cTaerEnUE2cWi9tD6rhg
         a97Guq6vI4/h64jTO1wnVF4hjoQoyzykKz+uxky1heS2zwkjVRUM32C2R/zbeoqcAucO
         V97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=RyMcXTytVSNUVmZrR8TQrsgD2eugg3EpATeFB7Uk07o=;
        b=m2IUar/1jM+c6S7ca8Ajzc2eWV+9I+BM1r5lyCplt72dqkg7rVGxgTXTzZMfSgwYvu
         E7MB1pIPdBZBoK8dEmPcLMyHAKvDpRrwQA1zOGl/IlMzi+UYZGMRks3ss7gHxK2WzFOC
         x4mmmm6Qvg3wwxkPFqScnE3JWGhM54YYRrFry3F3RPEYq1DDxhcuw7wuFjzRDoFoYLj2
         K2678VpV4hFPhyqFMCLKJui5+IR0CenFB/9wHE0kzXc1CqnzxRUdBo2jRTDdAztmuKMG
         4+cTtrR6AFpXBOzb/8j5EJ7tIgaAnfsg3R3aFyzxyAAA/LJCFXieILtoT6ZHVG/ahNK2
         eJnA==
X-Gm-Message-State: ACgBeo0TOqCBdN5FRnt1PxBB5OttCRBbByh3YYvFJNmYtO13HKVCvmYx
	Sn/EeLEZD4HYs+hDcQh+FY9RTxBMQwD02wLH
X-Google-Smtp-Source: 
 AA6agR4UEPZuekCbCWII1OFItV9Tx4/N94kjAl8pjGimPFjBS89RzI9lW6DjepT8zbwVsCqhlrJh5g==
X-Received: by 2002:a65:6b8f:0:b0:42b:77c3:9564 with SMTP id
 d15-20020a656b8f000000b0042b77c39564mr6847180pgw.91.1661624813808;
        Sat, 27 Aug 2022 11:26:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/24] wic: depend on cross-binutils
Date: Sat, 27 Aug 2022 08:25:48 -1000
Message-Id: 
 <4ac53650dee64f824add3ce2322b4d3e3d9d4e27.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:27:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169965

From: Ross Burton <ross.burton@arm.com>

Wic can build an unified kernel image, but this needs the cross-objcopy
from binutils.

(From OE-Core rev: 7c7a488116f49083ca42d3628ebc0870585110c3)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 2 ++
 meta/recipes-core/meta/wic-tools.bb  | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index e3863c88a9..5374d6125e 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -84,6 +84,8 @@ do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
+# Unified kernel images need objcopy
+WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index ba0916cb56..daaf3ea576 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,8 @@ DEPENDS = "\
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native\
+           e2fsprogs-native util-linux-native tar-native \
+           virtual/${TARGET_PREFIX}binutils \
            "
 DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
-- 
2.25.1


