Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8BCC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:03 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.39297.1683653035974152801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mib7m2lB;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9659443fb56so948383166b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653034; x=1686245034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bCIakXxDHX8uCjxFbt1hFI9/csG/3QbDPLwtDjIKTA=;
        b=mib7m2lBzyr+8bcVL7I6JSwHvmPuKia5CY1VlFOJosaORJqGRpaKRamoXCVf+NklKt
         vQ+smRIYspE800cvNP5kVZUcjOYPBBhq5/etRfqbUwqJ4ntiaTFrPmQise0eoUQaDnKT
         0GP5Jy2F4q5CSIdMrFkfuebEToSwfiWvuweYHmQl5HBuSswYhcxFGnYS6Fh66VLTXuUg
         m/ngTYl/SgnReFijr73tYw4ozB8w99HuHnxqaKRluqmK0KLJGMrSUPTZ9lLDjBjHR1CM
         KVsht5i6fyjfpHMscErgz8gUMEcrlt0MuFep6O+KDFjxPLtrPuMWy69DnZCJ6FUjaSre
         AITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653034; x=1686245034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bCIakXxDHX8uCjxFbt1hFI9/csG/3QbDPLwtDjIKTA=;
        b=f11IccpIPTHFfZhCAlNglyONOSJVRJi9KRUQ171rFOmx/9cxWl7d5YV8Jm32d0Rw7r
         JSzcmRim16cJUNYPat41LJT30Fy90LZ8P7cI7SW4yM9lvOPLLZMB5uZC7tSaShlu/bjo
         T/EKMv3uNOGSPH8UTryY25J3Yw2PJO7hj5irKDw2lSmk8hEkxa8qiy4TRKwjlcigYL2Q
         ibokvjn4T6s/JNFHUrIzj0u/9YooAfnvKP0lHDw0flu5dAEBzTrParQ4h5oEdqyln5RT
         Wy+5v/3bxCahE2rDXmZT1h5WTwoNSZq0yL5DPtYVP+0DnGJoeJqft4lRBpWcj7UVqA9s
         +16w==
X-Gm-Message-State: AC+VfDyoVt4OH5+MS1AJhkSOovnFJPwxGgalYqJY4I7TU/MqLwo+8Hcd
	lVQIsgs4AJL7Rfh7xLWI3GrcCFaPwz4=
X-Google-Smtp-Source: ACHHUZ6hnmm1u66V3BRMLseNbJ3XRqX6qI+rRkORd/s5wDimrkEHFr5fQrmsWyB7P2TfmJTC34Kagw==
X-Received: by 2002:a17:907:70d:b0:948:eed:b4e0 with SMTP id xb13-20020a170907070d00b009480eedb4e0mr12992485ejb.61.1683653034434;
        Tue, 09 May 2023 10:23:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/27] llvm: update 15.0.7 -> 16.0.3
Date: Tue,  9 May 2023 19:23:27 +0200
Message-Id: <20230509172344.1516743-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181065

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...e-64bit-off_t-on-32bit-glibc-systems.patch | 79 -------------------
 meta/recipes-devtools/llvm/llvm_git.bb        |  5 +-
 3 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9d0b319739c..853a20bfe26 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ GLIBCVERSION ?= "2.37"
 LINUXLIBCVERSION ?= "6.1%"
 QEMUVERSION ?= "8.0%"
 GOVERSION ?= "1.20%"
-LLVMVERSION ?= "15.%"
+LLVMVERSION ?= "16.%"
 RUSTVERSION ?= "1.69%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch b/meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
