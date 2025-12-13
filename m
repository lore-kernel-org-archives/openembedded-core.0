Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD8ED5AE73
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2903.1765620103747330796
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SezbUwn/;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f1bc40b35so25230865ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620103; x=1766224903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0mhRLlF3hMyFlL9QXom4W5kvthxcAW4AfuAV1xSkvI=;
        b=SezbUwn/ZSHcUAvGp6p8pKPAWp3wwHb+ao+HrBnBw2qbofjPMt3GVIF9rJdAnb8Hx9
         6PuFVMD/Bdl2wLg0LIeCPG3JjJt6e1EFiyWz1Wmnoc8an7M6xWo5036f3yc64rEJZAEL
         zpPWwLzl64tUyKP+mT0hffakcBn3i2qDy6QMH7iSoI1SeFC4BRTesNwdrvMKsDVwDNZj
         PKCZ9kzOwx41IK+9oHyQMwWW+RlHpVDQjMURWDu8D4xnKO/vnbNluhEb+0iVEL9tdcXB
         5LLWWHyDFiPDeIWMpOpIi7q4HLjgrOLFMFi7h8y53nrtHjzkPtp/SX5McagqgluL8Uyy
         DYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620103; x=1766224903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0mhRLlF3hMyFlL9QXom4W5kvthxcAW4AfuAV1xSkvI=;
        b=aH1Wec35Te/JOYb9oRqeVc8f1cZhoB+lnm0qK3ugS1HCMEEE/+Gyf0f9Fk1unIKJmZ
         z5+2GfDM9qy28tPR4Z01+c4PPzltk6342yJJp9b9jWPBxpQ5Ky7aV9cMd7hsuIpSWjMT
         UNQoxxevO6hABqS7Eo94VWAkswerAE09PBUe/RnogXCngxwJvLNnSQBPDiDaur1eUa+l
         NYvSjIA3HkIlrZDeakw5kDWNL0te9WiFGLiyuIqgu9rrpy9ljTdvmUfgOuvrbHA5O0Ez
         Iw5OQjfCnkEaaD0WSnr5dY/GZX65C8BrLZpnO8VkWPoLBcVgK4id+iyHpJ4QAyMn6n3N
         rAfA==
X-Gm-Message-State: AOJu0YztRM2x1W76/Kl07aOImWCqSownxMVtYFw/IxI6/Y5obwq4Xwtd
	0UYh4s2zHr5B/5v43lu9KCnxK7SfCLSVbSwqcQP4F4eN7XfhF/Az8zhngaw84P5/
X-Gm-Gg: AY/fxX4uksB9VW2QX/5W86kguwZo99ge9lFyyE4z1lRksk6P6lJpFal359SktCw04ed
	2pGsKtzHCqJU7vMPTQvK5tOD3U/DNXsWxm8FdDzYI2UMFcPYHZfAKunabGdMEUGe77s5Ja1UurJ
	6rzJ+dAgkWlQqe66bSYw+YVWAYp58HLk54X7c1cJn9m4iPnx0Mr4t9zTuNFiK1ysEaLmI6N3pxz
	5FKuxrtKugTxbSbF99pzlZNWf5NBUm81UeSDzncBgYsMlI1ScGAKOoDj6/w3dPOCy97AEVDyEPg
	7DyEtOzZqt/C8C729eKdzWCLct51acHspq32pjRUtPVddGJflYzVZ3mRfCnW7ZLV7Ce96S0QIec
	qmsAPtvhGBEkO3OCyR1kk0bFDguvHuAjreA7wZ/RvjFd8ah04wdMh63Sxbb9DHbWy/D/RC0J7uk
	KF+KhIfixLd6/JGQHw4scyIk+J
X-Google-Smtp-Source: AGHT+IEKQfCMfSezTko7mK0800K3c1Rt8lppkl3sSgkufZNzJ9WBjrfRn18xU26WJ4lndRystk2BqA==
X-Received: by 2002:a17:903:2281:b0:298:616a:bae9 with SMTP id d9443c01a7336-29f23c733ffmr51901265ad.28.1765620102897;
        Sat, 13 Dec 2025 02:01:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 45/67] compiler-rt: Remove the need to depend on libgcc
Date: Sat, 13 Dec 2025 15:29:09 +0530
Message-ID: <20251213095931.2571498-45-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227663

From: Khem Raj <raj.khem@gmail.com>

libgcc is only used in cmake tests for compiler checks
which works in contained environment like OE, add depedencies
on native version of compiler-rt and libcxx for compiler to
use

Do not build orc builtins, its only needed for JIT which OE
does not use.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit f504b6bb8366019d46e48efc5f3fa79859476431)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 8cf11edf85..f42f17e9ba 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -25,9 +25,8 @@ TUNE_CCARGS:remove = "-no-integrated-as"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-DEPENDS += "libgcc"
-DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
-DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc libcxx-native compiler-rt-native"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS}"
 DEPENDS:append:class-native = " clang-native"
 DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
 
@@ -76,6 +75,8 @@ INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DCMAKE_C_COMPILER_WORKS=ON \
+                  -DCMAKE_CXX_COMPILER_WORKS=ON \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_INCLUDE_TESTS=OFF \
                   -DCOMPILER_RT_BUILD_XRAY=OFF \
@@ -100,6 +101,7 @@ EXTRA_OECMAKE:append:class-target = "\
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+               -DCOMPILER_RT_BUILD_ORC=OFF \
 "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -111,14 +113,13 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+               -DCOMPILER_RT_BUILD_ORC=OFF \
 "
 
 do_install:append () {
     if [ "${HF}" = "hf" ]; then
         mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-arm.a \
               ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-armhf.a
-        mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/liborc_rt-arm.a \
-              ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/liborc_rt-armhf.a
     fi
 }
 

