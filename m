Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79562C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 23:16:12 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.52478.1679958963158090370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 16:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MVt5GQWb;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id a16so9184023pjs.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679958962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vLYBzcZwyoxDqsZThF275o1Riih46ctEIC59UDeT538=;
        b=MVt5GQWbPlbk197yllTAMDnPwumA4Y/w63GkSvZYyTGtO7fEFmaU0n872JgBaQLeB0
         by9Wn01YNnhx5K8g/nNSs1bO8l19lOTK8QwjW4cioruJDaYesmGSMa/2B+aGGqLOX/ll
         jUpX3BjquuYdxthR4snqgKJRDBSMEi3jcWdb0wVuwqcHCVG2iII7Hq/JlNhPASCbwsDq
         9x1fx2hHtUky2A5UJBuoPkCZD3A8P6eNsLxc12pRRYvNtgh0WN/Gxa0XJXPIdk68rNvG
         4dsGhPw6setUronIzUYIV5ptfGepQEBl/WZ+HUz2FgyuzeFdqlTQDW2cZj7o6iKM/GdW
         SJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679958962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLYBzcZwyoxDqsZThF275o1Riih46ctEIC59UDeT538=;
        b=HJn3gcWpYnKBGANkBMLUhL6t65ZxVJqCDw/biZXOoxvrSSQsCJOqa1FJWPuRf0xt/I
         n2j8P+JKGAEiXDgdgU+E2/FhYtpJowQXwTeTUqKb5AEzRN2Ufs5RDR8MNbjJdCif9kqu
         eQOa2FySkQyX8ULGLPOguMhIEI3/hP+oK+qfeJ4yW792x6uryHlmJafsvQI/S2heJJGh
         CQzUIj51rmQFhP6Y2Bk8cVRZzCGcwEWEV1tIqVhgDVtYuz7M2/RXzpMGMvXV/6LNJUVX
         Q9mAPUicN1nb/16rY3/kO6pEMx/I2MAdL2Ke+CMdQOE4T6hSzpSAW3mvmq8m7p0QF5T6
         Zt+g==
X-Gm-Message-State: AO0yUKXhoHOu/kKm3LEv69KMcAXgvmZWpsJJWZonXHHpoCCp4wABasPW
	zGpiNioQ+nSlD/VANTorRH04erIngcmD3Q==
X-Google-Smtp-Source: AK7set9CQYoT28f3xbDtArm6oi/056bNtf5JgDSkpaClTDifLMECvFjQbxKrLCgVy7yMd97bklvH9Q==
X-Received: by 2002:a05:6a20:19a:b0:cb:f5ab:3bd0 with SMTP id 26-20020a056a20019a00b000cbf5ab3bd0mr10969804pzy.59.1679958961899;
        Mon, 27 Mar 2023 16:16:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id p26-20020aa7861a000000b006249928aba2sm19539654pfn.59.2023.03.27.16.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 16:16:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Disable wasm on rv32/rv64
Date: Mon, 27 Mar 2023 16:15:59 -0700
Message-Id: <20230327231559.4190081-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 23:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179189

It does not build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/files/disable_wasm_riscv64.patch   | 24 +++++++++++++++++++
 .../recipes-sato/webkit/webkitgtk-3_2.40.0.bb |  7 +++---
 meta/recipes-sato/webkit/webkitgtk_2.40.0.bb  |  7 +++---
 3 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch

diff --git a/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch b/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
new file mode 100644
index 0000000000..eac942fddc
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/disable_wasm_riscv64.patch
@@ -0,0 +1,24 @@
+Provide a way to override enabling wasm from CMake
+by setting -DENABLE_WEBASSEMBLY=OFF for RISCV64
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=254553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/WTF/wtf/PlatformEnable.h
++++ b/Source/WTF/wtf/PlatformEnable.h
+@@ -613,13 +613,14 @@
+ #endif
+ 
+ #if CPU(RISCV64)
+-#undef ENABLE_WEBASSEMBLY
++#if !defined(ENABLE_WEBASSEMBLY)
+ #define ENABLE_WEBASSEMBLY 1
+ #undef ENABLE_WEBASSEMBLY_B3JIT
+ #define ENABLE_WEBASSEMBLY_B3JIT 0
+ #undef ENABLE_WEBASSEMBLY_BBQJIT
+ #define ENABLE_WEBASSEMBLY_BBQJIT 0
+ #endif
++#endif
+ 
+ #if !defined(ENABLE_C_LOOP)
+ #if ENABLE(JIT) || CPU(X86_64) || CPU(ARM64)
diff --git a/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
index 4401b0e527..8932bcb562 100644
--- a/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk-3_2.40.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
+           file://disable_wasm_riscv64.patch \
            "
 SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
 
@@ -113,9 +114,9 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
-# JIT and gold linker does not work on RISCV
-EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
-EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+# JIT and WASM does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
index 84a5981ba0..04f722a913 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
+           file://disable_wasm_riscv64.patch \
            "
 SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
 
@@ -112,9 +113,9 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
-# JIT and gold linker does not work on RISCV
-EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
-EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+# JIT and WASM does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DENABLE_JIT=OFF -DENABLE_WEBASSEMBLY=OFF"
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
-- 
2.40.0


