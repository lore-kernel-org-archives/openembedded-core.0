Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B2EC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:06:06 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.15269.1664305556688256832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T0KC9GE0;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id c15so1490610qvp.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FPKHBo0shNhbQKKLBtQzJMpZSqx5BuZvV8RixjeJtOs=;
        b=T0KC9GE00DoW/W7EjRwZYnITz0Ych/kqJ4YN/dmeL7hrokMqcLpVQGgXxrrStathAd
         sO9jEmmmOLYi8plgWb61vkzSuOLf7ecJy+rLbcgfiujUBbO9JT5s5hilVbkhWFXbJP+R
         Jr1FlODZ8XHXQaqPI7GGk2BtUhTE1IyXUU9SJT7jGIHThUGh7yiJweKF2OCWL25yZ8JF
         UbwXUwAyvH5n6RWGj0LOKC3iCzKABRx7uhqnDJZbKwsj+1RICltZSFhCGZCs1JirbcZh
         +eYJjcyiJb1kTbnj9nypjlhvXXFYwZX7AtkCYaI7tGJJUQbeFYI0WMk632S5xwFzJpYG
         gsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FPKHBo0shNhbQKKLBtQzJMpZSqx5BuZvV8RixjeJtOs=;
        b=oRfzRImtcX9l18ZHR8HE0BodkRq3J8WAajoPw+u9lhgVV5/1bZRtdstcuocrX791DG
         W4vqo6Jxt677GQBJhJFGjMmTsVLsiveMYyWMivHR13yzBH/QyWpyIb/Llze1LCi3TFgE
         O52pNqPF78pl/0O4TIgwiTTBHIrgKS1lE42JtdaFvMe33WaqbI6/o6JLrqymYkCIR57I
         reIxtLl8k8rkTSJXWdaYEbs0ElhBA141aD8hZL7bGlEhrwb6BotBExTy0XySWrpr+8qp
         5HbrORoqSCsRzrk6cG6Oom98QPdtktk6a+4dk/LCRYaEBDPnvuDpwtnxxVs9S87LIv42
         lyJA==
X-Gm-Message-State: ACrzQf3HhKCebBf05k/dfZ6j900CnGGLT9wCURdSbMWU1so8QjadvZe3
	EL7P2Nl+JvgHBI/Zz0UF9bE=
X-Google-Smtp-Source: 
 AMsMyM4sbY6j57qgi2DfxlIqvttCnVDm0OwjYTP5q6uGNkfITJqhMU1wIW6wNn77YmD1mPhc4gW75A==
X-Received: by 2002:ad4:5bc5:0:b0:4af:95e2:5722 with SMTP id
 t5-20020ad45bc5000000b004af95e25722mr778986qvt.116.1664305555609;
        Tue, 27 Sep 2022 12:05:55 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 t16-20020a37ea10000000b006ce5ba64e30sm1403436qkj.136.2022.09.27.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:05:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.19: fix gcc-11 warning
Date: Tue, 27 Sep 2022 15:05:53 -0400
Message-Id: <20220927190553.7313-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:06:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171124

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.19:

    65a9a22786a6 libbpf: Initialize err in probe_map_create

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Ross identified this change as worth backporting to fix some
gcc-11 warnings. I've been soaking it for a bit, and haven't
seen any issues.

Bruce

 .../linux/linux-yocto-rt_5.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 17ae94066c..b3e9fbae62 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3596666292dcf3fc078090666dc327d233695310"
+SRCREV_machine ?= "bc8af638c00f28a46e77e34056079087638f6e65"
 SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index c18278ad79..466b7063b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
 SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 4fc1ae9245..f882972e35 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9111e441d26961e67bef7866919c51b27e794bac"
-SRCREV_machine:qemuarm64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_machine:qemumips ?= "5f89b6548b6665f3ebec11266f2c7db2793129da"
-SRCREV_machine:qemuppc ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_machine:qemuriscv64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_machine:qemuriscv32 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_machine:qemux86 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_machine:qemux86-64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
-SRCREV_machine:qemumips64 ?= "99613988297ac45653cc81319e63b2821645a3ba"
-SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemuarm ?= "446661f6a3b07535304497c1a51d9cab95f48f0b"
+SRCREV_machine:qemuarm64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
+SRCREV_machine:qemumips ?= "98da147618fca3da29cf1c6ab9c53f24de2c587c"
+SRCREV_machine:qemuppc ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
+SRCREV_machine:qemuriscv64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
+SRCREV_machine:qemuriscv32 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
+SRCREV_machine:qemux86 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
+SRCREV_machine:qemux86-64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
+SRCREV_machine:qemumips64 ?= "53842054198d851b5deb5810afaf126156efbb54"
+SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
 SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


