Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400DC47DA6
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:52 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.15561.1704990468021541349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I5Kn4lc5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3f2985425so29135135ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990467; x=1705595267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHnrZLvWj2rLETIzCeMIY/sbtOrx0qxE9R9jN00/uTc=;
        b=I5Kn4lc5jKa/T95Evp/nNtCNee3qW6pNeiJIJhSrM+tgjnks0UhIiqCysO9Yc26bhW
         uqD7QoEd77eKcQgJ9Ze1sGLenVDL785Rgma54UQuf36E5oB7HNp/c/klS5YlpQdJa/gK
         /wfFHyBGJ1etxf6DKAMgov3LWq2xuDwA5VF1rtLBs5zwZHuZEbMPYhvuH+70sKDG3ZBZ
         7ubwdX48p4CSmWI3WMRT1hLHIUYs9JrS5AYsgq/Z5PZcfllA/3sJyLwKO+ClFzToezF6
         fTrZQHfUoLxdv0Xzh6tPliwVU9mmatIQbsRzjXHETljagJVjucYoYsz1+Y35q5Tjp8AH
         /fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990467; x=1705595267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHnrZLvWj2rLETIzCeMIY/sbtOrx0qxE9R9jN00/uTc=;
        b=haZlqp+dGqUhS47SW/K3VaXW9Bgl0eBh4/5/s/g7E/QbQyojF1tKLOcm/VN/jBi/nc
         0BCoBppll7dO022/Q0o9wZFtw6J+26oxp/kKptJf8rHW/aS+JffzjB4NnpC+8NGLoMlt
         RYxZpjknUE1G5bzRIx+Hn1c2qrZWrLyFnSQoLi7vamcp/zNpCpW8WYGGENlCFvedADPs
         CXjjS0YPMr04YMok7xypOBcDrsYZB63N13J9b5qwWA5/yKpzulMigpHYU3DMnnE3Ikwy
         bjmKRLqsBRKOWZksysrfNZjZWk/n0HJ9eQmc49qlM1ggbw2PuaoLaXKPOgJjzXGPfCzc
         2URQ==
X-Gm-Message-State: AOJu0YyCYNa3acNyQmH7sGAQQ/l9hiNjok6tpPvpO889XBt09afr53ne
	dtslXDC9MZQcfCnmP1spFhF6iiFth7lwMFHVtjMeKqudjgAkag==
X-Google-Smtp-Source: AGHT+IGs6L7esoQBxsQ1QyZSqKqaetF7UYjVbrO0kMbwUkH7uc8VuzNQ/7Z2PINRcKms+WSipjMG9w==
X-Received: by 2002:a17:903:446:b0:1d4:1c0a:160c with SMTP id iw6-20020a170903044600b001d41c0a160cmr1167149plb.86.1704990467080;
        Thu, 11 Jan 2024 08:27:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/12] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
Date: Thu, 11 Jan 2024 06:27:22 -1000
Message-Id: <5599eaefee3818c865d71f5b7c3cc04fc01de848.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193557

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


