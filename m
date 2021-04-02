Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.14634.1617362181109020739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 04:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovwKwdCQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w3so6998419ejc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 04:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kf6E6ZeBQa7qrd65awmbrY5IuWEPxbyacz3bNNNwRYM=;
        b=ovwKwdCQOHvK3JBh/YnmZ7/swqpC2wYSc9Yade5hdRSEdUIsflkVwFvPTPB5FbT7u8
         gTb6O2dlMOGPTfK0I9feeMGt7w/L/OxPiLR/vumBHrOxx6KTkrQITThYhv96VDK8udqm
         ETehM4UvHU70ZiZgAgOFp3rWWD93ACB1wRt+1ByOiOIfaKi1X7DEySNH5KnoalxN91so
         fH/uBuwNuc2g2zuJBvfI/Lk4f77eP2obtBP37HbX/W/IHLV1BQ3m0jrwOZx6LaDCfxCU
         48TYGvCuYVN9JLPgV52VAwkq1rBbNtxHgPx3jO4quw06JpuZxiZs10TIyD+WRYLm6q7J
         gkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kf6E6ZeBQa7qrd65awmbrY5IuWEPxbyacz3bNNNwRYM=;
        b=XnR4ayN4/xnzzB+zJESrvJDzcYiveT1V6Q03Lmaog8TAG0CC3mqLWzwdIsgoO1gktg
         Yh2UjD2bz0/zF4TNK1R65VH/0UDZYAWmYaRzAgHp2DXNprtaA6O/x0w8IsBjJHXiYpje
         wUBS0QfvY+ATMedrXdLa2P7nMirj9lIfIsWE4FJr2jb3J65K0IMGizAG8invDEENYKTQ
         CXogW7DOECKjN90aMSOPx43AB8tl3cvoopjjuuCkPVAgwZC9Pezd9fybHqxJMfgbs7U3
         kGqLODDxF9yfCG31IhsqYrTfhNHAPXbgVNnSzFMADG8kKp4PaVgG88Sqjs5Pe628rDUC
         b+7A==
X-Gm-Message-State: AOAM531i94nN9Ox5nVgCGgWfKg34SLJLEGWIl306WCsI5CjzL49X6kTW
	GiBPdZeUUu0ULZiUXO+HWLO921F+0Ng=
X-Google-Smtp-Source: ABdhPJxpas/eC+OuEP+BvKEBZA2huHQoWFelb5LB1zD7tpIkLAqBXktkAUYesUZkQd03d88Ra/Uv9A==
X-Received: by 2002:a17:906:3643:: with SMTP id r3mr13251046ejb.527.1617362179469;
        Fri, 02 Apr 2021 04:16:19 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bm10sm5393101edb.2.2021.04.02.04.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 04:16:19 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] mesa-gl: Use swrast gallium driver
Date: Fri,  2 Apr 2021 13:16:15 +0200
Message-Id: <20210402111615.935592-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <16720308F4B6A8BD.31642@lists.openembedded.org>
References: <16720308F4B6A8BD.31642@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Fixes:
../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in allowed choices: "auto, i915, i965, r100, r200, nouveau"

with any driver enabled in DRIDRIVERS, do_configure fails with:
../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building dri drivers require at least one windowing system

even after enabling gallium and wayland PACKAGECONFIGs, move DRIDRIVERS_append* from
mesa.inc to mesa recipe.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 9 +++++----
 meta/recipes-graphics/mesa/mesa.inc          | 4 ----
 meta/recipes-graphics/mesa/mesa_21.0.0.bb    | 4 ++++
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
index e50782be1c..dff79f0be0 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
@@ -8,8 +8,9 @@ S = "${WORKDIR}/mesa-${PV}"
 
 # At least one DRI rendering engine is required to build mesa.
 # When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
-PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
+PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
 
-# When NOT using X11, we need to make sure we have swrast available.
-DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
+# 21.0.0 version fails to build when any driver is enabled in DRIDRIVERS
+# ./mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building dri drivers require at least one windowing system
+DRIDRIVERS ?= ""
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e9b72ce063..67b0835d9f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -102,10 +102,6 @@ PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
 PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-DRIDRIVERS_class-native = "nouveau"
-DRIDRIVERS_class-nativesdk = "nouveau"
-DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "-Ddri-drivers=${@strip_comma('${DRIDRIVERS}')}, -Ddri-drivers='', xorgproto libdrm"
 PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb b/meta/recipes-graphics/mesa/mesa_21.0.0.bb
index 96e8aa38d6..d578c75e39 100644
--- a/meta/recipes-graphics/mesa/mesa_21.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.0.0.bb
@@ -1,2 +1,6 @@
 require ${BPN}.inc
 
+DRIDRIVERS_class-native = "nouveau"
+DRIDRIVERS_class-nativesdk = "nouveau"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
-- 
2.30.2

