Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A659AD70DE4
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 16:12:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.98895.1732810367113391892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 08:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NKg1WBcg;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso792685b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 08:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732810365; x=1733415165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyhfCWJ2R/lfJPDLLjj5zI2Cs7XhoMFjljNu+vMsiGk=;
        b=NKg1WBcgwXFr7ei6ZNv3JneOTBQMo6T/ZBsc2v9eNpD4KfKYZCucJUSq58jeMfWl4R
         4R8uvLdFnyKMwhKarCPXUXU1NXh0vQkBhVoQqdtGwNhFoo8gltBqxmAFcLpvmD8y2feV
         DQrNFt+WaDOpwE/VcMV1TS7y0l+vy/YAeATEy5T+w101ixDEZZQ7/Qqgztl3NIr1Zv2A
         x6h2JScz5KRfiwivfmFLJoPleFwr7ch2cc2yQ/bIdwB8wNSgPWq7e5Y+76Ioz7zEOkut
         drfgCKSHqhEisVq1Gh/ON9UO+g5M0xFEUX64ltkXhC79YI5ZM+n2YDGKUjZ47MLDocam
         abNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810365; x=1733415165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyhfCWJ2R/lfJPDLLjj5zI2Cs7XhoMFjljNu+vMsiGk=;
        b=a9vMfCXHW8ZxzeRXTTXTnUhX+hubcMqaLaDDb8Y+hKV2JFn8RK6FJigy7hUvAq/Ktj
         ecFTIKSWzBz5o4sdl4TCSWx1tSXsZEDNSaizHl/MXoJLjO6ZrNvFTneyy1kidMa2Z2qV
         9tUnhAnbZEkytyK1GcNNwvIoQACGrayNQX36amrzUF+WbvOx9670b2MmAKpDmNR85Lcm
         pKeMzTmeExlX9gCwp14IZItHxM2Cu0VhamEc26w8LSp+guUN+AUZH14Ynz8AF54/pcHD
         AdErtc14jDpBNtbhRT+yc4GKrRE+IG4ktOtrT16iZKjw5TRbTqSPbd96FHZnWO6A87Vk
         +m6A==
X-Gm-Message-State: AOJu0YwD67BUVpL46gshyxlspoFGcrLds6J9TEsXgV2mJ0ii9FuOTo/i
	EAnE6oUP/6GptfCvOaI1BWbj54GUiRZIp1H1z3WkGYxv/Q/q8esCjuXrig==
X-Gm-Gg: ASbGncuY0Dp8LjNf2G0QJ65zNIVehdMQHsxS7JXmRLFa+5sw011AxZSVu2WQ3WDrl7c
	gH/9NFJG/jmk0ipPjFS4A4Rn1MX9eOd51ijNbai+/z6QFRPI0wJ6ePJFzkZdgBCMStgUw2WAyNT
	iB7fXrcPfP1ZvkC/T4gNOmtViXDWRFmvjkTso4enU5KEkObwx+QQ1uADxMG4HHAuM5KUxmDg7rP
	fzjoIk1XtIEuOlr0ffaHg2ofDPIgKfd96ZWGhgQWTwcOhxddPZiOeyN6BMmkbqb
X-Google-Smtp-Source: AGHT+IEclGyyRTVW0iuiXt/nBQKT7MrKzYK60/TPTV8c5hEWZhQZrmtN+N5O/K53oy+Wmyw+6jpRDQ==
X-Received: by 2002:a17:902:ea0c:b0:1fa:9c04:946a with SMTP id d9443c01a7336-2150107d0f2mr118196345ad.1.1732810365510;
        Thu, 28 Nov 2024 08:12:45 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3e2c:6265:a6b0:441f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f4a52sm15213645ad.4.2024.11.28.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:12:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] kmscube: Upgrade to the latest revision
Date: Thu, 28 Nov 2024 13:12:36 -0300
Message-Id: <20241128161236.1530316-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 16:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207996

From: Fabio Estevam <festevam@denx.de>

Upgrade to the latest revision and remove the patch because the
original problem has already been fixed upstream by kmscube
commit 311eaaaa473d ("kmscube: gears: use only GLES2").

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...rs-Change-header-file-to-GLES3-gl3.h.patch | 31 -------------------
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
deleted file mode 100644
index 415515b908..0000000000
--- a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 38237aee63d671cc418902951b8945b59a41a4fd Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Mon, 8 Jan 2024 15:00:01 -0300
-Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
-
-Since commit 96d63eb59e34 ("kmscube: Add gears mode"), kmscube fails
-to build on platforms without <GL/gl.h>.
-
-Fix it by changing the header file to <GLES3/gl3.h>.
-
-Reported-by: Martin Jansa <martin.jansa@gmail.com>
-Suggested-by: Martin Jansa <martin.jansa@gmail.com>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/51]
----
- cube-gears.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cube-gears.c b/cube-gears.c
-index d5b7a5f..cb538ec 100644
---- a/cube-gears.c
-+++ b/cube-gears.c
-@@ -31,7 +31,7 @@
- #include <sys/time.h>
- #include <math.h>
- 
--#include <GL/gl.h>
-+#include <GLES3/gl3.h>
- 
- #include "common.h"
- #include "esUtil.h"
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 01ea80a142..0fcea0702c 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,9 +10,8 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "b2f97f53e01e07a920761e5d3e3ba22898b794a4"
+SRCREV = "311eaaaa473d593c30d118799aa19ac4ad53cd65"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
-           file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.37.3


