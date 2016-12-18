Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62AB971E1D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 17:02:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so14547861wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=t3ilky1U5znUKwIUZOC/jtoLbRCtz06NeJMLOgPUInc=;
	b=YP5GIFFkeTk8pGYAV3PmVybmoshBvz1Wb9B5FZtiF71vpz75Kpwd+ZJoZF4u36/dvz
	XoXyrlOp+UuDCNjZOU2XIK5HB6WDOaxkSgKzEJkY8KOijJSl8w6FuxaDA6VV9Vz3RJ1H
	R9TO4DfiP0CdHM+yHypzkOCY3uXSUYKDRjyEjkesEigbmGUzWSvOe1I4aFtjfMBbL9pb
	I5MK2AC0mAX5EJg3Dk8hQJ1ABHhVswYidEpee9pqf4MlvT7MXUC3Bxh69ML+mv/btoY9
	XxkLLM8QogZcYgb2ecQukQ3UbLY8nlWCn7bUzTLo7SCD8D2dlL65/8deXrPj+imCVzes
	dl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t3ilky1U5znUKwIUZOC/jtoLbRCtz06NeJMLOgPUInc=;
	b=ftGKv+i2Q44QjltIn+NRY11Wsg++U45VZgV5b1t2OhPvGORx+RbLfZ9Yow7j5L42Be
	UpCkTsmWWkm4qqjkGep6MaXmlm4e883xv3CzGk+cFCXf2KOT8ec3c6oLlq0/Paf1a0Xl
	/GzJx3Jh5+N7qz/9SIO+uc6xxp1FIY8pg0kHeG0I5e/iGP0OZJL9XbSSAlV2KCMeL9iX
	XJIjSA7k1dYIBcNcyLxaHbNJ4y8AMaYIcsnnMsPcXtGfaJwNichWHczJ7MLVSaokqqGv
	PTOzQ+VGNhyu86VSrYlDDn8YqpWJskEGluhCnhetnt7AB8mq+WOaMtoRgQFHP6Qyq1eR
	kJmg==
X-Gm-Message-State: AIkVDXImh/CbQ2RQQaWHtxbgbixfTIVRKWVeOa+W8Ll8YaiYdbsXcg1m10mW76SpidfM4A==
X-Received: by 10.28.216.9 with SMTP id p9mr9835406wmg.11.1482080564309;
	Sun, 18 Dec 2016 09:02:44 -0800 (PST)
Received: from e6520.c.hoisthospitality.com
	(static-88-200-112-80.thenetworkfactory.nl. [80.112.200.88])
	by smtp.gmail.com with ESMTPSA id
	g17sm16778366wjs.38.2016.12.18.09.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Dec 2016 09:02:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 09:02:36 -0800
Message-Id: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] glew: build for EGL in non-X11 distros
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
X-List-Received-Date: Sun, 18 Dec 2016 17:02:46 -0000

The glew 2.0.0 release added support for building for EGL:

  http://glew.sourceforge.net/log.html

Add PACKAGECONFIG options for 'opengl' (ie the previous default, with
dependencies on opengl and X11) and 'egl', which depends on EGL only
and allows glew to be built for non-X11 distros.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../glew/glew/linux-egl-no-libGL.patch             | 38 ++++++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.0.0.bb           | 22 ++++++++-----
 2 files changed, 51 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-graphics/glew/glew/linux-egl-no-libGL.patch

diff --git a/meta/recipes-graphics/glew/glew/linux-egl-no-libGL.patch b/meta/recipes-graphics/glew/glew/linux-egl-no-libGL.patch
new file mode 100644
index 0000000..48fab16
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/linux-egl-no-libGL.patch
@@ -0,0 +1,38 @@
+From b1317a2faff15ba91b38c2fe5fed24e18003c198 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Sun, 18 Dec 2016 07:01:12 -0800
+Subject: [PATCH] linux-egl no libGL
+
+libGL is not required when building with -DGLEW_EGL
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ config/Makefile.linux-clang-egl | 2 +-
+ config/Makefile.linux-egl       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/config/Makefile.linux-clang-egl b/config/Makefile.linux-clang-egl
+index ca06419..ea8c703 100644
+--- a/config/Makefile.linux-clang-egl
++++ b/config/Makefile.linux-clang-egl
+@@ -1,4 +1,4 @@
+ include config/Makefile.linux-clang
+ 
+-LDFLAGS.GL = -lEGL -lGL
++LDFLAGS.GL = -lEGL
+ CFLAGS.EXTRA += -DGLEW_EGL
+diff --git a/config/Makefile.linux-egl b/config/Makefile.linux-egl
+index bcdc3cb..3bee77b 100644
+--- a/config/Makefile.linux-egl
++++ b/config/Makefile.linux-egl
+@@ -1,4 +1,4 @@
+ include config/Makefile.linux
+ 
+-LDFLAGS.GL = -lEGL -lGL
++LDFLAGS.GL = -lEGL
+ CFLAGS.EXTRA += -DGLEW_EGL
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/glew/glew_2.0.0.bb b/meta/recipes-graphics/glew/glew_2.0.0.bb
index 489dd7c..e5bf3cb 100644
--- a/meta/recipes-graphics/glew/glew_2.0.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.0.0.bb
@@ -2,14 +2,13 @@ SUMMARY = "OpenGL extension loading library"
 DESCRIPTION = "The OpenGL Extension Wrangler Library (GLEW) is a cross-platform open-source C/C++ extension loading library."
 HOMEPAGE = "http://glew.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=67586"
-SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
-DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
-           file://no-strip.patch"
+           file://no-strip.patch \
+           file://linux-egl-no-libGL.patch \
+"
 
 SRC_URI[md5sum] = "2a2cd7c98f13854d2fcddae0d2b20411"
 SRC_URI[sha256sum] = "c572c30a4e64689c342ba1624130ac98936d7af90c3103f9ce12b8a0c5736764"
@@ -19,12 +18,17 @@ UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit lib_package pkgconfig distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', 'egl', d)}"
+
+PACKAGECONFIG[opengl] = "SYSTEM='linux',,virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
+PACKAGECONFIG[egl] = "SYSTEM='linux-egl' GLEW_NO_GLU='-DGLEW_NO_GLU',,virtual/egl"
 
-# Override SYSTEM to avoid calling config.guess, we're cross-compiling.  Pass
-# our CFLAGS via POPT as that's the optimisation variable and safely
-# overwritten.
-EXTRA_OEMAKE = "SYSTEM='linux' \
+# Override SYSTEM (via PACKAGECONFIG_CONFARGS) to avoid calling config.guess,
+# we're cross-compiling. Pass our CFLAGS via POPT as that's the optimisation
+# variable and safely overwritten.
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} \
                 CC='${CC}' LD='${CC}' STRIP='' \
                 LDFLAGS.EXTRA='${LDFLAGS}' \
                 POPT='${CFLAGS}' \
-- 
1.9.1


