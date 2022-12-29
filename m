Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B607C4708D
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 07:12:40 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.199611.1672297956316576280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 23:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZGd2ovFi;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id ge16so14747942pjb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 23:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhOSW1EWDI7H+Nt3f87CvaLysn95E66VwShdpv9daRQ=;
        b=ZGd2ovFi3ypAk5xsulsoJppdc3LYQ75D56MeiFf8D3Z7kRxmKscQ3QiYAeg7PilVlg
         GEW4YQVBnDWzs1ChAVRIEViDKqQ+0TvX4M4LU6mYQafmVhzXiXBjomsptyjKuRJwmfk6
         Ci8nD1LvtO7lCdiElCp0EZ4A7+6OHNTkfTFnjyu1VyNIQ1y/86TEaETAeuG/A8p+XTCH
         EPIbY4D01tOmdkaykoM2cdL/61v6mE7V0lWlg07HsGYdPDTIXaNYF6HJ69rU7EAO82m7
         iM7X/iDu2XbCGVL0fj84ASOiA8RDtHjrOYeowO5/HXMYoFpxZea43LS82C+Ay8cjCy1b
         wiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhOSW1EWDI7H+Nt3f87CvaLysn95E66VwShdpv9daRQ=;
        b=pKySw7TkMfZawKWWIiBSaxt4C1HOjTMvM+g5OfqjiBv/Iz69o9QfhMdD1+hVWSH64A
         Zrv3egIpfwVgbsKwXFeXxY9Oa595sg4vJo7SYIOoDNmn5fLYPkSZqk7fbOnkwYtYGX5U
         QoHSa1CPyATRp9oADc7ZmnT6+SRs9u8lAyfdTeu5JPGDy4YaQHAdze/wR46/dny00U3A
         8wqPksbWW3OT5IFJJ1qj9y/4AmYQzu+++6o9VKhM/MlIw9py/FXGlj8EnJ+7DMKuNf9n
         2Wqrg7MuHzJTIiKbPnKgTg20E+QXf9bsB9rQXlD8HrcrZURHHGu9hhv2yDFDyQgoH2Ys
         41lg==
X-Gm-Message-State: AFqh2kqL8tiYXZQ56nXY3VxlqpZvE7GWNL1bYsNs2l523qaueE695XHz
	WAnFhQY9yHGHfgo8y9jGjcLg7thhaUk=
X-Google-Smtp-Source: AMrXdXvW79dCsxdBElQB3TwP0D8bFaKDke1CCWPGXxYMOJpVGyc02tRK+vPJ1FXQWWaKA4rpsbO8Ug==
X-Received: by 2002:a05:6a21:32a7:b0:ad:f2bf:bc50 with SMTP id yt39-20020a056a2132a700b000adf2bfbc50mr46015118pzb.13.1672297955447;
        Wed, 28 Dec 2022 23:12:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id n16-20020a63ee50000000b004812f798a37sm10398347pgk.60.2022.12.28.23.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 23:12:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] rust-llvm: Fix build on latest musl
Date: Wed, 28 Dec 2022 23:12:31 -0800
Message-Id: <20221229071231.4107849-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229071231.4107849-1-raj.khem@gmail.com>
References: <20221229071231.4107849-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175093

latest musl has removed lfs64 functions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-64bit-off_t-on-32bit-glibc-systems.patch | 79 +++++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.66.0.bb |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch b/meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
new file mode 100644
index 0000000000..fe98e3e4c0
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
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
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
index 4cf244bb67..4cc57d12ae 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
@@ -10,7 +10,8 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
+	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
+	    file://0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch;striplevel=2"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
-- 
2.39.0


