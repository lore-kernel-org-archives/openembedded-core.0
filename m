Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BD4C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:14:29 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.8326.1678349667396617996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oJnE3SMO;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id cw28so3706718edb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 00:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678349665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bT+4cuxmPfeysEVSmpVnqLcC30sa/StqzY47rf3qgVo=;
        b=oJnE3SMOuwOlzPHFmIj5NqgO2QYkPcDYFpBbM43CYFS84Dr+fiFwHcjniADwywNEMX
         rJwvrTGfOcjD6fRl3Hlsi8DDk4HvAKjNEjbElIJEb7GU6ZrJw45rRwz8t87Q3bKW2vfv
         fzoUym6p0PpWtyb3JtN+XNFNl97qOvljCg6eEUytqyPcP/oyuMHrRza5mki3vbNdUcLR
         rySlmxyxvlF5HuSeMZbI2q6SGeKuvpn8LO2wv7RDyHDZA5+ZtpNK5/4SHtSlMH3gj7pE
         Ljz+vnSWEq6PjccewZVQrOBEPRVP6dAJHD3lHNu7b2iLdZEM3ZUSF6PeCD/hP9rgRpvj
         lhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bT+4cuxmPfeysEVSmpVnqLcC30sa/StqzY47rf3qgVo=;
        b=Bm4xlaKrnrL+GBQJoyiI2QOWc2tGeWpX2WT5LvCfFi/EYUrDAl29H/3YVcasNSl2pL
         naMaxtoFIWDpo1Ty6nPljCgOCouOBkkXAgu77YszxZMDX/bf02rx1xsW3dXNqZEY5xl8
         zFNdoExqhiG+SdKoz+0d9j8rPn1S/Ek+ATacA1OvcsES5mpDCh8c42NJI9yVqrDiOl/i
         dbxZav2k5+3uCBeNVp2vT+gWMTxE969hCAM+3LY31QFT0/GlOgi86cRpMqbRV40nAK46
         gvAG5m+5r5TPEjQ8Y1AwYCO6BFejnkSDmiOt6GLhAXRVXISzkGJy4AM37e00O+z/+aR8
         fcYA==
X-Gm-Message-State: AO0yUKUKbP3d5vfkmu3dJxx7cwDEoOZmDsJEXT0oz0J3WhNNtqZ75yVu
	wdxCSMBZ+t3oSR2mBS2Etv9FLRSjj6O4/g==
X-Google-Smtp-Source: AK7set+p68cZLzdOtnhMx7VZTwSV3TUT7PXWWw0Zvw8xrA0/BSmgI+Xl2AmkjcLJK8UGE+9xAUGMvA==
X-Received: by 2002:a17:906:5387:b0:8b1:7857:2331 with SMTP id g7-20020a170906538700b008b178572331mr19537387ejo.65.1678349665585;
        Thu, 09 Mar 2023 00:14:25 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id qt16-20020a170906ecf000b008ea5f4fab5fsm8622863ejb.145.2023.03.09.00.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:14:25 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] piglit: Fix build time dependency
Date: Thu,  9 Mar 2023 09:14:23 +0100
Message-Id: <20230309081423.3208268-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 08:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178211

Replace explicit opencl-icd-loader with virtual/opencl-icd.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index edbca69413..f453c28836 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -38,7 +38,7 @@ do_compile[dirs] =+ "${B}/temp/"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
-PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,opencl-icd-loader"
+PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
 
-- 
2.39.2


