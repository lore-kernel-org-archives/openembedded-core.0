Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A93DC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 20:33:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.27639.1672432378815486214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 12:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gzhzkkYp;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 124so15104652pfy.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 12:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7PFV3jvxinZRxSuZkqtlOEB/M+PCtdf5RVfsrRgqA4=;
        b=gzhzkkYpms6qr13bupGpjmF1f/93JGzxYlucfVoKfYZ8IdYQC4SEaQb/u0dEKTM319
         4kosMhps0NjpMPFPbO/CihlYfhDyQWYuYQZ5MKuN2HYinUP5NYf4FfFhYDHvWEZzXZol
         W31qCjdf7Ezn8wn4O6fYJ7BHDBeJL/vpkfkQg+aXJufn29mocQZFNYUzEwrIoeShANoI
         Q8X+1UwzKVcTsiVLw9xI9EjgwD17/jNT4FolZloW83NDs6pcH1jtr9+QmRhd618rzvtt
         nqrilYNPcQ6mbJfFBdu1hMqvfZaKtydxwcl8eWlyQmXeR/0WeV/pb9Yw/a09ovRd3ISq
         z+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7PFV3jvxinZRxSuZkqtlOEB/M+PCtdf5RVfsrRgqA4=;
        b=vIA3dLNvi0VjTRGiReZlzucqTUdb5D9WcxmwLgOXcGBXu8b0qtQqK4lVKWwZD6sFU9
         rCP7QVJ+NqGC1lbJlnwNtT3qTty4C+ft/lhz4ItXQoHR0cHzxV4unC44X4cpTlFNj1fx
         qXD+u9XB1/yL72EKV8D1Ctl37Gd0vqrRYF9DhT7vv055YUFmih6aJWx/ypJmYChX2v77
         bo8OiHVk0RZESp2La2KYQCJM5m0Vrl4VULvGhdGHXkJpMnTTsGZJsylbj2NGNOE4Md5c
         EGPMTErAgwa6iQXjkdfhKGmfYuwm9nGLmGR19eF0MfPDqk5LAduDDeV4z+Zz46fJdfC/
         mvDA==
X-Gm-Message-State: AFqh2kobKnDO8wYKxKmPxkKEbgl2DaP5iWf5+rw+iCYKMEAjjGdb8m15
	WvUAsIbY+aOzEqEdeG1grOqxtYo/1B8=
X-Google-Smtp-Source: AMrXdXtg8SBGe9zgrYCeIv5nylPeK7cSjV2R6g4rtFcKzocFzZSKxaQNHC3QDeAE57cXucPlz+C83Q==
X-Received: by 2002:a05:6a00:4398:b0:580:d5ea:7b7d with SMTP id bt24-20020a056a00439800b00580d5ea7b7dmr18347335pfb.33.1672432377785;
        Fri, 30 Dec 2022 12:32:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id x15-20020a62860f000000b0056ba6952e40sm14093792pfd.181.2022.12.30.12.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:32:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] llvm: Do not use lseek64
Date: Fri, 30 Dec 2022 12:32:53 -0800
Message-Id: <20221230203254.1087816-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 20:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175175

