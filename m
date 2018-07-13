Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id C734C78862
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 17:21:38 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id u16-v6so22985237pfh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 10:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UBeguqz7dKQ52zghW8wv8l05Rwe2CxvdISfZVTCQ/k0=;
	b=teLhXBgGQ74O/vgWUKN/Olfo6VvQtsQNEl3nRw80/rcJ6ClIUfLEBxqnZofQxznysN
	gxHfjxbwqUZJMB/MMLH5Aqx63PlQ+xTj6JIhGADLomr2O/FgJCtAbYVNDUeEsOi/7VV0
	xjvm9Yfh/MUt2e+pb6dJdj4HdkhopOXjA6bZLgcDIjbTt1SXQDgIpA3zn9q4Gk/+QTA9
	NUcA6Va2sYraYJGSu1pFw1PeFoJgVd+DyWUxAlFp6aaAA/4bI3iP2hiDWza6sg4A4YLY
	ie/imlO6hy1w66mvuqOP8jicD6Plb/Xn+4V9aR5O/rzsXLbWpiBqKdsj0s4a+I4HmHFa
	2PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UBeguqz7dKQ52zghW8wv8l05Rwe2CxvdISfZVTCQ/k0=;
	b=mywoHQ7AqJEBzkak4/LUv+Cb6o4tGZpNhPQzdCvWWeC8WRLqWc4F1reJzfIdugiiYy
	R4u8JP7/Xly7gz3ss7mC5VM/ZC9k2Gb8aC7TttWMBGa9leNzPmZ6+ZQT8AGVmvoxFwBY
	xgN04DRjHHpD77rFalICUaa0s24ZpkpPqIy2bVQC0VviknZ7Cvo3ExbYYhMR6DO9nqZ5
	vbqf40BairWuv8j4pz551SK9lkkQLeiSCSpxklkZDulYJZdCkieZCBZfqg797IhUs74R
	tAq5mE4p6lgsl9qc7pcC50XJ/uRXBs7edmEZFhNuL7eVZZ3OsJOzxsf6QytBM6YOds3L
	gDQw==
X-Gm-Message-State: AOUpUlE3FGXob0iWBcH6+m5nHIInSPZPhPTMpyZ9YksBJN2xnSR4LN8n
	QfaUme692UsnGl2KQjKRWpHrEA==
X-Google-Smtp-Source: AAOMgpdH+gOmV1lhwtHGgAOXjJxpCO1xoMVrU4/OmJ6hML4ZLFEZN2BC0iflTvAEBtduWRXwkT7Q/Q==
X-Received: by 2002:a63:1546:: with SMTP id 6-v6mr6949735pgv.271.1531502499431;
	Fri, 13 Jul 2018 10:21:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm29564453pfe.32.2018.07.13.10.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 10:21:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 10:21:30 -0700
Message-Id: <20180713172130.14962-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] mesa: Fix bild with wayland and egl
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
X-List-Received-Date: Fri, 13 Jul 2018 17:21:38 -0000

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


