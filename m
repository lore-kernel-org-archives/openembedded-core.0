Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D14487871B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 00:07:40 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id c10-v6so1660017pgu.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 17:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ouARJVIVYQ1XwK4sF/35IFjM2sqwEZZ/xAVkphmkVwQ=;
	b=nmf6DSL4TftcZXRUtsUU2Z1hRZ775WH9oamRQtaYTxjsRgDITnnF+bBTp1YpnRmU7V
	/Jqixyg3EFThnQXrdfzZK0gYW6iwhXFGQh4WXaVjwi+v9CbgYHu3Nx0OPiueeqa1EkKK
	xs08DyHdzYOg2u4sLySi0BNxpqXwAVHGmNfajeYLFtd/YQpcA336g1TIFlm4OhqQ8o5q
	pzJ0LlMT2H0Dc659MdrU4juZls+THiW2HVdkwVXUoZs09RbTI4I1ySZd/G3rzAZcLCon
	6Z5ynnQHJLBIoASZfntDHYH4YSt6hpxkXnJg/X+OCtPy/pJ3K0BAH+AGV4ElQLLG9VdH
	U/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ouARJVIVYQ1XwK4sF/35IFjM2sqwEZZ/xAVkphmkVwQ=;
	b=YR2jVFB3P3QhKZBbbp99hn/FDOw438kbKAfVHO0QxQtdDuoPmti+1V2BK3RyNDogkg
	L8UkJgaWd7gEpLGRpL6TVnthoEWuICOk1ndYEgY03JzVKJVK3GLM6/83Qfr6Iew5+/sn
	DY+c/4v2LvxreOa+PXTTDD1R6qsHgdYfHyGA9cMgSoxnp9IAEraEfaXWYKEjRo7aALM/
	YM8mM5IaIz5ghw7Ww6ksnDeCpBsSHHaNZVY/4k577CTYodEp/GiqLqEsGr1XjpxMChfW
	eQwxuJirIh5/QAQi1dSd0aXbpXC2yRvI7vNqEzqHefFeKyEw38hmwHxxjlK58mk2Irar
	GOUg==
X-Gm-Message-State: APt69E0PHTxPcahOZ1kOd29xwkH6TPas2aaxeHOTzjKdEegmW4HYxWBv
	0nrFX8tRzaorN1Ajjaqa97Burw==
X-Google-Smtp-Source: AAOMgpew+SvjBHXLqx2i936Pwb9SFm49NbfJ52R4YpQ39+ioFC5An6XRS8w+94SKvhSXWscDSIIUNg==
X-Received: by 2002:a62:dc8f:: with SMTP id
	c15-v6mr15887693pfl.155.1530662861463; 
	Tue, 03 Jul 2018 17:07:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	f125-v6sm4085144pfa.26.2018.07.03.17.07.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 17:07:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 17:07:42 -0700
Message-Id: <20180704000742.39060-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Wed, 04 Jul 2018 00:07:40 -0000

When we have wayland enabled with egl then it enables the wayland
plugin which actually fails to build because its not finding wayland-protocol
xml templates in proper location which is recipe sysroot since
we are cross compiling

Fixes build errors e.g.
make[4]: *** No rule to make target `//usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by `drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.
make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ss-compile-WAYLAND_PROTOCOLS_DATADIR.patch | 24 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  2 ++
 meta/recipes-graphics/mesa/mesa_18.1.2.bb     |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch

diff --git a/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
new file mode 100644
index 0000000000..b4e3c4995f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
@@ -0,0 +1,24 @@
+use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+
+This allows to override the wayland-protocols pkgdatadir with the
+WAYLAND_PROTOCOLS_DATADIR from environment.
+
+pkgconfig would return an absolute path in /usr/share/wayland-protocols
+for the pkgdatadir value, which is not suitable for cross-compiling.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: mesa-18.1.2/configure.ac
+===================================================================
+--- mesa-18.1.2.orig/configure.ac
++++ mesa-18.1.2/configure.ac
+@@ -1808,7 +1808,7 @@ for plat in $platforms; do
+         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
+         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
+         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
+-        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
++        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
+ 
+         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
+ 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d1723e3506..fed2900577 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -109,6 +109,8 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
 
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
+
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.2.bb b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
index 9a9a2b2562..45f3b3d0d0 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
            file://parallel-make-race-fix.patch \
+           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
 "
 
 SRC_URI[md5sum] = "a2d4f031eb6bd6111d44d84004476918"
-- 
2.18.0


