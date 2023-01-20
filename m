Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DE7C38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:30 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.82160.1674238289277330223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=54D+5CNF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id d10so4720597pgm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI4uP1NEjxAVdyfD0n6EL4sAFLcpdoUDWpnURSJsalg=;
        b=54D+5CNFzPTFjypNqSf6mk7IqjD4S3sH1iU/t4T8GE6df+7MMC1TZfImtznUHQCuMK
         lDW69YthTXyFSmeWv59vivBjFYONJfidkhN90gZgwoMblLefEOUZeCwgZSF856UBe3Ec
         uQzaVzKDuebDqiyfjUHsfO0QieK4M+C7qKrguqTb9FUJaBZxEUHDpymfYKdgCGx9IN7M
         XFB5/MdgDMIkTa7Dy3TeMaACPWu3KmpwIssTpzeZ8uZ1IElk3+qYmSPicve2GBoRoRzM
         fY91thlanaZF+MN0ODelgn01WMS2+yT+vYPZHDvg16hty6wEK99c7Zy4j8xQB8jgSfsL
         mGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nI4uP1NEjxAVdyfD0n6EL4sAFLcpdoUDWpnURSJsalg=;
        b=TUmkf99V/FBIlsf6NJ8xiJehaAuumAiyFX/rPEhbJNMqTDv7+0etXMNA9WWoIBKqLy
         TRAUeqBNmPBUoxkjFXTYO8YlAwGII1TgX+cRG7Tnw/5Xic22vzyD135VqZ7kTTZZ0mKy
         hJYa6FnpICzufZfP8/rDbzqrngxAwDOkcIVRhycM8uXuIvImm9iBhRNqS0LbPqT1BpmP
         6ev8TfMSRGht9IYYp1f2laBJxknN+8D5Tk7YfO+49Y/GUEw88DybIQVonH7cNt6L7z1s
         TOliPcfk5oc2LjKeK8cWYY8+gHqMzm8qnMY57N3HWQtyYpu3G3RAiqj92HnE+AFMbRUX
         Di2A==
X-Gm-Message-State: AFqh2kp6cbbBtLTG45PL6CGvYOfs5OzOprWktk5BicJOEkASaiTXI3Kl
	if94qO33y/6dvQ/wR+M4tc4YzircN38bm7ZC/Vw=
X-Google-Smtp-Source: AMrXdXuChyc0vO/dJTCBVexDEeDHG3/sgLv6FPG65TbWcVyG5K5MEKtxf8AFK8kNRBhKV+USACs8CQ==
X-Received: by 2002:a62:1d56:0:b0:58d:9251:b2a6 with SMTP id d83-20020a621d56000000b0058d9251b2a6mr25802293pfd.1.1674238288239;
        Fri, 20 Jan 2023 10:11:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/41] linux-yocto/5.15: fix perf build with clang
Date: Fri, 20 Jan 2023 08:10:30 -1000
Message-Id: <9ec76fefc8b3bd4fff31fe8958de6f51d4b1f139.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176219

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4c5a089621a8 perf python: Account for multiple words in CC

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1cf78a856beb42a2d68e6c49bfdbc33fea68ebb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index bd57d7c47e..63294f5bb6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9860fe27332e09dd4f0f3b303e40377de083be9a"
-SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
+SRCREV_machine ?= "dcd3b533c5f6bc4698d5b09aa83ce9a4695df3b0"
+SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8b83b5a8de..12e462228f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "86627fc3da74aefec1338724a597356e6b8ad88b"
-SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
+SRCREV_machine ?= "c7e10f06a33a546bcdd0b2e2909459b7572b5443"
+SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0b373c40fe..4e341713f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4915b05912ee7d15224eb9064ca63678f0bc6815"
-SRCREV_machine:qemuarm64 ?= "660bf605998f60fd77f24d3316b95b14ef2fa035"
-SRCREV_machine:qemumips ?= "38bf282c052b70c1c6dd79dc6ae49da1ec1c7de8"
-SRCREV_machine:qemuppc ?= "ac4a5d99364cede21dc1838213f7fb29e1735969"
-SRCREV_machine:qemuriscv64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
-SRCREV_machine:qemuriscv32 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
-SRCREV_machine:qemux86 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
-SRCREV_machine:qemux86-64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
-SRCREV_machine:qemumips64 ?= "2923c39cc815e2109c9bfc0985adcd8d342fc415"
-SRCREV_machine ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
-SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
+SRCREV_machine:qemuarm ?= "e5f2cf3560139bbaad54796c323d60e66cc19374"
+SRCREV_machine:qemuarm64 ?= "d8835a4d4e9d4ea835316cd1843d62e30c5fef33"
+SRCREV_machine:qemumips ?= "0f802d6525c21abe586c833074fece3e665a9ed9"
+SRCREV_machine:qemuppc ?= "84f529230ca9f2ec20517821f7422d62e43ab808"
+SRCREV_machine:qemuriscv64 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
+SRCREV_machine:qemuriscv32 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
+SRCREV_machine:qemux86 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
+SRCREV_machine:qemux86-64 ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
+SRCREV_machine:qemumips64 ?= "ea2140a5f0cf7b8351982f60d3b30a4657ab0919"
+SRCREV_machine ?= "4c5a089621a8f395f020f6c2f4c578aafa155011"
+SRCREV_meta ?= "66de7a6f2687cdaf5169ce5b57dd35f508be1682"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


