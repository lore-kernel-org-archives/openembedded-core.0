Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A9EC3ABC5
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 18:58:35 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.3946.1746644312218733026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 11:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpwspdts;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1fde81de05so74459a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746644311; x=1747249111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTiDUgXMMOUwvjLAgVkEn619T+AyaGnjcbd8AFA0mAs=;
        b=dpwspdtsUMT4s5xVL0yRCqEqUSjJsZvDudWv9ggKjy683h44ky6ctkKM93RUQxDe1X
         Ge0qE5GnkCVVt+lCVRPSCa6wqw7GTmbe5cKdVQ6ABLDQgJTWmcvTByrh9IFxZSaK2M6L
         Ucj2Ys6TaRhqXvacLCkiARJU2q0EesemgQvveXdW9re5fg6RJfFJhlWnzYIeswDuhgNk
         VoFwVywWU0QyLg5dlo1V0p5HaBZzEisEmstgPdkjLeGu/ZGG/thNwm/Ik1NzeNo9m6Ec
         ptTM2KZzRPqj7QXzynMTYD9v4M0qUTgq71ZZ89e6Zc1WLmEWu9msxkTQnPwwIB+TVz1u
         EM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644311; x=1747249111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTiDUgXMMOUwvjLAgVkEn619T+AyaGnjcbd8AFA0mAs=;
        b=eSC5qoZyC7OZEHeHnHPTpcozJyiv/s7xrv2/FIBJQ8w8HZ/YsWlhXjQcC7K+XyxSpF
         2yc+kHGcCy3N0k+UXVIY3D/YBBvGjV7RCrQauSoXXQXGJU3PjyTqZNDMW02vdoitTLcE
         mCEGjCbu22VCrzBCHE3pZKhan+NSsfzBF5bhpkPOV/RQ9pQhTIJ+2fNamJaZCRoVFvTO
         tVgcPwFJb5z8+L/XSixrgR8Xb6jFhJigoCa2S8EM9QqrKD7GPgHUyhvf/YbVKLgyMJQT
         k1+eAZ/1yGPBIw/H148r21h3vcZBmtvbsdnbTBPYU9xvyKAqGHR3lrAqNXSyg3ulJXir
         OMxw==
X-Gm-Message-State: AOJu0Yz97pfJoR3xb45bNUOAw0NWqP56V+/FVgYKYAH338bG9HOEQS/Y
	llECtKBGdQShYWuk6W+0RzMgRd+0VWTAIykW7nf+/7uNWi9v5qF/xunsdglw
X-Gm-Gg: ASbGncs3q9foLhQgmnMPlzvyaoEjKxxW+v1j6pdnPpK18cjxCwhDf2Y6k9nwGWlxJr5
	eW1oYVoHT0Gk8CcANre2nv9UnHj5sfOz31eQoW8JAQO5MQx1hF50ChQbqo8TP2x4Lkb1eCcMsKm
	VCRJrxkUQzt7KgbwHFbS5UiMdPwn/UM6O27nebjU9sHP2rSBvg5FVKZerxrQKDKM+VhqAsM1txj
	W6fA1hzcJqHHvVOM67JDqymGCrX1f7Jhdmfol22/QvSbkxgkV0TgGUt5+uMdtumr6Sb0b8V0L5W
	jfaDetvde3m0xtT732cofXWaCicpAOyK
X-Google-Smtp-Source: AGHT+IFDIfadd/G2kvhoyvoMMOrAKleUiAUXcBvUW3G++YnWxfMzFdR4J3j8JyeSv7kguAH3VTolzA==
X-Received: by 2002:a05:6a20:c702:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-2148be01dc0mr6128164637.20.1746644311327;
        Wed, 07 May 2025 11:58:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm12084705b3a.96.2025.05.07.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:58:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/2] clang: Build limited targets for target clang recipe
Date: Wed,  7 May 2025 11:58:27 -0700
Message-ID: <20250507185827.843653-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507185827.843653-1-raj.khem@gmail.com>
References: <20250507185827.843653-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 18:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216129

On target its sufficient to build what mesa needs + one host target
It should speed up the build.

Fix bug in function mapping target architecture to LLVM backend

Reduces size of libLLVM

Before - 131M May  6 20:42 ./clang-libllvm/usr/lib/libLLVM.so.20.1
After  - 93M May  6 18:47 ./clang-libllvm/usr/lib/libLLVM.so.20.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix bug in function mapping target architecture to LLVM backend
v3: Use HOST_ARCH instead of get_clang_arch()

 meta/recipes-devtools/clang/clang_git.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index c93554622f1..b41b700292c 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -35,10 +35,10 @@ def get_clang_arch(bb, d, arch_var):
     elif re.match('aarch64$', a):                      return 'AArch64'
     elif re.match('aarch64_be$', a):                   return 'AArch64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match('riscv32$', a):                      return 'riscv32'
-    elif re.match('riscv64$', a):                      return 'riscv64'
+    elif re.match('riscv32$', a):                      return 'RISCV'
+    elif re.match('riscv64$', a):                      return 'RISCV'
     elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    elif re.match('loongarch64$', a):                  return 'loongarch64'
+    elif re.match('loongarch64$', a):                  return 'LoongArch'
     else:
         bb.note("'%s' is not a primary llvm architecture" % a)
     return ""
@@ -115,8 +115,12 @@ LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIRV_HEADER
 # Default to build all OE-Core supported target arches (user overridable).
 # Gennerally setting LLVM_TARGETS_TO_BUILD = "" in local.conf is ok in most simple situations
 # where only one target architecture is needed along with just one build arch (usually X86)
-#
+# Core tier targets:
+# AArch64;AMDGPU;ARM;AVR;BPF;Hexagon;Lanai;LoongArch;Mips;MSP430;NVPTX;PowerPC;RISCV;Sparc;SPIRV;SystemZ;VE;WebAssembly;X86;XCore
+# Known experimental targets: ARC;CSKY;DirectX;M68k;Xtensa
+
 LLVM_TARGETS_TO_BUILD ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
+LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};AMDGPU;BPF;NVPTX;SPIRV"
 
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
 
@@ -189,7 +193,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                   -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
-                  -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \
+                  -DLLVM_TARGET_ARCH=${HOST_ARCH} \
                   -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS}${HF} \
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
                   -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \

