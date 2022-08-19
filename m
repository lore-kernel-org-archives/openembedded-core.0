Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8102DC25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:55 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.50689.1660877028751726426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p0Av1Y0A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso3596457pjr.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=dOoXJOllQE9GDetXvOkEc3jTaXvy9GZFNyuVF/8DRRU=;
        b=p0Av1Y0AV4XxC00HE+NASsnwk1IxA534lQHsJQkiJ/whsZ4RK0cNevgQ6MAZ6iIrvn
         5oQb1Y8D0Fp+4mfhLDp1Hz5FH1eYUSccNHO+grjJ5IDf1o3UEZ89Noxi3BE4+qPR4J05
         x2CvIq7wOHC0C+huqYWr/eLu0XAAEfEI0DqhpGSA2fUt3AN/v7xgcvbNRjUyrtAsrmqu
         3CgVBqpM2PacXLS9EmrfvWJkMTWyGhhbfHsvARhKwnVM6/nxaaejMROYgIbvZ3Mx63WO
         0Iokeo0LGEKJNka05O9qZKBris6pwFH8Bkg0PVgX6M/iIKcJ7Kv0j3tTwjPeZA9Cb7RT
         sckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=dOoXJOllQE9GDetXvOkEc3jTaXvy9GZFNyuVF/8DRRU=;
        b=1SYZOJGOs1/tUEqIMuzuD6CNCIU/SOJjIipehMVrsrmYRvHYnhwBlk0yI4khxkxy4x
         afqWhQimGlYwMmBl9xaWPJVTGeBAnsWNTws8UeB8J1DbMKi5K7LMtqwek0KlUlMTPXJP
         AcGi1K9Dexbk+KV2LGMTUK3YQCDg02h3muUEH5b4aoymJjA3q7JCwYB0ErU7Xd/j3cLZ
         cnh2LZXrm8bb+vsrwFSVRoPLVh3sbe1BhOw05Z+MmOx8LHI4UvTj4IdJtcQOB7EJ3sv8
         2SgdNuAiRLY47O1xMBV3Gzi8MC7zPS3Qmw8QEDmhnBhzf59VfOsiWTPXARshzcpWv02I
         ytnQ==
X-Gm-Message-State: ACgBeo17BGRnsdhW2UhTXURjpZFwstTOrAP5M2rE4V4lyl0xUpdbcXmO
	CodaB4Az/8oiC1Y273r2GnwVZEy3Lay+Si9+
X-Google-Smtp-Source: 
 AA6agR719UFXS8vQRq6ZvHKLOF8RflaXUfyyIvtTSfrjMNbqectu+mvyhKBTyrXqqCQklOh5Q0AhNg==
X-Received: by 2002:a17:90a:de13:b0:1f7:4bd3:36ec with SMTP id
 m19-20020a17090ade1300b001f74bd336ecmr11584786pjv.179.1660877027825;
        Thu, 18 Aug 2022 19:43:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/26] cmake: remove CMAKE_ASM_FLAGS variable in
 toolchain file
Date: Thu, 18 Aug 2022 16:42:41 -1000
Message-Id: 
 <aeec7cc3081a7b21dc0e38b404547463796bfa0e.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169562

From: Martin Beeger <martin.beeger@online.de>

As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
file to configure the toolchain correctly in cross-compile build for recipes
using cmake. The CMAKE_ASM_FLAGS are the configuration are meant for  assembly,
but the spelling is incorrect and the Flag is ASFLAGS for gcc and other compilers.
So this variable might neever have worked and it is better for
recipes to specify their own.

Signed-off-by: Martin Beeger <martin.beeger@online.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 72729ffbab53f95ee9dd1bc22913d9b864495930)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 86446c3ace..3ddef12c83 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -1,7 +1,6 @@
 set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-- 
2.25.1


