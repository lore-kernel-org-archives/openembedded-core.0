Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE34CCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.6461.1655130143880403246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dziV1mf+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id o6so5242201plg.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gvq1N2sJ+3CNf9zsqFq6R3FhxEbx8Ml9zCJtn6qftDg=;
        b=dziV1mf+DvqCCnTY0JIbP2UaF5YkeXPyLmZ/ws72AnZ+rkm3cgc845OXiHMH0UiATB
         ZbB5o7NJRw3OXpj46nfunRWPgNK7zhA4lSc31DkGb56wdlQcnPsrlVQJ6MOD3z74SEOj
         AvbZIpjgsl7VGQddFGpFbYdyCdeEmYZ2ivnyEkSI90uT3xhmll+8otCGEi5Ch5IuzXpa
         4QYCKmUcCNlYzJD10dJHk92zecgeOJxLjwfhEbfRnN3CKtvs+eO77IyC8Ei80MWlzXZE
         LcKZV/6OKHrxigkwcZ6UYozlDHuvRazBl4SKxJA7oaR+3xhtl3nl+rmb/jiBKCwqzTCz
         nh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gvq1N2sJ+3CNf9zsqFq6R3FhxEbx8Ml9zCJtn6qftDg=;
        b=GjWVG/k8NPdwYa87hDtR4b5QJu+2fjqwl6Y4aIzSXdPoM+8FofjH5l9135xZ0UbH5H
         yzoaEdcyrB0NGCsrDJ1fbo5R5hDTsxvH6aUPj9BJdUmlq7QA6CYaZRH6T+NIrxwG/SD0
         mjIjuKX/8eLEEDAS/v/Ql183fP+X/gXutUGCgiML/5VlrbL5qpbVVupB34E5rmpo/TVj
         veL00P++Ph4ivDwgK7Yzj3ydoZ7ljnWwwhf5dP/oe862lqkTwDTa435nWfEc64k7p2fG
         9bWmgq28eFHtB22vh/RmBdD296J2zCW7Xvvg6bqCkg9GEylhUTftP3hhfui/JbBoD5V8
         p0xg==
X-Gm-Message-State: AOAM531E2CW0XcB7+h07O/kxBDL7zgH3S50C0CNTrPIY+WYA0rvYEwGp
	3TrUQsyvJ6ds0h4v5Fz+JY+X1tX9PJyLx1pg
X-Google-Smtp-Source: 
 ABdhPJxa7US/cQ86yZ+JJtPC+b6H1zQb/adPtFxFm4kTyr9Zl/q212f65+MZiNqLL7izN9Lewm17ww==
X-Received: by 2002:a17:90a:d148:b0:1ea:4e16:545b with SMTP id
 t8-20020a17090ad14800b001ea4e16545bmr16205663pjw.132.1655130142495;
        Mon, 13 Jun 2022 07:22:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/20] linux-yocto/5.15: bpf: explicitly disable
 unpriv eBPF by default
Date: Mon, 13 Jun 2022 04:21:40 -1000
Message-Id: 
 <8f04684552b541d5a099ce8894e8bc67b898b68b.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166853

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    5371fc3b2a2 bpf: explicitly disable unpriv eBPF by default

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3da9b7882a397b204f63fac5fef04d79ba0a01f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


