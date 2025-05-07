Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2D6C3ABC3
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 15:04:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.795.1746630240547806776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 08:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3o75L6F;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso31120b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630240; x=1747235040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18qpU4xPLuqYHzewH/3D5tPrutMkDr8jdarWtUWnLdw=;
        b=S3o75L6F5f3uEpNDq8/IbjAQVzbha4yqMLQEewjCVA8Fd1haz/e0lNGVMJlSe7sldc
         l7LQZDpdVJIvtK7W7W72ZRvKrYl5xy4FLa0JxSuwEwj2gQ/nLijzljcVLWmvUBGUtEfp
         b7z4PxN6GDhwP8ajSwlSeCQHif55FqNV53gGwIXzCos1MvbrADU9vUQ44nBUwrrbLDYv
         fhwdhXHuxc3mXFiAH+veCgKjneRK8UENJ+Y33V0wVncW6Pccrgkzl4xuK/ZX4tf9QDYn
         JepGYSiulAS0s7yuGzTh92GlzUbNbCN43UAC0g2Mm/Gj4gaOVCp6biwjf9yFuZhXP/dg
         QhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630240; x=1747235040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18qpU4xPLuqYHzewH/3D5tPrutMkDr8jdarWtUWnLdw=;
        b=Dc6plqQI/o0CfvfymYQjIYoF790DEGSk50od2FiMryv0JrNgkqET++WJK9r0lKOiNd
         OyD16Sp5hRSSreIjttSNsznr/CAcE4SlpEgekRa2ISu2exG4KmbJPZkd/CK3FV+36btq
         fTRyUsQsgh5DRTPxcbRNLuwGo2dHzQSA2JBprB+qR9s+cIl7YW+THL7lwb/7Iyl1hWnw
         Hg2oiikRjXhygtwQwhTm401ln4bAM9HAj2yCZjRll/POPL+v5khwbY2XDKu+U+DvKzmv
         ZTqqkupIiOv3PmUs5JXUESqzE/+spmUc2rm6iYxij809jo33me4+mNgzcdduVLqFMAuY
         K/2w==
X-Gm-Message-State: AOJu0YzIj5eoVSYaxMzrlOxFy0zQjljz2l80QkWUgblUxfMjg0HANzDO
	DzbgfBi/QttNufre5h3S/c+K7xRPU/1aZP8wOR1YYaL4BxMCF5ELi5GSNJtt
X-Gm-Gg: ASbGncv7ZuQtarqN55E+UPD2SRQbqfwom91qEqb/6wBEodPJZSqe9uuST7OILS7iHIx
	O0gLf8GEaqOp5VY5FJ8gQKcK0452cqxci7gJLW/BKAu/j5CdPYeFYhV2vtX4rvJB4MwkB57Gl9L
	7E9RuUflyTIDPgEGYwNwfQJYROj5Jx73ynRRoZDWWFgnKcZVpVeFSUHTB5x2jUouI/hlaCl34De
	wURjdv9malFaa1pZ5MpWVreTKzak//0w0elqvEvgNLkAw8U2z4t3p7K4YHJqQftgZgtvophLt1a
	FlXXTic0Lcx1s0nnURxLE51jtuAIaPwU
X-Google-Smtp-Source: AGHT+IHx+U3VMblAh1dMCrybNe/mu9KYKakVHE5W7nrYxtOJuJDeVELp9Wp+90gtlxjD28DzMudq4A==
X-Received: by 2002:a05:6a00:3cc1:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-740a52f96d6mr1514005b3a.6.1746630239690;
        Wed, 07 May 2025 08:03:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3f297sm9643417a12.58.2025.05.07.08.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:03:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] clang: Build limited targets for target clang recipe
Date: Wed,  7 May 2025 08:03:55 -0700
Message-ID: <20250507150355.1131830-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507150355.1131830-1-raj.khem@gmail.com>
References: <20250507150355.1131830-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216117

On target its sufficient to build what mesa needs + one host target
It should speed up the build.

Reduces size of libLLVM

Before - 131M May  6 20:42 ./clang-libllvm/usr/lib/libLLVM.so.20.1
After  - 93M May  6 18:47 ./clang-libllvm/usr/lib/libLLVM.so.20.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index c93554622f1..21d2c41c67f 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -117,6 +117,7 @@ LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIRV_HEADER
 # where only one target architecture is needed along with just one build arch (usually X86)
 #
 LLVM_TARGETS_TO_BUILD ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
+LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};AMDGPU;BPF;NVPTX;SPIRV"
 
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
 

