Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id E8BFF78AF7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:26 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id w8-v6so6451007ply.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6DOJPl06VMYxzDNtPCRFbTNcxcZDXdeH+JA7vQqQ4UM=;
	b=nSgDiBfVIzwNVVF50QJG82ar8PUxgoeA/FFyWKZXb9nm7OJkhu/hQFrkwEA03TQLr9
	rUiLFkPP2bI1MTOlot1JKo61Z91Vmq1sqzBblfzy6YFpVVuRVO8t9JeB9g7ewoP9oXCf
	B+/b1IalkQfjL8itNUQkbn/5X/Zl0zO43PmcTag+0q2Oscg++GE5zpsSi/cb3aDu6us1
	XHGvvea+P1M1LZXGSkC+9FEpn/brQDATVihvht0KoIhxPPUWSXKn+IVUya+I2IqMk9pQ
	E4coImVLQtq91dhiw0UYBMw/szfgYv6T2BnqQNDXaquP3DewW+y6jFhi9UhAE4ubEoyd
	t13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6DOJPl06VMYxzDNtPCRFbTNcxcZDXdeH+JA7vQqQ4UM=;
	b=mBSHBYYd2A0+jK6zvwfxruija7ZQYpTgMSokqj0eLt3eufDMuOpGxrZ/8tK8qjfujS
	ipzg2LAQ4tHUKqHFIrbjPVYH1OSPuWwhRk86kA8JllPbYKBPlATGoCpuyBgMNLX7DiCO
	mpZPaQnMpZaI5q8ZW5ZX2Fqi73USeRTRajttesL9WwCmxlEDfVD78TK9g1ejdbALpQpS
	sr7QTZSVxHrePTK91Xl2qtVXlJnePimWlFFcEMIThWBKyLwU++UXViw//EgLLpJwmGVP
	1+LgBFFrjTjWVvas0EBZWk+PqQexwMwvnZleZByTUTLkTAuDNIcqKDX5I/pzEdF7Ip+Z
	Z5Bw==
X-Gm-Message-State: AOUpUlFonPN9Movlw6Nl4Tk/WJ7TD+w3Fr5hpn96YGGtPUREu5506+z8
	/vq/Ds42weDCuKShfGx3iOLr2tLd
X-Google-Smtp-Source: AAOMgpf9d9ZeqHVMG4bZdx8hVrkQ2LOx7EOrbVfwEYrllUVq7vj/iUrooOguZlamrk/5U2MachwV5A==
X-Received: by 2002:a17:902:ac1:: with SMTP id
	59-v6mr6282012plp.36.1532190447678; 
	Sat, 21 Jul 2018 09:27:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:11 -0700
Message-Id: <20180721162715.12611-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
Subject: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jul 2018 16:27:27 -0000

Fixes
| /bin/sh ../SDL2-2.0.8/build-scripts/mkinstalldirs build
| make: *** No rule to make target '//usr/share/wayland/wayland.xml', needed by 'gen/wayland-client-protocol.h'.  Stop.
| make: *** Waiting for unfinished jobs....
| mkdir -p -- build
| ERROR: oe_runmake failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...R-for-defining-WAYLAND_PROTOCOLS_DIR.patch | 34 +++++++++++++++++++
 .../recipes-graphics/libsdl2/libsdl2_2.0.8.bb |  7 +++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DIR.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DIR.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DIR.patch
new file mode 100644
index 0000000000..f9a666e755
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DIR.patch
@@ -0,0 +1,34 @@
+From 07ef55d0fd9f53a4d94ed8df03ac5ef7d3cbf2d2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Jul 2018 22:51:32 -0700
+Subject: [PATCH] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DIR
+
+This allows to override the wayland-protocols pkgdatadir with the
+WAYLAND_PROTOCOLS_DIR from environment.
+
+pkgconfig would return an absolute path in /usr/share/wayland-protocols
+for the pkgdatadir value, which is not suitable for cross-compiling.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../libsdl2/2.0.8-r0/SDL2-2.0.8/configure.in                    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: SDL2-2.0.8/configure.in
+===================================================================
+--- SDL2-2.0.8.orig/configure.in
++++ SDL2-2.0.8/configure.in
+@@ -1395,9 +1395,9 @@ AC_HELP_STRING([--enable-video-wayland-q
+             if $PKG_CONFIG --exists wayland-client wayland-scanner wayland-protocols wayland-egl wayland-cursor egl xkbcommon ; then
+                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcommon`
+                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`
+-                WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
+-                WAYLAND_CORE_PROTOCOL_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-client`
+-                WAYLAND_PROTOCOLS_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
++                PKG_CHECK_VAR(WAYLAND_SCANNER, wayland-scanner, wayland_scanner)
++                PKG_CHECK_VAR(WAYLAND_CORE_PROTOCOL_DIR, wayland-client, pkgdatadir)
++                PKG_CHECK_VAR(WAYLAND_PROTOCOLS_DIR, wayland-protocols, pkgdatadir)
+                 video_wayland=yes
+             fi
+         fi
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index accea38aaa..a8d2283fde 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -14,7 +14,8 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
-"
+           file://0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DIR.patch \
+           "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
@@ -29,6 +30,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
                 --disable-rpath \
+                --disable-wayland-shared \
                 "
 
 # opengl packageconfig factored out to make it easy for distros
@@ -53,6 +55,9 @@ PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
+export WAYLAND_PROTOCOLS_DIR="${STAGING_DATADIR}/wayland-protocols"
+export WAYLAND_CORE_PROTOCOL_DIR="${STAGING_DATADIR}/wayland"
+
 do_configure_prepend() {
         # Remove old libtool macros.
         MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
-- 
2.18.0


