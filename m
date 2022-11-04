Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94236C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.7190.1667530927001650130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fIT6gT/M;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id b21so3711988plc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyzL3XWs6T77rLBRvWIeQXVa5/ctXm1vnX8C5fNOgSE=;
        b=fIT6gT/Mo7zOhb6+yTHZhjcRM7rzMkMJZ/sk4uAWnYMgOA/NcOPHhUoMetmssbTSxQ
         8BLDd8WcTRpMkRaTuUwi7F26oTfwwpt/ce0cN6usLreE2abTNCJQ2op1PvYwf98HgMEH
         +mECcIs67I+JgWO4oUmX8Kkb8Xcx+8bHEnSI4c7gp4/mPkPl/AskIXkg/zmM42xCUH0U
         uQgiB53j1JIwqomDOebuqmuKBfcmkKLRgBJUevxZx3GuaUZLeHOykCcIWkuztOFWPoDs
         PHnToDNrE8PUUP4/iFuqsa+tqI3sK2Jlmt8ocWqXT1XE/kqBbay1oPV8+b6P4WTNa0sH
         50xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyzL3XWs6T77rLBRvWIeQXVa5/ctXm1vnX8C5fNOgSE=;
        b=3X3pq1fwXPJ3J6SJ36+EklEKbthjVl6qUbLssEHfh/eT8EUpxhKAHvghIn0LUb1Y6d
         bsXtkiq0QrbPWBZPS8Tg5ncd8Ft1zXIIh3WI5K2A73NqK1dHQ94XdN556oohxFD7793a
         PNaIAmfO0c7+tfKL/R0qV/YaZZA8lyYLkG/xFJz4pJtmV3+n/SkHRPPuIMX2ScshZPNZ
         z0lKmGdHwMFQ+cWc21isON8dmwYGFfSgVEpijuhs5fg4ptHVEfT9xT52iIxVGh4xGIhB
         MjhwMr3HQ99aPyma0nEYimDIQZURGQ1aGA8bWuDS+J6HCSFBWXWngjSTrIon5EiXV0Kq
         rtqg==
X-Gm-Message-State: ACrzQf0WoOCuaz1ePzlnwX4CBubdfMsm0TdJ1P6F38WDddv1uy6cbocs
	IeFYIbA96py+ijThyHOKesSTLx54wnN3Zyqr
X-Google-Smtp-Source: AMsMyM4a/PIMXcWEOFlx2CW+zvMM9qDQa98h1gyc8c4ZaSVwCPM6CfcYodRatQ8X+/EAOJHMSldASQ==
X-Received: by 2002:a17:903:2348:b0:186:970e:739e with SMTP id c8-20020a170903234800b00186970e739emr33850219plh.115.1667530935369;
        Thu, 03 Nov 2022 20:02:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/31] cmake-native: Fix host tool contamination (Bug: 14951)
Date: Thu,  3 Nov 2022 17:01:04 -1000
Message-Id: <1fdb3f36e9ac0e5335650eb5286169e943a402cd.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172690

From: Bernhard Rosenkränzer <bero@baylibre.com>

Trying to build cmake-native on a host system where curl was built with cmake
(resulting in CURLConfig.cmake and friends, which do not use the same naming
schemes expected by cmake-native's build process, being installed to a system
wide cmake directory like /usr/lib64/cmake/CURL) results in undefined
references to all libcurl symbols.

The problem is that cmake-native sees and uses the system wide
/usr/lib64/cmake/CURL/CURLConfig.cmake, which defines CURL::libcurl and
CURL::curl as opposed to setting ${CURL_LIBRARIES} as expected by
cmake-native.

find_package(CURL) (cmake-native's CMakeLists.txt, line 478) succeeds, but
incorrectly uses the system wide CURLConfig.cmake, resulting
CMAKE_CURL_LIBRARIES to be set to an empty string (cmake-native's
CMakeLists.txt, line 484), causing the cmake-native build to miss -lcurl.

The simplest fix is to let cmake know the right value for
CURL_LIBRARIES. Making it -lcurl should always work with libcurl-native
in recipe-sysroot-native.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.22.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
index ee1f7761c4..45ea78ae00 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb
@@ -32,6 +32,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCURL_LIBRARIES=-lcurl \
 "
 
 do_configure () {
-- 
2.25.1


