Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C3DC369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 14:11:23 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9504.1744207878929650876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 07:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TLCKh6fQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b433so69300345ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207878; x=1744812678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yvP943ZEcNYG5rgvCBTzLplr1X9CDYPg57nCyaMzvg=;
        b=TLCKh6fQpPPWVhYR6W9eNW5RobbSG7Ulo23WlxAxIFW+onAFhv82kiyCsz86VLCK40
         o1NmOVmAW3QVEWQNl01YhvrvsZVOSzJrjfnNT5fS39268ieHxMfovrZ6ueBFJWGCeBZD
         kwGg+2C9n8i+PUYk2WFXqVinxEfzX6p7OrXikCDHIwMc0GXCOHzo0YZUKhS965HeAIr2
         C7d5O6mu79Cdd7GraRpBkc/Cw4aRNXv50QA780dlNcewo6Lg7QFKcjKuezStIIcZndK4
         DuLHEr5LTLj5u4SL5zayKaWyolhVuXQJL+KN7TPBgq5d7HPVzOqG49M4B6IoJjH06Qvl
         hEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207878; x=1744812678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yvP943ZEcNYG5rgvCBTzLplr1X9CDYPg57nCyaMzvg=;
        b=g9afs3CjIuOu3ASvNlv69HTsfshvnrv800NgBJFIhfAbIJTnmLZq32RJikf3zCF696
         10pJJw8cHO6SCXjPdn062pdMB6bFDZgKCen/UUCjrsf0R5i6AbJZrNE2uweO5Tj5v69y
         EjtXRsDvBoH3GlwSWx/EHB31Y+73dCBV1+aMCishBrqkmCxH63A15dQ9+0/2o4Zh906F
         YWLje6hqPa4pE7PjZhz725zct4Zz8MGr+ZRl4yWGIu9sBDmHwivag4FfyBHlzrVY5Vfy
         ntLJTy0Hanm4i1+quJhomp/CwTF8+smcb5UX+m0YwlYRad1QAjDvvyufXsI33EdUdZPV
         +OIw==
X-Gm-Message-State: AOJu0YycUSktpnGJx/LfFtYDcad+o/10GbIm7W6XnNzrSxF7hLT9An08
	DUBpC4ocEz0HDSUhBlSeBsI+8eglK8MjHhyrdVYxaiOlKASqh0lXe3Q03tkT
X-Gm-Gg: ASbGncsTLKDR4y3mOHWaNcmapI/6adP5AaPcj9U2sOUHftJgV7VLt2NhWzC+S5ZGDsF
	9eI5v7kbQlWEEivzCiWWpaN3B+ph70PqGth6MZX9+ZzpAyzbtWbSwoBpgWLSjFjuejUOmGoZVrK
	gXSZRHvlwzh275NicMcv29UPQnNrhwCzYC11R31iH/X3HaNvs19vCQyatj7P9suMt84uGUemILC
	+F3pyx9CiY6anxmfOGKBUUPriYFEACLr0zqsP51z2lqOCPZNp54twWD1JeYqXo45C1YlNpSPcc/
	WA/961y5281ofcxU1yP8Kr8GVRn9fZAHd9CdEx8Io+k=
X-Google-Smtp-Source: AGHT+IGMvHbbl5zC97vk11rjqGhcp5JgXx0Fga977qTVyJIWMK4wTWg8QIq/K6xfwbBRq8de9WxYmw==
X-Received: by 2002:a17:903:2284:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22ac3f7219dmr43070255ad.21.1744207877971;
        Wed, 09 Apr 2025 07:11:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8af56sm12216605ad.66.2025.04.09.07.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:11:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Use WTF_CPU_UNKNOWN when building for riscv64
Date: Wed,  9 Apr 2025 07:11:16 -0700
Message-ID: <20250409141116.1092802-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 14:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214591

This helps fix the build regression seen with 2.48+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  | 38 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
new file mode 100644
index 00000000000..e4368960988
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -0,0 +1,38 @@
+From: Alberto Garcia <berto@igalia.com>
+Description: Use WTF_CPU_UNKNOWN when building for riscv64
+ WebKitGTK doesn't build on riscv64 even with the JIT disabled.
+ Treating the CPU as unknown is perhaps a bit severe, but it allows us
+ to get the build done until someone steps up to maintain this
+ properly.
+Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=271371#c1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/PlatformCPU.h
++++ b/Source/WTF/wtf/PlatformCPU.h
+@@ -286,14 +286,6 @@
+ 
+ #endif /* ARM */
+ 
+-/* CPU(RISCV64) - RISC-V 64-bit */
+-#if    defined(__riscv) \
+-    && defined(__riscv_xlen) \
+-    && (__riscv_xlen == 64)
+-#define WTF_CPU_RISCV64 1
+-#define WTF_CPU_KNOWN 1
+-#endif
+-
+ #if !CPU(KNOWN)
+ #define WTF_CPU_UNKNOWN 1
+ #endif
+--- a/Source/cmake/WebKitCommon.cmake
++++ b/Source/cmake/WebKitCommon.cmake
+@@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+         set(WTF_CPU_PPC64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
+         set(WTF_CPU_PPC64LE 1)
+-    elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^riscv64")
+-        set(WTF_CPU_RISCV64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^loongarch64")
+         set(WTF_CPU_LOONGARCH64 1)
+     else ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index 6eb80da1dea..58b78b5f282 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
+           file://fix-ftbfs-riscv64.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

