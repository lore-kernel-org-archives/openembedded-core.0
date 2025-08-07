Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A31BC87FD3
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 00:44:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.40241.1754527469955796889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 17:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SfVS9+D9;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76bf3dafaa5so1565151b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 17:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754527468; x=1755132268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTaqZB0XNyUEq0Ma51qNtpIxA0bRuoR6vCewYLfR9VY=;
        b=SfVS9+D9qvmIie6wb/BbAm2k/qEZEnAxnrfJF34ni7xLXg/hp5f8xULpixRU43mB2F
         CCYGFGPKB38scvO7KBvuEqvAlbu6uTLQOFzoJoAlf6sx8e9COfmQaMxCV7FtW38faCgG
         T6U2ZFxyYtxA0ashDK+z6UpZ6J2Vu6P5KPUOwmHoVPyRW6456c++G3QB+cTK4NN+9nQC
         JaTed4+5h37n0vwudz/5+wfQDtsFzpG6/zUl4Cisg4P/PQ9LlfuSMxwORctG7og6Wug+
         AIeDy6nTfQFlLtFjxeT2zVbOVsE0m7EDe3qPY0oLKikU8cuhcPzAM0EFMQbKAQss4+rJ
         Y75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754527468; x=1755132268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTaqZB0XNyUEq0Ma51qNtpIxA0bRuoR6vCewYLfR9VY=;
        b=vkvY720WgX3W24Iej7IYFNwzTJowrgKdOs5RTqSX4w4ABRfjYJ2+WRN6n9VoZMpqxe
         +OGPA0REzDQ5zVJQrSFKiSjXt/cOb+bywW2I1lqZFgx+3dXh8M+RzbJZe7bzgLZmAW6p
         scxYMZEFpYVOrWXO34kQtgmVjF3Q9ZA3T6lOiXOSBGF8GFswW0w1mvJj1Axg+T94vp2D
         7LNahULVmTD4itPUKAHfBkUtPJp9VoFG5SuIIquqxNxl/VRuLxTr1ya6t9H9n0gVlV2j
         AryBmElzr0gGCHKgLRU8GMhNnxisYVj39sNRKnyMM5kkLk5j9OEdqF7fRrqbD8qNy7Ob
         YPgQ==
X-Gm-Message-State: AOJu0Yw0bQWcNWJPh01JeaizkbHoBAN8afLn8dQeZ/L+jdfTCSDksaaV
	0t0p07jpmBITX5BsMNb7madk4iE1twhQA0ReAxFAFQ2T3+zo3rhfPSYfdP+CkNGmDF8=
X-Gm-Gg: ASbGncvbDMe6YegiBtpfcs9dX+PhrKlx01uh6TDNIqSl1Cc9GJlMiRHmLbapfA6CAee
	bexh2Dgfi01UQPGJoSYQGJJaMJLzvKnHENj73HRFCTPe7kvJgUi3BUeVk97E6ITAEz34uOYB5VQ
	ZRD6ILayesK8SEkdo3PQ+Z3h09C/wIbedADbSDbYTPtMKBffoq4N2+BskTLaDslKPwycQt4DSWU
	CQzWhVX2NnB5LmdCYmDv9eAmrzxEwCQ0yr1ooS3GEo3j8F9V0o8QzGkMe2N9jbtlnYTCQIQyE0J
	H0hOMHQn3bsEnk26vh5mRXA216V7TSb7C1QudKsGIjxEka6ieHycNTW0MLazgU8nnStQxPfoNnU
	26kPBJM6jiD5j8agabcZ50w==
X-Google-Smtp-Source: AGHT+IFwvn3aL1o4flZ8aXu49SzeC1J0QoePl+O62bLKdTUHkzL77xHmUj0GIDQO1GS9sb6naZZebg==
X-Received: by 2002:a17:902:c943:b0:240:8381:45b9 with SMTP id d9443c01a7336-242b0640515mr24149595ad.8.1754527468142;
        Wed, 06 Aug 2025 17:44:28 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a909sm167910355ad.123.2025.08.06.17.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 17:44:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libcxx: Create packageconfig for cross unwinder support
Date: Wed,  6 Aug 2025 17:44:24 -0700
Message-ID: <20250807004425.1768854-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 00:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221552

cross-unwinding can pass exception across runtimes e.g.
Multi-language applications ( nodejs native modules, python C extensions )

However, cross-unwinding is not default in libcxx for sometime [1]
it requires special handling at runtime by apps who use it
Switch recipe defaults to upstream defaults, which is to turn it off

This means native unwinding ( with in same runtime )
is build by default which is the most common case.

This also fixes libcxx/libunwind build errors
when enabling TC_CXX_RUNTIME = "llvm" on aarch64 particularly

[1] https://github.com/llvm/llvm-project/commit/85624c5de3e831ffa01fdc2d159e3d69c30de08d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index d6bacc33d6b..b0ee3925f43 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -20,6 +20,7 @@ PACKAGECONFIG[exceptions] = "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DLIBCXX_ENABLE_EX
 PACKAGECONFIG[no-atomics] = "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=OFF -DCMAKE_SHARED_LINKER_FLAGS='-latomic',,"
 PACKAGECONFIG[compiler-rt] = "-DLIBCXX_USE_COMPILER_RT=ON -DLIBCXXABI_USE_COMPILER_RT=ON -DLIBUNWIND_USE_COMPILER_RT=ON,,compiler-rt"
 PACKAGECONFIG[unwind-shared] = "-DLIBUNWIND_ENABLE_SHARED=ON,-DLIBUNWIND_ENABLE_SHARED=OFF,,"
+PACKAGECONFIG[unwind-cross] = "-DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON,-DLIBUNWIND_ENABLE_CROSS_UNWINDING=OFF,,"
 
 DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
@@ -64,7 +65,6 @@ EXTRA_OECMAKE += "\
                   -DCMAKE_CROSSCOMPILING=ON \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DLLVM_ENABLE_RTTI=ON \
-                  -DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON \
                   -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
                   -DLIBCXXABI_INCLUDE_TESTS=OFF \
                   -DLIBCXXABI_ENABLE_SHARED=ON \

