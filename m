Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id B466E755A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 17:37:16 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id f4-v6so8291538plb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Dqnqyl0t42nhSmAqFUfl4vz/3oIv9zXdrB8DqKb0OcA=;
	b=eQ+SEv3jWZeQWJ1P3L3Dm8XB7jnfy78nWb2LfbypmN0PyDNIBLWwpUwgRDJE24smkk
	gW0sN7wf6IebzJwgqIJeG5/nJTqh9jE/BFV9HskScPkshV6nn8VhDm2hmukFLIOwU9YL
	0xDKbdCrgMrYdIVuFSUHBUxSwltsM5n3nwHKdOx6ZDBrRbJisPeQm/ewI4YVG7iVV7Bg
	+A/T4I1WwOJISDiaP3bvabJ6dpgfxp+TAOIC/8FK3xWKe5PhKc7laf3ZNJJAvbbMiDN4
	qccM1wfxd7UiNFW/NT50zlb9J4+pqLKSSGpv+a7h3XZaKLmZGM2gbluHayoYbg/U5Xt5
	QGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dqnqyl0t42nhSmAqFUfl4vz/3oIv9zXdrB8DqKb0OcA=;
	b=IrcpeNwSFrppzqFqiRC0hIgsWAeXzgfwYjDm3ih9abAyuvkjbBbJtWsaxH/Il4S0hB
	TbKgvsaw/eFjUP6gGdqDGGw5NbGOccDJyGQ9ZdlBLxw3NIDLroQvUeEkGAz14wa3wkyD
	IGFGGd/1GpbT38gB3nwk2/biCaLfH6clsHds+5OBbCduoCDos9cqJT9xUonGVuYra4fx
	0jTtMeGHYlATIvILqBr96cK8E0U3pEDq7Zj79esHNw30AvamGast8uGVP2kWttpt4qu9
	IFagx3gbPuoOkxRjzTkdy4iydSJIJJ8uJ80KYrdPsHQdRA81o+VJWAjiylJ+w5dr58d3
	aRWw==
X-Gm-Message-State: AOUpUlGLaaSSL3MaCS/QEhenRDr7Z489k/V3a5Hmpz9xjtUPxoY/ipGX
	heHZHMv71uhkNcUdIypvBhPPaw==
X-Google-Smtp-Source: AAOMgpeXDv1z18a7xadqkNXh9CeLkgZRNMUGLTJiuu9kd1bbiQq7eWmCZxw90bKVkNZi8ZWCURHMgQ==
X-Received: by 2002:a17:902:d88d:: with SMTP id
	b13-v6mr7347122plz.314.1531503437255; 
	Fri, 13 Jul 2018 10:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	l190-v6sm2217503pgl.75.2018.07.13.10.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 10:37:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 10:37:06 -0700
Message-Id: <20180713173706.7788-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V3] mesa: Fix build with wayland and egl
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
X-List-Received-Date: Fri, 13 Jul 2018 17:37:16 -0000

When wayland and egl both are on then it enables the wayland
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
 meta/recipes-graphics/mesa/mesa_18.1.3.bb     |  1 +
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
index 6d61e09bc5..860a2d94cc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -110,6 +110,8 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
 
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
+
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
index 1c76f4b1b1..d72f5d0b6d 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
            file://0008-egl-fix-build-race-in-automake.patch \
+           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
 "
 
 SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
-- 
2.18.0


