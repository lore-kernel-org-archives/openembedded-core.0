Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031C6EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 06:18:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2470.1689574679206134425
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 23:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PeYfbCrX;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b9cdef8619so25138305ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 23:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689574678; x=1692166678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpjLWR0tNmN1ecLW9D1AdtqGK56KOX6zrYEoCX6LelA=;
        b=PeYfbCrXZ/ub27aLdHnR23UNafGs1XQDJhuJH7kuVSNgv6EXDRq6hw9sNcqMIii7rp
         4FnDiDgviKiqjbWkeIsgq+yY6U7akhpyqA+cJR1xf8UF/hQAxYsyFrVBBqVyPKp7q3hG
         KW8JoxYuIBPCCLpSOGqu01mVGtvQVrrNJS174q5eHCI11lP9JPdWFX1ams7NP121Y6J2
         lm3ySFL1EBiIiFR9e4Y7FhYDlWu+l3dA0GaB599vqpfta4pRlVoDk/diIMwMm8IsTWPc
         6N5uW0wg8CWJ5Gawz8YWwfs4oUg8ArOhFLf3wI9zOm9HDEjVER80uXwrEPlMu4KXfwJt
         K/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574678; x=1692166678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpjLWR0tNmN1ecLW9D1AdtqGK56KOX6zrYEoCX6LelA=;
        b=Lk8Ub851lKpx4oGBdd7+HrrGqgzrTbzlVTH5kR/QPJxjQWNZ8kx4UepvNkp+rHey1D
         Qpfb/1RYJmWpvfj5ANj+oQ3t3sO0eWHdbj1LpnfJFP2BjrD5JpDNPhLx0Wus0sjt4irz
         5Q0PCaMdvWay2QuPdSTc72fIskMh6EOoXv57HKTRcbR3AcsKT7zxYxoYjxAtTOBiQHh0
         CWoMTT7iWxEZVN+5JHX+t8x/4K1Tx2l7lfrHr5kuW4qkBQGQ8JY4yO5uen0qM0GcYu9/
         LG52KfcmxnJV2oeZvn8PZz/5DX1bXwQOZKGkfhhKJ7R17C8bUuox+R2oaD++broXXhmC
         Tahg==
X-Gm-Message-State: ABy/qLZ88ep6LwMEP54+2/f7RJX8kdkfBxAvpt5Lr/zLlYf/BTrxxUVY
	Tf+y/P4V4kQDeNvzkTVRkt3u0cRJtkE=
X-Google-Smtp-Source: APBJJlGOw33qf/9HM87S/qdBzSi6yxiaUvta49KMz4YjT0qJHRZtOLMJtbDNERSLArw1eZ3roofMCA==
X-Received: by 2002:a17:903:1c2:b0:1b3:fb75:dd24 with SMTP id e2-20020a17090301c200b001b3fb75dd24mr13196786plh.48.1689574678446;
        Sun, 16 Jul 2023 23:17:58 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c8f:4add:baa8:7d10:7282:cab5])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b001b89a6164desm11907954plg.118.2023.07.16.23.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:17:58 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Moritz Haase <Moritz.Haase@bmw.de>
Subject: [OE-core][kirkstone][PATCH] cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK
Date: Mon, 17 Jul 2023 11:47:43 +0530
Message-Id: <20230717061743.89079-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 06:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184429

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
index 3ddef12c83..d6a1e0464c 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -11,10 +11,7 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 
 set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
 
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
+set( CMAKE_SYSTEM_PROCESSOR $ENV{OECORE_TARGET_ARCH} )
 
 # Include the toolchain configuration subscripts
 file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
-- 
2.38.1


