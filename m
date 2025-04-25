Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311C4C369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1106.1745559811445794018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7A25POb;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c277331eso2914620b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559811; x=1746164611; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkJa7Vnhd4vgLdF3fQzisNIr43QdCMTbnrl040RwpkA=;
        b=Z7A25PObUJoR7n5Xiq9TEWcbBEv7aHTF8iSOwVxmsf8WVRVfDfqRl35gq2ldbz6tau
         1lZgjsbAZEYOb8ENsx1XvDBxK+J40n2CaQAHtqigExbihy6pZuciAJRx2n2Tos3Vt6P4
         2asT34a3+acIaQ7bZiPPfciDGJsRidIJ6d8KH4Ll5pIHf9pfY4DeZVoH8YGEbFWRn5dJ
         65XtIMwzFVEfx2qTQ3HWSId7xDS83m02XtvQ6Fv53Tgm9stYXQOXF5m5yVNA9xnntVnP
         9yo4m9+dGoMgU8XRIhn30IiQwm2LUSWeoWTgQgj+tE3tmI/3Hjqf+jW+gDrigsJHZDeh
         eu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559811; x=1746164611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkJa7Vnhd4vgLdF3fQzisNIr43QdCMTbnrl040RwpkA=;
        b=RPfZvtuv4UnmIP3XSWN5DbGnRSKjIGRJbEOteLImISwfDoKaOFeTdTr/mzHThDmihe
         iEuvlNVcoIvZuVZajGphuxuC/8yxaDbfO2cPRiB5zQcbGf/s4be7qiberkXDU14yr6IJ
         Zk35D7LGH0H+IeRFKRc6q3nGa2TWYg91JOQzSso3qk+TDSONUEyl/iNuczSb7UInK0d4
         hsNylUX3t2tr4NCS9GNoQjm5tcWW2WoTgeICHB6Tu6ufAhCiA5OhpscgH/ObdwxTjmnP
         eiG+5pTUg/NMWjlk0NTFrUUvZhIYQRKgQ320sgPrJ3HUl60/p2SRMgLw1L9nXwuxUBt+
         Ag/w==
X-Gm-Message-State: AOJu0YxKfrle3o55FJVXHKOlSeUzUY2xCQsuLWsR0+8/ssJtal91GhXR
	uCiVWs+hdZ50JnSlnwhv/OjrsaYIUWTzy/PFYvdwej7HbXRV9IhSWwtWSrUL
X-Gm-Gg: ASbGncv7oqZ+bC8+7mEN3Wy4zuvHVptCPemKIg4DwZnXDq2OBCJfkuJ8HO7/P4KoDce
	gO5ZsERCSC82csIcBIuEtUjFQUDUHorumSM1ajt/Y+aRrUksnQ2wUXiLcZXDw5ql5BvNRLO4zsj
	dnZXh8igsRDMT/Lg8VLzhO0bBrqURlNQcmgSgKvu+DDHPVj0drnbah2n28qjem/gqAwsX/iOtVM
	y6mqd4sMSRzuP8wHoIpgdnGS9vT08DCVTsKjp46KRYQsvM0gXwdDAAhXup/eBD5dTqGI0nb7e3D
	vYitDbKa45xxSVP71RsLSo3Y+zCfFAv4
X-Google-Smtp-Source: AGHT+IF8s1+PhbBhiapQcRUhVhKtV/PkIDH7w5uaM4N/faFTju24kUPbRUDNqMY7Fei+GSiqejzl2Q==
X-Received: by 2002:a05:6a20:d523:b0:1f3:237b:5997 with SMTP id adf61e73a8af0-2045b5ae115mr1510774637.14.1745559810695;
        Thu, 24 Apr 2025 22:43:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 22:43:22 -0700
Subject: [PATCH v2 1/7] cmake.bbclass: Enhance to emit a native toolchain
 cmake file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v2-1-0a51d0c1940d@gmail.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215416

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


