Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A511AD5B853
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 00:30:27 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.8378.1730161821661229520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 17:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=x/jXr7b8;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbcc2bd7fcso31313136d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 17:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730161820; x=1730766620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMzwXhnM0AnHEixJO8/gnPBBitEHybkVT/8N749nJEI=;
        b=x/jXr7b8oANz/rQhNPcAy9MqcubNYcy21wR8W8FQWhGKiFSEutk4tpy2VixIcyID5y
         KCXnpskQyYTyTQFsiSDn1z113WMsAgZcIngY9WeFaB69hhW79fCNKaoIuKKbZYxw97FD
         gjA5VWbfDF1+ZfzbbUW9pUn/5QT4egq6FzHz0IUbnjz1W35zAVMdubvBLV1aOk389NUQ
         UTQ8kl/x+TKO9RjtWpxSPn4OI8WDWW8iRXcob07Cl45UwjE3DY23LRGQS8HdYY/3sxOP
         raxSmWN2/e1yAWlMg+eCsnDKLku66++uGJpMJBjEhnKIa8PIprO/hjm9o6C6CIbJN6we
         6hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730161820; x=1730766620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMzwXhnM0AnHEixJO8/gnPBBitEHybkVT/8N749nJEI=;
        b=Z7hP2QnhqiviyuzGiDadTlmLh9/N2Kwc2kOcWwLc0azQQMvADEjJ+o1x4M3Q3P0OIm
         WyZrFqzwu7aXUJBC9Dm7BXjerur3LUgpCj2/gCzcHPo1jVjrVrIOWljD5d71TIKSohVc
         f4L5cKKSdbumaWc+3VVBL70khPzWuS8d8v5rGqaEL6IjkdBXrPOSxASICBD1+y7Y/+Op
         +pT/6yzKqa3gi/aqFXdMxbK2zgtuBdsI5acZgoLdBexwiUmqEkf8ONPLOOogvl8jNxoj
         pcbYmvY5GB89mH2OV2iHRVbFg2BwLsPIpjMbg7DMJvkEkFJye7/s5yl253V18kamuwvB
         g4qw==
X-Gm-Message-State: AOJu0YwipoeF98/9MSFecFt1HB1OtBSIzQ5dvPAT2TZVI7ndGlUoPWLv
	1wcLbTiI7XW0WmenBZrh052AEX493xRXkI19hEspEBfq0Lvs77S7DmkxT8wfzmFBlGcbjP1AZ8Y
	m
X-Google-Smtp-Source: AGHT+IF40yn1GPY1ByYyombklMbq+DOs2IGDHGt6eeRmSw505xKvwemfq7y1QwQTZn0hj1jeXj5x8A==
X-Received: by 2002:a05:6214:3b87:b0:6cb:cedb:a389 with SMTP id 6a1803df08f44-6d18567ff77mr137588796d6.14.1730161820286;
        Mon, 28 Oct 2024 17:30:20 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d17972f55bsm37361556d6.26.2024.10.28.17.30.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:30:19 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] cmake: upgrade 3.30.2 -> 3.30.5
Date: Mon, 28 Oct 2024 20:30:17 -0400
Message-Id: <20241029003018.3485308-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 00:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206468

Changelog (https://cmake.org/cmake/help/latest/release/3.30.html#updates):

3.30.5

-   The project(<PROJECT-NAME>) command now sets
    <PROJECT-NAME>_SOURCE_DIR, <PROJECT-NAME>_BINARY_DIR, and
    <PROJECT-NAME>_IS_TOP_LEVEL as non-cache variables only if they are
    already set as non-cache variables when project() is invoked. Cache
    entries by the same names are always set as before. This refines
    3.30.3's behavior change to restore behavior of nested directories
    that call project() with the same project name, and it addresses the
    bug in the implementation introduced in 3.30.4.

3.30.4

-   The project(<PROJECT-NAME>) command now sets
    <PROJECT-NAME>_SOURCE_DIR, <PROJECT-NAME>_BINARY_DIR, and
    <PROJECT-NAME>_IS_TOP_LEVEL as normal variables only if they are
    already set as cache or non-cache variables when project() is
    invoked. Cache entries by the same names are always set as before.
    This refines 3.30.3's behavior change to restore behavior of nested
    directories that call project() with the same project name, but the
    implementation in this release is flawed (this release note has been
    retoractively updated). It can result in different behavior between
    the first and subsequent runs. Do not use CMake 3.30.4 if your
    project contains nested calls to project() with the same project
    name and you use these variables.

3.30.3

-   The project(<PROJECT-NAME>) command now sets
    <PROJECT-NAME>_SOURCE_DIR, <PROJECT-NAME>_BINARY_DIR, and
    <PROJECT-NAME>_IS_TOP_LEVEL as normal variables in addition to
    setting them as cache entries. This is needed to preserve support
    for some FetchContent use cases under policy CMP0169's NEW behavior.

-   The FindPython and FindPython3 modules now define, respectively, the
    Python_DEFINITIONS and Python3_DEFINITIONS variables on Windows to
    support development with the free threaded version of Python. The
    INTERFACE_COMPILE_DEFINITIONS target property is also defined for
    the various targets provided by these modules.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../cmake/{cmake-native_3.30.2.bb => cmake-native_3.30.5.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.30.2.bb => cmake_3.30.5.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.30.2.bb => cmake-native_3.30.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.30.2.bb => cmake_3.30.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.30.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.30.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.30.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.30.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b88a4e4bc6f..41f169e14c5 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2"
+SRC_URI[sha256sum] = "9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.2.bb b/meta/recipes-devtools/cmake/cmake_3.30.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.30.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.5.bb
-- 
2.39.5


