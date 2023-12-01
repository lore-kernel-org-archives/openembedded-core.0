Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BA8C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 12:15:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.21326.1701432945613022194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 04:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BcdebjAc;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cfc3f50504so3840615ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 04:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701432945; x=1702037745; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOndrpSjxf58VzxSm6EpAzO4eo2Z8sLVlFlWL/2Relw=;
        b=BcdebjAcdLec2sdbWoQaTAGVH6MMC4Crp2hhyzJBjnThZ5+ZJmNeZc5ATrcIXLUv4e
         GfnwZ+n5jCC71SaJ8NdvrjLWUjnYJ7naF2w9jDpYMYnu2cN+vzI3lSas8lzGblgebe3b
         YxxSSDiY69DM+kVl2fM8Muxs/BHpN85JQpKNIGF80vQeOVf0BdLbu7fAnpoGSyXSJXx0
         9LJsqGYR+vM0W/O2xT2K2z7AknEifjmccguY1907941lCYvsVc8UnyjFO4CwUVdMr0MD
         yIi1cdLAufup8fywJGEZgGWs9U72INny4ruohcGwuyh0igUDsuPoUiACUOE4OCnUe7o0
         Tzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701432945; x=1702037745;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOndrpSjxf58VzxSm6EpAzO4eo2Z8sLVlFlWL/2Relw=;
        b=BTJu2KB2j9JHhTNEuN8UTns/i46auRRY9yDXsEUYYAuXW0qfwNkT4AXplhx0kO2K8H
         7RRITq1ThbmBBHCn7XLEVZnCNdR6y6zbbvHeZyzV4gYWpdFNqVhQDJvoSVwVHVZIXaGt
         0cx7rRtaXcUuQG1Eiewj59oqGaOcBM8hvqPeHjzZBkUGHa1fhSyagBCpLcstkVcPPrut
         rWZlZ0sgXvDUVOlksfb87jjsUviUX4P4D7e2y3NOmEHaH6IPzjxe2dxAvY0Zt37vhBRB
         hGa0XfYAXROXuNddKU5kQB5RycbRLREJG5nl0U11Hf/tapjUXbWYrimG+wjTDXun+1aW
         46SA==
X-Gm-Message-State: AOJu0Yxe1P8C15vDsGzqPXb7WtMaJ+zKJ9Ntrktd206z8EbU6P1YhxOd
	5kmD+YfaxjENQzcsF9iqjbJE7Buem+A=
X-Google-Smtp-Source: AGHT+IFqGZD6cONxV2FsBuGo25bwCopYzF5oCQNdsQtcz4l83VWSswSG0xU4LRx/p+jjUWc2EPU8Xg==
X-Received: by 2002:a17:903:1c9:b0:1d0:4c09:7d31 with SMTP id e9-20020a17090301c900b001d04c097d31mr2644367plh.65.1701432944695;
        Fri, 01 Dec 2023 04:15:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e02e:c09b:5061:9844:3bea:1bb0])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902e9cc00b001cc20dd8825sm3162567plk.213.2023.12.01.04.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:15:44 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][dunfell][PATCH] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
Date: Fri,  1 Dec 2023 17:44:58 +0530
Message-Id: <20231201121458.27574-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 12:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191569

From: Zahir Hussain <zahir.basha@kpit.com>

As discussion in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
file to configure the toolchain correctly in cross-compile build for recipes
using cmake.

The variable CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES value updates incorrectly
during do_compile the code. Due to this getting sporadic error like below,

fatal error: stdlib.h: No such file or directory
|    75 | #include_next <stdlib.h>
|       |               ^~~~~~~~~~
| compilation terminated.
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.

As cmake already correctly initializes the variable from environment,
So we have to unset it in the toolchain file to avoid overwriting the
variable definition again.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index a7020da9c7..870009c2ba 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -19,3 +19,6 @@ file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
 foreach(config ${toolchain_config_files})
     include(${config})
 endforeach()
+
+unset(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES)
+unset(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES)
-- 
2.17.1


