Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B5FC25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:40 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.82163.1674238291055001969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=orwS/f5z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 141so4774400pgc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EmITKenhkSbksC2yCwVGjaIbMSObydjcWXokvDyJSA=;
        b=orwS/f5zxxDdUTRmCg4RM9SaCGbX2C73SLRvWLKds23Obv8Jpz/BrMhQz/5/+JKQzl
         9e2e4yTJuyx/rM48W+9JJiNRGrP57doe3Y9xcLl4l4MlJGI422mgrVw8qZfEpD/rfQQ6
         0eAniPyM6ASJCR+T7SDCf8yKRz3oCv94NWuLoJLIdMct9a3EbNguLtAzcleHUjN8+KFN
         kGy/dPPYNJl6KEi6RvvHsZ3WLbDsDylbvl0hN/ynmIqFJWoHct16c7mfz0OKWGX8qYjv
         PRCOrGHLRNILHQt02Nu3dk1zOVsyhrWkTIEjp3cH64+mrDUD/FtYA5xhrTBR0T+zWwdF
         sX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EmITKenhkSbksC2yCwVGjaIbMSObydjcWXokvDyJSA=;
        b=HTJH+1BsELKisURuNLb/N3lMZKhjLI8g48k6jsM/7KKxzB0TkyMCKG7PL6QGAsyprV
         9fhVp3GCrLgNloAFXfv0oHan3cQl3StDE/EiEoVSohyLinp7aJ1LeKah4+v4eXWtdS9n
         gNLuALcV+tbxeloGpPTqjBkDsFTq01AvK02EUHMj9tbq4AiDDRZ7wfLTkvvPrfudeynL
         B89PaSIPEGM+6ZOsQ9FYOx50CAPTAkmjIirdmKLNKSTm0NFGRXbSra5/QJi0II/gdAZP
         9k17YV5p/L6siyS/Ia+j+Yzu9gNQndLCbbIJdHUSaPXY+1KUVpJj0x04Rl26/kwTNLCF
         mhhg==
X-Gm-Message-State: AFqh2kqjDcmYkuqTz0N1mTMcTxzCUtIMhwXTQH5YfH+uFrIhsd0Iabqa
	qo8hh3ECObkp5grYU65TrHOcHmxgsa5CBNyb+FY=
X-Google-Smtp-Source: AMrXdXuFZEqsaBLPo6Q8eRGmTSpwc5myzeP57VsYoPOebdTH5dEinD4nZmr0Go7XJZWiwEWPKbqnJg==
X-Received: by 2002:a62:86c8:0:b0:581:b3f4:21f8 with SMTP id x191-20020a6286c8000000b00581b3f421f8mr7986550pfd.31.1674238290021;
        Fri, 20 Jan 2023 10:11:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/41] linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
Date: Fri, 20 Jan 2023 08:10:31 -1000
Message-Id: <94448553f0e6c5f7efd08febb973967186ae3372.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176220

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    da5513f30187 libbpf: Fix build warning on ref_ctr_off

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb75d561256c794baf6c89c1975967343145da87)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 63294f5bb6..3dac2fbcd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dcd3b533c5f6bc4698d5b09aa83ce9a4695df3b0"
-SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
+SRCREV_machine ?= "6a972b54f014ca67588d73f32058c42af0bd856e"
+SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 12e462228f..3dd2ecdf6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c7e10f06a33a546bcdd0b2e2909459b7572b5443"
-SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
+SRCREV_machine ?= "6e85c80a960287ec238f53c91eeade3456044fa3"
+SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 4e341713f6..dabbb82822 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e5f2cf3560139bbaad54796c323d60e66cc19374"
-SRCREV_machine:qemuarm64 ?= "d8835a4d4e9d4ea835316cd1843d62e30c5fef33"
-SRCREV_machine:qemumips ?= "0f802d6525c21abe586c833074fece3e665a9ed9"
-SRCREV_machine:qemuppc ?= "84f529230ca9f2ec20517821f7422d62e43ab808"
-SRCREV_machine:qemuriscv64 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemuriscv32 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemux86 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemux86-64 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_machine:qemumips64 ?= "ea2140a5f0cf7b8351982f60d3b30a4657ab0919"
-SRCREV_machine ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
-SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
+SRCREV_machine:qemuarm ?= "24c30a8e9f8385f6d74785aa345f5731321b6c41"
+SRCREV_machine:qemuarm64 ?= "c3caed57192735dc74adff939ea35af248a11177"
+SRCREV_machine:qemumips ?= "3bed92886dc9177ce0076dada5056cbe83ec11f0"
+SRCREV_machine:qemuppc ?= "45cbeb05d362ee51b7836a7faa07958670110c38"
+SRCREV_machine:qemuriscv64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemuriscv32 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemux86 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemux86-64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_machine:qemumips64 ?= "2642cdd862a63f5a8c2774f372f3d3424991b1b9"
+SRCREV_machine ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
+SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "71e496bd338221709b180b60ba419fa542c2b320"
+SRCREV_machine:class-devupstream ?= "d68f50bfb00f6288e812be895ea5c77932a4b9dd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-- 
2.25.1


