Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168FFC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 05:39:03 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.2343.1684906737090021011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 22:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Y3U4Bqxp;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53033a0b473so410268a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 22:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684906736; x=1687498736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8T5bDOOFdtThSsgqbVJ6ZUkF50gu7iUYCjHDcvYJ0w4=;
        b=Y3U4BqxpSBCVVBSfT0bxeOfqR7iekA7UU6WqOLrSArVncVYYJkBYaGLCDi6hWB3/Os
         ZIl1mr8HAR3Kl9XKWTyTmhdu/GEPC3LVpHFVOM4NtehLddMCXyT7ail/rALrd7q5kIMo
         K6+XDo+OTKW0MXMSQaRwKzJb9++F0PFOSU+fW6YIx7qKNhkzwOcEu7PYcX+EeLkCUAAm
         pMuIL24hecutujj3eWHhZkUsZ2OEl3NhhxUse7Lw9gnNg14tjyt1RnFBTKIt3AUxn8Fw
         118ZR4jddonC8OBqpq4L8VLojrD2FhRfj5zrL3l9MzMmHI7z4E/ywoZcQIarKsYcuUMe
         s+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684906736; x=1687498736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8T5bDOOFdtThSsgqbVJ6ZUkF50gu7iUYCjHDcvYJ0w4=;
        b=eRDxDNnWuTB31xena2mZ3KhKDIg1xUrKrnEd5hAarNxLmV5LFklJSZlnT0fGUoBcoq
         laqlku5QHeQFaYoete2a68dCarYXGFERhZ+xTccC+/p3/RRshVu8yoS/Ss+X/EVGSeOj
         HMdYYSzP3Cp5caqhp4u9pOPca8iG9DUJsSEemFumFYjoTGyTl892wmedOQq0WoDq2KOG
         vq108RDR0D58J7wzn0U0lstRe7Xy6xtXPA+mHxfBg9PXD6UfnA90lv4kqNWmw9ZbzTDZ
         wPDR4DMFVNROQscQ+80jVylzEHX8VjozgVvPj8MRv+zoZku7dXcSeYznGwLiVQq0oeR0
         f86A==
X-Gm-Message-State: AC+VfDxZUIES36MgbeZgBW9n44kMc4t/+dXTc4aHc7Vf0fPCB8V8mQVm
	6895lWz7ZK7BaxC7N4uKaPqIEdjMe2E=
X-Google-Smtp-Source: ACHHUZ6lA2+O2TdO3SQuaR03pCZHvUXGjRwnead3ldY8nqt4gUi/jBEOTBzAiwLWmEDKqCYm6NjaXg==
X-Received: by 2002:a17:903:481:b0:1af:9b8a:9c7b with SMTP id jj1-20020a170903048100b001af9b8a9c7bmr11294884plb.47.1684906736120;
        Tue, 23 May 2023 22:38:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id jh12-20020a170903328c00b001a19f3a661esm7696421plb.138.2023.05.23.22.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 22:38:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm,mesa: Drop MESA_LLVM_RELEASE
Date: Tue, 23 May 2023 22:38:53 -0700
Message-Id: <20230524053853.1944472-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181658

This was needed to use provide different llvm from meta-clang or other
layers, seems unused since meta-clang has stopped providing a versioned
llvm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 --
 meta/recipes-graphics/mesa/mesa.inc    | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 71bc1a022a5..a49965668ff 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,8 +14,6 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PROVIDES += "llvm${PV}"
-
 PV = "16.0.3"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 10efff96f0e..439389fb8a9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -52,8 +52,6 @@ ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-MESA_LLVM_RELEASE ?= ""
-
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
 # here we assume the user will want a release build by default
@@ -178,8 +176,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
-                               elfutils"
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 
-- 
2.40.1


