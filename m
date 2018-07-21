Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id BA36A78AF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:25 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id b1-v6so6451015pls.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xoJ+VRmmNY4KjrrDjo19vQen7ZQ4CFPc9ABTr3HDH1A=;
	b=by6DiS8mOZaXvw1QG+Y4yJbZns7Q+xqO87YMCuvqdYeXexhUfRy/xnVK89gIz6Awlj
	qihtAgNFCC/FnvTbWfjk3wTiUaSRYyuYuRZnREdJcuB0DoosZ0ff8zT6LDS4/j7xtqjO
	PzfynEUcYGbykqeyYHNgwmUX+wSJO9Fj05TqwjF8qTV6BcS9HygpTOEddCmdmX4/ED0u
	bCYzEDnMCoRzCrexjJAAMDuwtD5uhygWDXZal9/Ry06+7Pc6L/H9v/0aMprwDLgvYPS/
	HHRQ6THO1A6SsM6/D555GCYAwjLK6mpJxxAl4nJpbCj6SnmHAZvn/VhsI2yU7x+dPDEt
	ib8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xoJ+VRmmNY4KjrrDjo19vQen7ZQ4CFPc9ABTr3HDH1A=;
	b=nD3ClF0Gymp0j08gMGoLzQl15/gKq9lo4e1sNSOm9KZ16yCdoZCpOK6J5XbxwlTrmp
	HZkZrrK4ayS/py4bJsdzcyak/qLKqaAu2AoptMYvR7JbuCsR2DZ4/hL9joyxr5b783gO
	c8o9WL8yka9xY2V80d46NJAXe3kMjimjnGSVivOFpVbmzl1g1ToH2xHKSm4bbJWdOTiD
	U2U4lXAjqaY3Ah9akfuoEWf7WDPIOS0OYqtH2zgjb2dBCQkLTBnfn9/IbZVDI13Nc+r3
	yvV9kmD2VmmRBOkrUpIn0/bJ6THW1hYfGNKBAXcgPekYHUNY6+j9KUiKCcI6xWNnxVAy
	Lduw==
X-Gm-Message-State: AOUpUlHRRE7Ze0vE/4GkFDjivAHarcuQv3+20MbvmINMujALgDaAZIzd
	abaQm654mWO4P5PM00DpgFKOXiwR
X-Google-Smtp-Source: AAOMgpfD+Ue/pdu9Yx9+wtUvt8yUtOc2OPYKzQGMuaaAVx4fws513pCokrDbX7jh0cfpnG2DKNpywQ==
X-Received: by 2002:a17:902:42e4:: with SMTP id
	h91-v6mr6333083pld.27.1532190446563; 
	Sat, 21 Jul 2018 09:27:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:10 -0700
Message-Id: <20180721162715.12611-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
Subject: [PATCH 2/7] gtk+3: Fix cross builds with wayland-protocols
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
X-List-Received-Date: Sat, 21 Jul 2018 16:27:25 -0000

Fixes
| make[4]: Entering directory '/home/jenkins/oe/world/oe-build/build/tmpfs/work/armv5te-bec-linux-gnueabi/gtk+3/3.22.30-r0/build/gdk/wayland'
| make[4]: *** No rule to make target 'pointer-gestures-unstable-v1-client-protocol.h', needed by 'all'.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 31 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb      |  5 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
new file mode 100644
index 0000000000..3948bdd4e2
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -0,0 +1,31 @@
+From 3bbc4ea83256df8a777e13533e8d2791a70c0ee9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Jul 2018 22:32:37 -0700
+Subject: [PATCH] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+
+This allows to override the wayland-protocols pkgdatadir with the
+WAYLAND_PROTOCOLS_DATADIR from environment.
+
+pkgconfig would return an absolute path in /usr/share/wayland-protocols
+for the pkgdatadir value, which is not suitable for cross-compiling.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7ca7b99..847fa4b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -470,7 +470,8 @@ fi
+ if test "$enable_wayland_backend" = "yes"; then
+   # For the cairo image backend
+   cairo_backends="$cairo_backends cairo"
+-  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++  PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
++  AC_SUBST([WAYLAND_PROTOCOLS_DATADIR])
+   GDK_BACKENDS="$GDK_BACKENDS wayland"
+   GDK_WINDOWING="$GDK_WINDOWING
+ #define GDK_WINDOWING_WAYLAND"
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
index 697b518544..d1625478ae 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
@@ -6,7 +6,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0001-Hardcoded-libtool.patch \
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
-          "
+           file://0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           "
 SRC_URI[md5sum] = "61e60dc073e0a6893c72043d20579dc0"
 SRC_URI[sha256sum] = "a1a4a5c12703d4e1ccda28333b87ff462741dc365131fbc94c218ae81d9a6567"
 
@@ -16,3 +17,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
                     file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
+
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
-- 
2.18.0


