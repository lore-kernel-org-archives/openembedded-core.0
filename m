Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66000C07E97
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 12:17:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.21349.1701433026232286540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AxoYZvF+;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d048c171d6so3985085ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 04:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701433025; x=1702037825; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCSJcJi5TlD10HiLyswrjtumGrrQpglFVGpaRCel9/A=;
        b=AxoYZvF+vhi5eErNQk8m7VptswbvKqPi5gJ58111OleFBQ7DuDulPmp8D9zE6SSb9/
         ivAB26cbmVPbq19m52/fFynU+GAnNv8fYb/i8cKJT0WePeC2xV+VoHYicskKTO0JDlBU
         7c6JPNF2tMuh4p4r01idpLa3OGevIEyAXt8Hb/YKiCFGmgSGbtdo6uac1gLzJzbxy8ud
         70AjUWeic+/ulCCK1EtFF/GjFygiSkSZQulO7NIhcCjKKt+Nyrz2v+fb73qHnSocTQkR
         yiaV4uSXtAwGWmz+DwNzLoJX0MsQ1ySZIlu/AOYAU8PcijAArfLAxIXfuToNO55msnkQ
         EPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701433025; x=1702037825;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCSJcJi5TlD10HiLyswrjtumGrrQpglFVGpaRCel9/A=;
        b=oZqR1dav7GJaQccsdl062dSxf7YQ8z8IcQkOPoGxAOxPhPXSqZe9GSR22Kh332Lo2z
         nI7l1O1+KCpq3BTKlxEwCgR9qm8Dpnk37K+oFXtiyYmuVkm1T0bicGJidkDdnd0GSd+K
         QefTg337uFYuKjNlu8OrcaJ5++6hHTm/kZAA1krttSvCJ4dncypoO6vuXeb6uD4MIZxG
         bXNTQVReHQ/c1xrrQD1PUlTkPjYyf6fAZERL4/WGP5zHpkHklso6pjXi7Yfd3cnp16ev
         XV+zAcahyf0ljQi6q9ClmfCI+m7fs+EUEbi4luc9q6nS7zwgW7fHVlSuz3kleD5oWHTY
         XoIA==
X-Gm-Message-State: AOJu0Ywi5mQ3plfRnYcJPQ0H1R5eRj9HNY9udrxxwEQpH8KXBaIYZjHI
	//+VUIGro7XWtNeafCP0aGWdmHRUTe8=
X-Google-Smtp-Source: AGHT+IFIgqTAPIDf5d1sf+/dSxVSRYKiUNVULi2fazlpkQj2thq41DIEEuEo996k2wotOh0I6Oe12Q==
X-Received: by 2002:a17:902:74c4:b0:1d0:45be:6db7 with SMTP id f4-20020a17090274c400b001d045be6db7mr3559008plt.69.1701433025342;
        Fri, 01 Dec 2023 04:17:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e02e:c09b:5061:9844:3bea:1bb0])
        by smtp.gmail.com with ESMTPSA id g1-20020a170902868100b001d060c61da5sm500356plo.134.2023.12.01.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:17:04 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][master][PATCH] cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
Date: Fri,  1 Dec 2023 17:46:17 +0530
Message-Id: <20231201121617.27666-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 12:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191570

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


