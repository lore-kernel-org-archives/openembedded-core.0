Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.1907.1588192108415249286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 13:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NLnr6RJ9;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id h4so4043143ljg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UKGvesV0sq9zheRONGsQx9rdd75EpqLuTXJEnCfqFM0=;
        b=NLnr6RJ9P5TeY9oPdgAefQR8itS20BaUfQGsltEUejVLKYmdP+TaTcDI7rt0Rv0NrO
         /ujmRA6EYspezOLqK3nVzJs0Iwt/X9Chbww4IJIRWsfJKZFrrLSHr88QUPthuOlpKDIT
         6TLjHJw/RkrUG2svzbjk/jMEj5ZUtantYNzLIjgWDB8tVNgjt94F9NATrpjx9nckBIgn
         Kq3cbYHl6Q/tHijXZFT37buXyNx6ISeuC+YUJ6St7rB7dAwqcHqOVqJKdZJYqHnSfFU1
         fm6fIrfLJjB4D2BiPXdaf5i0AtpkDMCczhjcgJhaE3lHNz40TNmbkgamiC2W0z7SgT1g
         Yj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UKGvesV0sq9zheRONGsQx9rdd75EpqLuTXJEnCfqFM0=;
        b=JrBNujsYdTox3MRgRbj3OlbiuyO1n5mtA3iGvAJGk1R/ZbE2+Yuzj+qT+YplYV4vQR
         a8gxoyEBTtsK3AFmXcWl7tWdeLhW6hltnYsVDiAQy5rAWDnTnToxThmG884a3eN5S9Kn
         M1zubWCOIHQLby9+iHA0rA1Nyk0tKko35Y5eA84NvWv7iWyF2l+LzaQr6Q86Ey4kCWNC
         S8zmiXC6/QTcrX4w5vqMWQIWsvfNDGFzN46cl7JcXcMDRTjSsDDj9xlQtkBuvy3IiX/e
         Xhz1U8YXR1HqkHJNjAVNfive7rHJMhz5mELdsAJdtoqOfrk/HGdAQLjClZ37ezcpnvRX
         ttUw==
X-Gm-Message-State: AGi0PubMUjlvGaw9XDId5W2R3FIqjPu597pwTSMpvk17JYuFFXrcqgIE
	hB5yS0wOqZnBOkZbhibH70DmtPgS9aXDcQ==
X-Google-Smtp-Source: APiQypIgQlwku1PXu9tk1JfbTgNgo3rE2Hc9I0AHnXgbihwu1BnAjYd3nMtF/wXIKPNkpW5WeVKI2A==
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr20805527ljm.215.1588192106199;
        Wed, 29 Apr 2020 13:28:26 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from localhost.localdomain (dynamic-78-8-50-212.ssp.dialog.net.pl. [78.8.50.212])
        by smtp.gmail.com with ESMTPSA id a6sm2941933ljk.22.2020.04.29.13.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 13:28:25 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bart=C5=82omiej=20Burdukiewicz?= <bartlomiej.burdukiewicz@gmail.com>
Subject: [OE-core][PATCH 1/2] libva: add PACKAGECONFIG and additonal rules for glx.
Date: Wed, 29 Apr 2020 22:27:44 +0200
Message-Id: <20200429202745.3891440-1-bartlomiej.burdukiewicz@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* glx PACKAGECONFIG by default is selected when x11 and opengl
flag is present in DISTRO_FEATURES.

* virtual/mesa is only required when glx driver is selected to
build.

Signed-off-by: Bartłomiej Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
---
 meta/recipes-graphics/libva/libva_2.6.1.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
index 92cea83bc1..8c495bad70 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -23,15 +23,21 @@ SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-DEPENDS = "libdrm virtual/mesa"
+DEPENDS = "libdrm"
 
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
-PACKAGECONFIG[x11] = "-Dwith_x11=yes, -Dwith_x11=no,virtual/libx11 libxext libxfixes"
-PACKAGECONFIG[wayland] = "-Dwith_wayland=yes, -Dwith_wayland=no,wayland-native wayland"
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
+"
+
+PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxext libxfixes"
+PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
+
+PACKAGECONFIG[wayland] = "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
 
 PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
 
-- 
2.26.2

