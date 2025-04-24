Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71384C369DC
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.9731.1745479253464210305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FmHxlanU;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30820167b47so704803a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479253; x=1746084053; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqwBSYcvmYVkMdJCxS5D2DuYoZCGFF5kgNulMAfmobw=;
        b=FmHxlanUMPr/jasjyiIbDiwXgroF13Iyu5yHm9p30kiv0PpErrlGLvNr2tB/z5mhnO
         FZUKACawRIj+8lryFvRLzrc/tJw2XQJavAiobcN7qu8tdFa8wGQBga82VScPPqHl1mAY
         qb8/0pkFnntjX5YAJZ4IICHmXN2bDj+29ivy9F4ANYqR2PuDuVChOZy7iSB+sJMKP+J6
         1wo3+GcUxUVsVKtGiojBaoVMfT/8JX9yxIq/UHjSaV4EJQ56HmetVf73jTLA4tdCdOBc
         A3RVLmVq3u149517P3PVq3KBxZmv8Ssj/ItCkNloVQjAQ6ymlspQZXttftFoSmWnz7rB
         +gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479253; x=1746084053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqwBSYcvmYVkMdJCxS5D2DuYoZCGFF5kgNulMAfmobw=;
        b=mGEFh7/kTcOemORGp0QggowXY2EpUGwjWwIGRAujh1xcWSHuLlHFPM5tBV3xyVOKt/
         WsJ2k5Mo/6XEnxpRzMzahXgDGOu3V4tqjErGNDGazWFVAwdcxVbUwZTkDGLIs3u8eQNc
         +euqz2CNuJna0Ng2XotL6yiy7+pawa9pBXr1kymTv2hzXhHe9u/1PCqIPEiyThTWZRgL
         Dns13uhmzNs69jP4/3NK5lylc8Jm80O3/jnYw6RDdom06Uu4zXR7nDZOruO30sTwHubr
         VDjyWr9KmuuetNh45pE2bNOATCB1GvnmRDWSin1LwEz+UVOpyb68KvIrwc2FjjL7MYWH
         t0LQ==
X-Gm-Message-State: AOJu0YwF501uKcyJAL9RND++R5YZIjiUULWPlWu7H9nhPd7xGcME8YXs
	pYni3ZgM9wkbQ/t0FWy9xxzZQLbMWCpd+4DbEaFLKjya7Ka7Oy9a
X-Gm-Gg: ASbGnctXJxo0SHLCGNx+9JHWqT4MYflICV/b8+lFQ+6WkjEqvipceNL1foclV4gBFZE
	HW0utLMI9nXAXOe59njI7DBML7oJ8shhE395EAAcsVssb3ZBFfc4vsYz4mH9oreuy3X4I8e1Wp3
	zaYH10KeqwLJR/GUp8Rtdj5ZbYTzL6Rt0T0abAcfQgfRGZocM02e9ffWbtR+MiPq68u0yO7kiGN
	wgN7Cb7S4QtKPRBIJAmd6rq/RRgC5NRwRjaZyIvtUduu3rd1LlYyng5eIRi6e7zPAP8K4ji0hor
	i+EGug7gayfXOtZfUz5nrj+cAB0RDPWl
X-Google-Smtp-Source: AGHT+IEFZmRLgr13cDMv8eRtV421nuM3SbTfkICQpl+zR9++bRisJ2pqJTF0Ok9pd/tg6nDiKKeTtQ==
X-Received: by 2002:a17:90b:5205:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-309ee36ebc2mr1877927a91.3.1745479252677;
        Thu, 24 Apr 2025 00:20:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:35 -0700
Subject: [PATCH 01/11] cmake-native.bbclass: Abstraction to use cmake with
 native toolchains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-1-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215328

This would enable using OE built native toolchain e.g. clang-native
to build cmake based packages. e.g. libcxx and other llvm runtime
plus it can be used for build native packages which require clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/cmake-native.bbclass | 56 ++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/meta/classes-recipe/cmake-native.bbclass b/meta/classes-recipe/cmake-native.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..116cdd1a99923bc1ac41b9a2e0dd665daace40a3
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

-- 
2.49.0


