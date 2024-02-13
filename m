Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93574C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.26115.1707860628733275509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oZXShYzu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3610102a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860628; x=1708465428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8D0jCGwzeuNwf68ZYCz2O3SADzT0hxa0Ml9kpp5ySQ=;
        b=oZXShYzuiK/lqNp+XCBnzIzjqjjp24qUicNPFHViIHBkmvUnmzB23iQOU6qMsbiBtG
         cVyBpVj4/t7ga519J4zdQqc56hAMmlwnJgyere4Or9keNz4D6dcuItM5Q5nfd96wmul3
         c3gkfz69/B+F6wpEHLpmd1Mj1nvoF8wyZOocmwJoVCO9e8Q9Q5ttz7m6OLhKIpJQg7wQ
         nbE7Ro7JY00jkUR08nqAV+WJs15PsmptsEG9fN+Gnlhiy42gTV0DSCXn9Sd2heEIkiu3
         QGJbEj9ptEEpJlufsRuhDClZha42zZmJAnCpsub3yzrq4TLfrJvZflFfYaOyVwk4mrlK
         WTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860628; x=1708465428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8D0jCGwzeuNwf68ZYCz2O3SADzT0hxa0Ml9kpp5ySQ=;
        b=MscQ2xbyvV/mf10rB/37LoxC8c7NIC9bQTSkifXkLJmPn4kbk1qmZEnPtkpSmbWzjU
         dPhpmYJATuxTVVRR3C8vYlMIAZLRUDmzwWtq+r216bHvKTw0k1Vc7SME+cYZSr+1n7va
         t9kZk/7MzsQpnn1AOAV+ATZ4VbcHEcLP8ewTtfv/SFmKP3WFsmsYKLPZQvdqJdCvyqdd
         GGrTA9P6BIcHxX36l9/H4TlY/2KvkWne/8t1+cqFJIpxQiwvtyMhjV/fnzg1X+Xu3xU7
         Cf0y5a6GFIcwRdCzSRVsT5Mg9k4/ERG6Z65P+cK8xQCyf0NYmtJEY9ji95lQlRQhWANG
         hr3A==
X-Gm-Message-State: AOJu0Yy1f1TNntJVx9xPchm2TFGFy4Yk1Szd+CwFeAt9Mo4LzUfc+sEw
	xy22+pT6EERpMCvWoKHQpnj/h/COE81KC4FmavAhqmOgTplYwHWysvpFiOJd8gl4m6zVYiG7l2M
	s
X-Google-Smtp-Source: AGHT+IE4g1wnOI5Q1iCiHvUjnm4+Chztu9b1pgAFaJOe620dqAzHiQXNqzj0eOn29UJDLMYzn7XygA==
X-Received: by 2002:a05:6a00:1d0b:b0:6e0:7f22:81bd with SMTP id a11-20020a056a001d0b00b006e07f2281bdmr609591pfx.20.1707860627921;
        Tue, 13 Feb 2024 13:43:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
Date: Tue, 13 Feb 2024 11:43:27 -1000
Message-Id: <7ab6087536bc67c63094f08f863dcd3d5e35b8e7.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195436

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
2.34.1


