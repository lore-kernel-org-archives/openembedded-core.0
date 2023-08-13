Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BED3EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.83747.1691927654596952723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lyk3SlZE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso34439735e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927653; x=1692532453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCddXgiudBFPlCa7YmO1eg4FzLiW//NgflyKmti4qRU=;
        b=Lyk3SlZEQVeB6HS5OOp4lqQyUIYjEBhysfFFj7oSzMAHTqgLUaVHz9LIMoj7YiFxjr
         auce88wgtOXQA2BR+UC41WntfXQq0jIFJULrgoDh4Kn+0OWnF/904pcA0ddYWBGprKKq
         FOh3++XenxJ2We+VGYhLMVP2hRGSH4Q9LEB3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927653; x=1692532453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCddXgiudBFPlCa7YmO1eg4FzLiW//NgflyKmti4qRU=;
        b=RoWxoxIVdolAFtpEt3osPk4c+Dcor19Y6ChUFNia2LYOWVFxx49Jy5IoGhxPVjQVwn
         a0W7IDlR45zwWWeVlQ9GKaJBhG439UAOrWKzYcTR+u204KYNt5STJ09Gyy6akFuRV4sX
         01r+t2J/brK9FpM10TSfGl2CMo7eD7gfhi++8rGhaIsETh0y38RJfkJ/9LoUO5CeuAcG
         HlyveCTckY59Ih2HaFuxJYJs/xILlki1i7tq8PIkRGuZ9N73rYhr7PkHxciw0TtzaTc0
         OzHe9tUHlEftxJsI8z07YE6CEFMo8ZSbLWG+RG3jl5ht1swe4bEHflyLVVUeq1siOSvv
         XmuQ==
X-Gm-Message-State: AOJu0YwURb5hroo5TrT9I2Kww8ljWgaPHZi8cCtxa2OgQPqOuCXksXgw
	xvmzAZIFLgJNn9RmlZjZfdgiD8Y0UI5KCpxyM1s=
X-Google-Smtp-Source: AGHT+IEB5FnSrK/nO1LT+sdnlEyTtiCnl40UqWZgt9bsgB4L4RCOe2zX0Psjt7dZPregvzsrOPboDw==
X-Received: by 2002:a05:600c:3789:b0:3fb:b618:f7b3 with SMTP id o9-20020a05600c378900b003fbb618f7b3mr5911341wmr.21.1691927652977;
        Sun, 13 Aug 2023 04:54:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/8] gcc-testsuite: Set qemu options for mips correctly
Date: Sun, 13 Aug 2023 12:54:05 +0100
Message-Id: <20230813115410.163212-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185875

MIPS sets QEMU CPU values similarly to ppc and doens't support 'max'.
Allow this to filter through correctly to the toolchain testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index a8299fa7aeb..788a94ff5b6 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -53,8 +53,10 @@ python check_prepare() {
         #   - valid for x86*, powerpc, arm, arm64
         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
             args += ["-cpu", "max"]
-        elif qemu_binary.endswith(("ppc")):
+        elif qemu_binary.endswith(("ppc", "mips", "mips64")):
             args += d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')).split()
+        # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) however they either have MSA
+        # or Loongson-MMI vector extensions, not both and qemu lacks complete support for MMI
         sysroot = d.getVar("RECIPE_SYSROOT")
         args += ["-L", sysroot]
         # lib paths are static here instead of using $libdir since this is used by a -cross recipe
-- 
2.39.2


