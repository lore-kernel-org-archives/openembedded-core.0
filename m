Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1458AC36002
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 01:42:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.56249.1742866948928087121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 18:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xc/SYEQ6;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223a7065ff8so27457855ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 18:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742866948; x=1743471748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SyL2/E/F+jnSOs9zsAQ9cHiiHMvRQJ2WgvMPHKU69Sk=;
        b=Xc/SYEQ6BJf4oq90CPzN1F5xprFpD/t/uNt0/I+I7zFh9ftBqABpsHoHuB/rYCj7VQ
         AWLiLSi2lsPAIHRWzvmZSlfSqbCIs0fxMEnR6vFJul56xTC2PPSdLmmVNjS/0YjJ6kGM
         LSOc0lM8UWzu5f3VM0d6v8zQLLvfBqN0/HOOuhHpNKKppe43uybhzbuI5PIQ52O0mXFH
         Y6myJq4hkpEo6f3Z3WCQTqgROTcTESYKg73pFCH+yZuix0Y9zGUXlX4cgEVR6qRPRev5
         iaKsq1u5y/MRLX1cMtHq5TdoMiwzYvGSYd9h1dOuiDrJNtOY+5kiQ1rGmpwfHvmZ0Pn0
         CjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742866948; x=1743471748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyL2/E/F+jnSOs9zsAQ9cHiiHMvRQJ2WgvMPHKU69Sk=;
        b=C3IeCGhh+7HrTlbXqyOhr+QKkzrlRIVg5sGQjeBzbelfLEN6hoa4ErMoNag0OQmLM1
         5d3OdsPc/jzLSETZkC4zJpKfG7i8d5GplyOpmlNXmJIdJomv/HnWiASSAHZ/qpeiResH
         XTJFlVNEPiX5g/bkHpaCqgVAhb9USF8KIl3i3Xdkx2wpxRQ3k3AYUMXZJKAsND4aXfEp
         3YwAKYMh4TNerleOFxRh79E/aQAYUYmLnJCyRyRVACr75Fv410urw8zCd8sakAQ70+q2
         4T0lIjXNUdBNEgAEzVzBa7ojkbB/3Bd2NutOhkGxImZ163zS/QURhOkG/EjBLVjrBTtM
         BSjw==
X-Gm-Message-State: AOJu0YwXlzflrR7DUTe6zsCnZBkhyrVhg/oJF9DqcLCzcRQ8KiSfvToI
	TMRUtwuVjVkWqkR19gSlPymwLgp++hzoFx/pb8HILc0B6CeEaDpLR74FuKb8
X-Gm-Gg: ASbGnctSbzuwHKwSh1RCvdwL6AvsWRN/wFK1elS+GCG5WL/A2TR2R3ssFCuilxaTo7f
	S+na1ZzysPwdc27+pFg5tDMa93MK+T3lf+k8S74hlFlopaXHQ1x4Nmsh6v9ix6CTue4tp3rYWA1
	KmoTAXzsndho/lIJ0isACoiGTGtUHzhhYhJZBr6b214C8JzQCI7S6K0s8tkdaV3+5XQLeTlbti/
	h+1tEcj9vHH0MWvLxESTXDq6fpuYa1nJ+Y0i3N60c3Vtx2wu/hrzmETrhYIc7Nl/YHfi4sS96zr
	3AMA30t32JNL7aNr+tm//gpefOmF+ZywnoaZ
X-Google-Smtp-Source: AGHT+IF/L5GLeRpzBoXoLzXSXv/lHGnvCdecXpPvBEmlHFu2LMQfsvWAeJ8dwle78CU2gMFlqH2OIg==
X-Received: by 2002:a17:902:e5c6:b0:215:7421:262 with SMTP id d9443c01a7336-22780c78291mr249833055ad.12.1742866947887;
        Mon, 24 Mar 2025 18:42:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811d9f1bsm78105005ad.166.2025.03.24.18.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 18:42:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] vulkan-samples: Fix build with GCC-15
Date: Mon, 24 Mar 2025 18:42:25 -0700
Message-ID: <20250325014225.1666618-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 01:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213587

Include cstdint for uint32_t definition
Update to tip if trunk as it helps with GCC-15 fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use patchdir= when patching submodules, helps self tests

 ...uilder.h-add-missing-cstdint-include.patch | 28 +++++++++++++++++++
 .../0001-framework-Include-stdint.h.patch     | 26 +++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  6 +++-
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
new file mode 100644
index 00000000000..f50aa806da7
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
@@ -0,0 +1,28 @@
+From e40c14a3e007fac0e4f2e4164fdf14d1712355bd Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:44:21 +0100
+Subject: [PATCH] SPIRV/SpvBuilder.h: add missing <cstdint> include
+
+Without the change `glslang` build fails on upcoming `gcc-15` as:
+
+    In file included from /build/source/SPIRV/GlslangToSpv.cpp:45:
+    SPIRV/SpvBuilder.h:248:30: error: 'uint32_t' has not been declared
+      248 |     Id makeDebugLexicalBlock(uint32_t line);
+          |                              ^~~~~~~~
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ SPIRV/SpvBuilder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/SPIRV/SpvBuilder.h
++++ b/SPIRV/SpvBuilder.h
+@@ -56,6 +56,7 @@ namespace spv {
+ }
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <set>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
new file mode 100644
index 00000000000..8d323f2cef8
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
@@ -0,0 +1,26 @@
+From 445fcfd7b9245881d769880a5942ce9faa893045 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Mar 2025 20:09:35 -0700
+Subject: [PATCH] framework: Include stdint.h
+
+Needed for uint32_t used in this header
+GCC 15 gets upset about it.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/1314]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/platform/configuration.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/framework/platform/configuration.h b/framework/platform/configuration.h
+index f6a9cae..c15f76f 100644
+--- a/framework/platform/configuration.h
++++ b/framework/platform/configuration.h
+@@ -18,6 +18,7 @@
+ #pragma once
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <string>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 2dd4bba5230..75174f6a91f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,16 +7,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
+           file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch;patchdir=third_party/glslang \
+           file://0001-framework-Include-stdint.h.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "4838e02a4b08236931bec0532fc26ee3871b466a"
+SRCREV = "8547ce1022a19870d3e49075b5b08ca2d11c8773"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
 
+# Avoid erroring on including <ciso646> instead of <version> in c++17
+CXXFLAGS += "-Wno-error=cpp"
 inherit cmake features_check
 
 FILES:${PN} += "${datadir}"

