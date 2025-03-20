Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52BEC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:18 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.7685.1742478016706869106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=latHPHPx;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6eb1e09f7e4so9648146d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478016; x=1743082816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpuqKv8Q1ByHkTEhB/720vEzKMYczSUNm9q1ImDxfic=;
        b=latHPHPxGWlcGFB0EeyAmUv3Ti0UnjM3D0a3NdlZ1qd3kPtXC7zKCwWojoT7AFMLaf
         x6FYsaQJRVJe0PvgpTnQcWjsFyiTu4Stql43y0HTAdP0kjNEAPTxmgR4cjOL0RCsTW+E
         f1UPoeXMQda2eQPeXslf82SiY+rmgo4jPkjlnEEyEVT6NunPXqaVjTEmNuYtZDN3cG2i
         ro63bnvyxoFs+TG+obuGZbDNCem2DOEv7WkYwEW9Clo5jZ5ZNkphdZmQXlG31QFMnESN
         Qk4upsQqe8Btk+tBq6Z+gvctreRYA7L6p0KlYGlJDiFW9TXL4ne/id69V8f7W3oaQr38
         TNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478016; x=1743082816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpuqKv8Q1ByHkTEhB/720vEzKMYczSUNm9q1ImDxfic=;
        b=eDsFVJJ6IUBkPNZ9H3wZR20NDOuMIs6njoB2aKQNeMqLEOqH6/U3tx7/NWkJpK+Tcq
         TEl09P19wtTRHKgVqofUNVm+3AIUjLhumbpKYLEM/swPX1uIbhBXgn/tRd4wI1bgNT9/
         aEZHR+bavNmsOhBcHxzYHCQ/YCxGF5OcTbycKeZQrxu73o+K4DdtL2lo+e35VOOqUNQa
         hA046olJXpF8s3N0rJaBk6coXssqmKFVQvxRgLj9TvW9F4i0h6TUEfdLELT5xcNQXyrd
         yqVfnvjgyfrkpd6TMJFVQ6G+BWZopyOH3cmE/EnRKuLC9b3RReXX8bJNnyAKIJYjYXAw
         gDSQ==
X-Gm-Message-State: AOJu0YxGJR+XfQZEYMgGDSqFc9T8mDZjK17y+HQDwLTq3DqoXSSP3Y7X
	2VsUU451EP370UashwC3U73lvC/pg7Tqoqqy6aXmeBF9DzIGAeB8iIU74syeU94=
X-Gm-Gg: ASbGncuLZMVDWqlB5QT8E8RwSQdzSM/qI+HMTwmik4nBnubANe2LT0xtbo9wk1ndGyR
	Y1W9lp8MGnzQAosgJcgp/l/DnwBShLmpDx4B2o2Gi6ad1ckTY5jo/+5z0znTSNmE3AwnRnOF5Ur
	BLqj67hSTz2hS3qjz/FqY5yk3oFGB29apqBUEVcxsMe3WeQs9d3qK6DT0ga+l6NpUMIE0xuyaVf
	Ldpdo0GFty867+POm/R2RPYOrmlgq69grxsynsFdq/BDDAFINbDmP0AKpH5SoVGB2nFcihJBhwW
	U6gHvQRgapq0PSP5FlqD6WG9TEN7ALJAH/G/mq8BDJaIiUDhLxKesoliwKkbPwhqG1X4Nj9pOo4
	ojAybI6J1FzReXrhgpp5IrNYYiL1Jx3zGFvajzTg5b3xjj6F7hsdsDgZy
X-Google-Smtp-Source: AGHT+IGBIYxUByXimSLEvrSogqc9i8AAiUWczERtLZE+hvtbIDAi2m6VBtyfHN4/gKW+slu7TN5Fsg==
X-Received: by 2002:a05:6214:2a8f:b0:6e6:6252:ad1a with SMTP id 6a1803df08f44-6eb3536b36bmr42859976d6.28.1742478015619;
        Thu, 20 Mar 2025 06:40:15 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/6.12: genericarm64: set the DMA Contiguous Memory Allocator size to 32MB
Date: Thu, 20 Mar 2025 09:40:07 -0400
Message-Id: <e4e891c54cc07149e5d62d55e0d0aa21cad3a517.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1742477836.git.bruce.ashfield@gmail.com>
References: <cover.1742477836.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213392

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: genericarm64: set the DMA Contiguous Memory Allocator size to 32MB
    Date: Thu, 27 Feb 2025 17:32:29 +0000

    The default is 16MB but the aarch64 defconfig sets it to 32MB.

    Notably this fixes various graphical issues on both the BeaglePlay and
    KV260, where 16MB isn't sufficient.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 2e16e43628..a7475dd4fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "81e03d4794dcbe5a29307241dc110f42fa7d7f76"
-SRCREV_meta ?= "bb44ae9b6ada9da4729dfdd4cd6075908a02ba31"
+SRCREV_meta ?= "190a3cea8f7382423bc20fcde64847afc9e191ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 6cd0767092..5890379dfb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_meta ?= "bb44ae9b6ada9da4729dfdd4cd6075908a02ba31"
+SRCREV_meta ?= "190a3cea8f7382423bc20fcde64847afc9e191ed"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 1738300379..6d8ce19efd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
 SRCREV_machine:qemux86-64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
 SRCREV_machine:qemumips64 ?= "fd60fdcf820529aad2f28d498f7fccb5bce884d8"
 SRCREV_machine ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_meta ?= "bb44ae9b6ada9da4729dfdd4cd6075908a02ba31"
+SRCREV_meta ?= "190a3cea8f7382423bc20fcde64847afc9e191ed"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


