Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B174FC3ABC5
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 16:26:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.146.1746635175918822783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 09:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUlYs9J7;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224341bbc1dso1185265ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746635175; x=1747239975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3fgiKpm5rEBdHXORUVaeZWt91dZEeAz+HVuIikSGMc=;
        b=ZUlYs9J7mb4P3/jhGME8XMZXUE7xrRnpsZeJ819LO1PUMvYWqmCht86mjPSGI6C5CD
         EiO7GIvqE8Mw4tIWNsx0PG/pTt1XGJtaGJgSa6YZEbhTfqKIjD+yXzFypbtjLRv3dNMC
         nEPwOYxqXsm+kR0dBf/o6OdNvIIne5PAJe/tHTLcC/JBL3HRhdzcTA/MWmizYlP53XPG
         temwoDLIn2oPo77xu1FXxDSx18L0MgkdZUBd/+KKqart9zYKrA3B3+XgCm3GtoEetJY2
         Z9ZVrefiR0Tj/BWLh7EXKUlszUrJZsFvQIymBNMZwj5E5JZzf65yNAhxPiL/gNecR8nS
         6VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635175; x=1747239975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3fgiKpm5rEBdHXORUVaeZWt91dZEeAz+HVuIikSGMc=;
        b=X/hK8BLCfM4OZ0YggTFTmfWM0aCwe7qJL694Hjdh8VLrLbAmmtXPrz7KarERsELrtb
         Bd2jLfGpp0AVuMu7d6PmAAJTGTLXErEtPYyBznuDapQHuelB5ikP+7Cw42ABK3q2GWsl
         6wQEN/HLrAlhitUr1aLsvRfDYquCXYYOI2seLrxyOqUy9Ci0u1WP1G9kfwdGAtfWPhLf
         hnhlnXF6ri7OVDHOh1ASZfGT4QCWZ9/Usrg4CK0C+NivdlX4rNHaQzcoxi5mBqUxN2/N
         NCeiWD14H6lLZ28HsTSgTxfceg2/WKg13Kcq2JZmr97p09s9NWzt5i7SsDmkJPfWQJng
         pl9A==
X-Gm-Message-State: AOJu0YwY3n7zo+bqP0a7n1amn3EWTkTkQwoyKTj6vuBxFfa8qyYCQagB
	YkvRHgXGQ8YkFwgvmZxBEifCG8Utulr73drLcu7ylGqgZeF/tKuT3GVWXsgV
X-Gm-Gg: ASbGnctuFBSHUry/EIb8OZuzy6m96BjC5rrZQSjw2vODGOwNwiBF6y15UqapjGDLCLi
	YdSXvJB7FIFUXx/jUc7HQaLtf/x3YJv98IaxYs1ZjGlGp9G//4iEr3OFuzLCeQicCM1wQX48AZh
	Es8nbtsYyErYAqnAbPOhIgbFqySZJHuKK5inNl6SRKIbq6ehMpiFZymhIPL/yTS71MkflZs46GO
	g5o4zS8BIq7zI5xE6uSKtfGiKtFDPSYuj12XPfgmQ7X1RssWRicAZZNZTA2zK/lEJhXfRCuG+AD
	7NkE2cb6rNeS3eISfjW6okp1tifV269p
X-Google-Smtp-Source: AGHT+IHF3lYHMdSx/K3VaLxROcCLy7ZE5MpX+ffXGzRS9zgsytIVP9e4K7LNkEzd4WwhbDU2i+533Q==
X-Received: by 2002:a17:902:f605:b0:220:c813:dfce with SMTP id d9443c01a7336-22e5eaa200cmr53394485ad.39.1746635174873;
        Wed, 07 May 2025 09:26:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228a58sm96331695ad.169.2025.05.07.09.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:26:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] clang: Build limited targets for target clang recipe
Date: Wed,  7 May 2025 09:26:11 -0700
Message-ID: <20250507162611.1139258-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507162611.1139258-1-raj.khem@gmail.com>
References: <20250507162611.1139258-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 16:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216124

On target its sufficient to build what mesa needs + one host target
It should speed up the build.

Fix bug in function mapping target architecture to LLVM backend

Reduces size of libLLVM

Before - 131M May  6 20:42 ./clang-libllvm/usr/lib/libLLVM.so.20.1
After  - 93M May  6 18:47 ./clang-libllvm/usr/lib/libLLVM.so.20.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix bug in function mapping target architecture to LLVM backend

 meta/recipes-devtools/clang/clang_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index c93554622f1..f963b533104 100644
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
 

