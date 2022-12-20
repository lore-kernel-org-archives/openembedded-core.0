Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3D5C41535
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:25 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.57992.1671561741315190475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lwAsw4zX;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id bq12so1618664qtb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhvqhZtL6pMZYCBKyt+j5F3IMKeAoi/OqulVfQcAhlo=;
        b=lwAsw4zXYXtiD224+3QPOZXkofclLb8KELrYj3bLDhm1MS1NkQkwvlTakjTYTbtyIe
         pStuEVT5W/m9yNexuV6nqFi8JcYybj1w/05Pkv5g3gPM8CcXiDu06kAtIDEkx/4GA9PM
         PBiJCHpFvBCw+/4NxwVIZpHlJ0pVZmGJOYKxyl7YbIDEsPKn4lleqK8wrwkUufTjU4vl
         Lyv+TAa89DzcIKZHB9c86q3qdmQXBxEdN5G34n/116mgG6MTCg7Bkizv/m42cZkPnNts
         gdXlQOKE8nmxwXQDAxGSSrCMHLUinjl/ClRg7YDtdg+ZEX5R2n99VL+hO+jFDED0od8J
         /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhvqhZtL6pMZYCBKyt+j5F3IMKeAoi/OqulVfQcAhlo=;
        b=P7Vl8HqLwwZ8EK9fCwLwmVfV/eiCmOMSril4Wo0eX/fElHkoBt/nF3Q6B/9X05WZHc
         OejhwPaWA7lOYMX4AoHUVzFWD3wSQHFKhY1Qu+11gEwnbXpPJ65LjZN1tOTxEc8HEHRm
         FMlvanKznovxtRR8XNOhNOrG7Hx0UcLljXHyoWlPs061o6Vp+viMTmfvQUxAgT3dLvU0
         Tr3GbVGFyvEJaGcwz4LB6qv0kveoQT3hgf6IuNHK9rCjT7FVJQu2MGenJubzboxkiu48
         0MbufUGNHL/FJLZ40AqvUAOef6I9QMpweyM+DbNBPBhTsyFwlSBAU/6ynN3Xj5fKHFxB
         nTcw==
X-Gm-Message-State: AFqh2koAD5nwg/lE/+/GCYqxs1XgrF8d3ra/t2GoI0jiT+YhGxkfTvX3
	/BcdpK+uNltD6XL6eahV1ineGVXUpRI=
X-Google-Smtp-Source: AMrXdXvS1RP+T+CPHSsq/bDwFgONfs82PtgGU6c1RdhPmGg6CZ7gFIGQQYQ3M4MueX+5t9NKI52rbg==
X-Received: by 2002:ac8:7452:0:b0:3a5:e9fc:aa87 with SMTP id h18-20020ac87452000000b003a5e9fcaa87mr4064102qtr.59.1671561740322;
        Tue, 20 Dec 2022 10:42:20 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/5.15: fix perf build with clang
Date: Tue, 20 Dec 2022 13:42:08 -0500
Message-Id: <b3eb133fdee6cb0879403186901c6e548ced571a.1671560769.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174880

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
2.37.3


