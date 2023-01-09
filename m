Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75B4C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:14 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.59789.1673224752473637853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ni9OfBk8;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id d13so5201344qvj.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl0DMdn7yrOxKSW1gdyJXGFRYj4bgX52zE2/nDXwzG0=;
        b=ni9OfBk81pKXU+VhziE1Be9+1SNYiWK/PDA4m/NcI142vCRmb4/cVb1A7tiAULYkcb
         pQdlFDhC0N63OCXendAnz1VSr67ADszsDtj6jZiADZ2MrZbGg5yGz6NRU7Yj+KqR5aEa
         dzUVE/m0urYhsNwNyQGDqcj7XAU+QE4t75blj6Cs6MC+CIknZsxn1fc4ueeZqV3+bSFE
         dSGO+CAOcvXXiepZuNQtbolC+PPlolF3cGJ3c38d6Bm7w5aPxvGpZSnzMyHv6a9umFLk
         PgR2m6aq8njlm5jSkqXy9JnGH4hU+x/4ySw46vIPoxXCQoYcueo7ASqtzEbRRbTlG8Z5
         z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl0DMdn7yrOxKSW1gdyJXGFRYj4bgX52zE2/nDXwzG0=;
        b=0By7D4T62K61MmmIvTSfxU7SNAGc/KKby1GHurSv2SVgx4F+KNWd/ujv0yEUBL4QUk
         71/BAOxs5rpKQiaoABRaQYxh+1+dlbAeNWAQMhkyphIaKd0wo0EqvAWbklpGvp5BN9dL
         AQpqwUje8ew66wdvh9DFNn6d8jFpRA2cyapqucuRegca5Vc7onUx8tMzWPDCBUiPVkqp
         VJeiJ4hV+w24M6xJWxVzN6xLO10/niLQIN6c/4poqWG7Qh+VTltTsAfaCHKMNT/JRAoN
         ZzHolmwuiPEmas/czDfiYsL8WxhMmXh8CHS4NHmiDXKFi/mDMqePRh5+tGoASWEK8QgT
         Q8Fw==
X-Gm-Message-State: AFqh2kq9mD9gsuMT/sx+qITHLHgHIMJYaApzLe5wGzakjNrnAH2CBNCH
	+C1iptqbscpz/yrnF3nEb6VWMEkof8au5w==
X-Google-Smtp-Source: AMrXdXseyjFpwm5Cqv7cR8feQpEMnwwffQgm8aT1qVjpRWfIdfmM7V/YcHF2hXjxF5CNtZmSDLIx3A==
X-Received: by 2002:a05:6214:2e07:b0:4f0:2753:6cbb with SMTP id mx7-20020a0562142e0700b004f027536cbbmr87870147qvb.11.1673224751525;
        Sun, 08 Jan 2023 16:39:11 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] linux-yocto/5.15: fix perf build with clang
Date: Sun,  8 Jan 2023 19:38:54 -0500
Message-Id: <7437479dda8befba19452d77803ab578d4c07ab7.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175648

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4c5a089621a8 perf python: Account for multiple words in CC

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.34.1


