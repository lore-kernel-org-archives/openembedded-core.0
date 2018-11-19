Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1D54D6C118
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:55:50 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id x85-v6so26397566ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=thKwJ3rhBpuPVyaCdcO0mpkRbmq3USIIzwAeLCY0M0I=;
	b=or2boPbRCDt/V0gKiP539DRdehMLkQBvhiZx2dYZh8x4L4MGqBuQjgRyqY+nVOX3Kp
	Y++UMCE/WCPqqDXz8pc3mkOci8TkBjJHh2IyCn9jLwLDgduD+DWTPhEHttnD1b5o43N3
	A40GMWyZRrQQKpxQPom9aVwOc63CPTg8ZtlSvjiq13HYR9Slz8Fn0+DlYwa8mYk9AmdW
	K2PYDpKERB4J/YuGAtfsRNqU7QNWn6R4GlC5tSPXngPsAYP7Rugb3HUddHfUBdh1KnKz
	gvhfK9PKF4T01/O6539NqoGR2KpSkzoM/L2Fyu2Jth3ecZB22iIv4eXTrqMk66tbPBHf
	fRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=thKwJ3rhBpuPVyaCdcO0mpkRbmq3USIIzwAeLCY0M0I=;
	b=sy3U8621kiiB2fVzWGqkS+70SphlFvE+ow9x5tvvCk4US6T77Vlbs8YDpXv/xPec3v
	NTRqPk+sB+XKD0A2YtFoHPxexesBScLnihelIQHVb1662yRjFsU7XWqqpLtFd2w2QbVH
	qYhrgXJSmHkC4WczgHM0obakZ23CqBE7TTsLCWJBqDw0MZIMrnlqVMO6O1pnUBiE8wVx
	ndWN/7G+F4y3n41bh8HwQGhMo6EiH/C7GDKN2tD8xxA08gD9jHFP4LmqDvjj/g5TsDkS
	lIm+XHYbxRgyEF+Lqtm6hBzqOMDbtx7ewFyDNh0hQtTkzbOfBpNk7PkEmDLrTBtQpaVC
	EIPA==
X-Gm-Message-State: AGRZ1gIhO5kRjmK2XsYOZbqT2CBlpKbo7JC3A0Q8pebOb0Hsfmm76XiD
	Z9sMT7v3Znm51WdXFjrsEuuvddLJ
X-Google-Smtp-Source: AFSGD/XCwEd1yxb4K+hiMcElUu20MzNTz7DtFZ64CnyJY0w8shmX5ObjT8VdT5sv//B4QKdTRsq3Iw==
X-Received: by 2002:a2e:841:: with SMTP id g1-v6mr7961234ljd.21.1542639351122; 
	Mon, 19 Nov 2018 06:55:51 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id n16sm988393lfl.35.2018.11.19.06.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 06:55:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 15:55:41 +0100
Message-Id: <20181119145542.69051-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] meson: do not manipulate the environment when looking for python via pkg-config
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
X-List-Received-Date: Mon, 19 Nov 2018 14:55:51 -0000

meson does it in a way that breaks oe builds (they export a bunch of PKG_CONFIG_ variables)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...-not-manipulate-the-environment-when.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index b7fb3e698a1..32c6bfe5d3a 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://gi-flags.patch \
            file://gtkdoc-flags.patch \
+           file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            "
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
 SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
new file mode 100644
index 00000000000..60729854045
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -0,0 +1,43 @@
+From 45426f06689a520fc47f81ee29b49d509f11ba58 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 19 Nov 2018 14:24:26 +0100
+Subject: [PATCH] python module: do not manipulate the environment when calling
+ pkg-config
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/modules/python.py | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
+index 1195d8a..df81da4 100644
+--- a/mesonbuild/modules/python.py
++++ b/mesonbuild/modules/python.py
+@@ -67,26 +67,12 @@ class PythonDependency(ExternalDependency):
+         if DependencyMethods.PKGCONFIG in self.methods and not python_holder.is_pypy:
+             pkg_version = self.variables.get('LDVERSION') or self.version
+             pkg_libdir = self.variables.get('LIBPC')
+-            old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
+-            old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
+-
+-            os.environ.pop('PKG_CONFIG_PATH', None)
+-
+-            if pkg_libdir:
+-                os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
+ 
+             try:
+                 self.pkgdep = PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
+             except Exception:
+                 pass
+ 
+-            if old_pkg_path is not None:
+-                os.environ['PKG_CONFIG_PATH'] = old_pkg_path
+-
+-            if old_pkg_libdir is not None:
+-                os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
+-            else:
+-                os.environ.pop('PKG_CONFIG_LIBDIR', None)
+ 
+         if self.pkgdep and self.pkgdep.found():
+             self.compile_args = self.pkgdep.get_compile_args()
-- 
2.17.1


