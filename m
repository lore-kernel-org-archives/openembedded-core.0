Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0510C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 09:09:24 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5561.1737783715107826549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 21:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DnpBGD3/;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: haseebashraf091@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso522570366b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737783713; x=1738388513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+88cWU+4uNjD3zxVpD7KhJSyc9+iEARAoOrVE/g9v8=;
        b=DnpBGD3/i/3eU20u+tm3LkXOSmOF2hlvc+TqkzKT5d6XRBdt/spi+76IjtkIqfYKQc
         JDhpObm2QS2tEBiYMmjulr49ZFCiUJvnIvZhzPSam15d20aP9GrtwFvHpTQlW69XHs22
         vecZcx3W3yxHGVGx4Gxr53yBS484DClTNcIi8LMtCA6xcWC16xJi0xX5peaAt+DD9M1H
         Dv2C1RCmEeHNuuDEwB2ktl2GVWhorYrZxKXYtPjvD4LfzFMHxyKw5q7vYVM0P97BSjPc
         PlhOJEiZCMuKj8eA9qGN2fM2cbCEdzCaGBcGyDzAWxdifKQJ2FJCGftzs3o4uIxv/yOi
         pHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737783713; x=1738388513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+88cWU+4uNjD3zxVpD7KhJSyc9+iEARAoOrVE/g9v8=;
        b=Qan6isH6QXgo5xTCx0/zJkbWrZ0keBdK8PbKMOJl1a+A6VT/Eyi3WH7RuSmyEVeU4E
         sYuWvTNx52wu+yg49TU/M44Uflr+OKQv/ZjWBIPYx2Rnk3ltQlTE9Lr89f8Tz5mIoNLg
         l1R90vOB/Q+S3/Xh49BJ8Wm9coi+3MdEF1hBvuSyUwBj0lEdP4bb+WwhVvmJY4LyeTrt
         xvpx+J+OXYsLsVZv92a7oTiJozXdkzvkWKzjGNYS6zdW5NYyliR2I88pdP+59wx4o/dx
         sshZBGzTcjR7ODp82nEcKVoX7aXS1mNFiU/rgctsPfGMbHRtxMUPcGrk4x6BnoPd31KI
         O33A==
X-Gm-Message-State: AOJu0YwCknZt42skru5XlA153wWC51T57ihFapt21by5Tgh1ZitD7iBT
	kfGLJ74sI9iPB/eu2lkxArjzIevP/26AVRjuAhqmPjPjMfKUUSCr8bGcSA==
X-Gm-Gg: ASbGncuvmYhPTzkRCD9+mjexisArADzDgPoeajQFVwvpH1gG0pEz2xsCCpilXR2l6eK
	ska8oag8geSs4vOFDI4sPgPYLZz6ows8KqPqjCSoNEFVawvayzPvfMeCot5NsZ/q2hQPHckfHx7
	rR/1ZqahTL4+XOQTJmERbhEdmpgPm+08IKM5yQvWw27rzDUJKq7fc8GJxxfI9NZb09PBwK7L5jE
	Lg/CsWL9rycIMVx3BzolLely0L+AxLNsy/S5j0Cqw10ufgB+0/9Ttk1MzvgGdmB8Qu29kGf5tfo
	p9eH9rOAvio1wrRo8Q==
X-Google-Smtp-Source: AGHT+IHvcMLlpHiGpjDjlhFdtXmskGrh7WL3t17pheNFmGYqGfEgOdLsw3iuG3FZrwCULT7fUnDtlA==
X-Received: by 2002:a17:907:7da7:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-ab38b4af7a7mr2998905466b.50.1737783712490;
        Fri, 24 Jan 2025 21:41:52 -0800 (PST)
Received: from PKL-HASHRAF-LT1.. ([39.36.41.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fc485sm229889866b.160.2025.01.24.21.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 21:41:51 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: haseeb.ashraf@siemens.com
Subject: [meta-oe][PATCH] llvm: set LLVM_HOST_TRIPLE for cross-compilation
Date: Sat, 25 Jan 2025 10:41:18 +0500
Message-Id: <20250125054118.37187-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 09:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210258

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

The correct way to configure cmake for cross-compilation includes
setting the LLVM_HOST_TRIPLE as well.

Documentation Ref:
https://github.com/llvm/llvm-project/blob/llvmorg-19.1.6/llvm/docs/HowToCrossCompileLLVM.rst#configuring-cmake

This fixes bug when LLVM is cross-compiled for AAarch64 but it
was getting built with the triple of native build system instead of
the TARGET_SYS (aarch64-oe-linux) in my case.

`No available targets are compatible with triple "x86_64-unknown-linux-gnu"`

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 meta/recipes-devtools/llvm/llvm_19.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.6.bb b/meta/recipes-devtools/llvm/llvm_19.1.6.bb
index 003676a652..3efd6c40c3 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.6.bb
@@ -82,12 +82,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
 
 EXTRA_OECMAKE:append:class-target = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
+                  -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
+                  -DLLVM_HOST_TRIPLE=${SDK_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
-- 
2.34.1


