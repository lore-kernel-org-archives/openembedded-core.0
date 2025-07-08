Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7867CC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:36:44 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.20463.1751985401878170347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H7lnIr8E;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a9741b513eso90585241cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985401; x=1752590201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OEbSEIZaIazps7k99rsE2k2iRXl8dCmbeLfqYPreL0=;
        b=H7lnIr8EA+0Xn+36YqZQ0uFo98QMbKYE2gyY5BigghvKkURqlcAlqbRs0iZG/i/tKO
         yFqCzqnrdLECcFJWwJ7CwFSwBfqz639e/AhFX+JP02yM5dAykh5XExYUqeMFrbguxvGf
         xD1Vc3jLFxH+Xp7SX0E3IXOx9kPJzAEK14DWgUyFJ2r2uO51D/yPuXjzyLx6z0OF3jm/
         plzYPFtxxDNywkblffrdihqiRd6pQGpto0IWfBNAfkqndVHxy9rEF2MO+jEaSAawTzFK
         vl0IHMFJNW+NSbk20AFA6+oz6CIxtmklbuX/CTQTYO7MFTbJUlvRyCBMxSh42MgaJmRv
         mODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985401; x=1752590201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OEbSEIZaIazps7k99rsE2k2iRXl8dCmbeLfqYPreL0=;
        b=Imipo8s9H//fMvduOhThaXlAhH4q1jWQEOL0MoXMLTgxfr3bBL6fWrwo60Ip6k7NcP
         kvPaeNSRPrHU6JBG1Y5hvI7N0wNQCLUh8ioSwubb2lauLnvZk49oBqbxgQjXNd6GdsxU
         gl1/oFtwQm9VKNV08kSz+f5WRgXvGpA0yZUd2vwG6lm2H2uYeg9g6tRr/nWR2+iuNjsj
         FHY3v1unCD4ZXU4mkL43ujWH8+w67nkKwYu3H++zP22m29umFf33fiB/tnGD4qiGJs+n
         QO09q7kUsxqlfp7dT9qzPn0MZ80NajW/wR9/0M3A+yOk5htU3HvsoNOSTfKy9GCZICuF
         oSzw==
X-Gm-Message-State: AOJu0Yz3vy6vPdmnzhZ0iIUh/O0vCfN8aNEZjelog1S8f4OX14s+zqOd
	1NZWvuNSIFKmfnFfLU0/Z2DCMWhztdcB65mi4lrSv8kVkvEjYQwtTGVm
X-Gm-Gg: ASbGncv6jeACjPOTkHGU0eisN5vydfBX9kIOPEZM/l9Bk08F+P/50XyNrWz18UX7yoX
	HaG7UopZQJsN3rwB8ULtTSuGxNJASeUhVvDZHWOrmLUMunsYmWn+F7alz2Fsp/JdJ08ee3WBYj1
	j9QWRH6TS2ASKL8lOpIVupese1YynSsCdZQer++v9GaZkEtqxFrOjKLKYEwIIErhkMP3Ijndqw2
	cuxEGlW6WNhLNpQ46GNklqRIsQvs79zNbnPF6htQIHvhp/Bpf0iGmmIbLAlNrIrGNSRzsd8zXpe
	HJxa/HAvSQgWp6UTo9K3x8hKDKB6OiXfGK7224tobXD6o+oLjfQJ8FF91K9C3jsnucYKxQ/5kif
	i3PFNT+fmfQvr0GP6YlPoPad5b3Ywd4MSbyaY6BrULLCbKw3H0FafwkTeTF999/s=
X-Google-Smtp-Source: AGHT+IFWcz5zJw5rbsEcwDbPPrKlXMM9O8nxBg48eR3LEzUnpjFa3odc3qmf3HOfWzAjAm3rXHcMIg==
X-Received: by 2002:a05:622a:2990:b0:4a9:c8c2:12d3 with SMTP id d75a77b69052e-4a9cc662638mr38783571cf.10.1751985400024;
        Tue, 08 Jul 2025 07:36:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4c8esm80462671cf.4.2025.07.08.07.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:36:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/6.12: yaffs2: silence warnings
Date: Tue,  8 Jul 2025 10:36:31 -0400
Message-Id: <3864b1916bbbee01b9f4e3d2035b7cec5ad9e89c.1751985223.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1751985223.git.bruce.ashfield@gmail.com>
References: <cover.1751985223.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220034

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
index 5d8e0bc3f1..083b7b1325 100644
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
2.39.2


