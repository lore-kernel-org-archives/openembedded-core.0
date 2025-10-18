Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93274CCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 07:06:35 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1621.1760771185612579799
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 00:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O1ivBmXF;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78118e163e5so3213667b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760771184; x=1761375984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zwrNWIkVhMLz3JEvADfUNq5Z7W8kPxp6AtUCyZr0GQ=;
        b=O1ivBmXFnhyxqHtfrQEUN71V2YRLX82zKFL+t2XtzSvbtjv6SwZlEhr/bzPJs9TgF4
         LdZf2oF1tGYpDyt4MF0HzKOvEkuhwDyhQxPCZ6PZlICQROpDHA4rT/Tx0B0o2y1gf3ae
         HcNLYbbB3Jv2KlIqGXC1Og2wDXBQGj9bQJCjwBJWTqi6aZzFLzpqsOWhIFGXPkRTZ5nJ
         15AXNpZ3IZmerTlKG5gLcd9D1M4i/S8/VkUFNu/KojlYXoGP2W+DN6FV0v5kAtELzJD9
         Abxt6YyoHssersBmj5bU3ajEkdXu4MDjG3NRp9JzWa130dM5j6/3l39zkVXvK0w8AZp8
         vM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760771184; x=1761375984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zwrNWIkVhMLz3JEvADfUNq5Z7W8kPxp6AtUCyZr0GQ=;
        b=VVbWyo5aqmzAoebQ3xvOnZ7TWEeCrZj1OeFMxvdovHnrKBoLdNxo4CnhcEKvu4Sc1W
         3iPhDK57vtj4fZx4b/kHBIWMHXIqd42bQ8uyBlGDrqe3ghMLDqebe1t1YXkvKZtm82aV
         SI93Ucv8QTkx3diiSpnURJLko46PMX2GVj0H3M035G0QMggsa6j9T8W3yJL0sSMdNBP3
         ZU2QbjyTU/mVIE57QziwT4VVdQF6vdAHvB5EyFNxyii7ki2ncyJcI6VFN3MpH0EcfBJ1
         a3GJL/ZuFfHupnrTkHAlFKU6kfg9+nVh/ChIXkz8Rbhp7JfAZRTE7eDxGAT3cSAEX1J9
         CYTg==
X-Gm-Message-State: AOJu0YyAL/Tx1NXPAY00oEpz2y2XZw+awNFwHMlNJFqN9VL8NJwvRN4t
	V+HmwgU6Qpq7PgL/fKzoue29BYtRXZ+WxV8NNWXjdixKQCIhdxxNPrrBXfY8OKtf
X-Gm-Gg: ASbGncuCNXGvTC5bAdRRb8Pmufoe89ptbhB+EjRLtXczdprCGU8qHeY/3dUq+szbvS3
	K6cxEufUC00z2V97SbxJCNsy6OZS7bq9eUOn0tQyAkK4mpHOqDF/Bgx7Njj3kwvcXW4r6v7rbXv
	hy3aFCINwcOSp7Z8bDPTeee6nXINs74RjirAndx3CYS/zVQb4x/8c5Ks1hOTRzpyne+SRDtHzFC
	Xtpjbj0pmknIa3BvUQNXpXDQ3qLRsHtHFUn96slj4xHoc4Mve8eWhdNYWLdLAMbShBtioGCJ1AK
	pggXhjh1uzvC1x9ZX/x6KvVkKexPBg+nlAwmlhBIxhPxcv+2uxHfezHiJcUh8cOWFv9o5pzMehC
	1wrBJ7uAnX1RNQ1mp8ZoZGvP1tZizKQebdSmzwyt3BLDI6oIXYvLumuuNjSGnZbsLXpvwXSEmLF
	PKdi0Be5HMAk7a9gpwZvLxs4psknaQKduRtETjdKmMhqL9PpkGfCVmfwVsj/nbnbg9kJfAoN4D
X-Google-Smtp-Source: AGHT+IHdVjTwt/nPpniXS1BZVVAlCnuX2hJDE7myrhWS7A7dH8AtXjrjUcyfJbrPeHfaiKlBraqMng==
X-Received: by 2002:a05:6a20:9149:b0:309:48d8:cf1d with SMTP id adf61e73a8af0-334a78fdda8mr9108721637.18.1760771184384;
        Sat, 18 Oct 2025 00:06:24 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a529])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23011088fsm1752792b3a.65.2025.10.18.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 00:06:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] classes/toolchain/clang: Add placeholder for dynamic linker in cross-canadian packages
Date: Sat, 18 Oct 2025 00:06:21 -0700
Message-ID: <20251018070621.3456800-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 07:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225072

clang-cross-canadian is just symlinking into nativesdk-clang unlike gcc which
has separate binaries and they have inbuilt dynamic linker specs. To help clang
built cross-canadian binaries add it via cmdline option here, cross-canadian
binaries are only usable on installed SDKs, and these paths get re-written with
correct SDK specific linker during SDK install relocation process.

This helps clang built cross-canadian tools e.g. from binutils-cross-canadian
be relocated correctly on SDK install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index b4a1c180f6a..9c1204171fe 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -32,6 +32,7 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
 
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+LDFLAGS:append:class-cross-canadian = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 
 # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
 POPULATESYSROOTDEPS:append:class-target = " llvm-native:do_populate_sysroot"

