Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13B8C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:13:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4375.1746731604672755760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 12:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C94FK77N;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso1543834b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731604; x=1747336404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFu9hCgYM6J3MO/s3Y4jyzau325vXchR38JEbhgfSnk=;
        b=C94FK77NxlPkZSAYE3SRhm/axZN4zigUcAGANFLGOWEcR8eA9dn/XpSnW1tu6sBmi+
         NkQpndI0TFNd4MMlIp6LJb4cuE5Nl/pHdvEGcvT+ADFG0CEsdIoVGHj/R3IkoLmsHZ8M
         eeb99oDO9pa3uX9JlzUGnSaguq37uBMYiimSIHThWU4W9lIoFXts0NuBoxMX4uIoUp9L
         lmDNNzyFpkVzbwBfi8kq2+SbQAbAFnXMnrKtVKhB07ss3oX1DJjjxUvDbLSe+SdAhQpb
         6ACRuLeTH0bo8zZniUPH7FCigmW4fswA3eW8rqEuE0inIIH/9Ce1isYkB4bPYukAd8bX
         nqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731604; x=1747336404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFu9hCgYM6J3MO/s3Y4jyzau325vXchR38JEbhgfSnk=;
        b=ZgoG5TDZvbB870eGOxx8SHnvMkNPrPeDfGCiaRXRGE9C4Q3ePQUNKAcO7jjfLLv/9w
         KJ55rhf5ULUB9Coy+zLm6t8/VvoiR0vo57BhbZWNONyHhZxoZOCs7aFX7Yq7bHRkXeJy
         GMYyBCcvBvG8/wwepeKHXi9ElRKbyyy5g9UusRSyygFpU2GtiIZcOvTNn98qq/uqzWqX
         IgtNaLibttdfNj5XQY8FCRJR4u8x5TJNSCQpr993rjMcJVpiagLkY2zZ0Bat1lmwNiKf
         U5VubRD56kpFueXJARvgPhqbmA/YWJTsh0i7MrSdDqQkpNamRJDmgfkirpf4PnEAr3Ma
         2PRQ==
X-Gm-Message-State: AOJu0YwhRSTznoy6x0Yj9GuahD/2G6a2fhcVyqbNRKRboLwWR/W7exUc
	LPSJzLoIgjWD2+8gYhlgtYZYukZlNP+CupOf0g/1OJ1Zz2HJsCo2VKkVSTLy
X-Gm-Gg: ASbGncv26HrVlPTXpLmbH+M3//PjXL6NMTT/PWC6xK+GwVxKXEcqQgyANJOxdUxt6xo
	yQaRWPR/Hj5Na0NP2pOZTeM58dd8inS5nKc2juU6EX7lRPQ99DFWbSMWhjxnZ3ILYjaB7YwV0Vz
	iVUjRPZMXxIOXO7aAESNEEz9dxOw0FmVFr97a1QHxkPVf2W1yl4xo0AyuJ0WIksnDxo1DHnmm/3
	nrWLArIXSqohejiPXz9+z9HuqN/FJWBf0Rv7Q9ImDJ70otb5sL6fuGxzTJrG9xDilIsyo5u+E9H
	+hBrtbUK4qI303Jj1Pnzxe9lcJ7eo64o
X-Google-Smtp-Source: AGHT+IGcSa2Ty4N0aEKbfBgHeEbvja9ixM+DsUsNTq1LTaEOcwoJI3bTKfJEt+VtJHHlaBvuAvSeNA==
X-Received: by 2002:a05:6a00:2e1e:b0:740:596e:1489 with SMTP id d2e1a72fcca58-7423c09fbc0mr543623b3a.23.1746731603645;
        Thu, 08 May 2025 12:13:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f14csm376619b3a.107.2025.05.08.12.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:13:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] compiler-rt: Consolidate and fix cmake arguments
Date: Thu,  8 May 2025 12:13:16 -0700
Message-ID: <20250508191319.3743189-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 19:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216154

Specify CMAKE_C_COMPILER_TARGET and COMPILER_RT_DEFAULT_TARGET_ARCH
in common for native/target/nativesdk

set COMPILER_RT_DEFAULT_TARGET_ARCH to use HOST_ARCH across all recipe
variants

It is not needed to set COMPILER_RT_DEFAULT_TARGET_ARCH for powerpc anymore
as it is already fixed by setting COMPILER_RT_DEFAULT_TARGET_ARCH to
HOST_ARCH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index a0f9c769a06..22dec883298 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -63,6 +63,7 @@ OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                   -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_INCLUDE_TESTS=OFF \
@@ -70,6 +71,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
                   -DCOMPILER_RT_BUILD_MEMPROF=OFF \
                   -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
                   -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
@@ -77,16 +79,10 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -S ${S}/runtimes \
 "
 
-EXTRA_OECMAKE:append:class-native = "\
-                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
-                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
-"
-
 EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 "
 
@@ -96,9 +92,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
 "
-EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
 
 do_install:append () {
     mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib

