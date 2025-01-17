Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F7C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 12:27:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.9612.1737116859344850079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 04:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=APDUe8B1;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21631789fcdso39543115ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 04:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737116858; x=1737721658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZmLVUDnZDP4NQhXNdXka0l0aB2dqHkRPDHC3UN1o8s=;
        b=APDUe8B1CUFEZj8hBqpL1MRz1rqTp3K7I9XJBAnKJu0gUDBTn8kHsIoczqeJ8bznFJ
         xoClsYplNLFY10OCni/RtcQSygUkaEKjkF6yJVRKiOHoaIzP61b4BuoiufNbp4LMt35g
         FWXVGEnMZVdybEbIxi9z5Aux6wM6Nut4exF9Pqmq0BZCG+7ehjlIbP/KtiN3SeycEkrK
         6SYso2NbfKgmbzgzjFmAq6TBFX64F5N3zhUxUzT7Z5PcjeieNIUU0Y94nos6M0eHkxWE
         m/Pr2nvDFIHMxBfFEnBbbnd0JVw8kGVusa+Ft6y/nk77uhWxBK8mQB9Y7YXYHnsqQu/f
         e2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737116858; x=1737721658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZmLVUDnZDP4NQhXNdXka0l0aB2dqHkRPDHC3UN1o8s=;
        b=NpP+p8X6YXyoIm/r3EhN+YWpYOXblcYShZ1x8ZcRtp+X0zhrodlhrHXiTPRvrQF5UW
         YDGwdv3hsBuN8sjn1py18sltmotFfImtR1vheeni4gUlNETCpww9AmCQ5ePvODdeHpHd
         17aJDVOYnwue72VefB5e5NKFN0OGZQbmtGEvdsA+ZBEsi9bIx6qjCLvnwUDGZGMdVgrL
         iseIqAHJZbQP3sM4Rjqo2MsVL3TRJLzwWlzOH76LW0JUIAWhOUeT90kEoBfrUGBlkX2d
         ErmfTZyRb9LUq4ZL+TdinRN+cBAY08SwgQfr3uK9zU8ZvS4JiLfPHgThn4H3aPhXVpcw
         BFMQ==
X-Gm-Message-State: AOJu0YwTMGS1TduOtXzMEcEkT1BR74QwtkjP9/bV0yh5xtY2PglaKIXW
	GeeSMY/0nQWowWX1cFWT8sOxoJ4pkH+El7OIBr+yCe6gPuGTUwbGsrkY7A==
X-Gm-Gg: ASbGnctATOZvTrQdZGGrhCEzmTujwe8L0oOZcVBKe1Wlw2uGpJjxDE3UuEb+bYDzr/i
	3QfyHFCEeyYFZWfSYRcytIMLMfmUiwVYFKOFzjX2ZaUOokrpHCKeFoxaf3UaVrcQf2pQT7gJa57
	Hop/iS4Ct3D5k0XI7TTtEyKDmHfESge6ymQFayMB+kPPLeBsIXR1pgP+YCiJVAZom8kwrHvXVde
	6RRYwTcwt1NI0K8C63HHRxdZKiMnpvCvJBYkrphq0sdYsCUd4iIO5Q/fZlx2mc/PXmF1A==
X-Google-Smtp-Source: AGHT+IEiDue6tCFdY6DBq6oByuOtLL222r+rN/y2Gtl8aw3cdCQcWO3YxLXBHGLbnJssWDwprwMT4w==
X-Received: by 2002:a05:6a21:78a0:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-1eb215cb14dmr2975616637.3.1737116857718;
        Fri, 17 Jan 2025 04:27:37 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8cba:79d9:1c8:c78b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab812f21sm1743045b3a.43.2025.01.17.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 04:27:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] piglit: Upgrade to latest revision
Date: Fri, 17 Jan 2025 09:27:32 -0300
Message-Id: <20250117122732.2403018-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 12:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209987

From: Fabio Estevam <festevam@denx.de>

Upgrade to latest revision.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...1-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch       | 2 +-
 ...1-tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch   | 2 +-
 ...3-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 75c2d2fbfc..c7e6a68e23 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From db3a33a91ce0a28f297fe270167cf2d0a44354e2 Mon Sep 17 00:00:00 2001
+From ae76c836d98320dacb00616e19af93ac20c48825 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 22dd6c360a..8b7da9f43d 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 6559f5a7d82d411eb035f9d7c5dfb9987182803d Mon Sep 17 00:00:00 2001
+From e1d84dc54b0eca3cef1136264dbbceb9ea19524c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c9e7fe1e96..d68e9d477d 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 8320c2ff5793a612aa7d7223ae317657744169f1 Mon Sep 17 00:00:00 2001
+From e23bacb04ff77f86e56d6684451e5e93b59f1b0a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index fd085da220..a934d48c56 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 29033f323d870552410c31d1e3721304b8a38e99 Mon Sep 17 00:00:00 2001
+From 6810358403b2de577d76cab80a4e39da77c5c442 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index ce1ce12a07..fa9cad3687 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From ddd12c056bf05f80ddd728750a519bc502d55f3e Mon Sep 17 00:00:00 2001
+From d18b10cde60f209375e79db480c46489d483c7f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 829cb7730f..c4091eecb0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2"
+SRCREV = "631b72944f56e688f56a08d26c8a9f3988801a08"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


