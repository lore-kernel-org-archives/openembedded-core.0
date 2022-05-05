Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1A9C41535
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7300.1651727163890420281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2FQ8Y1P;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id kq17so6565366ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZu4iqo/6d801BpK158qHNBFog9R/gCgX/lqmCHaQaY=;
        b=i2FQ8Y1PXnYZdTEv7KxZOaUsuEbA8M+Vew4ziYRqYuMKarArz1upwfYAMGTk5IsUPy
         PNH0/1sfnPoowTzcrSisBXdLxHL5+3tgXX9sS80xtEE3ZCaphoZFeqUfI46FDqqsT2k6
         lK0Pan862OobKVPruW2DW7qofT0Im4vZ3ZIL9SkkA2DpMwY9wNnY8/bB7iOurdJAvdfw
         yAxNL7i5JZFwThFkPiRvY2YkpnggF5o7x8sFGv0v4MIOy2dYZuqeWHYzeG8h7a679zWj
         zBCkfFymB2B/yJyhp16097tICAxr0PSWlz/i1iSdyCzt1YBmY/pG8gpsVuO2g1TsMwIe
         Xw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZu4iqo/6d801BpK158qHNBFog9R/gCgX/lqmCHaQaY=;
        b=UKOlB3vf8GLdUa4FELE+m5Wqai1BoqrpbvMc0jyQ/gQs46WKforf4q2ocMcDas3xSq
         Af7r12yGl0jUhknupq+b+VAUmZIr6Ka9Wel4b9I3YbdcSSP12V6FEElZjLn6ITSYRt0F
         65bUGOcsnTbttIjoa9/IOy7pb2xJohttqyVCagh69hR+nSkk0a/XoaUfrzGpGPLBXhV3
         4L4/8b/jO3Ouv1FneIFk5qDiSEme8My7KoVkgUm0z9GI9aTdh6XI8Iq/6VkYHuL2jP4h
         niFemGRkmXjUxDvSx0u7ZwkIrzd522RPt5xMVJM87pzUV8Rwi5s92YXwP2ipeiSby3Jb
         3Axg==
X-Gm-Message-State: AOAM532T+ihlr3y5kIfnaOz0x+ZR+azkaJ4lnXJjrDfmCLXVJ21CZLhP
	xFreGw+D7fA4kfeLOCStQDPlf7GTbhA=
X-Google-Smtp-Source: 
 ABdhPJxB4I8BV2MI515J3InkpAe++emw6b2PX78EVLaQBXAIE9MTeV0Ki7Z/fkE2qJM5dBmnJgqckQ==
X-Received: by 2002:a17:907:3e21:b0:6f4:6c7c:c781 with SMTP id
 hp33-20020a1709073e2100b006f46c7cc781mr13952565ejc.735.1651727190523;
        Wed, 04 May 2022 22:06:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 54/61] llvm: update 14.0.1 -> 14.0.3
Date: Thu,  5 May 2022 07:05:37 +0200
Message-Id: <20220505050544.651895-54-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165283

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 68f027a60d..4064d84b32 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "6.2%"
 GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "14.0.1"
+LLVMVERSION ?= "14.0.3"
 RUSTVERSION ?= "1.60%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 53ae1abd57..0b5301cbff 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "14.0.1"
+PV = "14.0.3"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "c62053979489ccb002efe411c3af059addcb5d7d"
+SRCREV = "1f9140064dfbfb0bbda8e51306ea51080b2f7aac"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.30.2


