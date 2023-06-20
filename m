Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B252EB64DD
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.797.1687275608691675456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nggxLT6U;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-543cc9541feso2645027a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275608; x=1689867608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jXzH/i2ECj7OL016EvKq7IHoeuNFZ4ZbkwFsSOChFk=;
        b=nggxLT6UeUFYEzkcrMzYeg4gyYEYzng+UwWrRuz7hsQ+YIHzCa7HsLNO9kVa/x/0nt
         9IEz52FtX3orCG+bF/pN6uv0mdE498c/LvIcjuQ8OuhdyKoz/MMsuLbKex0aGL3sakX4
         HpAAWWx+mp2VQH+KSvCrq7HdJPGjI+9kN+usXEJKt0/bu5YKVK7HDjzhV6oNJKef4wDZ
         OFpJ3sTZrTQCMYuAoSMdA25TmVFpIw6CGq/XaSAf31I/7z3Z8sGpkVXhOiASMGQbHl6r
         8DQDUYc7KJ64SjijI9O6LFOHSpdGPndCJXmYzmRrR2oiHSMAGN+IMHkMVckhMk5EOyqi
         IYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275608; x=1689867608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jXzH/i2ECj7OL016EvKq7IHoeuNFZ4ZbkwFsSOChFk=;
        b=aofkK3RbEz5d547fXwcy/LnwpauuH9Ar5rKzYtioCm5uNgLrasx/le72atDG8niv3B
         GbASnXUAeHJGCX7XfXjvgHL2ju+I9w7ThjIr0m2lNeeCJTIbavtSB77+QhroPHUVYQ2H
         IihZSOjYhRZcNS/+ZmieULnBsW/EBleub7X9Y7QXmeTM/q06DqlfMZJdKTmAeUXPdjEI
         3URoEzLVv6djM+pbSd0Zdv9mNTveM2sVWYoEd+dJiXLU02j71qSEujUTjKAvQl0kqzUQ
         iNOfI0OyVs1jSD1TXqSqIVZTeXR+AAe03lrCz1nZMgoyDkSLTVQFfzr9ZARr4G/5eST6
         0FIw==
X-Gm-Message-State: AC+VfDwiUC4vpav7ZzYZOfaDthDBj5UEdR7M2BGaKpzsu5GHFhd3Le/P
	gP+WE25CsyIGCw0KBNNNnOelTiYbK5SP63cmRUw=
X-Google-Smtp-Source: ACHHUZ7fRRLpgIoK8cgr+Jw59JGcyfRdRBL7Rrox96C3doxf7TfBlji33Mh4+occ4W/GJzv5ZGt5sQ==
X-Received: by 2002:a17:902:e544:b0:1b6:7c9a:3a53 with SMTP id n4-20020a170902e54400b001b67c9a3a53mr2616820plf.67.1687275607839;
        Tue, 20 Jun 2023 08:40:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] kmscube: Correct DEPENDS to avoid overwrite
Date: Tue, 20 Jun 2023 05:37:25 -1000
Message-Id: <5dec509c33ce3d01fa1cd44408f0ef198dc4f6c0.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183149

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
index 58ce26a3d5..98f110527e 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
 HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE = "MIT"
 SECTION = "graphics"
-DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
+DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
@@ -20,7 +20,6 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-DEPENDS = "virtual/libgbm"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.34.1


