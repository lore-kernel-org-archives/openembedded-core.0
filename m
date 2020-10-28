Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.3869.1603919194339269013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ruWEeccm;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id dk16so284756ejb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lWXz4thfMBd1MGDmMUOEVTPxn+3Heamr2L1qEIPigu4=;
        b=ruWEeccmuyuL7yUs49YGgEMGqTvGUj+Ql6jLT4EjSaTV2ISccGIEQy8B54z+kelYbR
         uASR3MdjiLqGUrmXylUcyqllxCykIFcfyoPetsGOIUSVgV7xd9EhZicjVqZBfsR/0sYS
         eTDUXG2/r/sMaT8TOwrw8xGD0IoyJxJVW+IR0fCxCYqlnknetGzcVHx1mY1LSJmJklna
         SphKl4J5DJQbdjPHNCughT7GPzzrUFXZrMPNl///ebZs6ydIewh69Xc5tTN8qNZkO3+J
         XQ8eAM7LtGLsL1CnXv3fDflmYT08uiHj6pV0UCO3fvQXqIs0IUWJDx3s2UWJXBcJAhSs
         7zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lWXz4thfMBd1MGDmMUOEVTPxn+3Heamr2L1qEIPigu4=;
        b=XbVRmN9jgi0140cZGbGshLQ2OQ4S3xtYxGh3yrtI70eOzWtlTKb+5ML+9GIRifK2dH
         uWxl+J27Cm9L+SZZ2fyzp/OUHcTy8X6a0eRix1Lxo5UGM/70T0cK8hWC8trRqlSh8rVQ
         OpBeEg1S0rsmcpz7lMO2Tkf+zBvdCuWczVB0AIxRTqFgsa3OgB14jOJ9syLFm2K34FUm
         1M7AZOBDpsYcFntB09Nl8lTD1odyLgFwuqaaXOIM+QP6kPfyDKC5a+0peZzxWF68kYPH
         wrIpMEbqfNp+DofDzm+R+EvLGg19hWMTyzmwL9es0nUX3SIpvFOhfytO+m27QGPXaKug
         pnZQ==
X-Gm-Message-State: AOAM533R5JiUqtPb7QgTeSQyr2sNQxkbTyzVMg8lCaSEmtmllYhN6gli
	mxFLVvy4EoSFFjT0k4h6oGzq/6eaDSgC2w==
X-Google-Smtp-Source: ABdhPJyXhfNN1Cn1vMWhXm0JpmKrlpsgvaGaMzcATUO2bq3XoAsjq/AZA3oe+sBuID43VFuEAIt3hA==
X-Received: by 2002:a17:906:280a:: with SMTP id r10mr967093ejc.45.1603919192633;
        Wed, 28 Oct 2020 14:06:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/33] apt: remove host contamination with gtest
Date: Wed, 28 Oct 2020 22:05:55 +0100
Message-Id: <20201028210558.21070-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-configure-packages-on-installation.patch |  2 +-
 ...-init-tables-from-dpkg-configuration.patch |  2 +-
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  2 +-
 ...ibapt-do-not-use-gtest-from-the-host.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_1.8.2.1.bb      |  1 +
 5 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
index 2322bd8e78..81b328a2ee 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
@@ -1,4 +1,4 @@
-From 1ad21140787a6b8b0f774f75b50444d2c30a56f6 Mon Sep 17 00:00:00 2001
+From 96d23fc57d1ff9c851d563d6d6a6c4752dc4f1b6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:28:12 +0000
 Subject: [PATCH] Do not configure packages on installation
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index d3d3ab026d..1417153e81 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b18d7aa7d71b53b86bac21cd1d8c3accabb28f2b Mon Sep 17 00:00:00 2001
+From bf45c314867e5fb12141803fba06f3e45679d628 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 8c4cc04503..37f969690c 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 742fbb243f99e940c3e6b31296f7f416f550a57a Mon Sep 17 00:00:00 2001
+From 34700bebc52659e7e3eecd252f65bd36e669eee8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
diff --git a/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch b/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
new file mode 100644
index 0000000000..503b5a5c0b
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
@@ -0,0 +1,40 @@
+From 28e389a0d1275e7693df84a7d4a58b28364be1a9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 22 Oct 2020 17:33:38 +0200
+Subject: [PATCH] test/libapt: do not use gtest from the host
+
+This really does not work when cross-compiling.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ test/libapt/CMakeLists.txt | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/test/libapt/CMakeLists.txt b/test/libapt/CMakeLists.txt
+index 035ff07..280b83c 100644
+--- a/test/libapt/CMakeLists.txt
++++ b/test/libapt/CMakeLists.txt
+@@ -6,22 +6,6 @@ find_path(GTEST_ROOT src/gtest.cc
+ find_package(GTest)
+ set(GTEST_DEPENDENCIES)
+ 
+-if(NOT GTEST_FOUND AND EXISTS ${GTEST_ROOT})
+-   include(ExternalProject)
+-   ExternalProject_Add(gtest PREFIX ./gtest
+-                             SOURCE_DIR ${GTEST_ROOT}
+-                             INSTALL_COMMAND true)
+-
+-   link_directories(${CMAKE_CURRENT_BINARY_DIR}/gtest/src/gtest-build)
+-
+-   set(GTEST_LIBRARIES "-lgtest")
+-   set(GTEST_DEPENDENCIES "gtest")
+-   set(GTEST_FOUND TRUE)
+-   find_path(GTEST_INCLUDE_DIRS NAMES gtest/gtest.h PATHS ${GTEST_ROOT}/include)
+-
+-   message(STATUS "Found GTest at ${GTEST_ROOT}, headers at ${GTEST_INCLUDE_DIRS}")
+-endif()
+-
+ if(GTEST_FOUND)
+    # gtest produces some warnings with the set of warnings we activate,
+    # so disable the offending warnings while compiling tests for now
diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
index bd1f4f39c3..de0e150a2e 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.1.bb
+++ b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
+           file://0001-test-libapt-do-not-use-gtest-from-the-host.patch \
            "
      
 SRC_URI_append_class-native = " \
-- 
2.29.0

