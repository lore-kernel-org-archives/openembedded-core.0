Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6276DC41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.178868.1692240615289641687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=buXvB/II;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bf0b24d925so4420275ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240614; x=1692845414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsI23q8wiZaIOoOPJkBOj3jr3hHyQfT6VYkcggKZJ9s=;
        b=buXvB/IIkmHS9SPjBefmpjrBlL8ZVgh2YKwid7Kky1DHw3vCRPz8fmzt+bzSi/8hXP
         IamO2wrKDQSCTnDc54tEp15In8amE583hPmpWVtIYHaxLjWKVjZi7isObfPJ5049xK0K
         WeLSeZHPsBLxaq6rVvftQlQ+Ps5AMvFbcwtK7tIjjKsiS2Qhu2ZeQ0+mT57Hcoxd4UWw
         YZIAU+6jYNOdYt9l0gr6VbXTaZD1FvZ+o0tE14bDlAnk22g3372238xp5+T56UsmrW1F
         x5pjsmZ9l8TVXNPJT2uFDCyvLDnLiDuDbOThAqqcScmHPB0AmQdH/P39szpLyBgU2MZU
         w25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240614; x=1692845414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsI23q8wiZaIOoOPJkBOj3jr3hHyQfT6VYkcggKZJ9s=;
        b=jJ6/6Pn1iVx5mde311/ExK8b0rNW3RIdU0edS7KEl316RRcNZFFR98m0BQ/YH4fCXI
         azqKLUEkQHCegTLlNszoCEbCz1tFmL/l53rRuCjb533Uuue3v2SALBkmujaT3an4vd52
         MW306CllVB52s7oVJu+zdze4qCmNZWh7rNQkurL/N/8vqZY7u49LgYvdubRfDsBmO0wZ
         c74CdjK1mpAXx9F1wz7h6bY6u9mD3HSMuOzFazhWPiuc4kJmnaMoeXzKqeKo07o0JIFg
         4+EU0zuI2+zv1GhMY0+IXQtVfOlkXkyOAnS2V4wKRnAG0JmBMons8cK4vI9hRVGu/EyG
         Nasg==
X-Gm-Message-State: AOJu0YxROpeSczJoX3OUDj4XFjjkYJlCtRY0ulNgO3He+axsR+Cdf9oh
	8yClgAiDKsMgoilPbYyk4PxNrDtj3HUEBp7ReIU=
X-Google-Smtp-Source: AGHT+IFNnVs3XlX5115lSGPmiCTBp4H5r8Bv0ZAULN7SdYNlNO1vLTg3YNiQZoFmdYvgfXdmQNeuRQ==
X-Received: by 2002:a17:903:25cf:b0:1bd:bba1:be7b with SMTP id jc15-20020a17090325cf00b001bdbba1be7bmr3290283plb.39.1692240614360;
        Wed, 16 Aug 2023 19:50:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] linux-yocto/5.10: update to v5.10.187
Date: Wed, 16 Aug 2023 16:49:42 -1000
Message-Id: <50f8192a95315db169beb38d36d5d0a974f3ac4d.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186275

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    140d69b4e41d Linux 5.10.187
    93df00f9d48d x86/cpu/amd: Add a Zenbleed fix
    191b8f9b0e37 x86/cpu/amd: Move the errata checking functionality up
    113ce5ed59fc x86/microcode/AMD: Load late on both threads too

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6d8effd6e2..5feaa9811a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4a1803ede76bf613f627954d55abc14bc3ce33a2"
-SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
+SRCREV_machine ?= "0a7d0eaa4e53eede45702dde31a3580e4cce0034"
+SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.186"
+LINUX_VERSION ?= "5.10.187"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8a013a3862..1e401e2499 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.186"
+LINUX_VERSION ?= "5.10.187"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "be5fe90e1270855b9cc67ae6312fe04fa4d19693"
-SRCREV_machine ?= "1d287024a6dd075a6dc4027679fea5df640cebd6"
-SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
+SRCREV_machine:qemuarm ?= "54fe699b2a16739a9fb3905d3a6c6ff7475214ea"
+SRCREV_machine ?= "2fe6f9bdf89df6d468f7e2c7fc070993a11f029a"
+SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2ccedd8c45..93eff2bd58 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f9df75cf799c8ac43b932476c7ad6b4b4fba33de"
-SRCREV_machine:qemuarm64 ?= "404cf5c05b3fc82b4d8395fcc5abe4b26407665a"
-SRCREV_machine:qemumips ?= "9d39a0ab63dfaa32be0ddd02b61acd2fe1a2b156"
-SRCREV_machine:qemuppc ?= "e55cd861f7167730eb17a5c82891fad17c515b64"
-SRCREV_machine:qemuriscv64 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemuriscv32 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemux86 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemux86-64 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemumips64 ?= "7d139a5b0b4abc1a7104845c5c9f2523dce0d589"
-SRCREV_machine ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
+SRCREV_machine:qemuarm ?= "ca4bf25fb041f115ee9144acf175266e7d2c5495"
+SRCREV_machine:qemuarm64 ?= "7ef1d2f467aa45b98241421262e607ec080e0921"
+SRCREV_machine:qemumips ?= "f275b4829346d60d1cb600d4b8195eb6812361fd"
+SRCREV_machine:qemuppc ?= "af1960c76a2c940eee2e7b4c20e07c248b030b02"
+SRCREV_machine:qemuriscv64 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemuriscv32 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemux86 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemux86-64 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemumips64 ?= "2f630e9e4b3c809cf48d8e252477845c405195cc"
+SRCREV_machine ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.186"
+LINUX_VERSION ?= "5.10.187"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


