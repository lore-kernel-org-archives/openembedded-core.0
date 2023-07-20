Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33C2EB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:25:49 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1515.1689870341870707639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gzR57ygb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31590e4e27aso759579f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689870340; x=1690475140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKLgJAKDavp01/EGcwjIKaIxgxUDCEbNA0No+K7ncG0=;
        b=gzR57ygb2mnnf8gmhQDDKjgT0dtRdv2Gb6SHj3cPKkN0KpgYCRuneC+QBMBv9gO5S4
         etRRaL4Jh9hGfsudCZPOF8tfnLFiaCzgDVZm8pdlUmDY5u9+0FQ/0M8b7HM2oaM6jJIy
         sjqg/b1osJQuLwBJvGnpxdYtyn//8kSZIOKllifw5Av/3jtd/OzNwh3QpLWY0+t50WlI
         0rlqwLoJhmW2AqLmga79G42qbrdgIrXLsSp1OV9AjVfzG0jQDoGkKxbx/rF/o4G3uugZ
         BYgoKn9TQznesL1T6Cc7PMdxLIkN3QRHu6EVhE86tYa8yQklC8+/7mSgmS/kJ7NMJF5F
         g8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689870340; x=1690475140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKLgJAKDavp01/EGcwjIKaIxgxUDCEbNA0No+K7ncG0=;
        b=DWtXc5dO1nA1ykpGupPDVVl2ZOmYxFLPyK29rryXiz1HMHwLf2TMO0dobGTlzkMhQj
         Jq2M2zBc+PX+zjebrjeIiOV4vNu4VxH8mLnvcZ/tORSsvqtiQnnEFvfDhRHTp9K0o5qD
         +t5wC+knxXkNASIwzAD0mqOS5wmJI5JmVrneTwqifuhIOTivEi4QjRz9+DxqE8m/YyzL
         OrNq/GZHfqNeSfCt2HnJjawTVYzKyRw9UaDd0Aqslj+alAeU6rfv7xqEzZmj7stFxdPm
         yYbf2/AJtHPg4Te1mayhrZqApxb9ahWPV3Vv9AeRlHrQEHH+4ExJmAgv8w2xojcnz0BP
         ScuA==
X-Gm-Message-State: ABy/qLajsTL838OkVNoLyfrVceDpnnrKAFrWs60wEMqBd5U5y9AwDBoA
	GoRkUudJTy+MvxmLKrM5MqW558f89g6QwQ==
X-Google-Smtp-Source: APBJJlF4LnEuXF3P0QRm/ri7njeJ7+Lozduqewd+hGkhTJ7ml+33+MjWgwfKm5S16SEiofyPlFo0Xg==
X-Received: by 2002:a5d:4b85:0:b0:316:cbb4:4e49 with SMTP id b5-20020a5d4b85000000b00316cbb44e49mr3069085wrt.1.1689870339806;
        Thu, 20 Jul 2023 09:25:39 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z8-20020adff748000000b00314374145e0sm1749076wrp.67.2023.07.20.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 09:25:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH 4/4] devtools: grpc: bump to 1.56.2
Date: Thu, 20 Jul 2023 18:23:02 +0200
Message-ID: <20230720162535.116519-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720162535.116519-1-peron.clem@gmail.com>
References: <20230720162535.116519-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184648

Remove merged patch that export plugin to a separate targets

Remove no more applicatable patch

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
 ...d-separate-export-for-plugin-targets.patch | 93 -------------------
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |  6 +-
 3 files changed, 2 insertions(+), 159 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (92%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
deleted file mode 100644
index b245ad865..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 19 Oct 2021 17:09:55 +0200
-Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_SYNC
- (#25681)"
-
-This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
-
-Fixes sysdig from meta-oe and other recipes (like com.webos.service.tts
-libgoogleassistant from meta-webosose) failing with:
-
-| FAILED: userspace/sysdig/sysdig
-| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-sec
-urity  --sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -f
-debug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/bu
-ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/OE/build
-/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wall -ggdb   -std=c++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
---sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-p
-refix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-
-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/OE/build/oe-cor
-e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-cor
-e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-
-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/
-oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/
-core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_info.cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/sysdig/sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
- -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl  -lpthread && :
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| collect2: error: ld returned 1 exit status
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- include/grpcpp/impl/codegen/sync.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/impl/codegen/sync.h
-index 4cb8133c7c..3d10d9a3a0 100644
---- a/include/grpcpp/impl/codegen/sync.h
-+++ b/include/grpcpp/impl/codegen/sync.h
-@@ -47,7 +47,7 @@
- namespace grpc {
- namespace internal {
- 
--#ifdef GPR_ABSEIL_SYNC
-+#ifdef GRPCPP_ABSEIL_SYNC
- 
- using Mutex = absl::Mutex;
- using MutexLock = absl::MutexLock;
-@@ -142,7 +142,7 @@ class CondVar {
-   gpr_cv cv_;
- };
- 
--#endif  // GPR_ABSEIL_SYNC
-+#endif  // GRPCPP_ABSEIL_SYNC
- 
- template <typename Predicate>
- GRPC_DEPRECATED("incompatible with thread safety analysis")
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
deleted file mode 100644
index 679bd3882..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2001
-From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
-Date: Tue, 18 Feb 2020 14:17:07 +0100
-Subject: [PATCH] cmake: add separate export for plugin targets
-
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
-
-
----
- CMakeLists.txt | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index efdaf8936d..6608b1b00c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
-     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
-     NAMESPACE gRPC::
-   )
-+  install(EXPORT gRPCPluginTargets
-+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
-+    NAMESPACE gRPC::
-+  )
- endif()
- 
- include(CMakePackageConfigHelpers)
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
similarity index 92%
rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
index 958992e1e..c4dd6b985 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
@@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
-BRANCH = "v1.50.x"
+SRCREV_grpc = "c0d1c393d9365664d47df41746e992ae97b651ef"
+BRANCH = "v1.56.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
-           file://0001-cmake-add-separate-export-for-plugin-targets.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
-- 
2.41.0


