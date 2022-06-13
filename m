Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0E5C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:37 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.6532.1655130151409526208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=46iicrK9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 187so5877835pfu.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IzGtS8DcE2Q3Gq9QQY146Hathmyki5Kv+p+sZcfu/3I=;
        b=46iicrK9djOvESTO89HT2TiKiq8FaASVraCzfUlEzv4RqiICB9RNfP1+krG4ZWd16m
         A1SDCSYN8CTn2djPOCNT95bWARENbVMD+51vw89q+1NlJQKqW4XTXKUBHKf5Rm4SHxiy
         UdQyAOp4PejnlW5OyGt0/0UcXUy4CHaLpalAQVbuPmszeQskzrdPhYS7gbj8pon0lBKt
         a7tZMOqsUv7zsknutaWjkCgWtm/7C9IvQXrfc2409BxGdXwRP0AaSy4HmxpIc+aFcmah
         Zsnhjv03oyJKmxqWhnNrewlvDpe+qkL8lZWJ2xUYHSCK/kHvkTFG8OJlUgetBFv5Sx8v
         L0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IzGtS8DcE2Q3Gq9QQY146Hathmyki5Kv+p+sZcfu/3I=;
        b=fLPwhojiNS++reBmqp5BHYygN7YVgi/xmLM+4kxS3zSbi3qQ8nfxwgS46//omPJnJC
         LkXDSZtl5PRMP+2y1NDoBrs7AAltxbcrPiZ0LsU0eDg7lrHnaiDMraytvO9nbjrmV+qZ
         x1DgLnJAz46gMpzU9WOEH1Pa1hYCcLa6SP8mcyel3ZEq037IfMzGMMdiXb67jSm0fSCD
         PYCTC1UubJS/075m2gpP/WiN/toiVW+6ISB6bIljClsSfpZSNPUHUxI1Ws9r3/KMckPb
         zeG3a5WNWN5RU4qaQv11gjhp0l5OCG7PWDK/XCR4njSGoJPaVhTMzz9+NE1aEICND4do
         ZJVQ==
X-Gm-Message-State: AOAM5314poFqU8cwXANRzflA4IYmRdxyuee23oGicHVKCuVlgW8W7A9o
	+hr0QT9pG0YgdtOq1XrUll6b7Y1YlKTq9oKW
X-Google-Smtp-Source: 
 ABdhPJxCQm1o6OlIu16QXCe+P77LsT5yvqnMMhZHnhMDwzfTU+hqvbDZNgN6vnaiIjPC4d/fS07w0Q==
X-Received: by 2002:a05:6a00:319b:b0:51b:c5ec:62ba with SMTP id
 bj27-20020a056a00319b00b0051bc5ec62bamr58712162pfb.1.1655130150333;
        Mon, 13 Jun 2022 07:22:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/20] linux-yocto/5.15: Enable MDIO bus config
Date: Mon, 13 Jun 2022 04:21:43 -1000
Message-Id: 
 <10bb8f03097cb8a5f5c80a472dd6fccb66c47721.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166856

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    52919926480 bsp/mti-malta32: enable MDIO for mti-malta32
    963ab127810 bsp/qemuarm64: enable MDIO for qemuarm64
    77d5d5e86c0 cfg/net: introduce mdio fragment

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 161888872b8c02c77733c7b74d11db3ec59c93e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d4da4de1f9..059c0e9a99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7541f629ed38a02cdcd17251ce03f742b3b37ffd"
-SRCREV_meta ?= "d3948d57e924d1a28e3d9b7f0854dd8cdb525c9f"
+SRCREV_machine ?= "0349dadc971ea2a9ad780b9be95df3c7b9f08eac"
+SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index ce7d6ca8dc..40212beed9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bb5851d13d957e796c8a27ff3047d28495b3389f"
-SRCREV_meta ?= "d3948d57e924d1a28e3d9b7f0854dd8cdb525c9f"
+SRCREV_machine ?= "bec753cf26f9924ed9e4e583032687e4a2a947f4"
+SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 443c5f2e05..2128f85355 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a94c65101ab835b5f307cb4451b8da8f61b33fd6"
-SRCREV_machine:qemuarm64 ?= "2210f319d3e8efaa7c9bcaa4fe20ed2c3b22b7cb"
-SRCREV_machine:qemumips ?= "8d742e6f21ec98a53be9d41d449f1eef3262f522"
-SRCREV_machine:qemuppc ?= "eb8a6e8105ae65410761c3e77513222f8a4890f7"
-SRCREV_machine:qemuriscv64 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
-SRCREV_machine:qemuriscv32 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
-SRCREV_machine:qemux86 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
-SRCREV_machine:qemux86-64 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
-SRCREV_machine:qemumips64 ?= "481cf33f381449847e08ed322abb79c500f46efa"
-SRCREV_machine ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
-SRCREV_meta ?= "d3948d57e924d1a28e3d9b7f0854dd8cdb525c9f"
+SRCREV_machine:qemuarm ?= "53027a25781dce4876ed47dde4e7bb1f49216bf2"
+SRCREV_machine:qemuarm64 ?= "0a49d733a9ec378aa945dbd20f4d1e3b2d4a9052"
+SRCREV_machine:qemumips ?= "f8f756c4bfc3489427d714492b29ca316436276d"
+SRCREV_machine:qemuppc ?= "1ae9b6880799961c8bc3c33d8b596dbea4002401"
+SRCREV_machine:qemuriscv64 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
+SRCREV_machine:qemuriscv32 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
+SRCREV_machine:qemux86 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
+SRCREV_machine:qemux86-64 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
+SRCREV_machine:qemumips64 ?= "cc95aac05d6fb9f0fbe1c336127568df916e2fed"
+SRCREV_machine ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
+SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


