Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47727C7EE33
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:30:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.115.1685068200385630141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yCtNt2Q1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ae87bdc452so1493405ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068199; x=1687660199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLeAkHfKixzfTHZmPtFMOUnO9s/yqoZxNgCuG8ChUzs=;
        b=yCtNt2Q1iWElucJHim/0O9gqSxxxvPEadY44Qu9bzYXHNR2+eebnI+AoruHTjdanFI
         uuAArMv9vnLw5OMmCVCu+7yXxQrVB4LJdVbaWamnD610jMcEWSIb+7/cGQjIOAHubz48
         pwbLbaJr6KshsGDu94LFiVxg6kLkJ87RV1PtWVxCIt4TYNPqDxc55nnBhaX0sZ7HDhKZ
         Dr+8TETRJ2gTdc146ZRekEQi/UiKnBA7fW2ZgpndVWw55M/VEkd5cN3AXFM4RwgHgnU5
         28ENobq/ovk4/WgD3vrArl8xkvn3CHWz5G2lMw0hmGESAhZi7UBWbMw31RNIrqPUU4fu
         CF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068199; x=1687660199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLeAkHfKixzfTHZmPtFMOUnO9s/yqoZxNgCuG8ChUzs=;
        b=h55j2g/rb3lTNH+8HlwjizD0MB4UdiVTjuNhUJMhPQgvLMzl9VzZRA1Cb8cOXr9hO0
         in0HhZ4pGGMjHrRLBNorsG33ErxjUoACtGtG4AcAPBnzJEJB9s57S9VslJK77xIbwGll
         ETZl+FqLJsZYRtUD2tgLKRZ6orWdpTshUfeejvaN7Ei+4yGlgI13eTDwCz8AEMGGK8tO
         XlhtVKxk5jAw3IlBzU2zns4N6nTVwLzVHWB4h6L5Ma+RZzSgHE7slQ0ad30TlZKBdCUq
         LaDf+eby2gKWg1Q4zKRu4bA/LYXSIx3u7QlOosY+keCDzOzLwse6dbyNOZQUzWohJ1wr
         s1Uw==
X-Gm-Message-State: AC+VfDy4XBMFLyBurYLF22d9YNznpvMvMF2TLFK1rm4mUZ/Gwtd0Z5Cm
	h9gHEod1GZGhvaWxnK8ZhXRns/4AK2FRW+4gKlk=
X-Google-Smtp-Source: ACHHUZ7xctN3lC96NmeaS2rjT7qbQ3v927HyQVCFoAZ/7dCmparD9NC5jvNLv8EHOX/3F3G7m2kCcw==
X-Received: by 2002:a17:903:2094:b0:1ae:3dcd:30fc with SMTP id d20-20020a170903209400b001ae3dcd30fcmr828045plc.11.1685068199533;
        Thu, 25 May 2023 19:29:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/21] piglit: Add missing glslang dependencies
Date: Thu, 25 May 2023 16:29:09 -1000
Message-Id: <5e26ead1ca016d1691dccba1b58060ac853bf0d2.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181753

From: Tom Hochstein <tom.hochstein@nxp.com>

The vulkan configuration requires glslangValidator for build and
runtime.

Fixes configure error:
```
| CMake Error at CMakeLists.txt:191 (message):
|   glslangValidator required by vulkan tests not found
```

Fixes runtime error:
```
name: vulkan@shaders@fs-large-local-array
    result: fail
    returncode: 1
    out:
    err: glslangValidator: No such file or directory
glslangValidator failed
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a3c9c5e2e0..78a5d6248a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
 PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
-PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
+PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
 
 export PIGLIT_BUILD_DIR = "../../../../git"
 
-- 
2.34.1


