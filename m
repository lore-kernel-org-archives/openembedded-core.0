Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB39EC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:46:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.30907.1701258390842771559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ftNE3ScN;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cfb4d28c43so35230985ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 03:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701258390; x=1701863190; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bYYxF0YT/Ol190YPiU05f3uNr5FYf191dDbbI4JJss=;
        b=ftNE3ScNoSulGR63AaZi8OA3VasIVYBodoQfAgFMvTjN6IAhZcFV2MPxa7OB21VCxt
         PynXmA8uXLJwwDJLAwB8N1YObJo455ez/VgVj1q8R25flmld/fePWmN/KbKQv9WSHMdb
         0ECdgS4vv9+EjH9e4g8byUWfNvktWeqD4E5L/hGRMA4dnzP7m7L6bieKOVxXk59jTlII
         69MNPfOwIJ9PgcczZe2hUkJBHaZRxrGoF3tkl6olGAyBxuRcFDY3MnJYyEMEru4iIaD1
         TCjYszcEoZLlCgMyf4ZRPkbNIFMbAALelzJ4qFMgnnbUlmRr5UuX6hkt/b9b7QS40VkP
         zcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701258390; x=1701863190;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bYYxF0YT/Ol190YPiU05f3uNr5FYf191dDbbI4JJss=;
        b=XBBgBz3hIKMMevDrOjH11EUjyM26oAuCeu7ih+o4FfHrvUoT46bL8P9OwaIBu2sheq
         7AoZ6iBjNRooAaTn6RvVNMBMffE/gRtylcOVzEGsPti+wNIIeuMETYyxJrVB7Gvckpvd
         dTPmQQZjZhzdGCxdghZFijlvBt5N1CMB03sSRWpaGcAqu5jqPLZL1wyd4/w/AfykEeRA
         rqgAPwOxMHWV6xHRmIBEVIYHSsIchLUQuFWoCYh/WG8kLXNzDWMTfaMn1LHa3AD3EHAT
         UAb5nYBa43Ecd+FXfQHuCkO8pfJI4LmISNqLEISA1W5k/idnjvc+rMFlomFGnuH9TKzO
         6I8g==
X-Gm-Message-State: AOJu0YxN0+EZP7rD5CrZH0z4v08DenttEbS0TUw9H+AI1jEIVkxtfaS0
	0YnEdAuKc0qup/IjZ0IR24blQVeCFKE=
X-Google-Smtp-Source: AGHT+IFfxqs42ECOsrH0Si4L7Vy8MMvoeeXSNRgwULsMbCzRANUmkSuP4yG3n0ujC1f6OzIyo/g4lg==
X-Received: by 2002:a17:902:ecc5:b0:1cf:c2c8:7f96 with SMTP id a5-20020a170902ecc500b001cfc2c87f96mr13348454plh.48.1701258390007;
        Wed, 29 Nov 2023 03:46:30 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e034:50d0:d5e2:ec67:9541:eb86])
        by smtp.gmail.com with ESMTPSA id b12-20020a170903228c00b001cfce833b6fsm5758024plh.204.2023.11.29.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:46:29 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][kirkstone][PATCH] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES variable definition from toolchain file
Date: Wed, 29 Nov 2023 17:15:38 +0530
Message-Id: <20231129114538.4819-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191441

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
index d6a1e0464c..6434b27371 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -18,3 +18,6 @@ file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
 foreach(config ${toolchain_config_files})
     include(${config})
 endforeach()
+
+unset(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES)
+unset(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES)
-- 
2.17.1


