Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7BCC48BE4
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.18.1660081871859364304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JVWvQr71;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id s206so12595095pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S943EILVru3zgTTTpYhWDJK8f2BTbY0lBSMTr8LnA8w=;
        b=JVWvQr717DdUDzmKHmMi195R9lGD3pj3H1W4eqcv108SfJyP8OCKNR51KrG3uNaIWl
         d3I4/Q4TkT3cHne2dapsbvBQpbd5TsPpuLkyasMPzkEkkrTgvgPRfvcHF0Zg3e0ryna/
         2HG3K8/iRugyGkxneb6vSs+6ocpEl5d+komobo1+1fpZlOazEM9Fk/DzPnVkOhWQrsPI
         qru1Pf1CsdD2KFf0u3FHSZdtQP6VyX1Q9TqlfXsD5UV3RjO9YgnA4OLdNGP2kiyeUGe5
         ODDWbxtX3JICAKdrTg4ZihbE5vVKdHO/OqbFUXQTWAeOlam8HaK6OnS/UkvyPlHHkAEV
         ORbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S943EILVru3zgTTTpYhWDJK8f2BTbY0lBSMTr8LnA8w=;
        b=nYvD2gsoX5dWh25sAn0VNNZoQXH/eYfm0IPe0wAVUWdM7iZA0I7/OYk1URZC4TPzG1
         0jzOcTlYImAhcWjq95HXvGonbjq1hjRVZ65jgCEz/hjMudvUmMa327CK4FQBbLNSxi5f
         TbkPY23N2kVtlIKsKGf+g7QcaMqzQ7L0R53CXzxCpaIQaJoe45HgwX0bS1dIPHuqr7qd
         1E1YsDqpNZzNHlACwHJ+HStfWqKTUIxPzG8jGma0gwZbbcz94+LvTFqkEfV2jiwWlNnV
         AIIkkOfaWPdDD82NFyK0Kv87d2MNiKCGWvsO85fSL+OKLfEbmz9hIgKEXn9EiNtHm4NE
         sR3w==
X-Gm-Message-State: ACgBeo2aI9m1L5Uq70sBZNignFpFv+SEYhieXtWSvTjpTkEG/4TdZNHN
	Oe7ZsQ+znnnMDZCtbKyWVyCusgfAzZXpVn/x
X-Google-Smtp-Source: 
 AA6agR7haLun8XmRSUCo6pZOneUtcB1SUh7Fxlc8Xw5y5kDZFLLqscKLkE8MciozR3JeBEPXkhuUIw==
X-Received: by 2002:aa7:8317:0:b0:52d:640e:322e with SMTP id
 bk23-20020aa78317000000b0052d640e322emr24588375pfb.4.1660081870555;
        Tue, 09 Aug 2022 14:51:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.51.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:51:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] linux-yocto/5.15: fix reproducibility issues
Date: Tue,  9 Aug 2022 11:50:37 -1000
Message-Id: 
 <6216cc2fb8ec6ddc12a02c45af5b3508a4e809fc.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660081510.git.steve@sakoman.com>
References: <cover.1660081510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169179

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash

Fixes: 1aa0e8b144b6 ("Kconfig: Add option for asm goto w/ tied outputs to workaround clang-13 bug")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4991b638eaf243a531731ecfee0681c3ada93583)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a385042c95..32c7db2c74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1bb4f634d786d708e2f078fca1ccc46c9c42f5f0"
-SRCREV_meta ?= "514a287a5b3adaeb58774fb86616fdfa2e751cf5"
+SRCREV_machine ?= "13ee019f28013cf8c102a3ffaadfa5e9ae9743e1"
+SRCREV_meta ?= "f7f709bf874f85baff9f2fb0ac0341c08399b144"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b6473d740a..8eb138e78b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0aa6b57221bb524abcb34e8772ebff0f34a4a322"
-SRCREV_meta ?= "514a287a5b3adaeb58774fb86616fdfa2e751cf5"
+SRCREV_machine ?= "86c19d4c40f475e09a076d55391fa66d96a1b3ac"
+SRCREV_meta ?= "f7f709bf874f85baff9f2fb0ac0341c08399b144"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index bd4203c41a..083f87727b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1dbb5e5eb62a52d71324867d1256fc0b2374d8c6"
-SRCREV_machine:qemuarm64 ?= "92f780cdfe537cc6fc339a55aa2d5ce649be51fa"
-SRCREV_machine:qemumips ?= "6eff04e888e27e79251ba7c1777b6483995d654d"
-SRCREV_machine:qemuppc ?= "03453f65f2427ec9b0f2a542089fd1df844d2f0e"
-SRCREV_machine:qemuriscv64 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
-SRCREV_machine:qemuriscv32 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
-SRCREV_machine:qemux86 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
-SRCREV_machine:qemux86-64 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
-SRCREV_machine:qemumips64 ?= "667b54b6cd20a8c5ffcc36603922b6d13fa3f2f0"
-SRCREV_machine ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
-SRCREV_meta ?= "514a287a5b3adaeb58774fb86616fdfa2e751cf5"
+SRCREV_machine:qemuarm ?= "c33f2e2ad3fdcc1c9539f80fb51b49f68c544c03"
+SRCREV_machine:qemuarm64 ?= "e8a14fadeb24619f20d3caebc01c7f26c49f768a"
+SRCREV_machine:qemumips ?= "c5f07eee39e4e03e90de3e71a3f6448fdb73921a"
+SRCREV_machine:qemuppc ?= "b5873d3a40b837059a36179174863cb4c7f9e109"
+SRCREV_machine:qemuriscv64 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
+SRCREV_machine:qemuriscv32 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
+SRCREV_machine:qemux86 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
+SRCREV_machine:qemux86-64 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
+SRCREV_machine:qemumips64 ?= "a6c0767511eed80395777e42d33fdc8405bff2b4"
+SRCREV_machine ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
+SRCREV_meta ?= "f7f709bf874f85baff9f2fb0ac0341c08399b144"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


