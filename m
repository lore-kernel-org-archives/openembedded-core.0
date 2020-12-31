Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.2584.1609458573236482066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Dec 2020 15:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PY+7daYP;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id c132so2459230pga.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Dec 2020 15:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VhPUL4oGi9SYpDM29DrfMfPgMX5CQy6SkeVNcJlcSU=;
        b=PY+7daYPTAPZk+pvDk1oCIBcmRsE5r3G4Fj3XkbK7ZKbiHYWzr4sWKhwaaO13Hkmg1
         INSu1nyvpbOQYpgSrrrQhlIqJhUPMNiFqG1nzP4rD0Z0gB4PX6bvsM3DQmNsutYdM+M8
         jUNcFU8VQ3KjTC/mENbVJ7oEN/gihrV91HWsQhoe4cfCzIFN0Rc/RJUIfoOvswDEl7pr
         ZmDwjJFVS0JlkSV1m8+YaL8yG4ZIxMQWBW8SqOlNtv8GCGEzyCcpDrIt1Jpv48rjDLpD
         dEXkCIDSm/OH+twbTKR3vU3FGEEe39yHIFG1zAJQvWsMbFhBEjG8iiNosSAWBudWHb/X
         oErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VhPUL4oGi9SYpDM29DrfMfPgMX5CQy6SkeVNcJlcSU=;
        b=ifMZLGFC1WTI5KPRGM06ofcYx0xfaLVAWd3+MSqsUtqqCNDVqvbVgxPo0M3sqpVsqo
         q+SUxO4nXM4crZ1nnbFGprJJlNTwwC4ZL5ewXG5jhspJeF6gu2zR1NZRBxqFSQLVjWuU
         SG+NEfARqt7s4TcK2NqEGHAkDS7xjr5AFPuPMg5/5zFK89El6G9tqz99y/wAZmo81kCN
         6KzJ79p5vZCGfFbh5BQSFwLfqWxnX7HSvbjph2mvnkzi19G+BxaRpzxG2QL/BM87A3bv
         E6sjt9bH9+/8q0FU2nimeQ41ggX1RqEPZLiBsZzgD/rsrwx221/bb+pA8Jc52PJp4dM1
         X39A==
X-Gm-Message-State: AOAM5307xRgpHhXWHCCSvJLDZcjTZ+qjPrXuzcov0qsUbaVsPPR1ZNXH
	ydMdVQUp3unxXdQ23b2qogpFGlcdleFnPQ==
X-Google-Smtp-Source: ABdhPJz3plU1/vxVchQZEWeEgiljlJqfA+KCKjTAwvxgncEbqO6OojsI3Lrc+kX0VMGYt9balqCS2A==
X-Received: by 2002:a65:6405:: with SMTP id a5mr57875751pgv.389.1609458572315;
        Thu, 31 Dec 2020 15:49:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::cd68])
        by smtp.gmail.com with ESMTPSA id s7sm45726192pfh.207.2020.12.31.15.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 15:49:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ccache: Build fixes for clang and riscv32
Date: Thu, 31 Dec 2020 15:49:29 -0800
Message-Id: <20201231234929.4165627-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport patch to improve AVX detection helps build with clang
Add proposed patch to fix build with 32bit architectures using 64bit
time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Improve-SIMD-detection-735.patch     | 121 ++++++++++++++++++
 ...002-Always-use-64bit-to-print-time_t.patch |  33 +++++
 meta/recipes-devtools/ccache/ccache_4.1.bb    |   6 +-
 3 files changed, 158 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch
 create mode 100644 meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch

