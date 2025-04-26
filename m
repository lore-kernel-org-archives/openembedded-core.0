Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5CEC369D8
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:27 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2763.1745634924427022781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwDlbA23;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fd89d036so37926285ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634923; x=1746239723; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkJa7Vnhd4vgLdF3fQzisNIr43QdCMTbnrl040RwpkA=;
        b=hwDlbA23UsEUEk7VOoX82xjDIL391/CBaBPhEQ04KcxM66D++CqkBx5sBKc57Wlzwk
         SLDatqKNSZwEuU4jTUjuFpKidnmaQcGoWtagNnVhxJUVtjYBgXiR4Rm6hD8lLNElMJVu
         DOhVQv5zybdOilMaujdxvnd977q6HsaO04kTAunKteWy0ujttjbPSFpr9CgqDvvuGI3r
         FyO1ZLd1fpvspdn0LvZ2cIz9SXHwwra+7aCzdUOqxPwuJ8YvE5eQ6WgVa0ylSlo5nLyT
         FDTY77T8D2zEE8mnYh8ZsLQAP0reIJs6SB4bymliPyxXsnlHqLO1SW5OJ/vvu6roIrAc
         AROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634923; x=1746239723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkJa7Vnhd4vgLdF3fQzisNIr43QdCMTbnrl040RwpkA=;
        b=jXdVyXJOhtHAASTdKWTc1nhGknOKQ/R1xlHjuriKU3AcP2QPD/GdWBzgnDyddJUkAl
         g7+R1uhg/lcnGqQfi1S0Cfwr5XN00SlQ8wDsoeEK34gtAmNvJkY94+Kywk0X1RhiTwJt
         Y6Mv0i1LRiZxA40+gqaITOBWfBhhHQEpMNIZ+mE6fmta3OqpU0Y31U+XmBC9eSfJkDYI
         GsWZEwJkT6VMYbTc35KQLhuu7QpQHzbH/hGwtUhcJJtM7nzcbLrDVaqWX7fH0xUIyX4u
         ba5KbzHLHOqMabRKrnvh2WaVioFXiyQF64LoVwHgrXkHyt5qG9hA2epQ8kSllBWopvQf
         7fjA==
X-Gm-Message-State: AOJu0YxjwImMUiwr4f2K+jbKakEKwyJjsXG5mb7hn9NaPfabVmTkwQ9+
	qYtLaQegs+3iJ1MGZnfNGwvWC+9VWyF+Qe0HawwHkkroEJaC57X3qeYu2upn
X-Gm-Gg: ASbGncsEOW2DfVAm4rTiQXxhWdENMQe8wb4ZhMetOMjGC5J3pMKZtEz6yrYbmDxmsU0
	TKB4HnM6ULTRLSD6AObc6liwfy4YJ6O0ZYCNdyXs9nJ7BR4NjjivzPX/br4wuFF3U1iqfmIIM2f
	dPqh0dcMrVnvMAZigYYINhr9OJVrDbpQqj115A3cvbsx5/GMEsTh7kBao+l/zYrvrBcgnvZU25E
	GKzDn+hXBBFhP4PT6fWmhUk18vQDSbRESqJM0mShBZI23J6MaAbKGTBjMJmuNSHgt/NSzbukLBF
	mGPCQKda7vV7n0xbgAt8UaZLF2ge7daT
X-Google-Smtp-Source: AGHT+IHAUsZVKoKrz4oTZhqctgTUQ5CjYn3iIWAfuV7YPX1Oe3UQ+H3F9NhxaFjYkF04VatwQXP/hw==
X-Received: by 2002:a17:903:24b:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-22dc6a8292dmr24721155ad.50.1745634923530;
        Fri, 25 Apr 2025 19:35:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:03 -0700
Subject: [PATCH v3 01/10] cmake.bbclass: Enhance to emit a native toolchain
 cmake file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-1-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215500

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