deleted file mode 100644
index fe98e3e4c05..00000000000
--- a/meta/recipes-devtools/llvm/llvm/0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From cd2fa12d715929642513fc441287c402f4560096 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 25 Dec 2022 15:13:41 -0800
-Subject: [PATCH] build: Enable 64bit off_t on 32bit glibc systems
-
-Pass -D_FILE_OFFSET_BITS=64 to compiler flags on 32bit glibc based
-systems. This will make sure that 64bit versions of LFS functions are
-used e.g. lseek will behave same as lseek64. Also revert [1] partially
-because this added a cmake test to detect lseek64 but then forgot to
-pass the needed macro during actual compile, this test was incomplete too
-since libc implementations like musl has 64-bit off_t by default on 32-bit
-systems and does not bundle -D_LARGEFILE64_SOURCE [2] under -D_GNU_SOURCE
-like glibc, which means the compile now fails on musl because the cmake
-check passes but we do not have _LARGEFILE64_SOURCE defined. Moreover,
-Using the *64 function was transitional anyways so use
--D_FILE_OFFSET_BITS=64 instead
-
-[1] https://github.com/llvm/llvm-project/commit/8db7e5e4eed4c4e697dc3164f2c9351d8c3e942b
-[2] https://git.musl-libc.org/cgit/musl/commit/?id=25e6fee27f4a293728dd15b659170e7b9c7db9bc
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D139752]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/cmake/config-ix.cmake                                | 8 +++++---
- llvm/include/llvm/Config/config.h.cmake                   | 3 ---
- llvm/lib/Support/raw_ostream.cpp                          | 2 --
- llvm/utils/gn/secondary/llvm/include/llvm/Config/BUILD.gn | 2 --
- utils/bazel/llvm-project-overlay/llvm/config.bzl          | 1 -
- .../llvm/include/llvm/Config/config.h                     | 3 ---
- utils/bazel/llvm_configs/config.h.cmake                   | 3 ---
- 7 files changed, 5 insertions(+), 17 deletions(-)
-
---- a/llvm/cmake/config-ix.cmake
-+++ b/llvm/cmake/config-ix.cmake
-@@ -284,9 +284,6 @@ check_symbol_exists(futimes sys/time.h H
- if( HAVE_SIGNAL_H AND NOT LLVM_USE_SANITIZER MATCHES ".*Address.*" AND NOT APPLE )
-   check_symbol_exists(sigaltstack signal.h HAVE_SIGALTSTACK)
- endif()
--set(CMAKE_REQUIRED_DEFINITIONS "-D_LARGEFILE64_SOURCE")
--check_symbol_exists(lseek64 "sys/types.h;unistd.h" HAVE_LSEEK64)
--set(CMAKE_REQUIRED_DEFINITIONS "")
- check_symbol_exists(mallctl malloc_np.h HAVE_MALLCTL)
- check_symbol_exists(mallinfo malloc.h HAVE_MALLINFO)
- check_symbol_exists(mallinfo2 malloc.h HAVE_MALLINFO2)
-@@ -350,6 +347,11 @@ check_symbol_exists(__GLIBC__ stdio.h LL
- if( LLVM_USING_GLIBC )
-   add_definitions( -D_GNU_SOURCE )
-   list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_GNU_SOURCE")
-+# enable 64bit off_t on 32bit systems using glibc
-+  if (CMAKE_SIZEOF_VOID_P EQUAL 4)
-+    add_compile_definitions(_FILE_OFFSET_BITS=64)
-+    list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_FILE_OFFSET_BITS=64")
-+  endif()
- endif()
- # This check requires _GNU_SOURCE
- if (NOT PURE_WINDOWS)
---- a/llvm/include/llvm/Config/config.h.cmake
-+++ b/llvm/include/llvm/Config/config.h.cmake
-@@ -128,9 +128,6 @@
- /* Define to 1 if you have the <link.h> header file. */
- #cmakedefine HAVE_LINK_H ${HAVE_LINK_H}
- 
--/* Define to 1 if you have the `lseek64' function. */
--#cmakedefine HAVE_LSEEK64 ${HAVE_LSEEK64}
--
- /* Define to 1 if you have the <mach/mach.h> header file. */
- #cmakedefine HAVE_MACH_MACH_H ${HAVE_MACH_MACH_H}
- 
---- a/llvm/lib/Support/raw_ostream.cpp
-+++ b/llvm/lib/Support/raw_ostream.cpp
-@@ -804,8 +804,6 @@ uint64_t raw_fd_ostream::seek(uint64_t o
-   flush();
- #ifdef _WIN32
-   pos = ::_lseeki64(FD, off, SEEK_SET);
--#elif defined(HAVE_LSEEK64)
--  pos = ::lseek64(FD, off, SEEK_SET);
- #else
-   pos = ::lseek(FD, off, SEEK_SET);
- #endif
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index acf7f4c3d77..eb918383e6f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,18 +19,17 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "15.0.7"
+PV = "16.0.3"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "8dfdcc7b7bf66834a761bd8de445840ef68e4d1a"
+SRCREV = "da3cd333bea572fb10470f610a27f22bcb84b08c"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-           file://0035-cmake-Enable-64bit-off_t-on-32bit-glibc-systems.patch;striplevel=2 \
            file://llvm-config \
            "
 
-- 
2.30.2


