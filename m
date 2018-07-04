Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A4844746D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 00:11:34 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id q14-v6so1659792pgt.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 17:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7XFembP5AN+H/m4oxJ8LsLimWirh+A6y14cLJhhp5PE=;
	b=hLVd2kd3RcmFwZvWQOyA0fzTk3PEPuanT9QmmiJZYHxwzOAdiCfUJqFBmXEBf2J64K
	pzewTyQYJGlJHQSeAS9NbRgl0EIRvZGgaqMIvNwKewFcVFCxTtkZ2l45J3ZM9q0vNHPT
	IDtwRaeZ9dEavV6m5SsYaXji6QlcIVYMaSgqwlm8pnp9xmeWxpXhdW/Ei0TBPPJuCyv5
	ZKRVkf+9nVXAlDZVdO9rfW7JKbbLsvwOwW0mDZE3mpRPDnv/4Zw/MmtHqyIDGtywA+hv
	eV1D3rVr53hZ5Mz6u3jrZqMJ+1eRe+VSV85ln+ypWbse4XHt0U9GCgDLp59/9rKUz4AV
	rkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7XFembP5AN+H/m4oxJ8LsLimWirh+A6y14cLJhhp5PE=;
	b=E/irsWElnmYqct1YBQaJMdgAziV1nZ6Hq7RBrVJk5cL9ajg9/5B7VXN1BLeJOvTCnb
	/r2M/TALUhqAr6lMxFub/vDHe/jtPtXPjGmrfAOxKRkn/34QxzcoR/5B6B7CWFIDD/CD
	UTFfL8WGqJGREZ0gu/LKRwkQShQqn9Mfvy41oPHMVtmAhuarLbq/8vO9gwfGSdQxH360
	rpmWvWAS20eLWlzCEAOxgGtqJRmHDozFuj5Ang2RCyW5Q7VtTeli4YEdfnA2sObxQCGb
	T9DDK7fqYPGrLNN3eSU/rwoTutiDT1dnXt4R7TSknDo/TToTz8ud3ugx5PstoijqkAqL
	0lLg==
X-Gm-Message-State: APt69E3Xi1kZlwbyEaGZiPWKx7QsKlbO13E1ua8G3c1h8c1hNdkDU4rr
	ycUqzqje6B+Jaz3Qi8XGVmbgBQ==
X-Google-Smtp-Source: AAOMgpfSe7JQFq4LCGs+UTQY6cJSussKogcjF987yUer3UcG+waLUpxhNbdyRo9c7yHCAobAj5aQrQ==
X-Received: by 2002:a62:6303:: with SMTP id
	x3-v6mr31756691pfb.91.1530663095443; 
	Tue, 03 Jul 2018 17:11:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	e65-v6sm5287451pfj.48.2018.07.03.17.11.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 17:11:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 17:11:37 -0700
Message-Id: <20180704001137.41385-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Wed, 04 Jul 2018 00:11:34 -0000

When we have wayland enabled with egl then it enables the wayland
plugin which actually fails to build because its not finding wayland-protocol
xml templates in proper location which is recipe sysroot since
we are cross compiling

Fixes build errors e.g.
make[4]: *** No rule to make target `//usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by `drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.
make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Rebase on master

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
index d1723e3506..fed2900577 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -109,6 +109,8 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
 
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
+
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
index c47c57e9d8..6af1216b79 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
            file://0007-dri-i965-Add-missing-time.h-include.patch \
            file://0008-egl-fix-build-race-in-automake.patch \
+           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
 "
 
 SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
-- 
2.18.0


