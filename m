Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4950C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 16:31:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.49489.1710779503854301208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mnHIpGqd;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-568c714a9c7so2154050a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710779502; x=1711384302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZePu+q0a5rAq+Ave42p/yH85AsMFlTV2o8qHLr+FQvE=;
        b=mnHIpGqdOPBF4u0vcIiBG5luImaF0ZZ8FtYvIrBuFbW7o3cOysRgW7/UXZEcizw3BS
         LqUFyj526AFzMlZWEKJFdzYRXK4zeDlmHLcRlHvU8QYeZJRxEVRDPskYq3NOrzcKu6cN
         CJugcLEWWUtS/zoB0ZWYAj2fkwbzouLIF/K/zsYXz+BOcX1UlbcYUXMqCbrVt1ZBJ8rt
         1SGpIV2nP8kmKQC2wUC9826l+HF+UegYbzcLSnNsxAEe9w5/qMTBAU1QMPDH4xoG1SNa
         ECCDTCTEP0EXJm3F6S+19Xk0JHOlrzPPtJRI8CN3vMl556nC9Kngro4m5L+mJzO6QZdH
         3IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779502; x=1711384302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZePu+q0a5rAq+Ave42p/yH85AsMFlTV2o8qHLr+FQvE=;
        b=DmKHEcowHsEV56rDSZL2fbhPmpjdOiUxIYcQqTZPkEX2UGt14RV11tXNW89/JTKj61
         it3duo4nQWd0qOQpwSZerbLgj0WcEENSPRDFMiJX3NsGOvte0kUZRpHCDgb9PRH8S8L3
         2EwKBlym1QAGW0ghcopmv7E9/VYbEtM33GP8fiWGjPjWaB7/HWmW26Hr29vSuorUWvNX
         uD+5DVW3K0AKKhwUYZBCuJT1QMD6VmDH5TrMENOtRRwwo0c9bocgZe/y4SGisYvw0eP/
         DsH2DpoQcEreETZaYFoUeFV20QjSwd7uQKgfL5aLy+sx+mvpwahdJyMYEmYypMQ/NPPi
         tIpQ==
X-Gm-Message-State: AOJu0YxD3zxtJQnXMXTrfk++90RkYSS8mW4GYtKKPudovy+4w53/2r+U
	3h0Aw/16Xe2wSHI6Qnz66xjGoqwIeAnuEO9P3cheOC8LaWr+nd0eFvnwblCj
X-Google-Smtp-Source: AGHT+IHbYq/wKMgkODp3tvhxNcGEF/CobdZ2DzCBzkK4SnIQ0owNP31LxKmEhlivgLe7G09TbdXfOQ==
X-Received: by 2002:a05:6402:36f:b0:565:983d:7bbb with SMTP id s15-20020a056402036f00b00565983d7bbbmr7157037edw.14.1710779502153;
        Mon, 18 Mar 2024 09:31:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n8-20020a056402434800b00567ed79ba53sm4684588edc.67.2024.03.18.09.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 09:31:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] wayland: fix upstream version check by asking gitlab directly
Date: Mon, 18 Mar 2024 17:31:33 +0100
Message-Id: <20240318163133.1268868-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 16:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197308

https://wayland.freedesktop.org/releases.html is prone to delays
and missing entries as it is manually updated; in particular
latest wayland-protocols remains unlisted:
https://gitlab.freedesktop.org/wayland/wayland.freedesktop.org/-/issues/7

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.33.bb | 2 +-
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 2 +-
 meta/recipes-graphics/wayland/wayland_1.22.0.bb         | 2 +-
 meta/recipes-graphics/wayland/weston_13.0.0.bb          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
index c8875cc3cb6..074ea3663ab 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
 SRC_URI[sha256sum] = "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a"
 
-UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
 inherit meson pkgconfig allarch
 
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 657f67fb090..878c7a267e6 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
 
-UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 
 inherit meson pkgconfig
 
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
index 17e4a0cd98d..6aa76063ea2 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
            "
 SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
 
-UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig ptest
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipes-graphics/wayland/weston_13.0.0.bb
index c74f471f078..b728bd0ef3f 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
 
 SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
 
-UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig useradd
-- 
2.39.2


