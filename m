Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4965BC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 03:38:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.7756.1660016287531299034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J7Pz/Rjs;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id i24so7879705qkg.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=X0KSSHtkfNPk2C+iaKMzi0jvb+z7UhM9ro3RxP7Z7kc=;
        b=J7Pz/Rjsq50wJ83DK5Zm9q9OJHCrz0hKI61tsRrFsbY+NekUalqfLvHkoKAT8Ie/3o
         IQ3bzp0PzPKJa0bb44ombAZF1+uOIftC35lC+nV4qys7MyUaF0p++sxJ2AOWHcO9F2HG
         3ey4J+i5qWUK32ePCNtHFtJVKUn6XpLwClRiU/m854Pmbfe5m+HNcr3qI9IkDKAimOAK
         Lv0HhKKptVO/JMWQfy41wkQ66hSgxGgOJq2SiH28f5c4zdaO/Td/PcG/mb2CyT2OGeA8
         m0HMel9Na0aqn0XaEyfwKx7GZP8haa+9Kj4qZrtNyKSxgnFpFsTFem+JludqP3fMyYTg
         Of5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=X0KSSHtkfNPk2C+iaKMzi0jvb+z7UhM9ro3RxP7Z7kc=;
        b=QngcKBlVpxI2icLBn96x6+3BzNo1fCa/KPNMJv/l3nVTC9RUUOZTIt8E8iCr7Cg2EV
         WJsp3mVustt0in1RKK9drv4v9Ar1VGOwB7XIbXi3m3DIu0YMCgVKO8WqkPnI/S39rGdj
         tghrynovFHr54BR//4GiWo9qzcbMrJYaTTkfpizDaIEufIuqdr8oYN4P43rFXKSH4D77
         vYGDa7kB58LHS7z74UzNjV67iqyryCbCO9I8Fvh9r/a8VkzlgT8kLbJPh/tIKn2mVUM5
         is2vg8Gt4OH/XNByBV/wJ0WrsFPAwaMc+lgPxskRKt0OXuz0wgO72Z6+eUYtf/seBFTY
         +pMA==
X-Gm-Message-State: ACgBeo2e1MynKGSAGrXf8dhnrBrDdW5GB7S7IG0lnubKV+u9AL7zKi00
	rPEQSZ1MUMplECNo1WoG/lo=
X-Google-Smtp-Source: 
 AA6agR7fblxqSFb0j/jOm78bn6u+/uo/nAI3p6k3swCBBEibwbyJak0Q91dqHeHrbHpXHZ28VqwcPA==
X-Received: by 2002:a05:620a:430f:b0:6a7:9f9d:20cd with SMTP id
 u15-20020a05620a430f00b006a79f9d20cdmr16158079qko.389.1660016286410;
        Mon, 08 Aug 2022 20:38:06 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a05620a0ed500b006b615cd8c13sm10025327qkm.106.2022.08.08.20.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 20:38:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.15: fix reproducibility issues
Date: Mon,  8 Aug 2022 23:38:01 -0400
Message-Id: <20220809033802.52467-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220809033802.52467-1-bruce.ashfield@gmail.com>
References: <20220809033802.52467-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 03:38:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169123

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash

Fixes: 1aa0e8b144b6 ("Kconfig: Add option for asm goto w/ tied outputs to workaround clang-13 bug")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


