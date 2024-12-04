Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78840E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.8153.1733294984329015187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ibfIsUIe;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385dece873cso2556230f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294983; x=1733899783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1LG29dgu+iVloUukDjZ/pS+1KTmD/sC8S0GnuMJU+Q=;
        b=ibfIsUIeSmPS6eygIn2EjzLt6b/Uea7z/QAXU9Ye1NCRrgfKC87xiIlUqBLDryw3fm
         kPZEkeW8adUqjZVlyk8kBPTuvtIm4cqWVx0/NDmpiBuyXvl6dYb/frcVG1j8o1MPvizs
         FsAKhIVloi17sR1qgXTMf8x32ejsbNqqT6btekOj8b2Z6hwQtWXG1d9PmNoOmd/3M5hM
         c3vGVinuNEzi3+eYyUZHftz9NdJ0XLH471mVBqdEDkigPFv0gsv2tOG00i76b04SMTD8
         EZpa/c0OSbswu0nHclGv2k82wF9wBPD+iRbDbUPz4oD1OJdJKxMh+qFlB0k84VSSrpHP
         0pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294983; x=1733899783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1LG29dgu+iVloUukDjZ/pS+1KTmD/sC8S0GnuMJU+Q=;
        b=swmGc2KaSc5HmftxWRbAdrq3mt5lWttAeWLuAAsjUjhpLLmOgZ5s54Ttgvk5BNhSc7
         ARe7rPmD70ByPyWy/B6doea/nvRkiGjbFqxxGBQRJ/968t1IVy/3e1gqt1PUgYkMULCI
         8Wpljs0cfuJSehdBkTT7VZGEhA6WU+d5k3pco0OYMDoWABW62EacB9C5v0/BGKTOw9To
         miH0AKSIXqcvDBmxkmJBSUZHIZKfPx47KytjVL2avhBR3jCcHrvyhK77JOQXdsSiFV3K
         NMkTytTAPlrclKPebnOnuFkREwf9394yvmzxrWFZgVV7fATlLTsRFg8q2TDmudyOG2wJ
         H3Hg==
X-Gm-Message-State: AOJu0YxYE7TCIE5ANn2cnVk841+9r7bb+hmxv5Eau1WmFI2zMzN+JhqU
	c28hreAFt5Q5+2aJAYW7Ex87inUkKsHfYmrAJIjXIbAUAKapyGpLXdE61A==
X-Gm-Gg: ASbGncu1+2ZjX/dMa3F4Gq+GLfDSK5ImcX1zw+aqZyngulXl0vNxjxN+GuhMD+VlW3s
	u42rHb40nzX1pQpKoSd7nTCqhr8yG8UUPA8KrXXM+AiDmf9Qc34z/SVAXJWsGoUHxPiaWLytL0G
	kpd5WrihoyiW8ipAj3P1bZEngjJOM/4MEMvw1zdmYv00zQWwc2gKNPq18wMaXw64qoHmPbOPCmX
	rohW1KYrOFfmbsN+TyQW81qn1iU3O8k04RP55WY4iVoRGpMLeFmj8ZWCDx+u7M76LQJ+dtk4OnW
	85CRmfMhHiY=
X-Google-Smtp-Source: AGHT+IGombM/vs3O2un9i8gYuXOWrwHaR7zHQmc0duVkG8PETnaiRXMtIYSUlPspybfJB+f+8iN88Q==
X-Received: by 2002:a5d:5f96:0:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-38607ae0e09mr2347811f8f.30.1733294982533;
        Tue, 03 Dec 2024 22:49:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/37] virglrenderer: upgrade 1.0.1 -> 1.1.0
Date: Wed,  4 Dec 2024 07:48:56 +0100
Message-Id: <20241204064920.817016-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208242

From: Alexander Kanavin <alex@linutronix.de>

drm-msm-experimental option removed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-meson.build-use-python3-directly-for-python.patch | 9 ++++-----
 ...-Fix-int-conversion-fatal-build-error-with-GCC-.patch | 6 +-----
 .../{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb}   | 3 +--
 3 files changed, 6 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb} (90%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 3e124959701..f9080d53c51 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From dec8cca59124d7f8796b54902482ceb295a71b51 Mon Sep 17 00:00:00 2001
+From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -8,16 +8,15 @@ its configuration).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 9f91ff2f..2391f89d 100644
+index 10be099e..3bb6eec7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -74,7 +74,7 @@ flags = [
+@@ -77,7 +77,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
@@ -25,4 +24,4 @@ index 9f91ff2f..2391f89d 100644
 +prog_python = 'python3'
  
  not_found = dependency('', required: false)
- libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
+ gbm_dep = not_found
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
index 9c49ee512a9..67dc4989b5a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
@@ -1,4 +1,4 @@
-From 464deabe4d1bfce6b8f414ab0945d9a62b66ddd4 Mon Sep 17 00:00:00 2001
+From bb129aac12c5aa6e2dd371244b042baa82aff014 Mon Sep 17 00:00:00 2001
 From: Purushottam Choudhary <purushottam27.kumar@lge.com>
 Date: Tue, 8 Oct 2024 11:47:21 +0530
 Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
@@ -19,7 +19,6 @@ Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/
 Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
 Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
 ---
-
  src/vrend_winsys_egl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
@@ -36,6 +35,3 @@ index 9d9f410c..8750f6b2 100644
  #endif
     } else {
  #ifdef ENABLE_GBM
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
similarity index 90%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
index 87f25a34610..07abde1c4f7 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
+SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
@@ -24,7 +24,6 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'venus', '',
 PACKAGECONFIG[venus] = "-Dvenus=true,-Dvenus=false,vulkan-loader vulkan-headers"
 PACKAGECONFIG[va] = "-Dvideo=true,-Dvideo=false,libva"
 PACKAGECONFIG[render-server] = "-Drender-server=true,-Drender-server=false"
-PACKAGECONFIG[drm-msm-experimental] = "-Ddrm-msm-experimental=true,-Ddrm-msm-experimental=false"
 PACKAGECONFIG[minigbm_allocation] = "-Dminigbm_allocation=true,-Dminigbm_allocation=false"
 PACKAGECONFIG[venus-validate] = "-Dvenus-validate=true,-Dvenus-validate=false"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,libcheck"
-- 
2.39.5


