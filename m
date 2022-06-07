Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B01CCA47F
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:51 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.12595.1654610386194798161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iSCs33Hm;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id hf10so12646417qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GCDvZQz0JYKyfFsh9wTmsIPIhk9A+XShhH2+y+2TwmM=;
        b=iSCs33HmEdeaVNVJbwCTcWgGFkpSY/i4Hfar7TNSf+Y1OIn9sqR6gcV4Q+dLd3HTvF
         0B0MBloU7spIPCziMrUoZiLKh+H2c18nVg0L2SY/Y5etnlU4LFFLslQh+Z0G0jebE9YE
         ARSruDKEpvGc0ew8L/lrpAOq4+Vip74fBRqpTOsr0LMsbQZtL4saUmwSzCknM7uLg+Xx
         V6r2GpFFLrh1bow26BqwrU8JqWeUBkXWrVCWWvDc6tZNJiNwJst9JJJLHtSCHivEF06T
         kOrlcy8ZyH5bZY0hzTZB8zLpURbZ2YKycn3OgWCiFcY1RRcNIYehSR0x7aqDMCeTeEt2
         4/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GCDvZQz0JYKyfFsh9wTmsIPIhk9A+XShhH2+y+2TwmM=;
        b=ZmlgKYFHnXtqWNxCOkXcU5psq+3BV6PPLY4LHx15A2CskbNbqDuKjcJmW1okAAOku1
         iMIdBGiLzk3xrD9EBkxiwjAdcLu+aVGELhafVa1OIDm2S0KNDDMQm/DfmEMmLAgMAy5M
         1TfdV8fHTK/gcVYz2J8XUp8n0IfMNuhmSzwkYCx9BcoSKbFq6+oYSm1Cht5OiyUVKpfw
         DRkM3VQSkvmjO5Zg/i6gh5DKW3DajoVFPTJzKAYezkaqhyhmU+IyxdeaS3psJT0bMNAF
         jWNZ/eJoO4p2UQqHm51MAlH3jyti/HnouL5bHpAkgRjlgqaDVFUZcSMuMf7Bk5UCnIGc
         xTxg==
X-Gm-Message-State: AOAM531uLmAuKvGTf1J+0Pv5xescBHeZW43b02p8I+nFKDfY9+4VC0DT
	8Y1EbL1XBjP2E6uUCiW0COqzECT38PrigQ==
X-Google-Smtp-Source: 
 ABdhPJxoh6HF5lFTwh4fqo41K9zefXvrcwt8zjSe/wKLZb1jgKEVYB3zysNXwUf4rsPoGZqJQNpRzw==
X-Received: by 2002:a05:622a:38d:b0:2f3:c9f7:bfa0 with SMTP id
 j13-20020a05622a038d00b002f3c9f7bfa0mr22970050qtx.404.1654610387043;
        Tue, 07 Jun 2022 06:59:47 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.15: Enable MDIO bus config
Date: Tue,  7 Jun 2022 09:59:34 -0400
Message-Id: 
 <dfe56c337e795d95a87347c744dcdcb4e38db513.1654610230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1654610229.git.bruce.ashfield@gmail.com>
References: <cover.1654610229.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 13:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166665

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    52919926480 bsp/mti-malta32: enable MDIO for mti-malta32
    963ab127810 bsp/qemuarm64: enable MDIO for qemuarm64
    77d5d5e86c0 cfg/net: introduce mdio fragment

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


