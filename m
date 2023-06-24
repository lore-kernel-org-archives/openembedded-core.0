Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81994EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 05:32:37 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.12119.1687584747312039718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 22:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l00Az5Qy;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4008eba257bso10400411cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 22:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584746; x=1690176746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihRW0VD04Lgxxg5B49ArndjHAfh/c5ERIpE2GOTabIU=;
        b=l00Az5QyEYdWoNu736f2NEAH3emZVqVDPnoycW6e3p0HGOTxV37KuPAEx+t1hOcxQ+
         9b4zinVUeZKYwUjxp+GD6BMe8ZUoL/7U7pPlWt0iPLQfpQE6N0jRLVzjbTT9qr+JY00a
         s09YbDAYQKcDsAJlQV9gFrqPHiCSqi/SImJ7msU0mev6sGAvq1GIRbf7XqRBtZEZnplI
         j+yRUkU5HV+wlRjsoA6YekgxPUW5ZHqXvTZNIXNw46Iz5MTLPqmDOTdlnZYuHqMrjFDY
         P7iiXzpnuHaYCYBS1RNIEvHTgZG9io5j6ahWpip1PS+7kfUVioCcO2gKBrW8e4iNLaTi
         xApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584746; x=1690176746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihRW0VD04Lgxxg5B49ArndjHAfh/c5ERIpE2GOTabIU=;
        b=OoHQFbe6d2kmdgJxgt1c31zNqeoe0RSNr2NBWbq4hnmSWybSamjRgYh55M85RUIDN7
         WEL9Bj8xxNuSB906WtiVFmJFHGZMxaTeCI/vugqWc/MjI83RUkbVWn6oGkY6jvq42mnb
         BLhk1OSjWe9mHbCx+QwnTxGSSIwPl7531HtwDkU0VSR2FbE5TIRBANAzj1a20cJqBjvJ
         0RGAEKUtL+TMIw1GT4i6nVUHic9eon2QbP0LavlzCZ1/eO/6CCFiFYHOQN9U4uw36EEx
         I5siaAeLb/eKmxhppJ0NvNjzl6ANjUyomQoiWv25+Q2aHMwJkNTt9DBnveD+JtVGC+8s
         gXRw==
X-Gm-Message-State: AC+VfDz0tdvhmHNJrF08ebLSqiEahsoLOnnGu5U/lwOwpoLxUvQ/0Wik
	4IqmrdLShOYRsO/+yHKVU7vPu2T8uN0=
X-Google-Smtp-Source: ACHHUZ6kOfBnTZgtdUr+B76MHjIxtIjenxkrqTWOssnraIoR1eO/gy6eShUgn1iJatQ0PG+bNGYk5g==
X-Received: by 2002:ac8:5b0a:0:b0:400:7b48:3c9b with SMTP id m10-20020ac85b0a000000b004007b483c9bmr10449341qtw.29.1687584745764;
        Fri, 23 Jun 2023 22:32:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b0063b6cccd5dfsm353797pfn.195.2023.06.23.22.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:32:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] mesa: Fix build with upcoming LLVM 17
Date: Fri, 23 Jun 2023 22:32:20 -0700
Message-ID: <20230624053223.228117-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 05:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183357

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
new file mode 100644
index 00000000000..3631a918b0c
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -0,0 +1,34 @@
+From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 23 Jun 2023 01:20:38 -0700
+Subject: [PATCH] gallium: Fix build with llvm 17
+
+These headers are not available for C files in llvm 17+
+and they seem to be not needed to compile after all with llvm 17
+so add conditions to exclude them for llvm >= 17
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+index 24d0823..3d4573e 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+@@ -42,8 +42,10 @@
+ 
+ #include <llvm/Config/llvm-config.h>
+ #include <llvm-c/Analysis.h>
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Scalar.h>
+-#if LLVM_VERSION_MAJOR >= 7
++#endif
++#if LLVM_VERSION_MAJOR >= 7 && LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Utils.h>
+ #endif
+ #include <llvm-c/BitWriter.h>
+-- 
+2.41.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ac42a8dd4f3..c988c77115b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-gallium-Fix-build-with-llvm-17.patch \
            "
 
 SRC_URI[sha256sum] = "a2679031ed5b73b29c4f042ac64d96f83b0cfe4858617de32e2efc196c653a40"
@@ -74,6 +75,11 @@ EXTRA_OEMESON = " \
 def strip_comma(s):
     return s.strip(',')
 
+# llvm-config should be the one from llvm-native and not from build host ( if llvm is installed on host )
+do_write_config:append() {
+    sed -i -e '/\[binaries\]/a\' -e "llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'" ${WORKDIR}/meson.native
+}
+
 PACKAGECONFIG = " \
 	gallium \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
-- 
2.41.0


