Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9A4C4167D
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:17 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.10686.1651153696295017489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=En1Ja0Td;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id b20so996821qkc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xbzj4k7F+/lr7en0UbRg+Nylys2FeiV/Ho40sEAUjt8=;
        b=En1Ja0TdrQRyfs+/NY1fpQoIpBdY/vv2tIsp5bf3MlNjy8TI0a27U0kvXFgymAZ6Ex
         x53CDgkZaGzWLXj351mOSlGgRYodZoyh4780aLPW+o1fxg+1rKMSJjdXRYxOUly6CmmY
         POv9TCXPXp8FbjqQ5KZX27V2Xoohvp39Bp4rfwWHgxW3CYa+cAoxYg9L4Z4Ld1hXXhzw
         dg/oWfxvbcZ3hUu23BHFXelMQHgQyO2BNaxczcQavoYA2C+Iu0c5Hd3eWEJck5TxmE5P
         hQYC1gqB1BvjuzdqT/AOILmxcIz0mNTbLx5JjvHEqLiWA6gJHXXqZwjlhZFm4sK+isFa
         0UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xbzj4k7F+/lr7en0UbRg+Nylys2FeiV/Ho40sEAUjt8=;
        b=xYdb5ZwfVax9aR5nlgHfEV4SzNbWdlkZSTxmiDpIIGn6z8bdgYVVG1EUbDvAAAhWo2
         yPmAG94YCIvY/WyFju0j3G8wv3awgIPRseJG6KTro2Bn0cy2bFV/KOhNUmJdiW2HHr2X
         g/G93iHHmBVbeS9SYpYe40EJsRbBxiSRUtnMljonPeGnnB0A57zp6pvDR1u65zqa+Ojf
         lHDekRwIF4nZErPZnKVjWHNXeLyPybL7ei8GmkNGsRH0zhm97gCN7ra2v6bTEHWGbMTJ
         h+75n3j5jJrqzBzK7QglmZkEP0o0j9a/JFGs03tZc6EfBscovw6Tbb/oYjLF4cVn0Dg4
         BwNw==
X-Gm-Message-State: AOAM531ib0+RmiDjLmlLY7yqFQxdkiMqhaLqG8pJOvObsbGsDykCYcbd
	oPNjhwIlnewVDdFIAeW5Qeo=
X-Google-Smtp-Source: 
 ABdhPJwKxHwFnYPzH4d6pf9pMXArvwYnRrGwyM4rV+0PL7i/DoUWcAYe+bsRN5Vf2nV+A0CBnQIsnQ==
X-Received: by 2002:a05:620a:a8f:b0:69e:8e6b:c674 with SMTP id
 v15-20020a05620a0a8f00b0069e8e6bc674mr19814296qkg.625.1651153695351;
        Thu, 28 Apr 2022 06:48:15 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 09/15] linux-yocto/5.15: netfilter: conntrack: avoid useless
 indirection during conntrack destruction
Date: Thu, 28 Apr 2022 09:47:55 -0400
Message-Id: 
 <6a6e6eaaaf8e03bc5dcf7c9bbab77e62303abd55.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164957

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d7250ca4d5..9910ea023c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ec729d37e4036fe80d0294684aa779c091466307"
-SRCREV_meta ?= "71a82e181708bc619684cc9f1eea01ec2595c2ff"
+SRCREV_machine ?= "a5e556295fd7c0ec6095e12c0960d4313587e2e0"
+SRCREV_meta ?= "cb8938bc9d6b4575a1cd0072106b9720648ed0ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2de1be9e46..96f09f3839 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9f43f6966b7ef3cc76c465e1f53fe353740155df"
-SRCREV_meta ?= "71a82e181708bc619684cc9f1eea01ec2595c2ff"
+SRCREV_machine ?= "57d9f612e60a3b73774df1046dc3e3f7c17fbf49"
+SRCREV_meta ?= "cb8938bc9d6b4575a1cd0072106b9720648ed0ab"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 83e484693b..22b4a790fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5c287562703770d5e466893c53bb9fca16b16fe8"
-SRCREV_machine:qemuarm64 ?= "158f38930aa53b07009980cf417fbcddea58807d"
-SRCREV_machine:qemumips ?= "2ebd4e128f3f0ad1bff5677f593a545053f9ff91"
-SRCREV_machine:qemuppc ?= "566f4e67a086fbdeb17ebe3b7537f9f345001cd0"
-SRCREV_machine:qemuriscv64 ?= "4e7122625996261d870160dfd2096108742f1009"
-SRCREV_machine:qemuriscv32 ?= "4e7122625996261d870160dfd2096108742f1009"
-SRCREV_machine:qemux86 ?= "4e7122625996261d870160dfd2096108742f1009"
-SRCREV_machine:qemux86-64 ?= "4e7122625996261d870160dfd2096108742f1009"
-SRCREV_machine:qemumips64 ?= "2aafd732abb0b9011e2041c7c5c9ab3f475dedd1"
-SRCREV_machine ?= "4e7122625996261d870160dfd2096108742f1009"
-SRCREV_meta ?= "71a82e181708bc619684cc9f1eea01ec2595c2ff"
+SRCREV_machine:qemuarm ?= "2c5f632df378c23226fdb89fe36ad83c05d8da01"
+SRCREV_machine:qemuarm64 ?= "4a6d3cff7783b6d6f0c8c09de3158cffe8fa97af"
+SRCREV_machine:qemumips ?= "b8cca873d9d28cb48884ce4aa69983fe36867309"
+SRCREV_machine:qemuppc ?= "b0a8af64b0b46184583f8eb05a3c7b038d5484bf"
+SRCREV_machine:qemuriscv64 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
+SRCREV_machine:qemuriscv32 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
+SRCREV_machine:qemux86 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
+SRCREV_machine:qemux86-64 ?= "07a63f760793c64abe99674f067ae0643fdd2314"
+SRCREV_machine:qemumips64 ?= "6456900204c039e30e383eebb27b97cffacf420a"
+SRCREV_machine ?= "07a63f760793c64abe99674f067ae0643fdd2314"
+SRCREV_meta ?= "cb8938bc9d6b4575a1cd0072106b9720648ed0ab"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


