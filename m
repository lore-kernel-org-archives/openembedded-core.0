Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11178C52D11
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.82158.1674238287507021209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=05yZzu8E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso5694389pjf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USZ6IYZS32liPCUA5psD4jj04KrCS88Uc5wrU3deh+k=;
        b=05yZzu8EdRZxB43zAm0p77ogWPfpSGR8DbNqnuyF3uH+vJSOZxC+0CghATAr3JpLzY
         nmPOPpB0b/8x7JvVmyhXxKI9dytWfgFfeEj0BuaQdDVRJc0pZj+8ZwBrovEk1cVFN+Ta
         Uo3UazEnxwPahbjt/3AzZOVHtuwQqFErFasYv2b8+Cld6+mV1goAi8mZDWc9Qf+Yx2Ya
         HOhNOIWaXpYhrBMMmqnQAgBCUfgywx9Z2qZk9oDDzq59I95N/6ooamM/R9GIoAibtDLt
         sMAqZQrWgtQxqsgKm20XN3PLkjTqKlGgOp19lrOfGUSUk8GV0HomJtSBrBtzmKAe4q1O
         q+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USZ6IYZS32liPCUA5psD4jj04KrCS88Uc5wrU3deh+k=;
        b=NJD2RXtepE8XaQq2kfoR62VWGdf7XMwxaLvMXqmsJoZM3dmX9tB1DoclCzwZv8Nnlr
         AzN4x7A+5s2RvfKI5fXpz3HQZ3qkxnW+hqQCbtBXue9QAGMltx8E27tai90PNc9Q3pnX
         svAPnKGmGhqBFRXhU1ix27T2Th7N4JC3bMRAno+9uuKts93h4cbMZCmFTNw0N7OfPGrw
         QuDaGgRkGztMfKavuNRjX+G3LQ8uAvot0whurOGERu7I5vLBgL0j/pT16uEEndUsB4Pf
         yvQTrAe3K+fqAtQXdId2tGZRkhQFbMps5hypK4A+OPvm9fEa066PDE12EdqK6pok4xRa
         Rg1w==
X-Gm-Message-State: AFqh2kq2sqRL0fDmvkBU0oi/AZKeGPoAuEPHt52eE1qWNxWIAAQgMfVI
	dlToXah6fHxFxPE03vdrKVdy5LyOGe3T85WR73A=
X-Google-Smtp-Source: AMrXdXtBs5HvH68OZ0zT944imrjua5GDuA48wCo5It5Mn8iMBmdqH1r2QcSvJVD6BfmfDd/28Rsf2A==
X-Received: by 2002:a05:6a20:1bdc:b0:b6:3e6e:af94 with SMTP id cv28-20020a056a201bdc00b000b63e6eaf94mr13746035pzb.32.1674238286414;
        Fri, 20 Jan 2023 10:11:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/41] linux-yocto/5.15: ltp and squashfs fixes
Date: Fri, 20 Jan 2023 08:10:29 -1000
Message-Id: <1b1dc1cc57816a01383d7173b63991e3ed001327.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176218

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 474ddb758dd1b327540e48ccfe1500fb4231f30b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fc1ccd9b39..bd57d7c47e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "9860fe27332e09dd4f0f3b303e40377de083be9a"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 087c30b5a5..8b83b5a8de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "86627fc3da74aefec1338724a597356e6b8ad88b"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d5f21daf35..0b373c40fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d3aa5916b2b02966ef37bfe3fc527c99754571ec"
-SRCREV_machine:qemuarm64 ?= "a1d364fbe3d8a916426a107f07b89fd0338923c7"
-SRCREV_machine:qemumips ?= "904de7b55a7e8edf4cd894fb0558efee799a314a"
-SRCREV_machine:qemuppc ?= "35d547b91124bef128a13402190ca05f54a2392e"
-SRCREV_machine:qemuriscv64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemuriscv32 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
-SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine:qemuarm ?= "4915b05912ee7d15224eb9064ca63678f0bc6815"
+SRCREV_machine:qemuarm64 ?= "660bf605998f60fd77f24d3316b95b14ef2fa035"
+SRCREV_machine:qemumips ?= "38bf282c052b70c1c6dd79dc6ae49da1ec1c7de8"
+SRCREV_machine:qemuppc ?= "ac4a5d99364cede21dc1838213f7fb29e1735969"
+SRCREV_machine:qemuriscv64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemuriscv32 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86-64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemumips64 ?= "2923c39cc815e2109c9bfc0985adcd8d342fc415"
+SRCREV_machine ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "509a32764e1a5692935c4f26ed96fbe94c480186"
+SRCREV_machine:class-devupstream ?= "71e496bd338221709b180b60ba419fa542c2b320"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-- 
2.25.1


