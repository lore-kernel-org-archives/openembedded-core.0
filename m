Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E911C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:41 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.12852.1654610381037275072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBGyyW3g;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id k6so10197239qkf.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFjAzWf1dOqMUSIFkaNKYCTN4aNmwkI12IxaiuA1RXs=;
        b=ZBGyyW3g624hs+W2Xbwh8OUVEIwHhf7M5xwjJvk/Jh9E/j4rvLD0xy1IIiFDzvPhsQ
         1IOqeM8zx0kwyP4uONmNUpU+A+/QFz352WVp4rPX7X7hdwQCDboJgHEBGEouCTccd30k
         IE4qiWuCCKl+QIQ5YCZSBL89GFijKpluKV3ogIPMtPgmJEPhM1FVQuTwQMELhyn9/0HK
         +kpKlwB5yvxW3j4yQkD9ntczhTyk4T98g1QvCckxVwVz8IoviCYrAfVKYwMUigP0qSBR
         Zhk9fUzFSga8DVGtXXonab5axob4qtxh50tRXYiMopQZ59tmWqbtAYlAK+1yKWhKD38O
         J7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFjAzWf1dOqMUSIFkaNKYCTN4aNmwkI12IxaiuA1RXs=;
        b=as3QnVNFM9reE3qIP0VnhrKMnjW9Im9TsKffYKNLKzzA+CeMaT7z0RJgDS32Z0qiwn
         jjNEMf9OEXwOzBC6V+GLVxYHBQCzHsa3d9pj0eFKr77mAlSaLKKWgVJuAIZPeE5lIvma
         WgtoZHltC54eJMNWVzr9PflJ0tnheOpLnEr12iPS2H7VzJTVu6gnp0ElRWvjiK3lpIlE
         MMJ4Db7GfO8S0+DsdNiRB3Mxvar+BuJLr6nwsVg+OtkXTA4z6X4pDP3S7M3nCMaf2o+H
         8Nv2RZuWjtjjaTdHTRypqrhQCnhrHMywqnrEe17OqyAQMpWWjn0+6n/CUlvhliYcyyj+
         UOvg==
X-Gm-Message-State: AOAM533hBLbMn2dBYxMFwuj3XMJ82V1dl7KiSdHZ0CixwheKRd+Z1Dpf
	PUGYCBoRsl7969X3BnlENlROzcMxOXKG2w==
X-Google-Smtp-Source: 
 ABdhPJwWEfNS4VQyay4VpvgdUc5GMfuE5WpDiP7ZTSlC4pQXc32kTBJK4Mw3R+Xtfg4A618Nf5vnHg==
X-Received: by 2002:a37:f90d:0:b0:6a5:b72e:d2c9 with SMTP id
 l13-20020a37f90d000000b006a5b72ed2c9mr19600077qkj.490.1654610380085;
        Tue, 07 Jun 2022 06:59:40 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/5.15: bpf: explicitly disable unpriv eBPF by
 default
Date: Tue,  7 Jun 2022 09:59:31 -0400
Message-Id: 
 <9dd8b95fa91df6e0da0d6d648c508b4c5ef2a88a.1654610230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1654610229.git.bruce.ashfield@gmail.com>
References: <cover.1654610229.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 13:59:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166662

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    5371fc3b2a2 bpf: explicitly disable unpriv eBPF by default

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 6bfb8deb1e..5f58eece6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b028c4baada43d48014d4350dd66debe7e4cf362"
-SRCREV_meta ?= "37891dc371e83a3451781dd81a8a85cccd60084b"
+SRCREV_machine ?= "3cc07a80d507ab4fd25ad3adafe07d83bdcef401"
+SRCREV_meta ?= "eddfd0e846eee9307c95c40d706725afbedab285"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 0cf2d68d56..144c20e271 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7b1fe61102fd6efc26373305417cd683687eb7a0"
-SRCREV_meta ?= "37891dc371e83a3451781dd81a8a85cccd60084b"
+SRCREV_machine ?= "8037a6211ac7e61fae9eb3a33a54d72b373edee8"
+SRCREV_meta ?= "eddfd0e846eee9307c95c40d706725afbedab285"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 206cc0692d..1666b8cc13 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5a68f2d15d17f0f3c397e7f8c83f3f664f7037e5"
-SRCREV_machine:qemuarm64 ?= "00e666e6154fcdf52268f2a5a612b96afad073b0"
-SRCREV_machine:qemumips ?= "fb9e75076deade31754b7ad644952d63137e616b"
-SRCREV_machine:qemuppc ?= "49f6567f3b85a843e8b6042a79c58aab0bdbd0c9"
-SRCREV_machine:qemuriscv64 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
-SRCREV_machine:qemuriscv32 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
-SRCREV_machine:qemux86 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
-SRCREV_machine:qemux86-64 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
-SRCREV_machine:qemumips64 ?= "1ad01ab47ec056d4126798f6d57a33b65b2be49c"
-SRCREV_machine ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
-SRCREV_meta ?= "37891dc371e83a3451781dd81a8a85cccd60084b"
+SRCREV_machine:qemuarm ?= "149e76317b407ceac4da56d9df79e6e58e2a4dd6"
+SRCREV_machine:qemuarm64 ?= "1bf709cb1641eb13a64d0bd4145e61e56805af6b"
+SRCREV_machine:qemumips ?= "8cc914d3021787d6c48fd1b25f15feb32c5be2cd"
+SRCREV_machine:qemuppc ?= "59e013f100ad1887cf28cd51912df011ae95ae92"
+SRCREV_machine:qemuriscv64 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
+SRCREV_machine:qemuriscv32 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
+SRCREV_machine:qemux86 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
+SRCREV_machine:qemux86-64 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
+SRCREV_machine:qemumips64 ?= "a0ae7ea1f60a75210784c684fb577b26a172f7db"
+SRCREV_machine ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
+SRCREV_meta ?= "eddfd0e846eee9307c95c40d706725afbedab285"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


