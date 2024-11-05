Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2674BD33A31
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.27953.1730832349163397940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vh4DaioM;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so4051125a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832348; x=1731437148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBRyofExjoiHH+fTGXgBxI3bCDkyo7cVQSnyg0M8sTg=;
        b=Vh4DaioMgTxbQT+sNkYjkncCheUYmD6UT3gWJEyEYmeBfgMB+WwBjw2BLPdjciGOE0
         /zbaARAsTsLHNUQGhzRAhGnU4SK+2J3g8VWp0zXYd11eh7ZWHGS2cOr2Nx9fYTiP6WpS
         GO3cg4Y25KuhNqHF7gwH4As1f/7mOEShLwXrD5breENLfHIb+upFH+bkYtvOfGz1UbiP
         A6O6c139T56omBsYJQLq2eV3yiOUppujDuQpS56ZPWHWCWHSHS3Z/zo0ygfyRrXyluEo
         lZSxJKgxQ3QmEijwhU6Z2HAQQjDPlyo6nyiayab8Fmu6JDo5iSJygEo6A3xarmQGAGl0
         FZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832348; x=1731437148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBRyofExjoiHH+fTGXgBxI3bCDkyo7cVQSnyg0M8sTg=;
        b=omazZ8KKGLxGKHIDZEoo1m1LjEJo8kmZi3wDCmTE2k+pARO6sFkz81FaoQqj84Datj
         f9et+gEz2g2zkDTwSIJ+Z+RXmNDiG9cLZpQY62/3JHnEt0/nVKp7cK4e44MMMsYKPs+H
         VwJGoxxNhnpN5THHzo++bU+0ujmktD5aiToZ9IASxo3MAgfOfIbzGl7XU4NZ/rPQ6b9B
         lKVuX6zyI/EsDYL1hfrJ8hr7f5r+smy2kQUQuyWsiPiXMANZQGZC8knW3M7whzsKZtRc
         +RMv3cYJG46pSL/owjOIt5/CdIH9MVdU6vTAVLZt4/LvpNsgg4EXe9fX/xv6VUYbPOxq
         tLMQ==
X-Gm-Message-State: AOJu0YxKFXuAwl8yYcaLq/8p8Iv2YdINEVEu9q/bJaciygJMCUGEWwu0
	EzRWUmok4tw9cJYWgAIyyqTnSY/3/YAVVqyp0W+8nemMvMXNWRPOIzik9g==
X-Google-Smtp-Source: AGHT+IGUOCm81hniGMqirXsggC5zY4zH2RP+xfJjV624VAyzRXJCT0Qyx5HewBsbXJy+G0rXo7OdkA==
X-Received: by 2002:a17:90b:4a91:b0:2e2:c423:8e17 with SMTP id 98e67ed59e1d1-2e94c295063mr24069400a91.7.1730832348335;
        Tue, 05 Nov 2024 10:45:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 06/19] cmake-native.bbclass: Abstraction to use cmake with native toolchains
Date: Tue,  5 Nov 2024 10:45:25 -0800
Message-ID: <20241105184540.3450302-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206734

This would enable using OE built native toolchain e.g. clang-native
to build cmake based native packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/cmake-native.bbclass | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/classes-recipe/cmake-native.bbclass

diff --git a/meta/classes-recipe/cmake-native.bbclass b/meta/classes-recipe/cmake-native.bbclass
new file mode 100644
index 00000000000..116cdd1a999
--- /dev/null
+++ b/meta/classes-recipe/cmake-native.bbclass
@@ -0,0 +1,56 @@
+# Native C/C++ compiler (without cpu arch/tune arguments)
+OECMAKE_NATIVE_C_COMPILER ?= "`echo ${BUILD_CC} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_NATIVE_CXX_COMPILER ?= "`echo ${BUILD_CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_NATIVE_AR ?= "${BUILD_AR}"
+OECMAKE_NATIVE_RANLIB ?= "${BUILD_RANLIB}"
+OECMAKE_NATIVE_NM ?= "${BUILD_NM}"
+
+# Native compiler flags
+OECMAKE_NATIVE_C_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CFLAGS}"
+OECMAKE_NATIVE_CXX_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS}"
+OECMAKE_NATIVE_C_FLAGS_RELEASE ?= "-DNDEBUG"
+OECMAKE_NATIVE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
+OECMAKE_NATIVE_C_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CPPFLAGS} ${BUILD_LDFLAGS}"
+OECMAKE_NATIVE_CXX_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}"
+BUILD_CXXFLAGS += "${BUILD_CC_ARCH}"
+BUILD_CFLAGS += "${BUILD_CC_ARCH}"
+
+do_generate_native_toolchain_file() {
+        cat > ${WORKDIR}/toolchain-native.cmake <<EOF
+set( CMAKE_SYSTEM_NAME `echo ${BUILD_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
+set( CMAKE_SYSTEM_PROCESSOR ${BUILD_ARCH} )
+set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
+set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
+set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
+set( CMAKE_AR ${OECMAKE_NATIVE_AR} CACHE FILEPATH "Archiver" )
+set( CMAKE_RANLIB ${OECMAKE_NATIVE_RANLIB} CACHE FILEPATH "Archive Indexer" )
+set( CMAKE_NM ${OECMAKE_NATIVE_NM} CACHE FILEPATH "Symbol Lister" )
+set( CMAKE_C_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "CFLAGS" )
+set( CMAKE_CXX_FLAGS "${OECMAKE_NATIVE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
+set( CMAKE_ASM_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
+set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE STRING "Additional CFLAGS for release" )
+set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_NATIVE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for release" )
+set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
+set( CMAKE_C_LINK_FLAGS "${OECMAKE_NATIVE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_NATIVE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_NATIVE} )
+set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+
+# Use native cmake modules
+list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR_NATIVE}/cmake/Modules/")
+
+# add for non /usr/lib libdir, e.g. /usr/lib64
+set( CMAKE_LIBRARY_PATH ${STAGING_BASE_LIBDIR_NATIVE} ${STAGING_LIBDIR_NATIVE})
+
+# add include dir to implicit includes in case it differs from /usr/include
+list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATIVE})
+list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATIVE})
+
+EOF
+}
+
+addtask generate_native_toolchain_file after do_patch before do_configure

