Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A41EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:29 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.9035.1689690444470096672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ys1a5lCG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso3647287b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690443; x=1692282443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBTOKyYV8XjRSeDqZbJGw6YozUa2vn1hbH4VC9ZE2Fk=;
        b=ys1a5lCGGk1sLSzWwLQL048+WKRQxJCPESDQuxrUrIoZiY15eeI4ybW7RSvFXxO8aC
         XQbOMZU1cFUBBUTo4HGpIFAjWE+mX2HSl8fMSxLbfzoV0YR1FiU5fSZQ7ZaoeS60L+qd
         IRZEN1J3XfOnAQKLpnFu0Zz+8gw2PjCazrf57+LwuO77fudLZ2FT8VyVTUztNKIkDoWA
         UO+4JBUAq0P8Nu8xsR+tzdPlbXiFuEp0fQ5uqpmm/9fJtKGHceeA5KlENhfvkXotC5aG
         zHKJvgil4vmrGl/0typqYiKCNTGGBCmM3JRmWcB3vo48sEYCjcruq9sga7/VP9xdUjL9
         4VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690443; x=1692282443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBTOKyYV8XjRSeDqZbJGw6YozUa2vn1hbH4VC9ZE2Fk=;
        b=SREnxEVIzsg3/EFSim42omkeDU2yBvAs3MoqWQpF1p+nml84NAeSL7Jh9pHPq67ysp
         H7KsI39VZvNYmjTKe5gsnoimbaPokG/fsDmWYcgx/2I7NFmmBDc2J1jk/np+ra/fURbb
         AOOF5Qib/EKruuWbfNi8jlYBAWCqDhF+jIbk/Dyx4YpIs2CaDRdZt8uOkbMWe/s20HIQ
         gJr19WzduaJOaB5MKPqaxc7CpvKv/sYF6vazSK1Z9DdsFkhuytzCyTVA1Vj+u51LQCrp
         MShl7Vs6OPKgirCMy2k4+uulKP54E6fGF4eJB0AuUGOFnxJ4ZUqK6FH4pCR8SrVskeEI
         FjsA==
X-Gm-Message-State: ABy/qLZCZqSsZi9WmwTceHoJIqkrnb4DtR7jAIeJxmSk05mWH0c8s7R/
	aqMhYb+mAVHPYuDsDitbtNKBxADiI5e5Db9eow4=
X-Google-Smtp-Source: APBJJlFczSdyTKJuK4/s3ltRVVqLSC9T75hypWUeIOLzqtAz0ojHnN8tiOs4oUO3fGdBwy2jqnnBCA==
X-Received: by 2002:a05:6a20:8e0d:b0:130:835b:e6b7 with SMTP id y13-20020a056a208e0d00b00130835be6b7mr14097175pzj.47.1689690443491;
        Tue, 18 Jul 2023 07:27:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/27] cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK
Date: Tue, 18 Jul 2023 04:26:01 -1000
Message-Id: <d877d5f07772ec4a05332068ddc03cf387313036.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184531

From: Tom Hochstein <tom.hochstein@nxp.com>

When building using an SDK, cmake complains that the target
architecture 'cortexa53-crypto' is unknown. The same build in bitbake
uses the target architecture 'aarch64'.

Set CMAKE_SYSTEM_PROCESSOR the same as for bitbake.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d32a6225eefce2073a1cd401034b5b4c68351bfe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


