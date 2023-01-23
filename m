Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932AEC54EAA
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.34074.1674440502628422957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RQvP4nhT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id g205so7758424pfb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EmITKenhkSbksC2yCwVGjaIbMSObydjcWXokvDyJSA=;
        b=RQvP4nhTNrCiHFztiJwx+NWigJszGT6SO/BoFWjPKWfCi2OhJd2cm7qwyt1UtTTI2K
         pWx6iTpMoEaJgSZ5P/Ze3iA3T5OfRincd2F/58I1wkX9P5hknqPXVkXFg9L8KH6PxwTV
         OXyJB7D36t6t4iopj82vK1yM+CeU2aCDx8D2jeBGkQ06hs6lmz7Q7MmN24gmQhI1xY3V
         OxIht17sd+C4tISOJ41MhiNWhkJE7bDX0lTz7TvFXGVx4YVJ6Ek9LfJ9wkr6rZlcJuhU
         4X273ESvPDFSaOEj0QcsOndgasUC7Mr/oq82krHs9c4SZwq/3veehnUtScyvj97sP4Xs
         z3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EmITKenhkSbksC2yCwVGjaIbMSObydjcWXokvDyJSA=;
        b=HOLCBIwigkSYV0L3sjoQFmoTqAeBOHFLoPDmO3YXLfd9MjlcQELZ/8t//ISzpIu1+3
         0OH7HPTjvghKlX1pWV18iUSU+Zcs51K/coM/rklujQzHQZY8i4R2yQlyvuK69Uu28gNM
         7kMrYnEOdBC+/akWtfiZxzs1WCQBtt/ocdJY/81ZPdUpwSgnrEHDa1HfvZWiNL8VbHGq
         lPIsHKEHd2vEocZM0wRkvreYlW5w4aO0l2bqbxOasHsfE6Phnh+Y/yEVWray9PuEF+jd
         KxHUSsWSRcICg57+72xUXr14iByO+9d68qfrFUfNFa0wmeY4prHBaIUQ+s4Jx6d2+lHy
         PirQ==
X-Gm-Message-State: AFqh2koGHqCVOSz2RsogcRa+Om7tdP2vZlByCyQbe0cWxtISoZsKp++G
	PZZOj+okcMzJgJplUnlNmNePDxXCMWPnR9S++gM=
X-Google-Smtp-Source: AMrXdXsEGG0ZBDYdPb/8f2pXwjqe7SiEipab22+z1Uz12pSK7Zesp8yYZniMlLl6e78aRXLbHfpVYw==
X-Received: by 2002:a62:f210:0:b0:58d:bbf:8bb1 with SMTP id m16-20020a62f210000000b0058d0bbf8bb1mr23320014pfh.14.1674440532470;
        Sun, 22 Jan 2023 18:22:12 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/32] linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
Date: Sun, 22 Jan 2023 16:21:09 -1000
Message-Id: <422c3fee2364ae8376d0c4f601749b616a76fb03.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176279

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


