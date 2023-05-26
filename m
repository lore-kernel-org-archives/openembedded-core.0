Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424F7C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:30:01 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.114.1685068197718816885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ifyIm+0a;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ae4c5e1388so2548655ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068197; x=1687660197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8ZEZSSLUuMkAf2HhCUzdXn6FuoOLmaMepepeLv9F7I=;
        b=ifyIm+0azsFBWudEeDa5amQWEKd5Vp2PaoiEnTavlooavqqADPk67svR358vbuAOKG
         01/zb7oUkN3+kKt55hamrTULLGQ5HPFUdqhpbhfCYcXFeKuIgH+M/5mg+xwT002Edl8x
         7jZKptk9qOrMX4X6gTnQvV7gH4c3xrE0gEyqsriO3lDeQKY25M7VLsn4k763u5yVpX8c
         bjgkzmQx/A6khQzc+V8HMqJj+u1Xk6OVY+PJjqVuulSmwAKWWOh4DrmNz/9s5giaqO6K
         /9nL4rQDzALw9tGxLzyguVM7Az139ygnIZJ3TSKni0M3PZEpCR6FjOx33yJeG0RIQ2yE
         /cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068197; x=1687660197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8ZEZSSLUuMkAf2HhCUzdXn6FuoOLmaMepepeLv9F7I=;
        b=QT4OcIxyqrQZSdWikKROW1mFP0d5RJfVUS9JGrqlZVSqjul7Bahbm0c76HLfYcnJuH
         2fP4cCvjpuNOiROCvmxlnmUrH1slvbpqpUqw8BKUjoCNyQsMYsJy6oLJhmESQIOIbIn8
         xpYb01HxEyLngNDMechawp6oThtiRVSHpenHfeV+smgaYX/x5s61QWUB7MR/xfqOZI92
         GJ01YCg+pD0LG+NC4R4/+MYY+RnOQPkcGUf/Dc6hBXIu5jwi8ngEK/kHJlAD95Shyux2
         NZM2z2aCPHgkKyRTvrddkLYVitN/DYIzYp84sc5cmlA/78MgZ1PYa2VkncC2wMll9oE7
         5WRQ==
X-Gm-Message-State: AC+VfDydCX0F3/QwV2Dr+tyZDDpjLDtGQp3bjtwAHnlNf4H6xG8cZk8f
	XQ5ZhE78uR6a7f7hhFzx0LpFa823oelOVEf3VCE=
X-Google-Smtp-Source: ACHHUZ6fqFQbhlaCQz6nNM2oALfyankp7PIj40NJclPS8z3VGx5MevWCyG0uTBEQ/dToeyhlql8wcw==
X-Received: by 2002:a17:903:230f:b0:1ad:bb42:7672 with SMTP id d15-20020a170903230f00b001adbb427672mr994793plh.29.1685068196909;
        Thu, 25 May 2023 19:29:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/21] piglit: Fix build time dependency
Date: Thu, 25 May 2023 16:29:08 -1000
Message-Id: <fadadd3cf258b6d403fdcf537ff4b97aaabb5a40.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181752

From: Zoltan Boszormenyi <zboszor@gmail.com>

Replace explicit opencl-icd-loader with virtual/opencl-icd.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 5b7a206247..a3c9c5e2e0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -40,7 +40,7 @@ do_compile[dirs] =+ "${B}/temp/"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
-PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,opencl-icd-loader"
+PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
 
-- 
2.34.1


