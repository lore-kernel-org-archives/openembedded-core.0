Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5F7C83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.24807.1753041906980506701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ebCWT7aR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dc5bcf49eso45202415ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041906; x=1753646706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl3x3WIWlsOoflpJISRw/VBu12ZdBRH6ukUq2zkfl/M=;
        b=ebCWT7aRpIhHEWfSdXrb+obhSGWhabPHi2MuCdhxxwnm42K2P8fPItjZOv7k7ZtxWx
         IlbwdAMd39xUb5DKQGIM/0IU61PRkzKBN5VFexC644yvxghzjECDhScySUD31Ehg5bqd
         qTbtOKnW2SHMWIDwLoxjca2k97Rbd/rwJYYFHNI7VT/ab+s8X7o6GhKk2Pe1lsR11NuZ
         y/CBAv+o+ORLAUSs/fGfIRFHwzrl+cXTK5WyhHGsOUijGUw4s3UIo4m0f86byiiafK06
         HyCXmFY6jQSA3k0+ezx+68ibWhGIBUnGiFwMyCWHf+jISsB0SoyB3yYCP0pv0ACCVK78
         6Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041906; x=1753646706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl3x3WIWlsOoflpJISRw/VBu12ZdBRH6ukUq2zkfl/M=;
        b=WFOM269JhaskheYlv4RrVOXwD85x6lWclykhAUgdlwouqwurWRgTsH8ZKjkukLEhIb
         c6tfBWhPp38DjGYlQwMJ25hlMdtX1FIlpamyC2VIYzeanVflTSUjZPlmTSV7vGgScjvy
         8L5Q0ZAOdWo9WomyXl9NV9z1SaWHq4T5FlHeDMDCSKWf9g4Y8kPLfSemJth0nOduPH+i
         wbcL6CqjPO2QVWHxN4Jxa7USq0hK0yza6J00yjTnGoRV3EC58HYDf3eYz+I68xt9ITUe
         8g/bZquk3P4T2Kqomb7bNj4m4GZlrDLwmWD9VmGOeCwqYYwbgKpYFgTD2+Y6TJn7JCFB
         4p4A==
X-Gm-Message-State: AOJu0YwKEkBuusyD+F6OwH/JstIx4oTXGPT4HZUWCQfoVzhFiwMyeoEI
	YeRcCl/GzNnAgJ/irvqfQEkksitV6lQrFznblRtAJ5lo265OtbCHmkCK7+EHhpeeECCLcGuvZjU
	yila23I4=
X-Gm-Gg: ASbGncspfNGVf0FJp/w2jYEjovEBz6Thpxr/O42G8fVZijsvD2YecDN28AATva6qZO/
	cbOFxcSB7paSM7mAtW7LEAMmjqLFvy8F4RBWd6n4nZaK/HumPPNDCQNzqLFpxjBh2qSEMuVFcVp
	bslJlctN8zdNVD+CS4ycdYlovcbn2tMNHmUOi7zylfigFGCQtWTMceGdkcc+5ecOEq3ouB0hL7S
	8KU9SheFTp1joO7ivYjx++EH2RJJLwn9WiwOAR+GXp2iy5gZpYjrXjVpZqh8D++z8r1MDIjGO7A
	dyR/2U3hWX9Ghp+CuC0F0KOg9brxWBMNdnu8Ppow1a9c9g+pS8gK2BaeDNqW1z344vNbxcK+9hQ
	K7G4oGqWAkJXdgw==
X-Google-Smtp-Source: AGHT+IH4HkUtq8jpoBfJXgx14PI2rKW3oDg5BBTHYf0F0XSABaWRiSEf2tUXdk8xtj0xRzfo17Em1w==
X-Received: by 2002:a17:902:fcc8:b0:23f:76eb:a367 with SMTP id d9443c01a7336-23f76eba724mr44411125ad.8.1753041905851;
        Sun, 20 Jul 2025 13:05:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/12] linux-yocto/6.12: yaffs2: silence warnings
