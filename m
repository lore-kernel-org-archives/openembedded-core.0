Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650A8C54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:38 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.30888.1710889296574463737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQyQXoBR;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c38b03c44aso1435408b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889295; x=1711494095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8E5h3vEiJ7kcmnMq5tlU7U+EUD4XKyLg+xPoMgADDk=;
        b=eQyQXoBRhxle35DTHmvaGh67w3pPKCkBqsLlDkkG1y6DM1Kd3WUFkmiJlj3dUBdeNU
         VK2NhUy4IWR8WtmCQVZa6dNCIvMZ0ys8L64YSDpU9RwvBYKNEO9onM7VdCTR3eD84iAl
         0BOvUGtQAJJvPW0+6RmWdaySHtj9VW6CYcWIO9r0o2Ig/h5Q/RJl3DfL43qccNHK5sAJ
         nFhMq8fF0TH6USNqRdkv+17KHPCxMWPVmCA+FWuLPdwGHhG6tRrNkd+A6VdTy0l5+npe
         31CskSq3TZEJr5mAcdgmwn6NYTHQgfTutM9KQMkXxA0NWpP8Wbdm+C+VUWFYlsfnG8pI
         nYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889296; x=1711494096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8E5h3vEiJ7kcmnMq5tlU7U+EUD4XKyLg+xPoMgADDk=;
        b=kB8821LwDvCM8nUCsCR3BqkVeuEqya6cLJhgjP0f2pK5hQavyjoOQTRayswfx+HtEa
         XfWnz8dWOoz7ifXY5Q6dDq6USUuNEypcFEtmUCnzDF1nOjjj8Z5M3yGfm5xhYWYxQuM3
         CWanFcpp+yFqsB2h5Cd/WeR5wM7f1AhGXFVwJbpAeuuIwiZeO+cKL10ZkZP1Bqp72MW8
         aMS227aHrogu/1jjW/zszVCnuwV3n6tZq6k3foQCFRc+hqnlx3p7q+VsJfmC3J9Va6vJ
         3sXuflJy/IpgD2l/DHwf5hamzDJza9ihtSoGsI/GpFInGT1JVABuUaEapPfKGgXtRyu1
         MPeA==
X-Gm-Message-State: AOJu0YxlQhks8UlCxgtp8O7xtwCvH4Er7DhjhFV0mbjPW9Mx8FgMVbgz
	b9im94MaSkFlfJAxjx0oMweVWs4oww5+z/BJPSggeEL2YEUR5YwWycUhIBL9
X-Google-Smtp-Source: AGHT+IGDf2j9fcypeB1PDti9lCNgclmSNOJ2l4GDtJtp041iWrI6MXtCqU8Ha429SfvGQt2jPrMsqw==
X-Received: by 2002:a05:6870:d186:b0:220:e608:89c with SMTP id a6-20020a056870d18600b00220e608089cmr4226430oac.28.1710889295600;
        Tue, 19 Mar 2024 16:01:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto/6.6: cfg: generic arm64
Date: Tue, 19 Mar 2024 19:01:24 -0400
Message-Id: <922b613a5e738f0bbbc68322b2afa3e082379cc3.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197336

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: cfg/timer/no_hz: set NO_HZ_IDLE instead of NO_HZ
    Date: Wed, 6 Mar 2024 07:15:44 -0800

    NO_HZ was obsoleted in 2011[1] and simply selects NO_HZ_IDLE.

    [1] linux 3ca277e

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: incorporate more features, and sort
    Date: Wed, 6 Mar 2024 07:15:44 -0800

    Pull in a large number of drivers and build them as modules. The set of
    drivers enabled is based on the current defconfig.

    Some chunks are split out into separate files to keep the top-level
    cfg file size manageable.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e80594b45e..347c94d31c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "7c5911ab2e70bf84bb38a598b2a7e094618a9620"
-SRCREV_meta ?= "8cd63077f67a0f7ff639a2ff24c82b09d71048a4"
+SRCREV_meta ?= "59167507fd955d22a51ddc0011bc75d35e8f702f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index c2a0387d55..6c74e6d072 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_meta ?= "8cd63077f67a0f7ff639a2ff24c82b09d71048a4"
+SRCREV_meta ?= "59167507fd955d22a51ddc0011bc75d35e8f702f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0f62dea29a..2017c0c9c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
 SRCREV_machine:qemux86-64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
 SRCREV_machine:qemumips64 ?= "8e7605bafdfeb842396292181d524b183a1e13d6"
 SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_meta ?= "8cd63077f67a0f7ff639a2ff24c82b09d71048a4"
+SRCREV_meta ?= "59167507fd955d22a51ddc0011bc75d35e8f702f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


