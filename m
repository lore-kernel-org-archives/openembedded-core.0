Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6B5CCA480
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:58 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.21807.1658104313770011163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lpzUEgr5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 72so9272763pge.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P89ZQg7JYkcy9KOZQuIEDn4d/CfCgZw3Ibwm3sRfJwI=;
        b=lpzUEgr5joyFTwgzcEtnEBe5lkhIAyou1sSTIlGOcGySniaJJsE8mDvOp1pnKqfQ0x
         1afbRkLD21FA49euFJPaULI1ccPzKOZUBHSW4CD366tgMkowqG9st5YY15wdj2oJyu4k
         ZrTiPHRGx1EeN+pOz1/+zDWtvnFa1g4mY+CxGOab1N78OgcmwhdH6P5BNubv/bIhdRaB
         bq6bAYcZN5pLWmeOVD6wIs4huU2ElVlbqpuFgO6uFpWMSR3+CPb/FkPo1j/8wFIzFTTO
         240R6AU8GKYdDe07XdVFhczOp12AjHvTF5S4cqyXJAKUMStAStR/QJBqNNZ9BZdEoW/9
         zmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P89ZQg7JYkcy9KOZQuIEDn4d/CfCgZw3Ibwm3sRfJwI=;
        b=AeUuS3gMed15mS0xoGp//ULDYrNrSWGUNQOIiK+AWXvEbd6ISpfW+qhzCoaN92xG+u
         SdrRpp7jfa9/whAOuTxhZK65Ci+OUAzosbyJihMRN/8MA5s3ctCzKDTcWpCk0bVK3z4j
         I8d6xlxDCYG9L3FEvmR+4WtCXLlWf5TQ1LzlEtwfRX3n6zsQ5s/e7LSVOKyaafpWjFM0
         mg+1dHGJfBWLwGeO54NifwKoRayqoJS54qob8aeQ59mdli9UTG7L6QE71rVYDjJHTz7z
         tYOLGD0tND646dJXRUAgd+7Y2Y4OTEvNyO98q3dJIFgjkkDtIB7NQTFdwMQSgsq1AHyC
         KSEA==
X-Gm-Message-State: AJIora97O9bF2Y2fcTB+eVJTD2TEmqcjqOZJtoZwB9n8GjtebNidzRi3
	fPLMA7MDbLRBaj7uUGLbPSQ6vpmVVs9kDUmn
X-Google-Smtp-Source: 
 AGRyM1u17DisDvMIXdHyy6DkbBusq9aH4ZfsPjDxTKZ39WJ5CJNsnKzpVgYXRwdhw0WBxBWBM+MmXw==
X-Received: by 2002:a63:3cd:0:b0:415:f76d:fb4 with SMTP id
 196-20020a6303cd000000b00415f76d0fb4mr21943136pgd.587.1658104312673;
        Sun, 17 Jul 2022 17:31:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/23] linux-yocto/5.15: fix buildpaths issue
 with gen-mach-types
Date: Sun, 17 Jul 2022 14:30:17 -1000
Message-Id: 
 <267576eb2488aad3e41ee7e1e42f212727878bb4.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168181

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    6c085baf1838 tools: use basename to identify file in gen-mach-types

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5db9594da2bdc6d13be2190d10739b51de57890)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 61b1df04a9..f1f5de3b18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4132e425a2dee778212b42d99a9812fe1c78a03d"
+SRCREV_machine ?= "3a7da2af1ba40b8c2247bac03a1fae488a1abde2"
 SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7c81b048dc..e271c6741a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b2dcc4f70362059ef107000f9be5c76c2886911c"
+SRCREV_machine ?= "122de5742628e6b4303f0bbc653d409ff9f93557"
 SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 3e22f8d570..1c090db7b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3d2ffe77f277a0a650e7d012c5bfe3765a467e4b"
-SRCREV_machine:qemuarm64 ?= "1da6524b1508ca6e9b6602471b478d310bec1960"
-SRCREV_machine:qemumips ?= "4101fd448319edc00fec2bd822be407d19205bb9"
-SRCREV_machine:qemuppc ?= "651a0112fb207bae1be0d2609e9a910135fb4feb"
-SRCREV_machine:qemuriscv64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemuriscv32 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemux86 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemux86-64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
-SRCREV_machine:qemumips64 ?= "d518b9a80c938ca7ce11e56d2275c33b89dfc9c3"
-SRCREV_machine ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemuarm ?= "41652fad285637467681f47d4e94a886ffb473cd"
+SRCREV_machine:qemuarm64 ?= "b28bd930f849c23a8f1576b22a8e59a0b2ac8cc1"
+SRCREV_machine:qemumips ?= "fb51b7d8d905883f2595f006428c142975231886"
+SRCREV_machine:qemuppc ?= "731587ce51ec087bfbb6255a1e9c763b4f71f7cb"
+SRCREV_machine:qemuriscv64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemuriscv32 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemux86 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemux86-64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
+SRCREV_machine:qemumips64 ?= "5fcf0d1536623c9ede2ee54d143a650c59ca9d59"
+SRCREV_machine ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
 SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.25.1


