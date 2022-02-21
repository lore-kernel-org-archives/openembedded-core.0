Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E128C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.11303.1645452899431770019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4jSZCq3j;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 m1-20020a17090a668100b001bc023c6f34so5168139pjj.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DteEeTuev721oggvdpfczAW5Mwr5XmZlB/JtCPeFVOg=;
        b=4jSZCq3jb46k+nAz4fK3Z0Cj0E3RFuXDrQxRIRK4BPMUqTBKGZCKUN1O60bTa+K6Hm
         /0Ur+X2f8MTb6GY7LqC8sotPZXYYpxq/7WZxkNqZJnnhnxPPPyi3yqwtWJqjxhu2gdkc
         SOWxiiegzB+JepacfqyQvO7glfRaNmhvg1cZyZmBgqeUzFDVsJmtoQElFKw81dtdLs1W
         P6PWsX1AazZHv3Kw6cPAHHtY0lBG8/pvl35Kcm9boSPFexIX1qU4WZKvlh73IX3dILrs
         6/8ABekaNpUatLTUkAd7LGNPntu6MGvfbJndAYvtcxmN1ebRV42i8kJxfndLaIXQkNEN
         Z9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DteEeTuev721oggvdpfczAW5Mwr5XmZlB/JtCPeFVOg=;
        b=I7EXb+Du3yIReGHh5V5pdSOqDoLeaCsTuyjiz4zmGr5jZYEAyRBPUyfVJbm1ydP7js
         sF1LvEY/52HI7+3CH1pllZsO3nGhfbDG2u48rAODo0IGnnKOMzyxusJfBNlRdKS/afjr
         j37vy18rb4P6VIMw8gI4Erbmsxb7se1M5b6t7ESxw3EGikqG1va5b9F/3rWypZzAWkdm
         VybsihKECeLCmyVMru7L9YMilFGt6KtdCBA/vAg5we1KOxa6cF3LAIwgH6TiJU5bBXKt
         UvJthFvMWc+CcxkHoIJlH9aLBXiXRCzTi6610Ob8CWle5OtFEs8uRxoggYoovEBMoziM
         PzEA==
X-Gm-Message-State: AOAM530Ecv5tUzv1yIL/kCgb1tMeHOvikyuUyuXw2yhEJ5L7oH6wnbms
	Yo5NK3FkXCSSzHAVSk/AIRuJNKfnM8UJpxoy
X-Google-Smtp-Source: 
 ABdhPJzBEj8XTbBPJtw221pi2RIYQBiB80K2fPGvnEQD6SI7HNgj5vyvAFUEgl7haCPloUbSkm8Sjw==
X-Received: by 2002:a17:903:1249:b0:14e:e477:5019 with SMTP id
 u9-20020a170903124900b0014ee4775019mr19441433plh.53.1645452898536;
        Mon, 21 Feb 2022 06:14:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/20] cmake: remove bogus CMAKE_LDFLAGS_FLAGS
 definition from toolchain file
Date: Mon, 21 Feb 2022 04:14:11 -1000
Message-Id: 
 <cf17fc284bcffe1d5b0797c733bcc2eb293a5d8f.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162041

From: Martin Beeger <martin.beeger@online.de>

As discussion in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
file to configure the toolchain correctly in cross-compile build for recipes
using cmake. The variable CMAKE_LDFLAGS_FLAGS is spelled incorrectly, cmake expects
CMAKE_SHARED_LINKER_FLAGS, CMAKE_STATIC_LINKER_FLAGS, CMAKE_EXE_LINKER_FLAGS and
CMAKE_MODULE_LINKER_FLAGS to be set instead. As cmake already correctly initializes
these from environment there is no need to specify the linker flags in the toolchain
file at all. So this just removes the variable, as its value was also set wrong.

Signed-off-by: Martin Beeger <martin.beeger@online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52e59a5b37f55905ee693a99f9ffc34ed41b4283)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 398069eef2..f8af79ddd5 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -2,7 +2,6 @@ set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
 set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-- 
2.25.1


