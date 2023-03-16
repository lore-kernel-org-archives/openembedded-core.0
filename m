Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5B3C7618E
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.5077.1679003133366338282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=klO7Pdx5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so3032845pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro1qdbg7BmcrU+KLg3qJ5LOf1M5T2Q0XNr3VkcYzsgE=;
        b=klO7Pdx5MN0J+4SQYdW4icR5iQwx1/HRHAYiYX81BmvsWpV86ZW241a7bGoOV6YKFt
         o1usBN8u+87MqDWcFZsmkYKTE15SZc6oEyu11+sEJjhC/D+ykPTr3pWZre7g0XcdyPIv
         dybzSWZNVvyU2/34tXd0szpjwt75DapKuR0FuNfnytY8LVH0JjEFNPRlnpoIkKGTJ85p
         QkGxqF+1j84JzFZdS1Tw8E4x9B7+hlY5AaY19I2iI3tyGmEw9KrNJWNLDTc0kyzeJzOZ
         oNaiUbOh4qGWzNq03DMhXBcj0KnI1I8BM9cVTnL4vTzQTzs6mGOoaRXOHlxL7dI+XhOJ
         2svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro1qdbg7BmcrU+KLg3qJ5LOf1M5T2Q0XNr3VkcYzsgE=;
        b=f3F3hFKUHTo2CAMSVrigBXOJlhzrdgxXZxFjXqG6YxMUwpW+JcVA2Asye3OTnx634l
         1H8hbXp3t03mpGegNv7HXWSTn3nXSqSOGHy3tND6gQFtuoFSRMfSaIhRLwPD5U3uLfZD
         1Ho+wSNUVgad7an1Q34u2GXWFkkjxsmK4udJ5CTcpdc0I0cG2a27qIKrD0gIi/r9r3cn
         QVb+aeoxVAjkOYVKCb3K7L9UtWFrSdnEkayhEh3LtNYx5av6AIWx2i4MYdQG8jrPeeeX
         tiGZVLazEwajn+W+TJV5ZqRzXlflscpmgnpJr2azzoqK/+HKvhs2rRK48qwoyyw4idQE
         FatA==
X-Gm-Message-State: AO0yUKVxg51CEliert66zd6vuVsfKi8CSmDyj1QbHJBbO05AuI5X0h8G
	WbGfhzPYR5RMB1a8rVjAo46g0FDWMbdWDUZpfw4=
X-Google-Smtp-Source: AK7set/EWrh9NergmWTaMuvmBvxIGYyHRJ/4/rjTD5mvmoc8VcrLioJB88GrE6EchIhjfSUrqZDuHg==
X-Received: by 2002:a05:6a20:1bdd:b0:d5:7f0b:f2f with SMTP id cv29-20020a056a201bdd00b000d57f0b0f2fmr4871243pzb.26.1679003158181;
        Thu, 16 Mar 2023 14:45:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/23] piglit: Fix build time dependency
Date: Thu, 16 Mar 2023 11:45:14 -1000
Message-Id: <843848cc502fdaf013a87f73871b45a9633f861e.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178728

From: Zoltan Boszormenyi <zboszor@gmail.com>

Replace explicit opencl-icd-loader with virtual/opencl-icd.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0ded85c2e4d0888e459bc98d1c8e55429f542dba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index f758208c6b..4a4e44f685 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -39,7 +39,7 @@ do_compile[dirs] =+ "${B}/temp/"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
-PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,opencl-icd-loader"
+PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
 
-- 
2.34.1


