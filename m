Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EABDC3DA7D
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 17:00:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.101082.1671901199887380916
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 09:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m0ok2tjz;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id j17so1680577wrr.7
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1Ozo/yV2hxV/K1pBzt6M4b47j2LkHlO0nXM0WMiSMc=;
        b=m0ok2tjz/OkKAoGZGnpm8OqPXywp+7cNkWPYPI7daXTXsJVH/doSGFotg5qIt3XG6B
         hvpKSvvVXMvs865OUHEHyaBixztIlHVTRsQCudlNd/ntd2FZ7XsDed8OOZskqJKvBbD3
         MaZkyyTaEkeUsbUvAfgSsGZ44A7uI058tyMSsXb+9KYbD+rRzNf9B6D4udMm+S50lJ70
         FSR9YoKUojdzZvjDNzdxp0/cVH6kMkCqxSwm/Gxza5VWVk9+gpbv2jjEQqwgTKSvDzlW
         hDlBykqsjnmgFR5IkYwVM+H2Ae7pvIINHeVNFlLzi+UkxQj2sMiTOaUbn4m+FO1Wm6ym
         I4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1Ozo/yV2hxV/K1pBzt6M4b47j2LkHlO0nXM0WMiSMc=;
        b=vBlttYhIhq10yYbaHnXeF32oxt/NyLsxG4cDGTgrNtIWrOzudAT6WlqIjqFOmNPbWW
         EtfBIjiOnTPBnljzQhXHI0MnAOkFE/tcTL1bFPWdQ+JkHu1HIDpTT9LI51MnOe/s7btI
         Xe2KG8HfF3ZpKmOlT4njwBQTYgzmgiuGzoXF/BlH3uZBT4Ee9VDb9DMDX4xhKnK96V+h
         zxJsxoKT1Rzms9E3VUx9Vsre+yKiHSuZASUvrFTRycz3v3peIplkLCgKLopcDntR9YVh
         IcWjFfGD1L2GXNPppOAGrQ1LfAcaKp9Oolt7XLGYtEa8tyCbURli+6vsNvVQ3KCvAwiu
         PLMQ==
X-Gm-Message-State: AFqh2kqYB0NaId0h82mbEFJyB5UtuC/XSGF5rT10hwJ5tKCx6UpWOZBN
	5p2MnIgCpaZlCMRjDtOb+Gy1XpHUcVs=
X-Google-Smtp-Source: AMrXdXv1R6OOMKbKqtnODGxic+SDEELV3KJ+Zpp1SgBI8hbyQOZntCekw6PaaiI60yWiJ2zAQEv6cQ==
X-Received: by 2002:adf:ec49:0:b0:242:989:e07c with SMTP id w9-20020adfec49000000b002420989e07cmr8463298wrn.38.1671901198266;
        Sat, 24 Dec 2022 08:59:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm6005622wrp.95.2022.12.24.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 08:59:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] tcmode-default.inc: set LLVMVERSION to a major version wildcard
Date: Sat, 24 Dec 2022 17:59:38 +0100
Message-Id: <20221224165943.1324800-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221224165943.1324800-1-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 17:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174984

There is no longer need to be specific: none of the recipes
using this variable in core need to know the particular version
of llvm exactly when using the default one set via PREFERRED_VERSION
from LLVMVERSION.

This as well enables automated version updates of llvm
for minor releases.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/meson.bbclass           | 2 +-
 meta/conf/distro/include/tcmode-default.inc | 4 +---
 meta/recipes-graphics/mesa/mesa.inc         | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 3cc94c7584..48688bed75 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -72,7 +72,7 @@ strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
 objcopy = ${@meson_array('OBJCOPY', d)}
 pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config${LLVMVERSION}'
+llvm-config = 'llvm-config'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index dc1cac734f..c784221062 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,9 +24,7 @@ GLIBCVERSION ?= "2.36"
 LINUXLIBCVERSION ?= "5.19%"
 QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
-# This can not use wildcards like 8.0.% since it is also used in mesa to denote
-# llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "15.0.6"
+LLVMVERSION ?= "15.%"
 RUSTVERSION ?= "1.66%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 115621228a..93b3b59a91 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -58,7 +58,7 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
+MESA_LLVM_RELEASE ?= ""
 
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
-- 
2.30.2


