Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AADDC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.10885.1652193567393973157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=e3tuusow;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d17so16959859plg.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RhWb8t9/Kk1P8ZUTwk+qyRsV2sdLgDqO0LKVQmH2guU=;
        b=e3tuusowQN9G1318EpvEI80SNimI8MUUZ3urE8f9zy7bs3G0Ame+WrqmRkDolvDHgK
         1Ry+jIiyVbTL4Oi/TAt9rFyAZ5/FGr0gnVmKPcAJxtnWWgDMyL1uFRBM2BG0yDjodFMT
         tOd1NnYIdKG+gpcO9fTv0jecAcClT2feGAkEEsuhn3me64/Vva3Nltx+9C5UPySc8fgi
         Fc/RuwncGf1xiYD/emjd33RuITT9lbvjXPUeeb3xTIjsY9WdsNsyPyPAQQWEyi53Nqqi
         cYtpmHkahAlmOciaCA5Ha/RM1J2qVY2PrrjLL22/BSvIUWZnwxD9vt9bqbmLmLXty4xE
         KBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RhWb8t9/Kk1P8ZUTwk+qyRsV2sdLgDqO0LKVQmH2guU=;
        b=vB4Jf3KSBpG+CVOmyWRo8MQbTV7AzGrUY4T0J/OGeIiX9aJVRgaGBmw4xvirAME1Xx
         15FALFTQhTlHSCFVl+I56B9KnJOCbPVXGGDygY4wFnz28uQfOUlG+t0dy4Y7E9ENjYpM
         PBWl3MtkyM/BGPqzlMGnONzwE+OJrt8bbo4UJJB4jH18DbwOY8Y/WuW3BKuUDoyXRz2H
         2PdVSXh0EL/b1X6F6KoQ+4m50szjWZX8/QaKQvSFSbY9gchaex9eDNCfeo060E93KJJr
         RUVYYFcsWBdquFPmbL2P7bu2kcMxdEgxVJoH67Dr3/V4ai4QN3/yLaRmn9sUrupFZ2DS
         wKbA==
X-Gm-Message-State: AOAM533wd9Jz72os/gYhWts6/8LNqLBiqZvBTVRGKuHzKxk7lh3hUioC
	iyLRKOPi5j1VKab0kWLkw9dtS69HiqkG+a1n
X-Google-Smtp-Source: 
 ABdhPJxl2IUBDSSbHS0sSPkO2BGM47Fc5sgcuQXz8g94nyrT5d8BBFR+fjxrvzo2d44m4erKRa9OCg==
X-Received: by 2002:a17:902:9a4c:b0:158:b6f0:4aa2 with SMTP id
 x12-20020a1709029a4c00b00158b6f04aa2mr20875723plv.163.1652193566098;
        Tue, 10 May 2022 07:39:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/40] linux-yocto/5.15: Fix CVE-2022-28796
Date: Tue, 10 May 2022 04:37:00 -1000
Message-Id: 
 <f900829f96b7592ce026067e5154e2f1f55a9d4e.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165438

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a0d2acf249717416226c34b6147e5499adbda15)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f503df6404..5cc1bdbff9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5a5ffe1f47ec90c9778697a0b8dcc3145859fe61"
+SRCREV_machine ?= "21f94b6c9601dbb03036d539482471ddbe753626"
 SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 9a80353ee2..9c9d513f83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c1ea4d56b597a4740b655e3535157fd3248b6dde"
+SRCREV_machine ?= "2521f8951adffad70d844209b73cd8d8878710f1"
 SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index fbb953f559..d9b09660c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3954bbe99f0b517dafa413d88609d0c6f28e9790"
-SRCREV_machine:qemuarm64 ?= "e0f74df7acce2888931dbd6800b1503244155879"
-SRCREV_machine:qemumips ?= "8b632ac1df6b6f9dd61bce1479f6b48847326bee"
-SRCREV_machine:qemuppc ?= "ff7d30e3eabd702f870e10be7411d8dadb7bfdf8"
-SRCREV_machine:qemuriscv64 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
-SRCREV_machine:qemuriscv32 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
-SRCREV_machine:qemux86 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
-SRCREV_machine:qemux86-64 ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
-SRCREV_machine:qemumips64 ?= "5a1907849e651536a7eef3e1d5bc1a51f5cebb7a"
-SRCREV_machine ?= "a2cf1b2c0fab8c9907b50a5fab4f0757bc236afe"
+SRCREV_machine:qemuarm ?= "5dab48a9c4bb681646b06004bc081cc5b4e65285"
+SRCREV_machine:qemuarm64 ?= "fc0cae7371697d26cda76f46d352648a0d8a8fd8"
+SRCREV_machine:qemumips ?= "58617a04ab52b58a5393b5088a3199c3d28b7a15"
+SRCREV_machine:qemuppc ?= "fdf86234f2a35c3fe2457ee02847b4351fdeb08b"
+SRCREV_machine:qemuriscv64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
+SRCREV_machine:qemuriscv32 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
+SRCREV_machine:qemux86 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
+SRCREV_machine:qemux86-64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
+SRCREV_machine:qemumips64 ?= "0294ba0989f839fb11c41fb887707cb49d20143e"
+SRCREV_machine ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
 SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.25.1


