Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBDEE743CE
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 23:01:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.6274.1695942069616394161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 16:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PH3hoN5J;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5789ffc8ae0so9218541a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695942069; x=1696546869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUMlsfWBeijSktP0Tysgn+VzVuesxST2y7IS29YLQZA=;
        b=PH3hoN5JsdBbgO2X/gOoXMHJMlr1e9BrTNtd3k/y5HMQN9rPy2mBwn/HQQikOgal2m
         8NRCFHRGZVyPIRrl6dcJdM0ZstdyFrClwCDebBKUB2IJyG4QP14O646mJ6EmRurBfCsz
         ng4848Gycw1s5gYLe4yB6DAAKdlOUfUTFcNQo/4qTLrH2qN0Rzo02N1bxlp73zJiXnCH
         Y3YIKNhsZ7BTqWBhmf24y+toZ4IAJZhNn/TY9LhXo1CZYqrsQpE+/hPYNg8MF2Koword
         YD0G1FY0GkdVB5wgRkEZtZ9BKTFzMolI+gVGJReCZAH+JIrxnGgciLH2ZmQNdzK+yqpM
         ktYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695942069; x=1696546869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUMlsfWBeijSktP0Tysgn+VzVuesxST2y7IS29YLQZA=;
        b=uOalMt0lJDVa81JH/Dj86m1KnNBskTXuJ2N6pf3ai1nT0eabiKuBc8yLyh380U3ZIu
         gQ5sljT676JUF+koIg64dDrfqWAECrLBFxii+V+Fh/ZgDBBHIFeZvBgBqon0NXvJu3gN
         pXc0WCs6VrWGlbTEIHaOoy0mMDhaJphOrKGcI3FoXH2eCGSDHd2v0HjSeB+zrkJyrhcX
         DoNldQBr7yz2W3921jsJMqT8+cDq+CsAbuPtumylMaY4VhlVUwBt8InVnmdQYdwK7Xqa
         MMWg3FtADR88W+aZJsy7uNV1ua+BLsTuqAAEh2Z5p64auT2oaJxYXnacQrsV0QmB+4lX
         IY5w==
X-Gm-Message-State: AOJu0Yysv+1bsr5feKiEpwqjGUiGOl8DaOw2YT1J3FJRtWrZWOE+dWx0
	9uoFTRGiqbTLfII/gXk8zXxVDCx1/BrxAg==
X-Google-Smtp-Source: AGHT+IF/MmdbacNUOQI8Sg52oAcpyhPXDYoO9AD917u9zWn8evLMGPcidiCFBYIxKxrFrsHjyrP3KA==
X-Received: by 2002:a05:6a20:968b:b0:154:b4cb:2e8c with SMTP id hp11-20020a056a20968b00b00154b4cb2e8cmr2124974pzc.24.1695942068703;
        Thu, 28 Sep 2023 16:01:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id iz19-20020a170902ef9300b001bda30ecaa6sm15581276plb.51.2023.09.28.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:01:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] mesa: Fix native build on hosts with llvm-dev installed
Date: Thu, 28 Sep 2023 16:01:05 -0700
Message-ID: <20230928230106.1058552-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 23:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188386

This issue is always there, it just shows up with newer LLVM since
symbol mismatches are being found otherwise it was happily linking with
host libLLVM.so silently.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-cmake-dependency-detector-for-llvm.patch | 47 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
new file mode 100644
index 00000000000..3a836ab4821
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
@@ -0,0 +1,47 @@
+From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Sep 2023 15:34:22 -0700
+Subject: [PATCH] meson: Disable cmake dependency detector for llvm
+
+meson dependency auto dependency detection uses cmake and then
+config-tool to process dependencies, in mesa the logic to detect llvm is
+using auto detection which means if it finds cmake then it will try to
+use cmake method. Cmake method works ok except a case when llvm-dev
+package is installed on the build host then it generates its own
+native.meson file and ignores OE supplied meson.native file which has
+correct llvm-config tool specified which is pointing to llvm-config from
+native sysroot. The generated meson.native file points to one found in
+/usr/bin and there onwards detector finds native install of llvm and
+configures that into building native mesa package.
+
+Since cmake detector does not always work, disable it by default and use
+config-tool which works in all cases. This is suggested in below issues
+too
+
+A similar issue is open in meson upstream [1] and mesa [2]
+
+[1] https://github.com/mesonbuild/meson/issues/10483
+[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 00a6953..05815ec 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1659,6 +1659,7 @@ with_llvm = false
+ if _llvm.allowed()
+   dep_llvm = dependency(
+     'llvm',
++    method : 'config-tool',
+     version : _llvm_version,
+     modules : llvm_modules,
+     optional_modules : llvm_optional_modules,
+-- 
+2.42.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 559d445ae5e..4e824500dd0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
            file://0001-intel-Allow-using-intel_clc-from-the-system.patch \
+           file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
            "
 
 SRC_URI[sha256sum] = "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad"
-- 
2.42.0


