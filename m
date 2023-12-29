Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD97C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.151525.1703864745652064416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gZj8d3v2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d426ad4433so24165305ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864745; x=1704469545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sw8Q9x0wC6lJb7jMwAzAq7kcIqWEftYGUk+eOorTtK4=;
        b=gZj8d3v2PV2Yacmmvs/WHByi5HFH++sGGCvnu2rjyRQkiCqLlbpQXToJKaCUgQDcDU
         tkEhsJBb9ZDIUpFnNJp2bejJIi89GKLxFSSXWR2+a6rIVvtt83DWatqwmZY5w8B3XZBf
         CHslm4NHRZOd85o8Zn4LkrcxV9ibsb05Vm3IkR9i3ZWEZc4Uo6+YomrGfumXPat0ua3e
         oZkMCwO5Skiw3aFLFIc6zZ0RK+VYCw+8RB7GnmJKsO0/3vcwK0twjgoNmaY8vrKRX4qr
         LwVq+2uvipzO66i20gGolKDSxS1LEeESHTEISg31kOkrN8bdz0A89JYNwXde9OV1l2Na
         I46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864745; x=1704469545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sw8Q9x0wC6lJb7jMwAzAq7kcIqWEftYGUk+eOorTtK4=;
        b=lRwwg9ieoaTa7XU854YyeaIwA3c1O0KJD5MBb1k3IL/O5MJ8mBdTl6dMeHZ5fEuIqi
         LVdnF4pIDzcRyW79jmCylaiCCngZZjbla52IUcHv48tapU6ougBjUtSPBXguTf71dAXo
         oNg4Fjpg1j6yDujOAZawzitwkTZ3xTIVBQPAjfSW358mXJ9s8sqqOWZAoQew5PPp54cj
         cwa5xJuM+TFUzS7+PGKZIOASw2d2VLkBOctKARA6CfcLeg3YzR1GT0TgvPcMsdS8BVn8
         zuCsdEIu781tW4JIZIQ5UK2MfKUq9jpkJgj7KpZffhyvjQi4mq0qIi+R+xRS7JD25bJ3
         lLMA==
X-Gm-Message-State: AOJu0Yym8vwDmYeJkR0oVcP3zjcD59knx+/3rlsHmjW8carBmveB34DN
	Uwoxwzafdx09JKszEKsJMpVWIcDFVwn+t+4MS1U3C8Od/sARGA==
X-Google-Smtp-Source: AGHT+IGyX4LqLu1mgK0fhT756Q2zdBVzUcmD/1SnMEKNL1cupzM8l29+zjF72uu+rY/wl0bQ4szfaA==
X-Received: by 2002:a17:902:ec92:b0:1d4:94f6:56e0 with SMTP id x18-20020a170902ec9200b001d494f656e0mr1794637plg.41.1703864744793;
        Fri, 29 Dec 2023 07:45:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 22/41] cmake: upgrade 3.27.5 -> 3.27.7
Date: Fri, 29 Dec 2023 05:44:36 -1000
Message-Id: <3f3f3118dd6976259e8d971ebf76f2eeaf96f930.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193039

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes made since CMake 3.27.6:

Brad King (6):
  Android: Require Clang 18 for -std=c++23
  Tests: Clarify RunCMake.CTestTimeout case name
  ctest: Restore support for --timeout values higher than default test timeout
  Help: Document CMP0124 behavior on already-set variables
  FindPostgreSQL: Add support for version 16
  CMake 3.27.7

Orkun Tokdemir (1):
  Linting: Fix empty evaluated genex

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0faec0c8606b31216702252d0db7aa88388df231)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ef4eec5ab1..ecb0e487df 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
+SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.5.bb b/meta/recipes-devtools/cmake/cmake_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.7.bb
-- 
2.34.1


