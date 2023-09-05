Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591F9CA0FFA
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.22999.1693924638935045495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jAZskaWX;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-770819c1db6so33006085a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924638; x=1694529438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXpUsRy0h/1Ra/yaFkLc340enAkIEVErYf06p20Pees=;
        b=jAZskaWX0Lns2X3wWTxRJ9Icq7bRHMiI+ZqAy3B1r7dR1SdeIZipOfbgUYKAnnlfWp
         daN/JIKg4Cy2Ofat5Skxmk8tLCJp76E2lhU3r4zgy39j6uCbKMHQQ1d1JaKTC/Retgu+
         O+XsD64cmEjWOZ+r9CCHWfCI4pEyySkMHs5HMUgsbXj2HbZWMX0ZPvOLzjZypI19Z0+9
         Xeys8zpe6EYwqKB1ZRz8kDoEi0TKTPbt3awiAtIvilv0JX9Qfvkfh44pR9xQbV1/u3FR
         KZJuO65+23y+L/3ZSEmbLOnHEieN0QpATooKZRSxQtO3KN3rEZNdHtzWE2rjFPTpu+0Q
         E32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924638; x=1694529438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXpUsRy0h/1Ra/yaFkLc340enAkIEVErYf06p20Pees=;
        b=WmRFkWIzRVAZN356qY2MqMh2GjJ1j9A9WegbxGPq4D5+JvuvYyf5+akQlCD+FRKYsi
         XnKf45dIRUPXCdLNK/zEC4BkkTnggTqQ/w/No8EBicazUNDaNj3uNozr9mIGCsBmDz1H
         dBU2VCfyhbVZPiNojlzfOtAi1PY3wPvN5MmBkDnIFBjARayKJboKauLajIRaCWEw2Bsq
         edz7qXBjli9VWMGjymiZNQbMk4y1IWp26XX38TWCiEQbUA+ik6tbZrdXC7jHfczlnz1t
         tp8nDHjqBe7fgVfQ2ImMeUr4NxckTpHGyUjMSfWr6TOiPdf+qHVQ5khZzABj/Ti1MIy3
         KE2A==
X-Gm-Message-State: AOJu0YxT1/vTvFlp1MJGAPlVKN4bgK7CbNZ7THy7CiC0V4/v4CCYtWTQ
	47akH6EmAdFSa/XjearLqNcoXE2a7KU6hw==
X-Google-Smtp-Source: AGHT+IF6xLfFPQb8XcQX9qjwuT2F9bOI7w++bl+oZuL10oWR7g0L3MPvO/nswaa88UXOJ9la+nQWhw==
X-Received: by 2002:a05:620a:28c3:b0:76d:9dc0:bcaa with SMTP id l3-20020a05620a28c300b0076d9dc0bcaamr14979890qkp.5.1693924637813;
        Tue, 05 Sep 2023 07:37:17 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/6.4: fix CONFIG_F2FS_IO_TRACE configuration warning
Date: Tue,  5 Sep 2023 10:37:07 -0400
Message-Id: <89daabcbaaa87037424fa56c4226796c7e81f8b7.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187217

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    97bba4db5ff features/f2fs: remove CONFIG_F2FS_IO_TRACE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 3c168def2c..7dd3f36325 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "7b9505550d7a84a1f30b9af8b90aafc8dde37023"
-SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
+SRCREV_meta ?= "97bba4db5ff86eae2ca28a8bf0cb8cbfa44cbbe4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 721b52bc8a..baeca1a968 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
+SRCREV_meta ?= "97bba4db5ff86eae2ca28a8bf0cb8cbfa44cbbe4"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 52accc9f87..23af9167a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
 SRCREV_machine:qemux86-64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
 SRCREV_machine:qemumips64 ?= "de0569e0860973391d16074bbe9366afb15594bf"
 SRCREV_machine ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
+SRCREV_meta ?= "97bba4db5ff86eae2ca28a8bf0cb8cbfa44cbbe4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


