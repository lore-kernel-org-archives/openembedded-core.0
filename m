Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:27 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.10486.1651153702372481384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UQPwEDiB;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id x77so2814530qkb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98ceW0YKQjg0qG1uTSNsdZPAGLNks8P7cBfit19LsAM=;
        b=UQPwEDiBaQxxCYXHP1JanMf0UuUjwDg5hwT59mP0WDWDei1AlwphRyCbSHofYN1xxk
         fy3QGX+iRLD85fnI7lY8hwcsYi1vp+mmq5HRBzGDgzRc/zwGyLgTdLcWfIHA0vTPwSuT
         FmYHsChrAA6/4gFOg/kytOyiplDDR1abmhXukU92bvhMtVj3fDZKUekFAJeRtqrtZEz9
         2iUegXvu66oLTNs7tjFtvaNsAqOQEnUC3lj3qX+JG1xz1KGEuKx7V8BzSPvDcqww62qq
         /0u/w1JxGVzUErMbg+ArIKu8E/jtXNwf722SwiSxX3CTcouEnjct5mjYSzdep18E5R5l
         k6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98ceW0YKQjg0qG1uTSNsdZPAGLNks8P7cBfit19LsAM=;
        b=oECATAKpMzLL6HEeQODxUTN6mBIHELqtSut8XuSkMb5cykFa1P9cbStoKig4e7zP/G
         1k4YEWfyN0RvSKuOLE4IaGNkhsPQUFzS4pNLS/7Cc088LdDHZTFKlxYh8YQzgOWYkSdZ
         wbrVdCk/Yie7BfmjYiJX6NvzfEevjkOKw2vbR0npHjbalgcKiNI5zTcqCXZeoHh8+3nz
         xNQiNcDDz0j/YaSKdHzJctO+x9qYMK/lhRNuEIC/ui9e2lYgr7X3ukwyzDAi5tgCKXn9
         h1xJkXPepJuzW1uHseUmOariIxxjWOItMvU53jWW6uKK+7CerBaXyN3ECzbvfOV0WYcA
         8yIw==
X-Gm-Message-State: AOAM532ZEWwA1JASyI30YHQs9y6Ctnnfx0Or12d1BToIEVTkUhduL5ud
	cMQbLOOwltAteJP2xShMaSE=
X-Google-Smtp-Source: 
 ABdhPJx3KDBzxTyq7aZnlzGQFP5/GsBhweRYKnElg3MdKwCs7WL6hR/b5YEecjHKSXcvymY8H8bFPw==
X-Received: by 2002:a37:9546:0:b0:69c:7175:349b with SMTP id
 x67-20020a379546000000b0069c7175349bmr19571422qkd.441.1651153701474;
        Thu, 28 Apr 2022 06:48:21 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 12/15] linux-yocto/5.15: Fix CVE-2022-28796
Date: Thu, 28 Apr 2022 09:47:58 -0400
Message-Id: 
 <ca07a709f5edf6f51ffc618d23d2c290030efcd8.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164960

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


