Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADF0C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:29:32 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.30617.1701257369191224008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPwm07us;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: mail2szahir@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1fa0885e1c2so2943635fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701257368; x=1701862168; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bYYxF0YT/Ol190YPiU05f3uNr5FYf191dDbbI4JJss=;
        b=cPwm07usnGV4Wjr91fHL0rr3clvIEpGAII3/QNe388V8QUMgjSpgw+8yLSbAt8hK/A
         Ybm+x5SBS4EvIBjaO7nbkZ7XV8F0UF8mFKCDT36xlBfLIW2lAM9FrOqyF8t1g68ULzhQ
         d76WnljWROmzc9jhOCe5MKeScd00fq9cVJAew/VOtf0j1slKBsarX3VAhldS2aukLxoM
         mA/biLFJL1Y9TJ0X+UxhGkxchspjxo2sgOWU3vG2yYj4vQTY7Q2VTW0BZn+YfieJSLaH
         wmDksrBebqrjlNsMZSTzVJ+SNUgyXd602MzgPBS5TA9uLhP0d9zeEBupcqszAYbIsaTE
         xAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257368; x=1701862168;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bYYxF0YT/Ol190YPiU05f3uNr5FYf191dDbbI4JJss=;
        b=NVxEldpTfKX9jj5WXjk5kIh6lw5o6OkK6IziwKwF8GfGFMqIuHky1dG3R2HL/nQKVK
         2e1V5BUi5r7UKnxo7dP0L4mehER5oLti4yF2bBe52brxTbNQEvDMw4Hxd/qYRtk7VIe9
         N5MYcLMXium7X9XbFSRd0OPYTXAbY/8cJE15RAuXN1fer8U1suAKDu7kXBJDIPfvxsEK
         LiJ4q/XTSIixdcCuCrGoTiyAMMtsTvucRjKjHIaE0rV9bAxzaLmiAKe/IXzXeXNr2SsU
         iunN/3e4AnaQCflNTwGTn2st0cTdV7WH+sbxiu5VTwDkdOirb2MCtApeYPFebCtfjswY
         3esw==
X-Gm-Message-State: AOJu0YzdsW2tbmTF6kKMk6j00bbckyZtfiXOLz69PzkmWhlU07wb1jDr
	cqCr0kDGUacIwJY1BSwwrfQpqujzKwI=
X-Google-Smtp-Source: AGHT+IEFae4lobA8lDHAjvimNWAbMTpMI9IgDaABXgfqAkLviQW5Ne+fS4F+ddhgxKHredOHGBNSsw==
X-Received: by 2002:a05:6870:5d94:b0:1f9:90b5:be2d with SMTP id fu20-20020a0568705d9400b001f990b5be2dmr25098414oab.25.1701257368287;
        Wed, 29 Nov 2023 03:29:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e034:50d0:d5e2:ec67:9541:eb86])
        by smtp.gmail.com with ESMTPSA id ey25-20020a056a0038d900b006cb88e7c005sm10562858pfb.203.2023.11.29.03.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:29:28 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][master][PATCH] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES variable definition from toolchain file
Date: Wed, 29 Nov 2023 16:58:43 +0530
Message-Id: <20231129112843.4368-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191439

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


