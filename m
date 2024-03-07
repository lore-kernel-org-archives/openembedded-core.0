Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34468C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8649.1709854658670912044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HWs6O4Ce;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dca160163dso2050875ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854658; x=1710459458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxXXoW4PckQD0+W/iq+PC7tjk2FoX+reUrN7UOOIrBA=;
        b=HWs6O4CeJmv4sk3+3u2+oB0eyGWk5loeGKQfimu8/2GFXtsM7abbiFReme98FiB4/J
         YIiIiGIK/HkOtvq2UREeFFMjiGL+0gz4VaeNULIG20thXJSpBxiyYA8oWG9si34sv3AT
         UphT4diV/ePyN8Dw446SPIwlm15tTylQun3P0EXVvJgjR/WAcJEekCBwSdHnMPwDWVDe
         mO1eNBKwrDnVfQxccEN3VWABm0doZbKDWMtTBb26EjaD9brUVW4HT6argqfY9gwuqgLD
         uvaeQS7IZQLzsPSTuHCuQ/dKfLOnKoJ9TxBdcmvUIzZArrWSYi9y9hGeUhnE/N0QdFta
         LD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854658; x=1710459458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxXXoW4PckQD0+W/iq+PC7tjk2FoX+reUrN7UOOIrBA=;
        b=ZaY6aed5TC9TBCN+uHfLO8wWFxsVXDsG/1cNGYbf4KmD7aI+WHIM2TFKFIE+be+0tf
         LZJb8qjM+wEY4rZyfTO9Ok6TqHxPKBPjixWMGLJ7jtmQs7L6mmfpuud/w1Nr6iyRZGb7
         /uuf+XU/YXJAbieZ7uttVJ2w93K9E3D5TIF3z5q+R40rExp7Dm8tHBQ6zz1d2V5gxr19
         yZkcJZWA7ozEUHoXMBJNkb6Ua/bZwa+kIe5x3KTLlyZHEyi/yrCYnMVygj2VQiJs8yWu
         M0DKnF/fqVSzx1OUdifIyoZCq4w2LXZ8cDADx8tuR3GGNAPd5t+R6phGczx3V6ITuaZ7
         +IxA==
X-Gm-Message-State: AOJu0YzC8TqF5AqdSIvPPw5FMxcR0kqbLfjOWXyFPsLMvPglqaC0E3Yy
	Ne1ZkCchu4VtNBw5HjAehQ1D2nCtEDTLIdfkmisNd3hY8ahePNP9FYnpZoEmC2XhOc9VtK8Zu0x
	badg=
X-Google-Smtp-Source: AGHT+IEg0Z58u79VoCmw1gh1w84ZnHKf94jpdDalKp/21Pf6iUU8tW7YhwaAnFR3QHJ/ly9E6JBJFw==
X-Received: by 2002:a17:902:f64c:b0:1dd:5df5:e6e5 with SMTP id m12-20020a170902f64c00b001dd5df5e6e5mr2836386plg.35.1709854657975;
        Thu, 07 Mar 2024 15:37:37 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] Revert "linux-yocto/5.15: update to v5.15.147"
Date: Thu,  7 Mar 2024 13:37:16 -1000
Message-Id: <68b4acdc16996050196aaa20445dc5f7467e353b.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196831

This series is causing issues with adding and resizing partitions.

This reverts commit f4f1964a7a2922f3253484852b76602af5f31a89.
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e64f21b2f0..1e61698222 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7168cfa2ce6492db31163393808806b6f48af5e8"
-SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
+SRCREV_machine ?= "daa620f017a02ae381f1e54be7ceb8a2f3e3caee"
+SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.147"
+LINUX_VERSION ?= "5.15.146"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 38bea23264..c7c4e09bd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.147"
+LINUX_VERSION ?= "5.15.146"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "641e2136a155ce3179c84b9365a5998c1354fdd0"
-SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
+SRCREV_machine ?= "aade2fc343af128889d6c6f1071ec1a8e9a548a8"
+SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1acd7b62cd..ef8c18b1b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "82f8a25a3894c10d1cf26914b8e51726351ba11e"
-SRCREV_machine:qemuarm64 ?= "cf955e443d881e296b83940143fd30ea83fcf222"
-SRCREV_machine:qemumips ?= "1c3babd3b42768e24c797edfc3f67906aca6d072"
-SRCREV_machine:qemuppc ?= "b08998787bece69376578b049cab073d8b80e872"
-SRCREV_machine:qemuriscv64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemuriscv32 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemux86 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemux86-64 ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_machine:qemumips64 ?= "4ff2c0496c0160a96185a080ec9678c63b68bd47"
-SRCREV_machine ?= "5822f13dba3b1f460536d873aea707f4b25840cf"
-SRCREV_meta ?= "487de687c6a4553f11d67b83d01f16f79449ee49"
+SRCREV_machine:qemuarm ?= "f59d00a628c3ddb39052284a4a7bd54f9ee12999"
+SRCREV_machine:qemuarm64 ?= "8b10556d4fd67dec1a16252ef0d3058dfe31dff5"
+SRCREV_machine:qemumips ?= "b0c8aefa7811fd3b7cebb25c1565f73523c7b2ac"
+SRCREV_machine:qemuppc ?= "0ebd785a8436934e3f3e6dea6506de7f7ed9947e"
+SRCREV_machine:qemuriscv64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemuriscv32 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemux86 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemux86-64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemumips64 ?= "187d249255a797c470b0680f28e18a17a05c3bb4"
+SRCREV_machine ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.147"
+LINUX_VERSION ?= "5.15.146"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


