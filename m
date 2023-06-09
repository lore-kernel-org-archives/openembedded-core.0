Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED14DC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:45 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.182.1686329677506811269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pvmLKyCU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6532671ccc7so2105289b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329676; x=1688921676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YP9LHMBa1TZPPGgShiDGALuLQEiT7HeENJl99qm7ME=;
        b=pvmLKyCUT9be2XPGtFVPVkCcWKDdZHwX89Q2wkpM/Lb2Fq7iSm0y7HfCIKFh3E/oZL
         QP8ZeBw7jEHDDF3caO1VdPtHBug2fQOtZTdW1tL6fS1yHR7X9on8qmc7b3luw3GR2dPL
         YQYC7J+oFmZ4MtZdx6GCeo6Ptj4GBmG4oM1LblqdGl3Qp5wiJXH2GyxEiocjbLILMLRZ
         i7jo8i3DQYHqryt5chHMEAITlRb9n1Cse3zT2NRayu1+16+GYOvhxQ3oY4vtoYqykSNg
         /CkaF3i7B9FGpct6XPyLbuZ5Avev4YfkO/KqK4vX/Gic0xQUhwTrqo7yDt+VcXEBTvKO
         TbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329676; x=1688921676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YP9LHMBa1TZPPGgShiDGALuLQEiT7HeENJl99qm7ME=;
        b=foswEj493Y1YBO5wxZIYmAQ4oxzvQtdw1S4G6neRwROe++qFVALNEi1Ixt1smnc9JR
         v7MKfkzsSSw32EFolhzEbOxk5dBRZxHDVsIVczDPiaHiVU6LpE92jWARw9f3ce/BwxzH
         Q4wLHOgFXMNF080wGSLhW2D7NE3Hy9FCp5axVLxu2UP2W8K0ol8Je4YoUpxmX+S+kfHh
         6NJghNC0TTQMfW8HnZ7h09J/JY2DCE8V2FsZMr3ei3cNlPh88KuLZiTHX4YPRpmNDJ1f
         IXPV22jVU2CjuKmolnaFpQm/rBa7q5WRMxIJB4+sMcFscvXRE+hqQBqV0s3bh3cyfaIw
         iUDQ==
X-Gm-Message-State: AC+VfDwGyCrSMuADsLqiUlHGwnukGCjLLkuC/JHgZENMfSffjqQAv/so
	a3xXIgpZtxt16Eqh2GehLINCmzGZiztIZu2SZf8=
X-Google-Smtp-Source: ACHHUZ66mObnnVNcv1sinSm8hKyPS81y+DdK8GPnsrUqJOcquozgi5WiPLHtVXDF2DNzvJ0NFvi8Wg==
X-Received: by 2002:a05:6a00:1a10:b0:652:98e9:fb1 with SMTP id g16-20020a056a001a1000b0065298e90fb1mr2169032pfv.32.1686329676640;
        Fri, 09 Jun 2023 09:54:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/30] kmscube: Correct DEPENDS to avoid overwrite
Date: Fri,  9 Jun 2023 06:53:47 -1000
Message-Id: <45bd0b8c1256640aef98d497e9d53553a1bd1dab.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182586

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

As part of the below commit, DEPENDS gets overwrite which is wrong
Link: https://git.yoctoproject.org/poky/commit/?id=bd947d3343dcd96e79fc8157f32a2a087cd710a7

So correct the DEPENDS varibales

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63f338255000874c62bf01ccc11f2c100014c3d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index b2c10e09fb..67ac97b963 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
 HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE = "MIT"
 SECTION = "graphics"
-DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
+DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
@@ -19,7 +19,6 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-DEPENDS = "virtual/libgbm"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.34.1