Fixes build with musl where the LFS64 functions are deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-64bit-off_t-on-32bit-glibc-systems.patch | 79 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch b/meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
new file mode 100644
index 0000000000..fe98e3e4c0
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
@@ -0,0 +1,79 @@
+From cd2fa12d715929642513fc441287c402f4560096 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Dec 2022 15:13:41 -0800
+Subject: [PATCH] build: Enable 64bit off_t on 32bit glibc systems
+
+Pass -D_FILE_OFFSET_BITS=64 to compiler flags on 32bit glibc based
+systems. This will make sure that 64bit versions of LFS functions are
+used e.g. lseek will behave same as lseek64. Also revert [1] partially
+because this added a cmake test to detect lseek64 but then forgot to
+pass the needed macro during actual compile, this test was incomplete too
+since libc implementations like musl has 64-bit off_t by default on 32-bit
+systems and does not bundle -D_LARGEFILE64_SOURCE [2] under -D_GNU_SOURCE
+like glibc, which means the compile now fails on musl because the cmake
+check passes but we do not have _LARGEFILE64_SOURCE defined. Moreover,
+Using the *64 function was transitional anyways so use
+-D_FILE_OFFSET_BITS=64 instead
+
+[1] https://github.com/llvm/llvm-project/commit/8db7e5e4eed4c4e697dc3164f2c9351d8c3e942b
+[2] https://git.musl-libc.org/cgit/musl/commit/?id=25e6fee27f4a293728dd15b659170e7b9c7db9bc
+
+Upstream-Status: Submitted [https://reviews.llvm.org/D139752]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/config-ix.cmake                                | 8 +++++---
+ llvm/include/llvm/Config/config.h.cmake                   | 3 ---
+ llvm/lib/Support/raw_ostream.cpp                          | 2 --
+ llvm/utils/gn/secondary/llvm/include/llvm/Config/BUILD.gn | 2 --
+ utils/bazel/llvm-project-overlay/llvm/config.bzl          | 1 -
+ .../llvm/include/llvm/Config/config.h                     | 3 ---
+ utils/bazel/llvm_configs/config.h.cmake                   | 3 ---
+ 7 files changed, 5 insertions(+), 17 deletions(-)
+
+--- a/llvm/cmake/config-ix.cmake
++++ b/llvm/cmake/config-ix.cmake
+@@ -284,9 +284,6 @@ check_symbol_exists(futimes sys/time.h H
+ if( HAVE_SIGNAL_H AND NOT LLVM_USE_SANITIZER MATCHES ".*Address.*" AND NOT APPLE )
+   check_symbol_exists(sigaltstack signal.h HAVE_SIGALTSTACK)
+ endif()
+-set(CMAKE_REQUIRED_DEFINITIONS "-D_LARGEFILE64_SOURCE")
+-check_symbol_exists(lseek64 "sys/types.h;unistd.h" HAVE_LSEEK64)
+-set(CMAKE_REQUIRED_DEFINITIONS "")
+ check_symbol_exists(mallctl malloc_np.h HAVE_MALLCTL)
+ check_symbol_exists(mallinfo malloc.h HAVE_MALLINFO)
+ check_symbol_exists(mallinfo2 malloc.h HAVE_MALLINFO2)
+@@ -350,6 +347,11 @@ check_symbol_exists(__GLIBC__ stdio.h LL
+ if( LLVM_USING_GLIBC )
+   add_definitions( -D_GNU_SOURCE )
+   list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_GNU_SOURCE")
++# enable 64bit off_t on 32bit systems using glibc
++  if (CMAKE_SIZEOF_VOID_P EQUAL 4)
++    add_compile_definitions(_FILE_OFFSET_BITS=64)
++    list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_FILE_OFFSET_BITS=64")
++  endif()
+ endif()
+ # This check requires _GNU_SOURCE
+ if (NOT PURE_WINDOWS)
+--- a/llvm/include/llvm/Config/config.h.cmake
++++ b/llvm/include/llvm/Config/config.h.cmake
+@@ -128,9 +128,6 @@
+ /* Define to 1 if you have the <link.h> header file. */
+ #cmakedefine HAVE_LINK_H ${HAVE_LINK_H}
+ 
+-/* Define to 1 if you have the `lseek64' function. */
+-#cmakedefine HAVE_LSEEK64 ${HAVE_LSEEK64}
+-
+ /* Define to 1 if you have the <mach/mach.h> header file. */
+ #cmakedefine HAVE_MACH_MACH_H ${HAVE_MACH_MACH_H}
+ 
+--- a/llvm/lib/Support/raw_ostream.cpp
++++ b/llvm/lib/Support/raw_ostream.cpp
+@@ -804,8 +804,6 @@ uint64_t raw_fd_ostream::seek(uint64_t o
+   flush();
+ #ifdef _WIN32
+   pos = ::_lseeki64(FD, off, SEEK_SET);
+-#elif defined(HAVE_LSEEK64)
+-  pos = ::lseek64(FD, off, SEEK_SET);
+ #else
+   pos = ::lseek(FD, off, SEEK_SET);
+ #endif
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 402460ee10..77fccbccc2 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -30,6 +30,7 @@ SRCREV = "088f33605d8a61ff519c580a71b1dd57d16a03f8"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch;striplevel=2 \
            file://llvm-config \
            "
 
-- 
2.39.0


