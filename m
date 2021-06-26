Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.4925.1624701276374339117
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jun 2021 02:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dAeJwkN5;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id he7so19305915ejc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jun 2021 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0bIcvTiNlycxAssTlBUYXYf9u/vJLBi05bdynBGlR3Y=;
        b=dAeJwkN5BYkaxLQB4UYz8fBa/5UDnyGPPbYmKyOR9Z+mn8qk2yra2vFPBoeZbMGphj
         vMX9Dm8Ay0/d9NBUqMykUGJkn/WhTe6WGtUSZ+QZ2HgAuKAmFLGv6wMsb3ueDEy16swQ
         ZS9rfQT68WWbq4n+k+DmtD+ng8gvxG3pelsrEKFCbpDNqw6ZeO84P4VI3FJVX4rm16kU
         9/FzGWwBPauB/FijOzIWO5jjFPPDOT88BdPyZB7PIkHfQBl27Z5k1RBvjaqedvrai36U
         VnUGxWMaFi58uk002OYA37FkyKi4616PFuCDbF33ke8yxJt2ujvIboe/E5Hh18d+MjWO
         w2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0bIcvTiNlycxAssTlBUYXYf9u/vJLBi05bdynBGlR3Y=;
        b=S4rIfbFeB9ay/dgqYoV5GN8hEI56m5i5bjMV73kk0AyVzifOAprG8ASV9ucpFX8syf
         /oV3dMS1CJtsPf0MI0J7TbB+wnO1yKK6eDtPXotbsT5mk/9ZG3xU/AOgNfI2Y3c5V1pe
         cMAJAvlpkjJCkqVEHncUY64hKpiVTtYVzqy4B8roHdCQp9iWLE7hIj1U3J2jcK1gjIxn
         j2aDXAUPYzttTRPefbqI/LmoDLGrOJ0az+w70YV4FQO5eqYw+TXDGmfUf3BR6LMDPvHx
         ZnK8osj+fptFrYKtO1yHIjwoyoYPeZuDSZIZITsxgIn1pAQqZ+O/9EW82AbHUWkz33qb
         95/g==
X-Gm-Message-State: AOAM533N3jYO1E6L1JAEHttbZJe3oL9VoVBixLC1r8+zlWkEaLji01g8
	y8mgxsqJOnWGdL26Ii7nZs3MuIQZmKTNLw==
X-Google-Smtp-Source: ABdhPJwMYylMKI7ydtyXvM6AyFDTPz1ZHwp2xXcpyK/l66hjePo6cgaRQoBG1Jy5GG/ZdZNh2OFkCg==
X-Received: by 2002:a17:907:384:: with SMTP id ss4mr15430734ejb.120.1624701274433;
        Sat, 26 Jun 2021 02:54:34 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.local.all ([194.191.225.82])
        by smtp.gmail.com with ESMTPSA id x17sm5727532edl.58.2021.06.26.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 02:54:34 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch] xwayland: port packageconfig from xserver-xorg recipe
Date: Sat, 26 Jun 2021 11:54:15 +0200
Message-Id: <20210626095415.6949-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Copy the packageconfig options from the xserver-xorg recipe to
allow configuring for non mesa opengl backends.

Keep the defaults as set in the xserver-xorg recipe.

The following options no longer exists and are dropped:
udev dga dri dri2 xshmfence xmlto systemd-logind systemd xwayland

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../recipes-graphics/xwayland/xwayland_21.1.1.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
index 8b1c96fc4a..faf166f788 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
@@ -17,6 +17,22 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
 
+OPENGL_PKGCONFIGS = "glx glamor dri3"
+PACKAGECONFIG ??= "${XORG_CRYPTO} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
+"
+PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
+PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
+PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
+PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
+PACKAGECONFIG[xinerama] = "-Dxinerama=true,-Dxinerama=false"
+
+# Xorg requires a SHA1 implementation, pick one
+XORG_CRYPTO ??= "openssl"
+PACKAGECONFIG[openssl] = "-Dsha1=libcrypto,,openssl"
+PACKAGECONFIG[nettle] = "-Dsha1=libnettle,,nettle"
+PACKAGECONFIG[gcrypt] = "-Dsha1=libgcrypt,,libgcrypt"
+
 do_install_append() {
     # remove files not needed and clashing with xserver-xorg
     rm -rf ${D}/${libdir}/xorg/
-- 
2.26.2

