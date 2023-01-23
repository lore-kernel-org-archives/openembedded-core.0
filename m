Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98405C25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.34079.1674440514739677708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sGT8ec8l;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id r18so7938082pgr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI4uP1NEjxAVdyfD0n6EL4sAFLcpdoUDWpnURSJsalg=;
        b=sGT8ec8l0309gp0EgPXlCKLRqX8FoCBFWP1x2sv4JX+gxlz+3WtmKwDjo181ILm+z2
         01CNkJsFtwXVo9T0/NbnYc3p7hxsYfnk9ZBYN4lsvBxO8K2ZMqqpMheHpKOhGGCR5oj0
         0q5OEihJts0T4c2cH8aLkHHK7yACfO2K8WEPjDMw2g7CEWLucNis/TgbTWKZCUz3qqSG
         /84X/7s5Wyz7ck/bwBXMv55CCdeMhiBbuRX+QoI7k45O8aJOoK5iCL8xmHWNRas1Mt9V
         e/9+5SpchwOFRpS/oGoT9YqTz1rN8BTwsiSgEg6xZbCGrcy+CR+T2fueCQDmAUECWmuv
         xujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nI4uP1NEjxAVdyfD0n6EL4sAFLcpdoUDWpnURSJsalg=;
        b=8C09GNBhcQO38Caas1PzKBKADBrtb930sus5DdFpL2HjMdWu5BZuJ94UzvjyldO+SM
         glYelkQkSqZf16neT8tFiP73kP7Cqk6kJJUk4D7eOq7Vi083ryyI2dBpTxxGAr2med/A
         sjCg6I16Nt4PLcGyfwf1rjgZ59ZcGKSZVwyLp6kHnZ49mtX1cXc+nc4/k6TxmVUharmD
         h++3HrAWeK28MH8XzkXOJTwL7Y/RLrIpIhXmhFj/FunTkkK00ORV2mZ3ViZIXUw7MnMb
         gkXHQXclpmm1TKH8RtfYoHNcHnWRmYNMokFqWBxuU1S89OGtmkR0b5HQJa/VisG+Lt20
         4xoA==
X-Gm-Message-State: AFqh2kohGJa2/WOWR39w8SlhI+UAs8MipC9+GhEanpDkJZc2p7zv6oUc
	38urYY6tEO+IAwTpkj8XLcG1XACRaeSIhzNGhjo=
X-Google-Smtp-Source: AMrXdXspwc+bpJWVQ3GbZ++UL8CAYAQyYQgFqgYoi8ZSQ90PwSrikGkQIxXvxpTyhbybLHfmLSySsg==
X-Received: by 2002:a05:6a00:1887:b0:588:cb81:9274 with SMTP id x7-20020a056a00188700b00588cb819274mr34614117pfh.32.1674440530513;
        Sun, 22 Jan 2023 18:22:10 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/32] linux-yocto/5.15: fix perf build with clang
Date: Sun, 22 Jan 2023 16:21:08 -1000
Message-Id: <9125916666e1d160b10edcb31f4306d20ce9cdd3.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176278

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


