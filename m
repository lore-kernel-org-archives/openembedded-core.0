Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.22765.1617396405591405590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 13:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1HF/Dj1;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id e7so6486616edu.10
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gUqaJN4mwVW1TRAut3cce5P9I2yW1sqBY9p0vsjlY3I=;
        b=a1HF/Dj1UaPxfsQFmBs3/r8GXhYlaZV5D1ZgFiYfA102jTkoUGv03CdWNq5YWqIh6w
         vceGEeUX+SwmifvR/r1ok3DP9WIx26IhyJ9uBvPUHvcM6JWXMkqFAGRQxN5rOlgBhz7+
         +3kp+sTVlu6EE1fhVJ3XxKqkTsL5Cmsc9b1OL+capDT0aviuYKeYTVoiJw25DUXO6Bmu
         pP2MUhweqXEz76aXwGfBvLz81RwDJw6+A8FLPhnsyFNxkyGKIUGyBVZJD4Qq6iNV9hvq
         943jxXyIBYDpZ8N936/6eVU2L+A2xUyaFFWKz+3Tl3BE7DnN4sao3k313lLColufRhtc
         0rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gUqaJN4mwVW1TRAut3cce5P9I2yW1sqBY9p0vsjlY3I=;
        b=DbsZVG3zYVXtkD3XfQ+QqOiLVdtMUmFMoVMfXA7Vz+2M+yPVodRNWqD5DRlqmTKoPc
         7lnkVe/mzwn+4t3m+oXjRxMvQAW4LT940qGvBNY6Xy70F+x065BqV5V+U5SM7ypgTq4t
         Ybcr/t5kGjGQze9BmCIyH2mM35el7bRpMNO5anj3gzixhfMG4z1LYPridhKioSp5btP+
         pOGrePBFD5GHNxs0Zb2Yhr8j/x79njiCRoFrnelOHrQzGSWgmTelRQv3+KIh9kAtuq5L
         hcoMW68gVxUYkmMG7jlv1ve3L9HKfTiIJT0we2zIkbBNIhwdyPTNJ6VP9BEnmm9nzQj/
         cJnQ==
X-Gm-Message-State: AOAM530pouuw5nzpNUv+WcxkXzLbX+6hGtGzQzcWzkrwyR+7LuZcZePX
	W09cOsNj7x5rccqApzKVmnb7ZwKfrBo=
X-Google-Smtp-Source: ABdhPJx7MR507LYcoq7z++co+FfOjKt5/vC3PWf4IqW+WFYvLFAsTRiQGS0RIIr+c7cNGmv2ZqKDeA==
X-Received: by 2002:a05:6402:17c6:: with SMTP id s6mr2872408edy.319.1617396403994;
        Fri, 02 Apr 2021 13:46:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a22sm5845623edu.14.2021.04.02.13.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:46:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] mesa-gl: Use swrast gallium driver
Date: Fri,  2 Apr 2021 22:46:22 +0200
Message-Id: <20210402204627.207068-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
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
2.29.2