Date: Sun, 20 Jul 2025 13:04:41 -0700
Message-ID: <7a1f8da4f96d9bd94b9a6aa1da87f11472629028.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220629

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/4 [
    Author: Bin Lan
    Email: bin.lan.cn@windriver.com
    Subject: fs/yaffs2: fix build warnings in yaffs_vfs.c when running make allyesconfig
    Date: Mon, 9 Jun 2025 14:51:47 +0800

    When building linux yocto with allyesconfig, some build warnings are found:

    fs/yaffs2/yaffs_vfs.c:1292:15: error: no previous prototype for
    ‘yaffs_get_inode’ [-Werror=missing-prototypes]
     1292 | struct inode *yaffs_get_inode(struct super_block *sb, int mode,
          int dev,
          |               ^~~~~~~~~~~~~~~
    fs/yaffs2/yaffs_vfs.c: In function ‘yaffs_iterate’:
    fs/yaffs2/yaffs_vfs.c:1841:13: error: unused variable ‘i_version’
    [-Werror=unused-variable]
     1841 |         u64 i_version;
          |             ^~~~~~~~~
    fs/yaffs2/yaffs_vfs.c: At top level:
    fs/yaffs2/yaffs_vfs.c:2441:16: error: no previous prototype for
    ‘yaffs2_get_parent’ [-Werror=missing-prototypes]
     2441 | struct dentry *yaffs2_get_parent(struct dentry *dentry)
          |                ^~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors

    Inspect the code that the two functions yaffs_get_inode() and
    yaffs2_get_parent() are only used in the current file, i_version is not
    used in the function yaffs_iterate(). So add the static modifier to the
    two functions and remove the variable i_version.

    Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/4 [
    Author: Bin Lan
    Email: bin.lan.cn@windriver.com
    Subject: fs/yaffs2: fix a build warning in yaffs_tagsmarshall.c when running make allyesconfig
    Date: Mon, 9 Jun 2025 14:51:48 +0800

    When building linux yocto with allyesconfig, a build warning is found:

    fs/yaffs2/yaffs_tagsmarshall.c:188:6: error: no previous prototype for
    ‘yaffs_tags_marshall_install’ [-Werror=missing-prototypes]
      188 | void yaffs_tags_marshall_install(struct yaffs_dev *dev)
          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors

    Inspect the code that the function yaffs_tags_marshall_install() is
    declared in this header file yaffs_tagsmarshall.h. So include the
    header file in yaffs_tagsmarshall.c.

    Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/4 [
    Author: Bin Lan
    Email: bin.lan.cn@windriver.com
    Subject: fs/yaffs2: fix a build warning in yaffs_yaffs2.c when running make allyesconfig
    Date: Mon, 9 Jun 2025 14:51:49 +0800

    When building linux yocto with allyesconfig, a build warning is
    found:

    fs/yaffs2/yaffs_yaffs2.c:557:21: error: no previous prototype for
    ‘yaffs2_do_endian_tnode_copy’ [-Werror=missing-prototypes]
      557 | struct yaffs_tnode *yaffs2_do_endian_tnode_copy(struct yaffs_dev
          *dev,
          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors

    Inspect the code that the function yaffs2_do_endian_tnode_copy() is
    only used in the current file. So add the static modifier to it.

    Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

4/4 [
    Author: Bin Lan
    Email: bin.lan.cn@windriver.com
    Subject: fs/yaffs2: fix a build warning in yaffs_mtdif.c when running make allyesconfig
    Date: Mon, 9 Jun 2025 14:51:50 +0800

    When building linux yocto with allyesconfig, a build warning is
    found:

    fs/yaffs2/yaffs_mtdif.c:48:5: error: no previous prototype for
    ‘nandmtd_erase_block’ [-Werror=missing-prototypes]
       48 | int nandmtd_erase_block(struct yaffs_dev *dev, int block_no)
          |     ^~~~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors

    Inspect the code that the function nandmtd_erase_block() is
    not used by yaffs2. So remove it.

    Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b877748ef7a789fb75db525fec5568691745fef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c57ebb3143..f6bc400c71 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b1b3b3bd2dca380a849e9c593a1186d4f5f6b57d"
-SRCREV_meta ?= "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
+SRCREV_machine ?= "7e0aff00ea569c858bf82407f501a0bf1f678f35"
+SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index bee8c550a3..db512ddde8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_meta ?= "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
+SRCREV_machine ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index ec121fca56..a57dfd62d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "be3c08ed343992d62710e7c6dec59b52ab1ed9a0"
-SRCREV_machine:qemuarm64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemuloongarch64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemumips ?= "caf8b2498f27e7cf8d2ea23a823059c53d622567"
-SRCREV_machine:qemuppc ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemuriscv64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemuriscv32 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemux86 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemux86-64 ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_machine:qemumips64 ?= "f785750b2d7a06b2b19e69cc321665cb5f2d8e51"
-SRCREV_machine ?= "f724ffca3fef3541b4be9f30f0a3261674c60e13"
-SRCREV_meta ?= "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
+SRCREV_machine:qemuarm ?= "22fa09f54f9c345541d8e68ca73106489acec177"
+SRCREV_machine:qemuarm64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemuloongarch64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemumips ?= "bf70488668471d5d0f6128d02cc23529132a7ee4"
+SRCREV_machine:qemuppc ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemuriscv64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemuriscv32 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemux86 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemux86-64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_machine:qemumips64 ?= "b35f07357970c0de8cce2f6496090f8008ffc0ab"
+SRCREV_machine ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
+SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


