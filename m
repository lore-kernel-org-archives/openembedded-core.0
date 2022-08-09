Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C32C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:28:25 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.423.1660080496469773757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1J/9cBGi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id y1so6889023plb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S943EILVru3zgTTTpYhWDJK8f2BTbY0lBSMTr8LnA8w=;
        b=1J/9cBGiAIukSrjHMnT4e/Gf2uQKZO8SM41PJYhLo0LbW6XEp3bjyb5IWz60FZ8ZIT
         +DH4iYZZyjxp3o5erIaP8YX6B6kNMtY5euRJUFaYWWGhFZSXGR7Nr7gjs0BuZlSlJ7tU
         Zs+QUn//BqVnGyH0/OHOC7OXEE9NItcCyvvYBKXrm3XAtjUvm7AspugZxVD5B8PH9ghA
         jjj2obvvj+Z4GiXiPjJrP7vwU/ovPdSQKUPww+O4fA2KQWKHdUUoVHivWGei3YYTSb7q
         BvMypzbFwQpw1uiYWEKCXccNbiEV7yhknP+/tjHnASmyiEGC4Ia8XGjrKIZhBPK6O0sZ
         9amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S943EILVru3zgTTTpYhWDJK8f2BTbY0lBSMTr8LnA8w=;
        b=AQuHXkUm+bZtbiLjDW+NQ9IJ+L1McZJWFd2TTnJMc39Au47WQtjrecIZO3EN6XQUhC
         3S/yrsFZYMAb/JxYjg+6VTMxYIqPZoKH19UN0QKMLyEaw2Oull/+h6mK+6pz79rxm0Km
         fEhUnD+XPyM49ea3vf6TDNBtpxFnhJ6XN+sr8N7QBtZjWqK3Y2ac4Q843+jldeA4n3eU
         SQrEpUuaGhJu49xzRYisDne76qep3WiRkQ314BHOZAHK98SWuw4m65B0YpuINbdL7QbB
         GTLao7pgs20xt+8XBp6E1qi+uu/9U8HMkLoDC+ApgFJfc24Lc8pgP84k/KLvjue2q0Nh
         eHZQ==
X-Gm-Message-State: ACgBeo0U4GwuiWX67qDbNVqbwynLWLyMiQUga0PfmQ5jscnYi/AUtCUc
	I4H0FQ8h5Oi/WDUphImPF3SxB+MiqaBtAJ75
X-Google-Smtp-Source: 
 AA6agR4I+O+wNW6yS6aUYqiWyzwH1x3HzPAb1cFx6zsg+otlFi8sYmAc92icuMJgbJIVTHEBvu6jrA==
X-Received: by 2002:a17:90b:3b8a:b0:1f5:1df2:1fff with SMTP id
 pc10-20020a17090b3b8a00b001f51df21fffmr403628pjb.169.1660080495369;
        Tue, 09 Aug 2022 14:28:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a17090a4b0c00b001f4d711e165sm62273pjh.11.2022.08.09.14.28.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:28:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] linux-yocto/5.15: fix reproducibility issues
Date: Tue,  9 Aug 2022 11:27:40 -1000
Message-Id: 
 <ddaa3ac6a834159043af31dfa3bc3279b37634a6.1660080350.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660080350.git.steve@sakoman.com>
References: <cover.1660080350.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169169

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


