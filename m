Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BE1C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:23:46 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.11179.1642184624938818156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ARAnYrVI;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id bb9so6077975qtb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uLpz4NDasl1jSbSeYmEfRdi+flIJ+slUxNwrfy7TyvM=;
        b=ARAnYrVI2QVQUfirBKZYu9/x6fEjhZJA/3RYkNbRA4RGgE6wEWLuxWiRLxywg4+Hl/
         ex2HlNUmwnVMHGHp0fr3pbQX1EbqgCaHnWpQ3IS4KcjzhXMoq+jVS400vdOGyqpFgfYK
         tOUdvxlXvk1TzM2HSP7M+UmSayB3VfnHHk83Kgyqwha/advaLWa8CpiPh5w0PoPVa9GB
         9mfSK3n6+iaez0A+Vb9XLIkGPlfElXO1PIHqwZrJi9xkb59Gqsro+UbndfVXpuiu3XZr
         cSG43C2b8o5xtQCqmNJShs575MJOZLRn4cD0xsQKBzUmcD7e4tMIA49pfhtCDXjUImiR
         YMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uLpz4NDasl1jSbSeYmEfRdi+flIJ+slUxNwrfy7TyvM=;
        b=EQNd0l5Whcu3cF6nF9tOJ/M1qAYHWxnnxfMjawXM2JcXzQoIBgW55bve+r89zkrltq
         GmDZC9uCdy2kYscte91QQlks1xarLsVivOwYHHRPUvaT8a6xDx/EN0PaqiE3F/LluLrh
         wmc8E1Tkc15c/RWq5zOjCIvFkfSdlZ3hfT/z/SQ3D5g1EVBRLDdvbU62K3QrY1vBGjoe
         g+BUG+6P2f6+eU3zTKWIDMFiZIGCeR/QZvIKOzgS9v52+qppPs0eZ/4f2qg4cZ2YW96y
         3Gku2cBLLxrtqEZWr1dgwEQqfPyyOzCnMfniGjwCEC1wZUtq7Z8eq3frIP4LG8Ay9JzZ
         UEgw==
X-Gm-Message-State: AOAM533k1Z61Schliou7vOa7w8jEZs5sAj7SyPXoo2hfDhYa4rHDSq5O
	6KhNNEMOW9IshxSzKCSg/zK3K9oPuVKWsA==
X-Google-Smtp-Source: 
 ABdhPJzGlac4M3EWjX3hghQ0eCAAreoJYE8FD0+f/N7e59zdBk793YQcw6CiGuqAVW/BjD1arKKa1g==
X-Received: by 2002:ac8:5944:: with SMTP id 4mr8905384qtz.19.1642184624008;
        Fri, 14 Jan 2022 10:23:44 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z14sm4448995qtw.59.2022.01.14.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:23:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.15: fix arm defconfig warnings
Date: Fri, 14 Jan 2022 13:23:35 -0500
Message-Id: 
 <d283e6f27e44942b11d77083041f0f4d17515e9a.1642184457.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1642184457.git.bruce.ashfield@gmail.com>
References: <cover.1642184457.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:23:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160586

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f114e0ad4e..0a905d0bff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4cf3777087098d1900d7b10f9fa902374e147243"
+SRCREV_machine ?= "04a95b0307715d513560636c2bef4238dde56c86"
 SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 1c41406f52..bee98d87cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d6eeaf39f3beb483733ff2970c901a94093d0b7d"
-SRCREV_machine ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemuarm ?= "149aa4e4f2f3c704e11fd379be32746ab2d3433f"
+SRCREV_machine ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
 SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b6f2fc3b4f..2e093357cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "aa48e73490dacca52a99928456050476765b56a7"
-SRCREV_machine:qemuarm64 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
-SRCREV_machine:qemumips ?= "b15f476dfd5edc44300279429b7de25ec899c2a6"
-SRCREV_machine:qemuppc ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
-SRCREV_machine:qemuriscv64 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
-SRCREV_machine:qemuriscv32 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
-SRCREV_machine:qemux86 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
-SRCREV_machine:qemux86-64 ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
-SRCREV_machine:qemumips64 ?= "e146f932b0ae0c3f764745df1c80aafa0136f276"
-SRCREV_machine ?= "b5879e67153e83a5884bbfa32346dc33d96921e7"
+SRCREV_machine:qemuarm ?= "49cda4a3872929491dbcc3793afbd01709555315"
+SRCREV_machine:qemuarm64 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
+SRCREV_machine:qemumips ?= "049f989b96848df48c445c2b83c634cc5d692032"
+SRCREV_machine:qemuppc ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
+SRCREV_machine:qemuriscv64 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
+SRCREV_machine:qemuriscv32 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
+SRCREV_machine:qemux86 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
+SRCREV_machine:qemux86-64 ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
+SRCREV_machine:qemumips64 ?= "27a47d7d5d6e7bbe8267f32f8089e395e0eaa863"
+SRCREV_machine ?= "02bf23d26bc4c2e6859aa3810df8d6b955488a06"
 SRCREV_meta ?= "9855687d0262b744ef201fc6e019c659033b83b2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


