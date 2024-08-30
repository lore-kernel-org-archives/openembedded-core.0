Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51816CA0ED2
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 02:40:15 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.4237.1724985614385678407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 19:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iKWiQgiE;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533521cd1c3so1616945e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724985612; x=1725590412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1exRqSwztQkaPE5KXJNrEzhoWU3QAE+NEooCcJ2/xVQ=;
        b=iKWiQgiEUuqGK5MoiQ7uTdPbTAgoh4OMAl18DaxcbeaXkneuIkGZmZYWYX7HYNmLmO
         yCA+AKRXaDGHtTr4byUygEt2HuxFQ6SFpEllrU2SAyY1z6LekS5vIxk5kBK25YhpuOOB
         ctvzlKA0lQ7z+VirybffLC9PGQ4o/TnHnHJUaH/uJjcpEtZ7IkyeoChxsI85X7z1tLZ1
         NtZ2MaS/3PVYBhtuPjYdJlUjaW3bahhCrb0YMUw45TheJx8w1kYMDMGvFHq90lNbn50Y
         FIC1wRpLhTl6iOfWpQBGLSDP0aIX1vPUe2KABXXoCblyiuCBcbRAFxNbfP+RGzMn4Iar
         yk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724985612; x=1725590412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1exRqSwztQkaPE5KXJNrEzhoWU3QAE+NEooCcJ2/xVQ=;
        b=is2G37uGc1NBIVV3r9wDdWWCOpBhzUsCArn3a/1Neh6s3QCmE6w0GzNRKpHq4ptdEA
         D07WWyIGThCDVGHQZfGTLiEsVf+bAV2Vi0KuacqyoCLuHo0z2N9vY4N+APLjmB5XF95r
         g0N37CUwk7HG3d+13kNYX2GF3Ikz+Zoa/q/YPSS7UxUPtmuOzeS8brBSNmfoJcNwimES
         h+muZU3dMkmRy/FykRp8OhRv5iWfRzKnN2MRM7IZmZ177nEIdKebsqrnUOsT1q1P+sAL
         aWcjqGzbhTI83cA8himW0Lpsdw0OGUPSswHF7nE52uu7MoMpDk0o5brPNfh5lj1+GATS
         v+QA==
X-Gm-Message-State: AOJu0Yw4zHPwvLV3CrfQZb9m7EaUhKGCk6UtBZjy21OuKFHdqhYGkEej
	ZDStq/h6VbD8A7uJCX8ti5qoarm6sQvlKZOXNXKjvkiCutauu/jlCNXEc1WCEbUPYj65W37xiCr
	P
X-Google-Smtp-Source: AGHT+IHhahpoorGLsO4d5YJrozEkvt65C7yA7+5g9LMsOdmeFjBr+K1o8IjdI24ihDNBUv+4yeLAeQ==
X-Received: by 2002:a05:6512:b15:b0:52e:976a:b34b with SMTP id 2adb3069b0e04-53546b33aadmr398926e87.15.1724985611413;
        Thu, 29 Aug 2024 19:40:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540842113sm360488e87.233.2024.08.29.19.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 19:40:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v2] piglit: add missing dependency on wayland
Date: Fri, 30 Aug 2024 05:40:10 +0300
Message-Id: <20240830024010.2655888-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 02:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203951

After the recent piglit update it fails X11 builds reporting that it can
not find wayland-client package. Commit 9662bdabf3f6 ("piglit: upgrade
22eaf6a91c -> c11c9374c1") has added wayland-related dependencies to the
recipe's DEPENDS variable, but it seems it missed the target wayland
pacakge, making cross-compilation of piglit fail when building
X11-targeted configurations.

Pushing more and more wayland dependencies to a generic build doesn't
seem to be a good idea, so introduce "wayland" PACKAGECONFIG option,
move existing wayland-related dependencies to be guarded by it and add
dependency on the wayland package.

Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Fixes: 9662bdabf3f6 ("piglit: upgrade 22eaf6a91c -> c11c9374c1")
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Move wayland dependencies to PACKAGECONFIG[wayland] (Alexander)

---
 meta/recipes-graphics/piglit/piglit_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3a2dec34d7e0..fbf20de176ed 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
 X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
 
-DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland-protocols"
+DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl"
 
 inherit cmake pkgconfig python3native features_check bash-completion
 
@@ -36,12 +36,16 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 export TEMP = "${B}/temp/"
 do_compile[dirs] =+ "${B}/temp/"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)}"
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
 PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON -DPIGLIT_BUILD_DMA_BUF_TESTS=ON,-DPIGLIT_USE_X11=0 -DPIGLIT_BUILD_GL_TESTS=OFF -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
+PACKAGECONFIG[wayland] = "-DPIGLIT_USE_WAYLAND=1,-DPIGLIT_USE_WAYLAND=0,wayland-native wayland wayland-protocols"
 
 export PIGLIT_BUILD_DIR = "../../../../git"
 
-- 
2.39.2


