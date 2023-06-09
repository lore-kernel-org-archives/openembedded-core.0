Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07397C7EE45
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.175.1686329671161567756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eEU3DBWq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6563ccf5151so2116349b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329670; x=1688921670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SiC3eqND7rWAqlIvp4wL4hzpFp2TuZaL01JBPfvnTE=;
        b=eEU3DBWqtEQ91vvuvZOeOyehYr9EwhYiYhr+/kbZUPVKjd0i2bmqIDfSvZz1/v0aF7
         AunE6s3V5ni5TAMJI8BAjGCTaAXaF9eZ9Tj/FGXoOdSX2m5qs7krd326cB+YBp66iR/x
         N5a13RrtGX0ldINfd1M1u8dubTCT7sd6VdHA/Nu9WrO7FiQdu1xeJVvH+bDGcVRvTV9C
         p+KmK5H0VPqWgHEQtAQAOpWNgatRFZxBdQ/9q2iee5xCajyjY/5NoyBP4ZETmT/PbHJJ
         3+s4at3ZL3u2nf+MOAWhiSUSPL2aigFZDBaotX+4NyZMmAyEWV7aksvw7arjyKuzbBMy
         XRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329670; x=1688921670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SiC3eqND7rWAqlIvp4wL4hzpFp2TuZaL01JBPfvnTE=;
        b=HCdPG3uXHcfD4nfWPsBFZ3rH341BEG9LGgzSGcEpg50wi2rTsfAGWRgV4seS428BhD
         VReW4T9jMkfWJgiJgcP6jEap7w6SOFmO9yJXpnMtEnx4nUm3tEYlHhlwd15DxeMl3NB9
         fKR1t4yZ95PbV32+sI03BmyjhGSHu/7EpXmh+5aP980FIkK48QlBFgUZeA5WjKlae59q
         lTkkraPneva0N4ZwzSSkOAI/AHicUq0o7LPFsXCFskDe8CO92mhgTb3TUqSIdJmAbqGa
         4JBr5/LBeKuErwxlC0KSzdyuP3fiVgPOGojvxU1+q3TT0Lx1+JFxoa0e0/2P+DGEVfMU
         PxHg==
X-Gm-Message-State: AC+VfDw7LhCpOLX1bCJL4aap0GgULF25sL+ozaFVQIQOAuT04ZWIPxDf
	MrYvYMD/LKxrLX5bwAYvsqJ2vZ8qdid5i/yzTIw=
X-Google-Smtp-Source: ACHHUZ6y6OsXxrOaugwLsrlpmWk00YTegTMcAAkcxF4SgiXMniKoWQ5/K9tlCaF4PNOCp9Ejrv3HYQ==
X-Received: by 2002:a05:6a00:15d6:b0:659:3031:5037 with SMTP id o22-20020a056a0015d600b0065930315037mr2335318pfu.3.1686329670303;
        Fri, 09 Jun 2023 09:54:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/30] piglit: Add missing glslang dependencies
Date: Fri,  9 Jun 2023 06:53:43 -1000
Message-Id: <67116105614137ede6c09efc0b1adf4ed34e79e7.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182582

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
(cherry picked from commit 89423cc35d9d2d709adaf032bee8340fb91a3af5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 4353a0a3a4..117bbd14c8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -41,7 +41,7 @@ PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
 PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
-PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
+PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
 
 export PIGLIT_BUILD_DIR = "../../../../git"
 
-- 
2.34.1


