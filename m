Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A6EEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:29 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.9138.1689690441553090104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ee4nqCJN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6682909acadso3832653b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690441; x=1692282441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejovmf9k5ZUr6DBCalS1XZu2z2gHRlMjyOBmjrC/ZX8=;
        b=Ee4nqCJN9pxddHrGzs53/7H2kDg2r1lxm6flZRztdokOjLYvEREAC8u0n4b/SFF3w5
         JYTE8Z/5TuR7jFJi5jyuCOhmPktww8VVcWtQRz5TwFtaSz3tESc+hYm6ZixkiR7hHhH7
         RR9kgZOd75etx0zQ3UoXrHOI4dlJEfzqsR5gA/BM4IBDrQ45XqZ5AAUbgaT/pWcCEtl2
         NrF56rG4mNYQWnpw9zxGfde4S9hZ6HCbpjNAd+9bGWjm+8Lj28U6tZxdoM8ykCALGW+n
         WFGAhoR9TkIaLvr+tFfOpWU+Lb7ZlBPX4SYP04cTF6ip7DSC/NFSmibw+Qr5BQcxH03B
         0F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690441; x=1692282441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejovmf9k5ZUr6DBCalS1XZu2z2gHRlMjyOBmjrC/ZX8=;
        b=KStejENxRet5+bDddn2uPQsAwrbwiV0VC2/REXMzP8eIg8X+/swfGapyFCcdTZOL+v
         a4/IWXd6JjDAsQMZpSkHR2BRiuHt9U8676S88+ADMmjVXI2meDSTDMTqmaNYjk323+/W
         +FWoqmLtXxYQkwIXSfNmCpmtkReurBK38SmyELb9GzmtSfefxKYmClh5WiU4uW7iKQUR
         1KtAt10Q/Uw2ieGqpG2CzFno5eNP9ET7LxeBs3ir9uqwVsMoeF8Ju1FC/UyiKtlCmcH6
         pd0OnISQP2HOkuvdiClWiKBB8HLWIy4eMAA/0YWwnW3shl4DJKUOsjOycXSswK06NNKn
         YX+w==
X-Gm-Message-State: ABy/qLb1oUEGCJOYoSgxeCDlP+JGWENiaQunX02O46mOz9X9eHo/RmzK
	0Aw6sbg1Ikml89mTMlNzURQuUV3uYLVTCPhyarA=
X-Google-Smtp-Source: APBJJlEB1+Lp8BmeJSL+Ue+he3PgjFYdRFNWGgU581ZP0KTMxDNmMN8kLpI9avokZxkM7I2xs6m9Fg==
X-Received: by 2002:a05:6a20:13da:b0:132:c07c:f042 with SMTP id ho26-20020a056a2013da00b00132c07cf042mr13174333pzc.15.1689690440662;
        Tue, 18 Jul 2023 07:27:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/27] wic: Add dependencies for erofs-utils
Date: Tue, 18 Jul 2023 04:26:00 -1000
Message-Id: <c349c7fcb299b123824da9a13ee58222a6cbf9ec.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184530

From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>

In order to build erofs filesystems, wic must have the erofs-utils package installed into its sysroot.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 meta/recipes-core/meta/wic-tools.bb  | 2 +-
 scripts/lib/wic/misc.py              | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 6453dd1b74..8497916d48 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -83,7 +83,7 @@ do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
+WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index daaf3ea576..9282d36a4d 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,7 @@ DEPENDS = "\
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native \
+           e2fsprogs-native util-linux-native tar-native erofs-utils-native \
            virtual/${TARGET_PREFIX}binutils \
            "
 DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index a8aab6c524..2b90821b30 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -36,6 +36,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "mkdosfs": "dosfstools",
                   "mkisofs": "cdrtools",
                   "mkfs.btrfs": "btrfs-tools",
+                  "mkfs.erofs": "erofs-utils",
                   "mkfs.ext2": "e2fsprogs",
                   "mkfs.ext3": "e2fsprogs",
                   "mkfs.ext4": "e2fsprogs",
-- 
2.34.1


