Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.91954.1597854541669443936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 09:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RMgcpJzs;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id e5so18212115qth.5
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=be1lnc7p8O/tc3t2NWDaGwOTAIe9iOthef+SKXJ8Ers=;
        b=RMgcpJzs/OnjLSSdtxqe7peB0RuAlMLYtYlUXkTO4wkvvLMFcX8ZJr5i2JIJEVx43p
         yPqYkORSx0NDAV5YyVgCrKRMYnJ/HOj3cpqzJAoTIhVa/ES4zHJsthzqJOdP+AqRtioz
         cigWxuLrqx/ccjP3YbexzpU6rPjDDlntW3MIQ153TgWd+bGc7vZ30V4rHwWkubtNSPcn
         IqkSbXXQpKC00iwOP7kpAXGrnqujWQ162ZF03WBvjPAa5iUnua0hXi8+7Ugvf//RMaIc
         loFrSZVEAbZW+wjg72UjEFbnfSwl2Kxl1y1pAbWdydetMpk2PKiq2W3ll5tI6vo0rB8N
         tYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=be1lnc7p8O/tc3t2NWDaGwOTAIe9iOthef+SKXJ8Ers=;
        b=LNofItcwM+22OuaQJfOVICIHTXkWxw989s9x4CXGRLrIfgzOxNSiTp/gTy7UiSS2ki
         BrPvUX8i5V2JqZz28fnNFIaVkdl5Zv1i0s/UTthXSbcQwlRXLuO6T9src/5xjlanpxJZ
         qzdFMdxTkECBDhvRWBUDwZoEt7w0k+RnZACR0scnaAU+ETAIczdq3j+dCmVzJWJZequN
         HSTChaH/53UepaJvGFAVYUSoC1Ui3zfs9nleMqJAj1qvIVewFENUfTcs5GOsyRUatw3E
         LklX+18/g+/fctRsHxUnne8a//6py6R2XJaSVty7vGLzURswx2xAZ9cfcVlExpGDHvqf
         iZHQ==
X-Gm-Message-State: AOAM533RiWpDV4g+ILovnKl6aJ9dWp1iJFKQ20KPnvIwEeKrkrPT6bZE
	SIiu6L8HWnoijkt2Hy+EQqj44SzNFHSqeox0
X-Google-Smtp-Source: ABdhPJxf9yY4Fu2OPKRV7+O2qYMbObmAxNBi5rtSYJLFeDT/yc/L/IaESOkkxqXpI5ovUAllbSzaZg==
X-Received: by 2002:ac8:2a6f:: with SMTP id l44mr23552750qtl.278.1597854540619;
        Wed, 19 Aug 2020 09:29:00 -0700 (PDT)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id i30sm29340519qte.30.2020.08.19.09.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 09:29:00 -0700 (PDT)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH] weston: add missing packageconfigs
Date: Wed, 19 Aug 2020 12:28:25 -0400
Message-Id: <20200819162825.8000-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing package configs to:
	- Select shell integration
	- Disable screen sharing module (independent from backend)
	- Disable jpeg image support

`PACKAGECONFIG` default value is updated to enable these configs, since
they were previously implicitly enabled.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 meta/recipes-graphics/wayland/weston_8.0.0.bb | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index f8e9e15f84..8fef864827 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -20,7 +20,7 @@ inherit meson pkgconfig useradd features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
@@ -31,7 +31,13 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
-                   launch"
+                   launch \
+                   image-jpeg \
+                   screenshare \
+                   shell-desktop \
+                   shell-fullscreen \
+                   shell-ivi"
+
 #
 # Compositor choices
 #
@@ -67,6 +73,16 @@ PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clie
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
+# Weston with screen-share support
+PACKAGECONFIG[screenshare] = "-Dscreenshare=true,-Dscreenshare=false"
+# Traditional desktop shell
+PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
+# Fullscreen shell
+PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
+# In-Vehicle Infotainment (IVI) shell
+PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
+# JPEG image loading support
+PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.20.1

