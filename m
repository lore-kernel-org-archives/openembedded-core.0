Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFD6FC980C
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38627.1774823895417113650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZLCxsB3W;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b9144790dso2053424f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823893; x=1775428693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPELm9+qfceZTCeb7cLui9XU5WzyxjQ+Dkj8uJbr3XU=;
        b=ZLCxsB3WgfIwXIJoEavw+dpJRIRNRZaoLGrW7LiiRya9L4tbqBLpKmPVD3A8jBaY+p
         IBHLf9AAP8zpLaWIAK03YEtbmLdPVfonaRR+1l4veJzEy0LmGK4ZN5EppbRkpsbALO+q
         N0yMkm6ObVTwsP476rQELM576FmarWGXBzLUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823893; x=1775428693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jPELm9+qfceZTCeb7cLui9XU5WzyxjQ+Dkj8uJbr3XU=;
        b=ZF4xvr52FBN0snq43OLLkhG1z+LaS5NHRjkwaHtFZN4d49lgfT1RuUZOxW6vQrhkJ9
         FYAPn8PZUcDYRK296KPYcA46T/o9YKVLSSKiCZsAE3Yn/J8K94u7800ERo2D6C7vEbQs
         uOuL+mIR4oom1+z0LbDshnFgr2cLdofhwv46hhirsot2dCHv3pzul2GcQsSjp+rNnL2w
         vi7kmpk5lgM2lkKQEw/0iMOKKBPeF3Tmr7E+pxBowT2SLDT700zLg7WUTMLC6CnUmPHF
         DzoDKLUyuXXPfCObDIzbVH4KFcOOMeT52TgU4BA5q1x7mDjPkyrx2DijRYJCxQsV5gej
         s7gg==
X-Gm-Message-State: AOJu0YxLlVCArchH3lRD0xo43r/0dqeQRQP8q9DQYGYEdbHdN3iLFzQo
	JMyoD9R1SpjN/8BNoZP+NQrdmawnUDvcypjOrLk4dF2U0O7K14YUg+lx78TZwsrLdf4l1pbjJdn
	4Y1Rv5Bg=
X-Gm-Gg: ATEYQzxgsMWVXFhXi7bOTyRY41TQMutXMp92NaWJG2kUycE/jH12x+8rxtA1KjPX4y5
	6+/f6zG+J5iXAQx9HK1RdxZL7fib3C/x+t8HjtZ8Grsc0FiRt9pYyBeDZ3zDONXxeOv/1d/tLE0
	OUmgNOAezIq+C8X0Y1kFbT6fl80ITszOwlx4hxmtJho02l6KIQbVJl9+v16NbMBDpo80BiRw2e0
	u+T3NE7dAn2ovd3aj4LOQ129n80llPsic5NLUDKKcs2ZgXc25aA1x1flhZb7wIHtBl2nY5OrmxA
	J5G3mtjSykQAH9PsOrpstfdcE5ZNidw89C3djlmRdi60BSA0yGU6s6bim5fDnIfYrpEOWvdGyBo
	nCZ/s1y0r52VxqvW3vyk3OKev3yH1iMvorqt+vMd93Acwlcrvuio3qfXkONQbBKEsBr4l3BENQ1
	NKHHDT94zHWbvMQcpB0e3QLchMBRnQrWwYG1EjYJNdmDYT9TSY2F8Lbuku+3GBEq78d2TVyg+w2
	+rHja6pHGYC/kClJgbLWdAkCJQ=
X-Received: by 2002:a05:6000:604:b0:43b:4592:f91b with SMTP id ffacd0b85a97d-43b9e98162bmr17515375f8f.5.1774823893517;
        Sun, 29 Mar 2026 15:38:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/16] rust: Enable dynamic linking with llvm
Date: Mon, 30 Mar 2026 00:37:48 +0200
Message-ID: <cb0608195e2c2893b4915f4d0f62679afbc1f2b5.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234174

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [Yocto #16058]

A segmentation fault occurs in rustc (e.g. in
llvm::X86ReadAdvanceTable) when reusing sstate artifacts built with
different host toolchain versions.

Issue sequence:
1. llvm-native is built with a newer toolchain
   (e.g. GCC 15/Binutils 2.45).
2. rust-native is later built with an older linker.
   (e.g. GCC 12/Binutils 2.40).
3. The older linker statically links parts of llvm-native into
   librustc_driver.
4. The resulting binary crashes at runtime inside the statically
   linked LLVM code.

The corruption happens at link time when mixing static native objects
produced by different toolchain generations.

Enable dynamic LLVM linking (link-shared = true) for rust-native so rustc
links against libLLVM.so instead of static archives, avoiding host linker
incompatibilities when reusing sstate artifacts.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Suggested-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74ba238ff1ba1e9b612aece1989b828f3a8f8770)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index b9348bf0507..f037bb33715 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -128,6 +128,8 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    if d.getVar('PN') == "rust-native":
+        config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))

