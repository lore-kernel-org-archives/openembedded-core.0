Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D991F6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 19:44:18 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id i26-v6so13816669pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 12:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Dqnqyl0t42nhSmAqFUfl4vz/3oIv9zXdrB8DqKb0OcA=;
	b=GqfF6aTl+jK6JjOd9OpCfWWK7Q7dhdfrILQ8SoGsuqjP/BzCD8kXI+launvrAYePtD
	WChNxiPL7VeyHGPxITW8Z6KMFQ+zGvJpe+3f2xtR8tvWPsbrztu59fxfgFappjL/CdRZ
	VjRU2vfbXLRFMtYgcBnvN+9EFs5so8h2SYtnrH5pmEle2z3gcXtfIkw6LQ3/A1qMeNmx
	w6vtodP4MQ4bytBBA0Dd76huhPDyMHwoldgromTpGq9fkZ/ukRjcZeJ7k0QVJcC85b69
	BQwmlg3mzHnNoY8k7W3/zaMVMvw5jgIDMk/6ZI5C603jJuS284uX1aNfq3oTKrB0I5cr
	ZArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dqnqyl0t42nhSmAqFUfl4vz/3oIv9zXdrB8DqKb0OcA=;
	b=pp8aOTNfRLKtnCZdfqm9v4X4lUnh1vcwIfnszX6wwI+PgW/zKn53iJWDoDj92Yc7PN
	tYwvyAFnPjLP4rZWiuasJoVB/JgqaZR/Jb+JhCGxxRtSabYgYKOO8Lf61qZSSMoMf+xm
	RVL7963jHfg6a4TLe9bpQJeHO9Wj3XZhqrIedSvGGX0jwEn5MCzv2zqiwKl3mBXVAy1V
	rxaHTWaqOuO7nIA5OT5spxHnD4nXd4Ii+w8AF3wul4kOHXiEUEZCLV0UjcixEXtANr6r
	87uqC6eE8F61UP3P/Wo+WiXQtFCFQHtoBaNAc8HXjbxoYZLIHGu8C5/qF5bZh/XtsiSu
	7j8Q==
X-Gm-Message-State: AOUpUlFBFhV8GxaxB72K02YxA9yVmpB+3p/wWqPQtYrhvznuWWcYx1zg
	z+uZ7S2g0G+6yUJU6CfO42YDoA==
X-Google-Smtp-Source: AAOMgpclgS8+xIvyROhmeqOjKJoTeha6E0aVs6F0wCdsu1DgX9mzTqITTeTxLe7Fb/AXAzfGm14/ew==
X-Received: by 2002:a63:89c7:: with SMTP id
	v190-v6mr12894361pgd.194.1531683857600; 
	Sun, 15 Jul 2018 12:44:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	x25-v6sm14309360pgv.63.2018.07.15.12.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 12:44:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 12:44:02 -0700
Message-Id: <20180715194404.29736-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/3] mesa: Fix build with wayland and egl
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
X-List-Received-Date: Sun, 15 Jul 2018 19:44:19 -0000

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


