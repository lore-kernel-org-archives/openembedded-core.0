Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B29DC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:33:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.30666.1701257578671471502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJMUkSAx;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cdde2aeb64so49744b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701257578; x=1701862378; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOKqGYd2qKWktu2lhhBTe4/tc0Firxd0LOTGrysbz78=;
        b=cJMUkSAx2lDd1cIspkYLzk/lJeikUsefVw7nipogEB/qM5gBDCXIY3t7iF9zf3NwyR
         k2+ZQP/2cRqLNyFLwnrQOb8+c9igm0JbJfOLJgTqeN6rX68YLDR//Qxku52uaWmUDAU8
         9NoBi2BjxRRRiK44qo02r7tfpKx1gPvSlyM5bU/2b4DqhFzqmUWOwHtUeryBcp7JNOlv
         tuAaNx3mSM4WF3Vw5LmC87GdyIEtBs1YXiFAtcyTzEtbajEt+rqsyrBjYhZkCDimgYXQ
         g6gXu5JOGlTYr/XNklRO54brudjm8VNTjfa6aIf8CP2bosaLC+LlHsnoD5NfLB6Zwjob
         GM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257578; x=1701862378;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOKqGYd2qKWktu2lhhBTe4/tc0Firxd0LOTGrysbz78=;
        b=ge1VisqewKDgnoe8VBE+kbnzTkur19reoj2P9GfvJLAnZEvU72n+3jkzMQ2VUsu3bW
         NloDXN83KyrROBBXZ+jqLbDf9ZPpVguFlvLAMhTAGpxPNeEd+W6ZcHPC/9CFG90raegw
         Cc09KygpDkkSXZT5VRNrvViFuE39oo74/p5IVw2JGJBi63oPh7eFK2N67q/7pipojeOD
         lEC6cYOQ5HnCC0VE9oh3v0SR5Eo0FTOuM6X6u8Nd7kBKGElpYZzwRb2uaWM+YrYTP45G
         0RWMSJWNMNJsNBK0DUl+Tkcr/5YkE3PHWshlz+z27iGY+VOtmf7iUT5QCEQpyHwZb2TP
         X1Vg==
X-Gm-Message-State: AOJu0YzIP4XXgCBAfYI8aO0QL1K2nTwWngpvr528QxEzAI3y/oS31bqY
	tuGqVQNVTIWG22eMlNxzUUyAPa1qKXY=
X-Google-Smtp-Source: AGHT+IHPRM3EIOracDPJl2+uf853mH4raCC+4DGjMGWbOA/z2xwM8DCptiMbj1LWWJnB78y6Lgr8bQ==
X-Received: by 2002:a05:6a00:2d86:b0:6cd:daa5:138f with SMTP id fb6-20020a056a002d8600b006cddaa5138fmr512393pfb.0.1701257577801;
        Wed, 29 Nov 2023 03:32:57 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e034:50d0:d5e2:ec67:9541:eb86])
        by smtp.gmail.com with ESMTPSA id w2-20020aa78582000000b006cbbfeec4e0sm10838165pfn.92.2023.11.29.03.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:32:57 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][dunfell][PATCH] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES variable definition from toolchain file
Date: Wed, 29 Nov 2023 17:02:06 +0530
Message-Id: <20231129113206.4582-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191440

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

As cmake already correctly initializes the variable from environment, So we have to
unset it in the toolchain file to avoid overwriting the variable definition again.

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


