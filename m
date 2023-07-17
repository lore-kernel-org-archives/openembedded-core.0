Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EFCC0015E
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 06:20:25 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2521.1689574821821858676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 23:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DmPuQVRx;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-66f3fc56ef4so3153754b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 23:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689574821; x=1692166821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOeb2rxiWslA75LqCXIJ30tyt/xh8tdgMY1niOdLqUU=;
        b=DmPuQVRxyKxXP76xN7MUcTDihzEY4kd8wApxRlhRD2b2U1Q+PTuX+e7FsOWFZO1oYO
         52/+F1AW2ZadrS3jpqRo+tAqJKUl2BpTriLv70npgIP7lzo05QPP9UVGUMMburVTrxGg
         yocd+gZ/swZ3G97lM0nqwcF5Cje5Utn3pb00xgvjdKykvTQPcGKrHN+692POQkTurvq9
         E3009iixYpFC1Iar50NgghspzgmDaQAyKpHtEFPaqL+7p+MgzIEifCnLCPnnoBsjp1Db
         Nn7gIGp5NdUpFJBIOj1BfTOEZUI8p0shZKB78t9Jc8zl3l3/51YWUboMujAvtGzh85Ur
         Esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574821; x=1692166821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOeb2rxiWslA75LqCXIJ30tyt/xh8tdgMY1niOdLqUU=;
        b=hNDxnxqKQcQ0qS6IpS+jVsQMl6OxF4KTzsomp3LRpNVIay6pU/XIhj6+4+TOaECDH1
         6rjBFuyEEqmiZizPEzXFjh+7b6ClU+2Xr437+5hxGMPQ9+kWVviWRzbmoSYngX8nC2kZ
         XBP3OuL7u6L9/qO06XPh/zSzhi2U36AGBc6gFofWkbCnhGrfG5VT3HeB1oGT0kL5DDg6
         6uH7sNCDgsPAIE5ljYX18QjrqDUl6NNGFxpwFur610GtgQW5otwJaDGADRAUTb5TdyT9
         HVFrOw31aewB67K/t5uCSpSad+EsPmYBuIuhv8A08mLV39Xp6NT7hJfv3W940t8N1qdy
         uirQ==
X-Gm-Message-State: ABy/qLYmOSteTr8nZqvvCGPcwPO4hWwfkEwKQVqDjMgVP5QTYD11klhD
	4rXYw60GdeKY8nYvm7kJ05IHto6tgk4NoQ==
X-Google-Smtp-Source: APBJJlEEtLwVhFj8pRotkm26ylRoko000wHK2X9F812kXkjEFgydokEwT6egbRO89Ejhzg0zA2LKrA==
X-Received: by 2002:a05:6a20:7351:b0:134:55a9:a1af with SMTP id v17-20020a056a20735100b0013455a9a1afmr5659091pzc.10.1689574821021;
        Sun, 16 Jul 2023 23:20:21 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c8f:4add:baa8:7d10:7282:cab5])
        by smtp.gmail.com with ESMTPSA id y10-20020aa7854a000000b0063f1a1e3003sm11057143pfn.166.2023.07.16.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:20:20 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Moritz Haase <Moritz.Haase@bmw.de>
Subject: [OE-core][dunfell][PATCH] cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK
Date: Mon, 17 Jul 2023 11:50:04 +0530
Message-Id: <20230717062004.90882-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184430

From: Tom Hochstein <tom.hochstein@nxp.com>

When building using an SDK, cmake complains that the target
architecture 'cortexa53-crypto' is unknown. The same build in bitbake
uses the target architecture 'aarch64'.

Set CMAKE_SYSTEM_PROCESSOR the same as for bitbake.

(From OE-Core rev: d32a6225eefce2073a1cd401034b5b4c68351bfe)

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: pawan <badganchipv@gmail.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index f8af79ddd5..a7020da9c7 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -12,10 +12,7 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 
 set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
 
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
+set( CMAKE_SYSTEM_PROCESSOR $ENV{OECORE_TARGET_ARCH} )
 
 # Include the toolchain configuration subscripts
 file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
-- 
2.38.1


