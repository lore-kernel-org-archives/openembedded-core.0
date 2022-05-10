Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6FAC4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:25 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.10705.1652193562024245324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cm/X5MGf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so2319089pji.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7sboQistaN0NTSpqP/iWAnOV6lzVfQaDKAxZJrW/lrI=;
        b=cm/X5MGfqBEHiLwavwbj4XNxXD0nonGa0S6J/focW5klzjoPq/PsZ7ZOlqssHhfL/j
         wzUg0sNdBW+MSqO8srHByFVhrBVmmFut+ZSJ7iM3VsqteJsjShQlIPV0wnyOxfzrRNcs
         IX9BoNo5LZ3LU7r5NV4yH0YN1+7HRqZdoiHJ7FPEvvZJtLALyRGZWFPKPR8/JJHfed8F
         2Oe+KOOMOv2F8lwQkEU8L0fIi3bt5ZNuqBQsa1xr73Tc4qjpNewlPG0usrC91sfgmp8L
         K8LK0WSQOo/PPBQZkQDOb181O8iFXiQAqF/3mw097Ewc2b4kqJLa7z0vxvVcviizop6J
         p2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7sboQistaN0NTSpqP/iWAnOV6lzVfQaDKAxZJrW/lrI=;
        b=cpCQX8cKbhbrgaX7XKxa9GCXVqPiZhjDq4gegEW/YmsGT2jyJKN/fS//hIFuEfqL/3
         dD/v93/BK+LYVrWhukZkymzgw9BfVKNC5aP9LQfHCcwRINDhRNqlpipaLX9MBfYg0xl+
         3MAXgn1vs1KaNuXsFcWwhXzkH/NIfxu0OFt+Pxi/q4EfTZLHPvQQICPB4+YP0J7roGbk
         ps2qVVHwaI87XpqpHcwuqgp4B0HTwCr9ptMiamer5OIqy5r7+54ij9DAxMiWEEI8DnJq
         mu8dq5K0kTQzTWI9ZIAwv8okfK8ZM6aetcRpqRBD8xQwGAQxd/cday0mpofN28xFUiDS
         MEjg==
X-Gm-Message-State: AOAM531JDB7laBqEwYVE3z78lYSqadMNsn2NknQ3GJYFt1vYfcnNgBSY
	KnZH704ObbfQDqp5m5osh9EjiOQt9tmQVjnD
X-Google-Smtp-Source: 
 ABdhPJwEUGtFqNxn9NLx5faRERMSBkLSCF0CGHX2xNZiJvhXwGbx6N2UeyEPCGuYKYkq3NSsySp3GA==
X-Received: by 2002:a17:902:8644:b0:15a:3b4a:538a with SMTP id
 y4-20020a170902864400b0015a3b4a538amr21014632plt.146.1652193560701;
        Tue, 10 May 2022 07:39:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/40] linux-yocto/5.15: netfilter: conntrack:
 avoid useless indirection during conntrack destruction
Date: Tue, 10 May 2022 04:36:58 -1000
Message-Id: 
 <abf7178c03248f58caf403b6f80039ae23ed9bdf.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165436

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2aaf2429474da762d305d6fb70996b5502c879c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


