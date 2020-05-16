Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4114.1589589955905372021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 17:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IJVKhTHz;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id l17so5434315wrr.4
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 17:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YdDLRP76R4lvntBNkI4ZDX208Uy0H9p/MqgDfTuf3s0=;
        b=IJVKhTHzY+pp3/xlx8xl+5ug1MC3bOm9QFCKgNvVFw/Qw20hn0bQ8sRU2WZdem/0qW
         9CfqPnRD7QhS7FJllHkJwMtzBIN7EstZifWn5Gb9Enz7GBLKSykpVnBwRfExWOWAw2oY
         24S5CpLLrMt9WgkTbFERSHXu7QZTC8uTZXZBaKvNEHQUBcDv62402jA5406/cbaJ7aMb
         pWjXwGSNyfmk5XgpckGfenrz7PoPyFA6puaPN7HFHL4mm5cKoal4N7MwuZhsUnnkj8f/
         1J6i+JRTlhvg3Uh6vs9hWd4Y+QrUI9JLNFxxpBEdst7wWAa5CrRt178koZq4VWsTaW90
         9puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdDLRP76R4lvntBNkI4ZDX208Uy0H9p/MqgDfTuf3s0=;
        b=myNczEGwvDXHJ1rM7ej1HzBl7tfpQimlHXsS0Ymq9ONd2ZMPHVZQB/Sltp/tA0WB2N
         F9ddTDic9jnQgTn7z86qGGoHvMxm8KTMcv7ZmkyviPnN3FxylI+AgKt8lRb2RRK+GVH9
         n0MYbtBmZzKiK45Old4e2B9JIAvH4bck8Vr8Ge7ge1F2u5D6pfqt8asuuNfSF4e3/X7w
         bO8w67hbOEBSAE91XBk6bwoSoi21JCBCrVeIewEHjDzpuVo5+xPBzFHSV8xxsoUmBwIA
         lJxNUwHqyl5fBi8+9Cyv8fv6gnW4r1xJPF5mqcbXy1evRZHn3MTN54kc7JXrNkKkSx5z
         0iVA==
X-Gm-Message-State: AOAM533wRHmhtbEfrqhdiqVo1EppuEpJSgdJiLsMhzsinRzCauFBieYh
	GQ+ShHSoC358fOxztF2/S4jlHMh/
X-Google-Smtp-Source: ABdhPJxSVejVyv7klEbzVFnMDJFWFfnOsE2hxXf3aKupVkSivC2JwTYr94stvpsAjoDjhbihlK+34g==
X-Received: by 2002:adf:f344:: with SMTP id e4mr6949418wrp.395.1589589954059;
        Fri, 15 May 2020 17:45:54 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g24sm6312035wrb.35.2020.05.15.17.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 17:45:53 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] webkitgtk, pinentry: require gobject-introspection-data in DISTRO_FEATURES when libsecret PACKAGECONFIG is enabled
Date: Sat, 16 May 2020 02:45:45 +0200
Message-Id: <20200516004545.3193719-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200516004545.3193719-1-Martin.Jansa@gmail.com>
References: <20200516004545.3193719-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* gobject-introspection is mandatory since libsecret upgrade to 0.20.3
* enable libsecret in webkitgtk only when gobject-introspection-data
  is in DISTRO_FEATURES
* drop comment about libsecret being in meta-gnome from pinentry

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb    | 10 ++++++----
 meta/recipes-support/pinentry/pinentry_1.1.0.bb |  6 +++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
index 288c715cc3..51596077b4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
@@ -26,7 +26,9 @@ SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc6
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'libsecret', 'gobject-introspection-data', '', d)} \
+"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
@@ -39,10 +41,10 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libgcrypt \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '' ,d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
                    enchant \
-                   libsecret \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'libsecret', '', d)} \
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
diff --git a/meta/recipes-support/pinentry/pinentry_1.1.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
index 8c500dcadc..dc9069b9d5 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
@@ -19,7 +19,9 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "3829315cb0a1e9cedc05ffe6def7a2c6"
 SRC_URI[sha256sum] = "68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'libsecret', 'gobject-introspection-data', '', d)}"
 
 PACKAGECONFIG ??= "ncurses libcap"
 
@@ -27,8 +29,6 @@ PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING
 PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
 PACKAGECONFIG[qt] = "--enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase"
 PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
-
-#To use libsecret, add meta-gnome
 PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
 
 EXTRA_OECONF = " \
-- 
2.25.1