diff --git a/meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch b/meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch
new file mode 100644
index 0000000000..12d4ebc4bc
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch
@@ -0,0 +1,121 @@
+From 05d290165a3b61da09b715e6c8e62cebebab57cc Mon Sep 17 00:00:00 2001
+From: Erik Flodin <erik@ejohansson.se>
+Date: Mon, 7 Dec 2020 19:20:31 +0100
+Subject: [PATCH 1/2] Improve SIMD detection (#735)
+
+* Try to compile code to detect SSE/AVX support. Just checking if the compiler
+  supports the flag isn't enough as e.g. Clang on Apple's new ARM silicon seems
+  to accept the flag but then fails when building.
+* Try to detect and enable BLAKE3's Neon support.
+* Improve detection of AVX2 target attribute support and remove the explicit
+  compiler version check that hopefully shouldn't be needed.
+
+Fixes #734.
+Upstream-Status: Backport [https://github.com/ccache/ccache/commit/b438f50388dd00285083260f60450e6237b7d58f]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/GenerateConfigurationFile.cmake | 25 +++++++++---------
+ src/third_party/blake3/CMakeLists.txt | 38 ++++++++++++++++++++-------
+ 2 files changed, 42 insertions(+), 21 deletions(-)
+
+diff --git a/cmake/GenerateConfigurationFile.cmake b/cmake/GenerateConfigurationFile.cmake
+index a21861f4..836ff9bb 100644
+--- a/cmake/GenerateConfigurationFile.cmake
++++ b/cmake/GenerateConfigurationFile.cmake
+@@ -67,18 +67,19 @@ check_struct_has_member("struct stat" st_mtim sys/stat.h
+ check_struct_has_member("struct statfs" f_fstypename sys/mount.h
+                         HAVE_STRUCT_STATFS_F_FSTYPENAME)
+ 
+-include(CheckCXXCompilerFlag)
+-
+-# Old GCC versions don't have the required header support.
+-# Old Apple Clang versions seem to support -mavx2 but not the target
+-# attribute that's used to enable AVX2 for a certain function.
+-if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.0)
+-   OR (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 8.0))
+-  message(STATUS "Detected unsupported compiler for HAVE_AVX2 - disabled")
+-  set(HAVE_AVX2 FALSE)
+-else()
+-  check_cxx_compiler_flag(-mavx2 HAVE_AVX2)
+-endif()
++include(CheckCXXSourceCompiles)
++check_cxx_source_compiles(
++  [=[
++    #include <immintrin.h>
++    void func() __attribute__((target("avx2")));
++    void func() { _mm256_abs_epi8(_mm256_set1_epi32(42)); }
++    int main()
++    {
++      func();
++      return 0;
++    }
++  ]=]
++  HAVE_AVX2)
+ 
+ list(APPEND CMAKE_REQUIRED_LIBRARIES ws2_32)
+ list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES ws2_32)
+diff --git a/src/third_party/blake3/CMakeLists.txt b/src/third_party/blake3/CMakeLists.txt
+index a75e5611..cc24253c 100644
+--- a/src/third_party/blake3/CMakeLists.txt
++++ b/src/third_party/blake3/CMakeLists.txt
+@@ -13,9 +13,9 @@ else()
+ endif()
+ 
+ include(CheckAsmCompilerFlag)
+-include(CheckCCompilerFlag)
++include(CheckCSourceCompiles)
+ 
+-function(add_source_if_enabled feature compile_flags)
++function(add_source_if_enabled feature compile_flags intrinsic)
+   string(TOUPPER "have_${blake_source_type}_${feature}" have_feature)
+ 
+   # AVX512 support fails to compile with old Apple Clang versions even though
+@@ -28,7 +28,14 @@ function(add_source_if_enabled feature compile_flags)
+   elseif(${blake_source_type} STREQUAL "asm")
+     check_asm_compiler_flag(${compile_flags} ${have_feature})
+   else()
+-    check_c_compiler_flag(${compile_flags} ${have_feature})
++    set(CMAKE_REQUIRED_FLAGS ${compile_flags})
++    check_c_source_compiles(
++      [=[
++        #include <immintrin.h>
++        int main() { ${intrinsic}; return 0; }
++      ]=]
++      ${have_feature})
++    unset(CMAKE_REQUIRED_FLAGS)
+   endif()
+ 
+   if(${have_feature})
+@@ -42,10 +49,23 @@ function(add_source_if_enabled feature compile_flags)
+   endif()
+ endfunction()
+ 
+-add_source_if_enabled(sse2 "-msse2")
+-add_source_if_enabled(sse41 "-msse4.1")
+-add_source_if_enabled(avx2 "-mavx2")
+-add_source_if_enabled(avx512 "-mavx512f -mavx512vl")
++# https://software.intel.com/sites/landingpage/IntrinsicsGuide/
++add_source_if_enabled(sse2 "-msse2" "_mm_set1_epi32(42)")
++add_source_if_enabled(sse41 "-msse4.1" "_mm_test_all_ones(_mm_set1_epi32(42))")
++add_source_if_enabled(avx2 "-mavx2" "_mm256_abs_epi8(_mm256_set1_epi32(42))")
++add_source_if_enabled(avx512 "-mavx512f -mavx512vl" "_mm256_abs_epi64(_mm256_set1_epi32(42))")
+ 
+-# TODO: how to detect ARM NEON support?
+-# If NEON, define BLAKE3_USE_NEON and build blake3_neon.c
++# Neon is always available on AArch64
++if(CMAKE_SIZEOF_VOID_P EQUAL 8)
++  # https://developer.arm.com/architectures/instruction-sets/simd-isas/neon/intrinsics
++  check_c_source_compiles(
++    [=[
++      #include <arm_neon.h>
++      int main() { vdupq_n_s32(42); return 0; }
++    ]=]
++    HAVE_NEON)
++  if(HAVE_NEON)
++    target_sources(blake3 PRIVATE blake3_neon.c)
++    target_compile_definitions(blake3 PRIVATE BLAKE3_USE_NEON)
++  endif()
++endif()
+-- 
+2.30.0
+
diff --git a/meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch b/meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch
new file mode 100644
index 0000000000..85ce2b762d
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch
@@ -0,0 +1,33 @@
+From fa360ca8a457dafcae1d22df2b342d3ee291e8af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2020 14:28:39 -0800
+Subject: [PATCH 2/2] Always use 64bit to print time_t
+
+some 32bit architectures e.g. RISCV32 use 64bit time_t from beginning
+which does not fit into long int size on LP32 systems
+
+Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/762]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Logging.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/Logging.cpp b/src/Logging.cpp
+index 9a5d99b7..1a6e6264 100644
+--- a/src/Logging.cpp
++++ b/src/Logging.cpp
+@@ -88,7 +88,10 @@ do_log(string_view message, bool bulk)
+     if (tm) {
+       strftime(timestamp, sizeof(timestamp), "%Y-%m-%dT%H:%M:%S", &*tm);
+     } else {
+-      snprintf(timestamp, sizeof(timestamp), "%lu", tv.tv_sec);
++      snprintf(timestamp,
++               sizeof(timestamp),
++               "%llu",
++               (long long unsigned int)tv.tv_sec);
+     }
+     snprintf(prefix,
+              sizeof(prefix),
+-- 
+2.30.0
+
diff --git a/meta/recipes-devtools/ccache/ccache_4.1.bb b/meta/recipes-devtools/ccache/ccache_4.1.bb
index 5f7d93b485..96254a3875 100644
--- a/meta/recipes-devtools/ccache/ccache_4.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.1.bb
@@ -11,7 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=a66c581f855c1c408730fe5d171e3013"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
+           file://0001-Improve-SIMD-detection-735.patch \
+           file://0002-Always-use-64bit-to-print-time_t.patch \
+           "
 SRC_URI[sha256sum] = "cdeefb827b3eef3b42b5454858123881a4a90abbd46cc72cf8c20b3bd039deb7"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
@@ -21,4 +24,3 @@ inherit cmake
 PATCHTOOL = "patch"
 
 BBCLASSEXTEND = "native"
-
-- 
2.30.0

