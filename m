Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17441C369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.60790.1745875581561392562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNPLOYgg;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33e4fdb8so57054325ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875581; x=1746480381; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkJa7Vnhd4vgLdF3fQzisNIr43QdCMTbnrl040RwpkA=;
        b=NNPLOYggbJj3nYXxYWTcurxZWpkeMlPhwrc4xgWeNibhVaiUUspZL84B3T5iHLYHOD
         ipZ2Fkr16FJDfBdLxCg0f4uzCAEBi5A6FYGxOyJuo8C33g1KZcIkzIGT+CVSBf4Li6vj
         c0IBRbSIip71fyQ55OWFSxs8NCYLQxfX6wex845XVnqd/tSEfNCEQuUcuUuTpN8wWZ8c
         O6ELWgk3+5E4qn0srDTbH6aMUdnzqFXkIathmZAhvGJ9T28JiQ2l9lOt1mKT3hu+GKla
         abttReYePMPRQsQwE3WUoK6FjGiRxMNfE5yQyxUMQVz5/SOU+BGy9FJ1TzcGk7dtwAMN
         DKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875581; x=1746480381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkJa7Vnhd4vgLdF3fQzisNIr43QdCMTbnrl040RwpkA=;
        b=riHUqjqQZZjxokoEUI0Mrds2qxIxZm7jLzkIuvhKTtKUE/P8eBIn2/XvRtb30tgX2f
         ygLuY6cZVs9Lzyql9QpT0OEq+zvlxy8j/M2d41Fqc0zbCTJUWQQ8LpP3K2Vzkg5A5lQw
         dv6VPzlJltI+UVdDUzBYxVdidHo8xDfqoN9jmItGFeyUXeR+UN07urCFyCylSXOpdVCg
         wGFGUylCDuh+AJ04a8vm6oNtGz9uP1VCcAIAH2yVvSWLKB0YFmJ+kqbrsbiXFk9OQ9kf
         dItXvld0SHgz4VVMZdO1Vk7zb8+p5EhlpS+f3HfB3vgnxI0VKJCpjY62MmJctX3yiesh
         Cv6Q==
X-Gm-Message-State: AOJu0YzbtuFfwM3AL5cJvTsNe0uiKi3QS7h/GFoleRSTlq5FY4IlWGKx
	RlUORnoKCfbqDyPCkuLY/bdn8ohQDYNVdQVT93BdsCuWMGTO9f6SQfZU+49i
X-Gm-Gg: ASbGnct4ihh23Wnejojk4JsqAEA+FpM1MT0crbbqcpLGdmw8qBzIinRV/FDlVC4Njq1
	WINUZp02k0jKh/dWg5Uuk+Iz6fCyHScBGiHQsveP0I7qJa/cWj3D1bHEO408enyLijGPZ33+b7a
	MTtpF32Vemsdw1O71kZF0pf3ltGQHHFPgCFOTUIE4bhNeeOGatfMfTJooWltH3ZOdk/jCOGZ1Hf
	DJe3d7d4XKmCVMSj0suO2z6GKY7TTvfr2qMrIh1p72Q65BgykE0HF4uRgbg/rPc4F5c+mKLXbqA
	TEnBiESeN6lJEUpU6J/Se+bNuWqdFVwsjexTYlblTPs=
X-Google-Smtp-Source: AGHT+IEw9OHCNJYhdSikpmf+JBxFLU6uX8TRV+csSjjOduN6/+M7vIehPfyLHsOJXbHhLLYTriCsvA==
X-Received: by 2002:a17:903:19cb:b0:21f:8453:7484 with SMTP id d9443c01a7336-22de5fe31demr15110845ad.30.1745875580915;
        Mon, 28 Apr 2025 14:26:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:16 -0700
Subject: [PATCH v5 01/10] cmake.bbclass: Enhance to emit a native toolchain
 cmake file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-1-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215635

Some components e.g. clang and its runtime needs the native toolchain
defines especially when doing nativesdk builds it uses
CROSS_TOOLCHAIN_FLAGS_NATIVE to pass native toolchain file, which is
then used to build native llvm tools needed during nativesdk builds

Moreover this would enable using OE built native toolchain e.g.
clang-native to build cmake based packages. e.g. libcxx and other llvm
runtime plus it can be used for build native packages which require clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/cmake.bbclass | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index b342deb67182e29a6b793ccf185c701745b47111..449fe2bb4433ff756d3b4d2357928b853806d58d 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -50,11 +50,34 @@ OECMAKE_C_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('CC', d)[1]}"
 OECMAKE_CXX_COMPILER ?= "${@oecmake_map_compiler('CXX', d)[0]}"
 OECMAKE_CXX_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('CXX', d)[1]}"
 
+# Native C/C++ Compiler (without cpu arch/tune arguments)
+OECMAKE_NATIVE_C_COMPILER ?= "${@oecmake_map_compiler('BUILD_CC', d)[0]}"
+OECMAKE_NATIVE_C_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('BUILD_CC', d)[1]}"
+OECMAKE_NATIVE_CXX_COMPILER ?= "${@oecmake_map_compiler('BUILD_CXX', d)[0]}"
+OECMAKE_NATIVE_CXX_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('BUILD_CXX', d)[1]}"
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
 # clear compiler vars for allarch to avoid sig hash difference
 OECMAKE_C_COMPILER:allarch = ""
 OECMAKE_C_COMPILER_LAUNCHER:allarch = ""
 OECMAKE_CXX_COMPILER:allarch = ""
 OECMAKE_CXX_COMPILER_LAUNCHER:allarch = ""
+OECMAKE_NATIVE_C_COMPILER:allarch = ""
+OECMAKE_NATIVE_C_COMPILER_LAUNCHER:allarch = ""
+OECMAKE_NATIVE_CXX_COMPILER:allarch = ""
+OECMAKE_NATIVE_CXX_COMPILER_LAUNCHER:allarch = ""
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
@@ -155,6 +178,41 @@ set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
 list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
 
+EOF
+        cat > ${WORKDIR}/toolchain-native.cmake <<EOF
+set( CMAKE_SYSTEM_NAME ${@map_host_os_to_system_name(d.getVar('BUILD_OS'))} )
+set( CMAKE_SYSTEM_PROCESSOR ${@map_host_arch_to_uname_arch(d.getVar('BUILD_ARCH'))} )
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
 EOF
 }
 

-- 
2.49.0


