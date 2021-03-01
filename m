Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.1686.1614623414573019508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 10:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O7eGRTlj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id c10so3556212ejx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3Wmc6ImnzrhIDrkmmZ33UYgMEyCve8TmCHsLjunI8Y=;
        b=O7eGRTljIz56cHrfj6kwk8PWTYLl3Kfrl9s+glPdYz4vnOpWeS95MH5Ba8QOIHKPTt
         t5IODvwFxUlJ1MJ2zLLzUv7Fg46gNGsS2iTtqj93oGFLYuJkKM0B6ueCZvCgVXQjiPzD
         cssO8SZaZbfFh5XL5xyLYVUQRUgwDpSogj4ypJ2A2EC6zb9j+f68LJbuoDX5V1yCxeSd
         qkX5h4l0/1S8ERMnNT+rcfuLuKCK5Wdx4jacJqx/Z19uV47tRDPKz7ghTkFdw3ndxijH
         PRU0z7TW4i9FuquYrjE5GQEbUZuRcbo7+M11ctWHeoteCBkva8bby7nDEZMtkhatVwni
         7uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3Wmc6ImnzrhIDrkmmZ33UYgMEyCve8TmCHsLjunI8Y=;
        b=RdYqIn+WJHTi6EyutT85qnhimRlA2tRAuHhqwFAZwJflYaUZjP/lJ3QBnT71WCi3U7
         ve5SYfx5wF1U/I9ws+EaedsafoY5oexUJaSKhHsT8bK/0xzcvYBaNvsuVm0sOTqhsqeB
         vbnxiU5ia7Kko/Y/dMpJZAcD4Lt1svu/YGmBhW3nxJoPxQI6mKRSzKNFPZ1x1ZXUEg8P
         ZBOaOyrPgDG7kbtWJUeVcYzMgnjO2Ti3qrvqC5r2LyqfH7PXILgvxen8md76/uO3RYRH
         JfaYuR2O+4uHBqQgCcEfRzN3c4EEeEaWnMIrLIzVowOoywixmGoNvJtJwTSJWhglmOVS
         toHw==
X-Gm-Message-State: AOAM53203fxvsYf8rh1V7wSlyL3aKaA5HejHf9IP52E2KetleLXN1nNN
	hSLteIP7rUshW61PoNmumKlIQyIAwpgvJw==
X-Google-Smtp-Source: ABdhPJwme4NcFBtSjXjKKg75wcL2k2C/8UYtqeYyi4cYgeYa0KC6zC3PIdbao5ixhZEtHczBu2pgzA==
X-Received: by 2002:a17:907:e91:: with SMTP id ho17mr17289094ejc.93.1614623412876;
        Mon, 01 Mar 2021 10:30:12 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id dz7sm16422202edb.74.2021.03.01.10.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 10:30:12 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] libical: drop the ad hoc native generator build
Date: Mon,  1 Mar 2021 19:30:04 +0100
Message-Id: <20210301183004.543074-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a bit of help from upstream I figured out how to do
cross-builds the way upstream intends to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-our-hand-build-native-src-generator.patch | 32 -------------------
 meta/recipes-support/libical/libical_3.0.9.bb | 12 +++----
 2 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch

diff --git a/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch b/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
deleted file mode 100644
index 0813641ee9..0000000000
--- a/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 378df7d6ef9207d3e11a3de54ffd05c04c6c0e0b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 24 Feb 2021 20:28:22 +0000
-Subject: [PATCH] Use our hand-build native src-generator
-
-Upstream-Status: Inappropriate [reported at https://github.com/libical/libical/issues/481]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/libical-glib/CMakeLists.txt | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLists.txt
-index 13f77aa..c337c9e 100644
---- a/src/libical-glib/CMakeLists.txt
-+++ b/src/libical-glib/CMakeLists.txt
-@@ -74,12 +74,7 @@ endforeach()
- 
- if(CMAKE_CROSSCOMPILING)
-   # import native ical-glib-src-generator when cross-compiling
--  set(IMPORT_ICAL_GLIB_SRC_GENERATOR "ICAL_GLIB_SRC_GENERATOR-NOTFOUND"
--    CACHE FILEPATH
--    "Path to exported ical-glib-src-generator target from native build"
--  )
--  include(${IMPORT_ICAL_GLIB_SRC_GENERATOR})
--  set(ical-glib-src-generator_EXE native-ical-glib-src-generator)
-+  set(ical-glib-src-generator_EXE ${CMAKE_BINARY_DIR}/src-generator)
- else()
-   set(ical-glib-src-generator_EXE ical-glib-src-generator)
- endif()
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libical/libical_3.0.9.bb b/meta/recipes-support/libical/libical_3.0.9.bb
index 6f8b491190..de4395d7a0 100644
--- a/meta/recipes-support/libical/libical_3.0.9.bb
+++ b/meta/recipes-support/libical/libical_3.0.9.bb
@@ -9,19 +9,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
 SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
-           file://0001-Use-our-hand-build-native-src-generator.patch \
 "
 SRC_URI[sha256sum] = "bd26d98b7fcb2eb0cd5461747bbb02024ebe38e293ca53a7dfdcb2505265a728"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
 
-do_compile_prepend() {
-	# As long as https://github.com/libical/libical/issues/481 is open build native src-generator manually
-	NATIVE_CFLAGS="${BUILD_CFLAGS} `pkg-config-native --cflags glib-2.0` `pkg-config-native --cflags libxml-2.0`"
-	NATIVE_LDFLAGS="${BUILD_LDFLAGS} `pkg-config-native --libs glib-2.0` `pkg-config-native --libs libxml-2.0`"
-	${BUILD_CC} $NATIVE_CFLAGS ${S}/src/libical-glib/tools/generator.c ${S}/src/libical-glib/tools/xml-parser.c -o ${B}/src-generator $NATIVE_LDFLAGS
-}
+DEPENDS_append_class-target = "libical-native"
 
 PACKAGECONFIG ??= "icu glib"
 PACKAGECONFIG[bdb] = ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=True,db"
@@ -34,6 +28,8 @@ EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
 # doc build fails with linker error (??) for libical-glib so disable it
 EXTRA_OECMAKE += "-DICAL_BUILD_DOCS=false"
 
+EXTRA_OECMAKE_append_class-target = " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
+
 do_install_append () {
     # Remove build host references
     sed -i \
@@ -42,3 +38,5 @@ do_install_append () {
        ${D}${libdir}/cmake/LibIcal/LibIcal*.cmake \
        ${D}${libdir}/cmake/LibIcal/Ical*.cmake
 }
+
+BBCLASSEXTEND = "native"
-- 
2.29.2

