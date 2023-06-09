Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493C8C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 07:33:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.7799.1686295990276384931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 00:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=a2k2szQB;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5343c3daff0so405996a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686295989; x=1688887989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34a7AKXCJJjmfTK7xyG5a71ewYqED6aDl1lh47soKm4=;
        b=a2k2szQB9BbJN251yP2VuoE/sb8+rZdbWCt0KSs2xq88vZwV6gv7rhkrzZFNBqiS0H
         Ndb3DM46GBEAb4xyvwZTl5+7fg71VO+grcOlzzCCQqnk6Vk6NKVSARvi2nksViquZqwE
         RrSVDfBdIoaTiWWg7K7NFRluI/mWs8PvAF6xMha13sixBGxFJA2DGNgo89Y9DLlK1SNb
         JVVPNlxeTVulOkquf9EO6EOSwNq4umPI48OuUJ5p4l2E93sB4xTfFS8ZDwq/v7EyfYib
         wOVFxT1wRLTXCRRMbnb2C97ONW/GJqGLik+mef5eaXNUCLS3mB/vo1dj+9OnHjUzY47L
         SE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295989; x=1688887989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34a7AKXCJJjmfTK7xyG5a71ewYqED6aDl1lh47soKm4=;
        b=cSkUW+8sctRKOjy5LaNxYXdveRUnLxo1zFS1RqoRW/PtClICWnPXyFwAIFl5IG2qSl
         sOG3YAcQIS7N2WZqZPmQSTGW5iAb2FmF2ANuikBeEnY7CUOWtlLhXfi7Qz1CIBuDG8RH
         azysGtHTugNxxTGL6sTv0+2uSqj8cu+M/jJHHrZkxf2VGGm7uE4s2NxyQ/KHxmQEx5Y+
         hB4SrJKJ4Vxz+96ttU63cAPgbmdDaKtg3Ihi9XgT4EISpZmRtBtzjEtg70tAMJ50k6VX
         kJm0gieeyoYhlS2hn5xummZgSz27fuU6qJMGaS1pQG2zpjPzbE46N0x9/p3T/ZT/qUvP
         Xabw==
X-Gm-Message-State: AC+VfDz36bQKeuf7P70dI5g9qXR0p/LyXGhRxhZAmqfkTN2MH3DoRR5W
	0X3Ft1aWvwFyhUCxV0WCddazKxJm7Pw=
X-Google-Smtp-Source: ACHHUZ4vEwvyplW6vMs2Y325gy1+hHu6nLwelmYBEzjs5UYHdAcC/VjlA2lNIyymiiyE0yTFT7eyMg==
X-Received: by 2002:a17:902:904c:b0:1b0:3ab6:5143 with SMTP id w12-20020a170902904c00b001b03ab65143mr262696plz.68.1686295989322;
        Fri, 09 Jun 2023 00:33:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::842e])
        by smtp.gmail.com with ESMTPSA id ix11-20020a170902f80b00b001b042e8ed77sm2559837plb.281.2023.06.09.00.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 00:33:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 16.0.5
Date: Fri,  9 Jun 2023 00:33:06 -0700
Message-ID: <20230609073306.700320-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182542

Release notes

16.0.4 - https://discourse.llvm.org/t/16-0-4-release/70692

16.0.5 - https://discourse.llvm.org/t/16-0-5-releae/71097

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index a49965668ff..8b0ab11b612 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "16.0.3"
+PV = "16.0.5"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "da3cd333bea572fb10470f610a27f22bcb84b08c"
+SRCREV = "185b81e034ba60081023b6e59504dfffb560f3e3"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.41.0


