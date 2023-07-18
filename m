Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BEBEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:02:00 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.11622.1689696112283895298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=a/dbNM2E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso3741815b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696111; x=1692288111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=314ImVU9k+jrR92nnteJoOdUaBMMvKDv/K4P+Aepsn4=;
        b=a/dbNM2E9EEo5zqiZwdWyg91xQL6OBH2Je0PxS1am9O9rB0Z0JQB4bFlxdkzAkoYze
         I9CtESjfmZ5Pg5oJki4nz+UTQRLD4wgZHycfzLATisyZwHBnMtAPTpJSXv+jwGcpqnT5
         JnGXWfommCo4S7FcmhphrUE4LCwYPjiXHONMgCngIp/bA7oL2A07Xn+mev/4LDPtK/mZ
         yTM8YLysBISoV9whQ0r2b6ZY7Vq2ZgEKGdEFKHb4G/Lkd/PIewDJfuEd8FdOjNQ+tODN
         9hmyMRu3d76vt714p6ZAlF+k9E8J0Wy09liJmYRCqzZhjDzGsDBrTa32euPvWFkCq+Wy
         +k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696111; x=1692288111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=314ImVU9k+jrR92nnteJoOdUaBMMvKDv/K4P+Aepsn4=;
        b=PWJWIYQ3ie0x+jNlirjHh5GAL0kJa/bieduYnpDm2jQNDZjKmGkKqNDFFxhDIVNPKf
         k4DytHAHESAaxy4icieycPm11Pfj9Zrf99BFig3WQjXYiX83JyTlKQVQNif7kq78+bTN
         GkY4GG9EKv6ofB2Bbj75/8mXLYUZdrWluV3BCuIXRJSB1f9dMtqT3PgHDFJKdlifGW92
         H05scwzyUFk4hnQ6aDJIztr2y68Bt4DGZ6OlGsRnT2ry3CTrnKuw/jYhPAuazFFXS9xR
         oZtB8jiQU0Ob0OvqzeOyA+gGXQtuWQb2BX2Yf/FEnX85+N9N6wMYPZ6qDxViFOyIJHrc
         SiUw==
X-Gm-Message-State: ABy/qLZvjqp8duwkmX5vqwiXB5jKF0cDPkh8nw56OZIKmu7wGzYkElNZ
	nn0t5Dlp3stdElgSQNYzKkaqPUs7fHOSJwj41sc=
X-Google-Smtp-Source: APBJJlEbK4nld5LektVk6V/kCFuCTplkIGo4dMO6vmc4e4TiLCKlxJW1KGHmGferNHAvvWmayxBEQQ==
X-Received: by 2002:a05:6a00:1914:b0:66a:365c:a0e6 with SMTP id y20-20020a056a00191400b0066a365ca0e6mr15964387pfi.13.1689696111362;
        Tue, 18 Jul 2023 09:01:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/13] cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK
Date: Tue, 18 Jul 2023 06:01:04 -1000
Message-Id: <7a7ef9d73affc23fa14712d56f1a40d0c46569cb.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184550

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
index f8af79ddd5..a7020da9c7 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -12,10 +12,7 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 
 set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
 
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
+set( CMAKE_SYSTEM_PROCESSOR $ENV{OECORE_TARGET_ARCH} )
 
 # Include the toolchain configuration subscripts
 file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
-- 
2.34.1


