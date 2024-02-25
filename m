Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBBFC54E51
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7531.1708898010171344004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wu1ba1Fx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-299b818d63aso1774179a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898009; x=1709502809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHnrZLvWj2rLETIzCeMIY/sbtOrx0qxE9R9jN00/uTc=;
        b=wu1ba1FxefCc+CmatZrVIZgBT0Kn8/U8cDOlwFft7ckg/InSOKs8RyhT5OcoKZ/MvX
         imVgbP9JPt65e+T/NsI/Gxu63Vz2WWzWdg6Y/i0K+7pvqt9IL/0t5ZkW4RvhdS8v9vml
         TbUqZdJxYuVSjwQLfXPvlhuh95/vz0JdUzTXPYte6aGdykuTbP4E/Ph0CPBMVhP2fT2O
         h2sXEQydcXzMmR5wyZvVEX30qNVjhvaEsU7l4kCfEk97Lgx1lbBOAg/XWLJt/t6Cnczf
         En2PAe0cnk1NbyFqjL7w8Uofmm+0hE/QLCE+HxT6slgywdublo+8QCEvUeLY/tLZhSFw
         ilqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898009; x=1709502809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHnrZLvWj2rLETIzCeMIY/sbtOrx0qxE9R9jN00/uTc=;
        b=kA786ArgKObzKxXTv0nwG3rxVkc8X9fBU7DA9/QUUZt9LISiQoXzb6NT+RS5g3r8cr
         Qn6qh+4WJkvIDhltB2NI4T27gfKc+l5L8ROCvdEuq4Fz1emNIWBKzTIIPPNCmjikOXrO
         dP43mMaPTLgq5Tpxhllzwl0aAyEe1DWaaZsz7QeuACkY7FcD7vxvzFxPKP/Ol+DPBxjw
         nyV/C3QrGQ7vN1CQmcOqcT1VSAuPO6xORK1eAgP/MaKBQOhb+hdrCnFo3TPEjSYbY2WW
         LRMWGgqEg4yPRcDDxfOA1v4MsxdVABhQMyuQGjBgd37ldLiVvjU0D3l2Jrdz6GqPr1eI
         48/A==
X-Gm-Message-State: AOJu0Yy9svCVexv+sBmxDHzzY8Q0AraE+5HSwC6enIv+dHSeph0uTvmH
	Fqs8f6wdW7n/radWLH6KbOQ2D1U22bQMhLUGrqMMNy0RKnQbVzXLZRiXh9CmFcwG0tsqOKQcFx5
	hYEsivA==
X-Google-Smtp-Source: AGHT+IHf9O46efhojUoWUtHUSC1fsYWXHPwJ2bKgA1Lpd6N8ynvy/NA149si7jgdFXrCiTeypVUEdA==
X-Received: by 2002:a17:90a:e611:b0:29a:af1d:e233 with SMTP id j17-20020a17090ae61100b0029aaf1de233mr3696433pjy.16.1708898009475;
        Sun, 25 Feb 2024 13:53:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/22] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
Date: Sun, 25 Feb 2024 11:52:38 -1000
Message-Id: <2b0b47fd0cafdb9de5025efda4140e11ea447afa.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196171

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5aeada5793af53e8c93940952d4f314474dca4c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


