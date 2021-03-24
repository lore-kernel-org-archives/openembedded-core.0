Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.198.1616596810471802740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=u5LLhPxo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id c204so17468912pfc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OWJVlyYc7z21VjdPoP9LXwc3DmsA9/3t1LvbX2Fo4HM=;
        b=u5LLhPxoNFFs9CEE5OaTgTu8GEz6RBi4pIxnUz4yd1gDqrds2PWJXgx0r7rC82dZy3
         3wOIc6UzB2KRejJ84RKJI+nzJLg3PWa0TYZDbmYb+UQZDXoeWBaRqPW1U25mu1Dw6BK6
         gYPuL3RFQCFvJ/p1Ttr+2fEyM2lbfDWUxo+4h8bOV/DMPPkEeCycgwnlKGUYtx5bAKp0
         ZKknNbjLfq7thUrRd0zgeRCUyqbG8Brd7u8QkLi/LcJraYiweIsoDLvNkSfJkSESARZi
         +Atozyv8LC88G2kbxRfXYod4xU6mubo62QO0CeG8/7X72lRd9oD6L9ja4NDZZm6DyACY
         cR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWJVlyYc7z21VjdPoP9LXwc3DmsA9/3t1LvbX2Fo4HM=;
        b=qFuftriTuZrZlZMujUwDaFdrNqiDCo9cNyOEtk/Y/jJw+3bdH0C/jXo2g2oabzr6nH
         34z5JZ8TjnGPL7GLOLVEaK9dRmAHOfEAVnmk42xcq02mNYgwlSqjOzTaX05wQb1yOgvi
         FonhDseuAIGvJ+vriUlplADhx6+31N2+kgmtQbG2HyurNEppKn+Eg67eYqKBo5L987XI
         Vr9TnoRFDu2DGru5TtbbzlA2H4lz8zdA5epoNDx+njw7IOw/6RNT73En2zkDK1j57a1V
         //crthx/CiF2bZpyh0LMJood8xL8LXIw68g4VEv7Enr+JCU1+fp0CY6YNQ3saubKHkGS
         2QyA==
X-Gm-Message-State: AOAM533I1YqBabb/Sz0ZNtHpJLPMHgNGAFmaHRO7N+mmoCJfs29lDyDX
	avRDPNukISxelqrnPOhLjxpHi7qS6U2tLJ28
X-Google-Smtp-Source: ABdhPJz522bwqc1oO0B7Ptdlan+/7AVJNZKguZyIVu7EUpV3PCuiQb7Wukbr9fKu985P7SiBiv5idw==
X-Received: by 2002:a63:ab05:: with SMTP id p5mr3345982pgf.149.1616596809474;
        Wed, 24 Mar 2021 07:40:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/21] cmake: Fully-qualified path to ar
Date: Wed, 24 Mar 2021 04:39:10 -1000
Message-Id: <0b5d825ccb251bd6015dfcd49ed452b7bd64e6f6.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Royds <douglas.royds@taitradio.com>

We (correctly enough) pass in our AR to cmake via the toolchain file,
but unlike the other cross-compilation tools (CC, CXX, ranlib, etc),
cmake does not then do its own search in the PATH for our AR.

By using cmake's own find_program() to search the PATH,
make works as expected from the commandline, outside of bitbake.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9180c9575f0723b51915a0da58452511b6b03bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cmake.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8243f7ce8c..af6a8c4395 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -102,7 +102,8 @@ set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
 set( CMAKE_CXX_COMPILER_LAUNCHER ${OECMAKE_CXX_COMPILER_LAUNCHER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
-set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
+find_program( CMAKE_AR ${OECMAKE_AR} DOC "Archiver" REQUIRED )
+
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
-- 
2.25.1

