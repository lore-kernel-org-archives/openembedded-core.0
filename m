Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFB1C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 12:14:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.21152.1701432861902580557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 04:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SrKxW96i;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so1673087b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 04:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701432861; x=1702037661; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6ZK6xMzNmjs28ArSJCFqw7rAYnuRIeOvqcDP6ieSDE=;
        b=SrKxW96ijMZtY/EeLHTEs18dp9Y+mn73kQ7pE/kSoo3JoKfBsR/fPG+3y3kr1V2Vkb
         kwV19mNsagGBhuZFZHE1zgZK5lgb0q+evWbzb1THDF4yVWlQLLJeS5arCHsdPdO4ILTr
         5Npp8gMqfw/1qWfnficWIY8ErxrMAtL3y7Vi4zXm8nYPo47s2lK7gIrMoLbhJuBlWS34
         0QsoQbBfhyBoKSqc0r8b/M7EttczCg80QhPjekwntySeEO1bbsZCuLm8QPhQRrzFkpo3
         8Wxy0nz0Onur3yvcXDcP4O3i3m6ZBnwixCndI5vl9dcH9VDXDFtIJ9iSRHADnJSx1GNn
         EMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701432861; x=1702037661;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6ZK6xMzNmjs28ArSJCFqw7rAYnuRIeOvqcDP6ieSDE=;
        b=BjknagJC0eoZLQ52xINKEp8dQM7aTmv8VmNJYMZZS9mH5+IxsuPo90ERGzlOCtF0wz
         8PSBsl83yEbkrItdBzD4zoZZa/LLI6jOx+KgF6nSfqR/IyLtmLX0wiIjerII875YZy50
         7MXz/kRTJiNA6UrIl/NoSYnNgAt2Hb2a94dOTZwnEPQTU41d/YP0ZnUhpfrKkegAjvzH
         OZR4AQc02m8DwZLmB8xZRL6C4ybiFIpC/tlme1KjJN/kGejaQNfLKzzhSMe4YEcRPe/t
         iSKF3l52eCJP0it/ekEcsZyCsSh6KRhKKbLDikZA/CfmRILMeUZqZ7ZADEs46elthj9a
         FJdQ==
X-Gm-Message-State: AOJu0Yxn5/iLsy+JycGJs7GPPmLUusnWJtn7W+E7pb/F/xMy2e8SCD2R
	PEFDweQOu4Wh/DfV5etekzE2hmdcHZyORQ==
X-Google-Smtp-Source: AGHT+IErxgch9meuY2Auz9Es8UtYucK+sWyA6Iu685VHkYgahrWMzKI86yBU2b9c+Wlj4AM0c/wMWA==
X-Received: by 2002:a05:6a00:13aa:b0:6cb:ba66:8c77 with SMTP id t42-20020a056a0013aa00b006cbba668c77mr43639302pfg.4.1701432860908;
        Fri, 01 Dec 2023 04:14:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e02e:c09b:5061:9844:3bea:1bb0])
        by smtp.gmail.com with ESMTPSA id p17-20020aa78611000000b006cb8c92a8acsm2863389pfn.113.2023.12.01.04.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:14:20 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <akash.hadke@kpit.com>,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][kirkstone][PATCH] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
Date: Fri,  1 Dec 2023 17:43:26 +0530
Message-Id: <20231201121326.27490-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 12:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191568

From: Akash Hadke <akash.hadke@kpit.com>

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


