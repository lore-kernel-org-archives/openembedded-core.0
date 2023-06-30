Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7546EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:54 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.3932.1688092427595505199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Q5AIlSUY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55b1238a024so1088149a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092427; x=1690684427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dihvPXBMI62mp1gU+95BnjNQONOs5MGExxLAv6YEh8U=;
        b=Q5AIlSUYxy6fYt5vYMwP2sHEqIQvHJkITc6OwthkeHIypj1TY6oDdK3DeQorUbmztU
         RXwyG+FrN3+VaOscwpL/0fYR9v7s3znOlkE/yqtpBKMckD5h6Dn8jUIlQnCJf8vpjrM4
         xAgZl1pfJ6/UjQYWZO/uXgXoGy0qRnQNy4O3+D58zWTCTkEHSWSr5VGH7LOC2H6zD7CA
         BORh/dpps1PMd0RyTRv6J4xlo/rS/IeYmC6L1gccRIL/zjNXcpFx/s4SkdrAdN7rfSt0
         laPVHURmSyK6UyGdqDXOIkqi22Ap1ZG3M9xDn5WueFAOxaL32zYlrGvYnFuzY+iI0fbW
         6lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092427; x=1690684427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dihvPXBMI62mp1gU+95BnjNQONOs5MGExxLAv6YEh8U=;
        b=D3anBUDmEvMMVJNIT//63WI7EORpM0G3je8c+xZx2VhydU+ItmMSnq+bAb6dI7Ql/v
         PLXW9tUz/8uKD5Ox/W1ijMt3cRFjf7PgKhayq+pMSOtFKenLb5JYHOmUOhf2hYFkfYJd
         y+G+nTsR8xwTH34zFK86wut+I65fkAb0K4//FoVlZFMZDk2VtKMmLf2uRk2aYYlObSuo
         yEAcDdmefKcCJ/JZ8R3TgI4tMnfEk+DyeBzaSQ3WCehO4I3KG7TxCTR6BkZN9mBEsd3S
         63HwhNwmypEYzDJhuu5OjkmyroAiGwWB4DiB06i/KuKs9jKtycp5hPEhzoHtLUby2rYp
         c6CA==
X-Gm-Message-State: AC+VfDzQcDOYGENsP9VBpejjs0ojx0wjZcMzVlpaHXXXLhpM0837L5uD
	uiLKB1heP0jwttuFa5zMdLItMDxUrXd6+pH9twrl0Q==
X-Google-Smtp-Source: ACHHUZ4B42OLwQ7DIaL378K3jzdx+aAQWzqAmUrezNILT4+jJXQEE7B3epuGDLl5SBhsyIbZd5ipWA==
X-Received: by 2002:a05:6a20:12cf:b0:126:df8b:e812 with SMTP id v15-20020a056a2012cf00b00126df8be812mr1718907pzg.25.1688092426649;
        Thu, 29 Jun 2023 19:33:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/10] linux-yocto-rt/54: fix 5.4-rt build breakage
Date: Thu, 29 Jun 2023 16:33:22 -1000
Message-Id: <13add4fd84c2e8a14caad857fbadf83205758c31.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092252.git.steve@sakoman.com>
References: <cover.1688092252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183680

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

    commit 8d8179549a233e7517523ac12887016451da2e20
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Tue Jun 27 10:13:01 2023 -0400

        rt: fix 5.4-stable introduced compile errors

        The 5.4 stable series brough back two elements removed
        by the -rt patch:

         - tick_period
         - deferred/safe printk

        We fix the build by dropping the use of the period and
        deferred printk

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a98a64110a..541d169379 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8472ed342e0ac3f529c10b474b12ef0e05995778"
-SRCREV_meta ?= "5c912968f2cb938ad084d457dae99bf8eb16032d"
+SRCREV_machine ?= "8d8179549a233e7517523ac12887016451da2e20"
+SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 46a8856963..171ff8493c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "ca5368c73bab4eb276a8e721df28c02ceb8f3eeb"
 SRCREV_machine ?= "abb579170926348d1518bc1a2de8cb1cdf403808"
-SRCREV_meta ?= "5c912968f2cb938ad084d457dae99bf8eb16032d"
+SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fae2de5c72..527728d9d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemux86-64 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemumips64 ?= "66cac7d41a43594760f6ac48e848d73315cc5dd3"
 SRCREV_machine ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_meta ?= "5c912968f2cb938ad084d457dae99bf8eb16032d"
+SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.34.1


