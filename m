Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D2EE57E9
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:57 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.35231.1726097028205087529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YH2obe4i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7191f58054aso277847b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097027; x=1726701827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+JAK8ZNQ1GuAE1pjuSO30S6sx+StjX93nTNTvHlL1I=;
        b=YH2obe4iweUXzjeCSwl3qIve1RfKO/qlK6RtEPuH0OEaaz4+g6V7EEy0JsCHNpwKqt
         loZFqlwxr16M7x+NUGffv4hd2hhtBqYU40GvxEOAnvpQZvmU4c0dhJG859wbSwyiEz/z
         XjMs086p76D702K72Pag6LuDS4/O9+NGl8jmzC9kZYyxnisbb6QJ6ZlgZ72vh09g8cUS
         kGiZ05sRKbdQEa9Arg7q/QbThJy+5+Sm342MFjDLGtW7cdMlMl5uyq09IKwKkpYhgYHv
         v2PXTossF2qCvkWbJdkUcIiVe42iELMNVhMHtHkkl105k3UE+lazud12eYxfjuT3/A4R
         5RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097027; x=1726701827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+JAK8ZNQ1GuAE1pjuSO30S6sx+StjX93nTNTvHlL1I=;
        b=R3w20rN8aj4xPi6FI9ygZwgn4hkpV9GeirMDO3HUqYWLi65pnL93aG8d03YTkQi5e6
         mviHU7dq+gz2nfSQZ9hdLKHMIWchLHDeXwkZtAUVJ9VdXLV0L6SRXSQvzTdqqC7FOxl2
         sWOqHu7lVuYhJ+9/+l6/u4Ejli4yVfAe71mneJO1UokbTDU0yy7P8Fcn8sC7nvXXBTvG
         pG2SGiKOPcwSbrQ7XYjamp68xOgcUbxQKUULQQL8GfDcctrMN+SETVBEALipKhpULhF6
         WvSMJ837w4Ml2/ox5k2nxaaDaCo1EZIKFKiqyZ1tRg57UQTITGkGdDxwiwbiLIoYkALT
         F/0A==
X-Gm-Message-State: AOJu0YzMkivbURs960rlE3KquXpyDTqIYMeDtbp1qqdUmNtuKfBizw8e
	jGQ2uwV48jVNEXYanHlj5pGxiT6uJkrcdVAKnwlBt6iMOD2V/gHj3+pi9BVedM4Bg2pFnqD4mdj
	P
X-Google-Smtp-Source: AGHT+IHR+XgLc8DgX5yyZYa+0Q6DwrU6usFRqRKVJxquyPMe4yoRFSTCZYHUylJjagaVyJ3W3p3w/w==
X-Received: by 2002:a05:6a00:92a0:b0:70d:2cf6:5e6 with SMTP id d2e1a72fcca58-71926088d5emr1322730b3a.15.1726097027310;
        Wed, 11 Sep 2024 16:23:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/22] linux-yocto/5.10: fix NFSV3 config warning
Date: Wed, 11 Sep 2024 16:23:08 -0700
Message-Id: <16ba1e8f27a685ad639a314d1b2b1b505fb6f4f4.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204405

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: nfsd: drop CONFIG_NFSD_V3
    Date: Tue, 2 Aug 2022 10:52:25 -0400

      commit 5f9a62ff7d2808c7b56c0ec90f3b7eae5872afe6
      Author: Chuck Lever <chuck.lever@oracle.com>
      Date:   Sun Feb 6 12:25:47 2022 -0500

        NFSD: Remove CONFIG_NFSD_V3

        Eventually support for NFSv2 in the Linux NFS server is to be
        deprecated and then removed.

        However, NFSv2 is the "always supported" version that is available
        as soon as CONFIG_NFSD is set.  Before NFSv2 support can be removed,
        we need to choose a different "always supported" version.

        This patch removes CONFIG_NFSD_V3 so that NFSv3 is always supported,
        as NFSv2 is today. When NFSv2 support is removed, NFSv3 will become
        the only "always supported" NFS version.

        The defconfigs still need to be updated to remove CONFIG_NFSD_V3=y.

        Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 96208b6731..268b5d1ec1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "131cb7adf814a294e91b1f130596274dcf946acc"
-SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
+SRCREV_machine ?= "3a31ff0840cedf5e78ef3490e604a9f66f9b1f1f"
+SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5a86306584..d35ac04135 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b1e71e9f64f711f24a5b4d1c9b95268d85f55223"
-SRCREV_machine ?= "1058d8075ff9a651366d135278effaaf707ee8ba"
-SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
+SRCREV_machine:qemuarm ?= "fe7f23b30d73333007fe54c96cdb579a31da43bf"
+SRCREV_machine ?= "ca19be2d9d77072cfdde806553e729752b0d9241"
+SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0a643ebf8a..f20804e7fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1b786a40d06acef91fe972e1e0ea0fba35c952f1"
-SRCREV_machine:qemuarm64 ?= "1a521d8f1fd43a00256c93eedbb1dcb411c3936b"
-SRCREV_machine:qemumips ?= "730441c1cf02c3ee9176ffb23fe686ef4162e1ff"
-SRCREV_machine:qemuppc ?= "051b2b500b8f91b670d3d65ad0decf4e077c2727"
-SRCREV_machine:qemuriscv64 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemuriscv32 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemux86 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemux86-64 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemumips64 ?= "3b07617401af5767816a9d60cd2b40dcb9244a2b"
-SRCREV_machine ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
+SRCREV_machine:qemuarm ?= "2524a39d1d5f16980df4f15ef9a7ac2e148795c0"
+SRCREV_machine:qemuarm64 ?= "57e9463c04f9b211dcedd7b92e32cac9b198bccb"
+SRCREV_machine:qemumips ?= "e8d524ff4ca12d884df488db504b35b97f394b78"
+SRCREV_machine:qemuppc ?= "0f0b7bfda26ff5ea9790d648fd82777486b181c7"
+SRCREV_machine:qemuriscv64 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemuriscv32 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemux86 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemux86-64 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemumips64 ?= "6e5d351f2d183cf91d030fc78b4b176338bcb141"
+SRCREV_machine ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.34.1


