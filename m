Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABC2C54E5F
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.14865.1709739729335774404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apcuUFvb;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso1192004a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739728; x=1710344528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGMOFF2rqgPZ0LEFHnxpKnPAG5IS+XagTuD9oMy+5u0=;
        b=apcuUFvbkD80wFVHw/k2X+rzs2RkMtD+lYai1PHmPnXX8sfds8mZgiEbTd0vCGlQTr
         adrp1Jaz/XHov/SRySaMPF6P7YwrBhbh2QsxJb6OZoS33fjk3uFxKficW6PGTFLTOhC7
         iul0xxGB2Y6B8a77ECS1EhUf6Rdvnrf9RM5TS0u3Cvg/tTS4+Bdm9RLluFD2dWVhqOcj
         +nw2jIuLNxm9y0U6Ky+Ncd+4nDWwdipae6Syl6ojTvzwGeiYJU1Z3NSO4wPklrYBdREI
         W5H0afvX64eqkzBsWW1S2zeT+tYz1F3JzuSTtusjDUm7xXoxYNB8qFPy8eqJeEgpbJH5
         VsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739728; x=1710344528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGMOFF2rqgPZ0LEFHnxpKnPAG5IS+XagTuD9oMy+5u0=;
        b=Ek3c5kQUXfyIMIPd5T65ec45nvEh6GV2JMH2c3eWtmTDnzHoxnfUBxC+huZ77I4LRo
         m87fkfFalSbqLrV+eCuDJcq1c+XyI+W+l0Yh83hwzu+6VzTbmAzv6qLLr1clKUhHzgBy
         SOc+xLsC/Pjxabwmvxf6xPVp1BMwEMtzx1ldyp1wt7MltbfGU5QcR4AcTUxDsBofUNKm
         NYTCs0zXfj9Y9iowE2BizAFixoG5e8egzI+shycSaTm5tb+v3pXtL93q+n+E1k6Eu/PW
         PQBvLggDhdcU/yGFECIj4CObDPCZp41H2/Kj+U+tezboEsuChsNF/FOTYylvMHytQ2A7
         bKjQ==
X-Gm-Message-State: AOJu0YxMXtljwi2/GSt+W7zlB/kDzYtmjzrwv4nFbYEG2JV3yp7qlcft
	dGqVXiiq1k1OiY2nwwJbu5XmLEN9mIKgVmacn/uiynRMsZJElxaW8reiS/qd
X-Google-Smtp-Source: AGHT+IE95IHgRk6rP5lxDt43OE01NONnyllRD/FRQHMXkRWnwsxCkD98WU/ojdwEkF9C3ZMgpHwt0w==
X-Received: by 2002:a17:906:ad9:b0:a45:ad2c:6f57 with SMTP id z25-20020a1709060ad900b00a45ad2c6f57mr3210988ejf.56.1709739727608;
        Wed, 06 Mar 2024 07:42:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/47] kmscube: upgrade to latest revision
Date: Wed,  6 Mar 2024 16:41:18 +0100
Message-Id: <20240306154151.3741709-14-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196697

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-cube-gears-Change-header-file-to-GLES3-gl3.h.patch | 10 ++++------
 meta/recipes-graphics/kmscube/kmscube_git.bb           |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
index 6843a662f46..f8608d46769 100644
--- a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
@@ -1,4 +1,4 @@
-From 0651c4edc9909832ff2acbbf170268f34e36616d Mon Sep 17 00:00:00 2001
+From 5f54f067da7ee24a61d6cb41e0636383729e2bad Mon Sep 17 00:00:00 2001
 From: Fabio Estevam <festevam@gmail.com>
 Date: Mon, 8 Jan 2024 15:00:01 -0300
 Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
@@ -17,17 +17,15 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cube-gears.c b/cube-gears.c
-index d5b7a5f9cbef..cb538ecc4aee 100644
+index d5b7a5f..cb538ec 100644
 --- a/cube-gears.c
 +++ b/cube-gears.c
 @@ -31,7 +31,7 @@
  #include <sys/time.h>
  #include <math.h>
-
+ 
 -#include <GL/gl.h>
 +#include <GLES3/gl3.h>
-
+ 
  #include "common.h"
  #include "esUtil.h"
---
-2.34.1
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 505acb024ba..19bbcd195d2 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "96d63eb59e34c647cda1cbb489265f8c536ae055"
+SRCREV = "6ab022fdfcfedd28f4b5dbd8d3299414a367746f"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
-- 
2.39.2


