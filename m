Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TXvn3-0006wg-3u
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 16:19:09 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Nov 2012 07:04:52 -0800
Received: by mail-lb0-f197.google.com with SMTP id gg13so991366lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 07:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=CN7w76fzERR+lU2hP3ktZFgpwLP0/ADoYZreJszI1KY=;
	b=XdcLo6INOHMutStSaFGu/BO213iHbLFj1H7Cbz+ktv1UuJ69nI//JjzMKNFtzAkM3T
	ge/ccajwJ6Y0QQKKpnbgWxNztnWYprHdP4GvRk6Ix/loUT7Lizc1jd4HFnj0cKkK35NH
	6tbjkw8qqdA8UaESTNwqaGpIZ1FsNLLQrdQ4YNzB7YW1yNGl1ltaHJcw7ysHHanZAtm2
	MbKcPJ5cQOYa5+gHR8PtmbqnW4FQnpCnLZEqfSNwRLDT0ZwFGforl97Fh8/1xnKyMa7H
	4LLZ9G8g3Cgw/3DOd822Ec90/xvRIP5FufNVJr0WR85+eeIZ7PUqkZz6JUvo6R/rXLhw
	QPGw==
Received: by 10.180.94.41 with SMTP id cz9mr15445453wib.2.1352732690480;
	Mon, 12 Nov 2012 07:04:50 -0800 (PST)
Received: by 10.180.94.41 with SMTP id cz9mr15445436wib.2.1352732690278;
	Mon, 12 Nov 2012 07:04:50 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fa9sm12042776wib.5.2012.11.12.07.04.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 07:04:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2012 15:03:28 +0000
Message-Id: <1352732608-9517-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQko89SKiGuhZoXXurJ1HyXj8dQjVMqGBhLj+HkEcCYaOAB0WxzP9Bv4kUllkBVUViBz6/BcKfdNVJNV7uxDaYJrNCopmOhowFiaNOGUAltlhuJVASzmYtuwLubipyBdx4C9jcBgRcAmMjQDA7Slw+cLCsTojX+91igKQ0x+yKwDlTsWwHk3GEnSxmuL77fAjPn6vvgI
Subject: [PATCH] mesa-demos: fix --with-glut check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 15:19:09 -0000

The GLUT check was automatic and couldn't be disabled, so mesa-demos would gain
a GLUT dependency if it was present when built.

So, fix configure.ac so that --without-glut works as expected.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-demos/glut.patch |   46 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb   |   10 +++--
 2 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/glut.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/glut.patch b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
new file mode 100644
index 0000000..84b6d4f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
@@ -0,0 +1,46 @@
+Correctly implement with AC_WITH(glut) so that --without-glut works.
+
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57013]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: mesa-demos-8.0.1/configure.ac
+===================================================================
+--- mesa-demos-8.0.1.orig/configure.ac	2010-07-13 19:52:41.000000000 +0100
++++ mesa-demos-8.0.1/configure.ac	2012-11-12 12:49:54.940054571 +0000
+@@ -65,21 +65,25 @@
+ DEMO_LIBS="$DEMO_LIBS $GL_LIBS"
+ 
+ dnl Check for GLUT
+-GLUT_CFLAGS=""
+-GLUT_LIBS=-lglut
+-glut_enabled=yes
++glut_enabled=no
+ AC_ARG_WITH([glut],
+ 	[AS_HELP_STRING([--with-glut=DIR],
+ 			[glut install directory])],
+ 	[GLUT_CFLAGS="-I$withval/include"
+-	 GLUT_LIBS="-L$withval/lib -lglut"])
+-AC_CHECK_HEADER([GL/glut.h],
+-		[],
+-		[glut_enabled=no])
+-AC_CHECK_LIB([glut],
+-		[glutInit],
+-		[],
+-		[glut_enabled=no])
++	 GLUT_LIBS="-L$withval/lib -lglut"],
++	[GLUT_CFLAGS=""
++	 GLUT_LIBS="-lglut"]
++        )
++AS_IF([test "x$with_glut" != xno],
++      [AC_CHECK_HEADER([GL/glut.h],
++                       [],
++                       [glut_enabled=no])
++       AC_CHECK_LIB([glut],
++                    [glutInit],
++                    [],
++                    [glut_enabled=no])
++       glut_enabled=yes
++])
+ 
+ GLEW_CFLAGS=""
+ GLEW_LIBS="-lGLEW"
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
index 1d16bfc..0511734 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
@@ -11,13 +11,15 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=9142
 
 DEPENDS = "virtual/libx11 virtual/libgl glew"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
 	file://dso_linking_change_build_fix.patch \
-	file://gles2-info.patch"
+	file://gles2-info.patch \
+        file://glut.patch"
+SRC_URI[md5sum] = "320c2a4b6edc6faba35d9cb1e2a30bf4"
+SRC_URI[sha256sum] = "4bc7f2b20d17e3eebfec288f2367a435cd2db71fc5ac9ece2c14827e290d77d1"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "320c2a4b6edc6faba35d9cb1e2a30bf4"
-SRC_URI[sha256sum] = "4bc7f2b20d17e3eebfec288f2367a435cd2db71fc5ac9ece2c14827e290d77d1"
+EXTRA_OECONF = "--without-glut"
-- 
1.7.10



