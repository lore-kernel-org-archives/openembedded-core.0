Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3538.1620768990517612747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 14:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FljS0RhZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: christian.morales.vega@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id e7so3009747wrc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GKAkwy4mIPZjp8PArLllfSmo7dJ+LZgIk4VNOahi5AE=;
        b=FljS0RhZh3JGM+3moflpieYim5/qrP1zZ065LJWPeKG9zIp+fKxeh7NOH1n4c09P4l
         hEsqrRmbc1psmVGtaClkv1/iL2IBtKu8/ujj2yUFIc1JxG5WRO048OHnj0mfu2xR0iEq
         i5X/aJHaXsRxCVfP6WoIvdzW1heJ49HL25cR7BXXCaeJ+l9B7vUs8dUeDtUPMJUgBVBN
         TNX2/Lt4mcQOgPp5rSGuRuF6iwJSacAovDCAo19htpu5e21EpL+GTRJbI+HO15hRusuG
         hNq/HguvRQ5Jl0e2XIkESCuLMIRoscOr5dMfgScN2zTP+hAbkatr1QhZN0FSIjpPAneO
         iOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GKAkwy4mIPZjp8PArLllfSmo7dJ+LZgIk4VNOahi5AE=;
        b=hR54V11vPTsFZjYYkdRirQsJ5NB+etSs5O7xhDocGhpXNIlpNMeNkgGjolpP6WVCcp
         EMRQUwyz26TZYXh2RZi71p7VeIU++ciUq0XDOvnMiOFQEBQI7s1167Jm2qFJ4Hx3RR6l
         9+UGqrR6Hc8FrvRNphA70DykStu//Njlr0nISssnkJ4pnX80UcZ1WNsZJQdH98S729Hr
         c7LlMER6ACHTKmzF5UPEdXjoN4MF5mYkX4Iz0jpNrc7HIKfkGj0+aJVHzYzGna4WWP0b
         bVfdD5LSEMLTLggJN1hHl/1UE91csFhMZl9rKt2KZqdrMq6IKDJPMpVlK6HFPxGlW/Og
         TkWA==
X-Gm-Message-State: AOAM531fzn4TaEWuPAUdjNH/E3SJ5CyM5zkS3IsBZxmRIFjsVpakBd0E
	9Oasd13DgFLjojrdG+VB+mGo4GiFTq4xP+0l
X-Google-Smtp-Source: ABdhPJx+IxALnRPZdivYQqLb23rZaYKHJi/N4abvdBuc+VV+16jkkr09T0kr7sE3IjUxSTb53S1Org==
X-Received: by 2002:adf:cf0f:: with SMTP id o15mr40590260wrj.181.1620768988842;
        Tue, 11 May 2021 14:36:28 -0700 (PDT)
Return-Path: <christian.morales.vega@gmail.com>
Received: from localhost.localdomain ([2a00:23c7:cb1c:100:73f5:7d83:a900:462e])
        by smtp.gmail.com with ESMTPSA id f8sm22475839wmg.43.2021.05.11.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 14:36:28 -0700 (PDT)
From: "Cristian Morales Vega" <christian.morales.vega@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Cristian Morales Vega <christian.morales.vega@gmail.com>
Subject: [PATCH] OEToolchainConfig.cmake: Remove CMAKE_FIND_ROOT_PATH
Date: Tue, 11 May 2021 22:36:18 +0100
Message-Id: <20210511213618.188369-1-christian.morales.vega@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since cb42802f2fe CMAKE_SYSROOT has been set, making
CMAKE_FIND_ROOT_PATH unnecessary.
It also overwrites any CMAKE_FIND_ROOT_PATH the user may have provided,
which is wrong.
---
I am using this file because I received it as part of a Yocto SDK. I
have never used OpenEmbedded, I guess this can potentially break
something. Test before merging.

 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 8f6f3a272d..4403f8aa9c 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -5,7 +5,6 @@ set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
-set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-- 
2.31.1

