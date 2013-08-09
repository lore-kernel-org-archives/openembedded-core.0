Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 172396AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:32:27 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so2221724eek.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 08:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZdJrikMSqG5HuJvT1tIabdOe11x7hw/N+eZOBulD5d4=;
	b=YLIM833R+ndZGLe3PUdQjcpBFy05oMsSzDkwwURi8Hw/iofCx4r0+CetNvP1SBrNZw
	jdKbGHHbR3ivMmL9/t31sYh1q1gjVqu5fh5vFngXGs7D0OdeLW9bk44ysbMIEt5fOl3l
	DDDLHXV7kI5quVLj72SBKhSkHwTJwj74n9OCN+1lxowJUk1vqd59+jYY7H9MDHdvq+XM
	8h9YkOBf5tW/JJ2S7COq42qFtftLKQlhS/vS3J76nbQOaPgJ7f5ldyuBBIvtJJQHS1nD
	+5LXjZjuSyy+9/dUJYGPgSzpAVubB1BhMCXIx9kRAv/MbNE98woRR22k0tpRIinrTfiE
	JR3g==
X-Gm-Message-State: ALoCoQlcMTP+YWRspYR4UbRIiLH8bFC/MLH/dphS3vmInkugC8jORP4C+rKvdUlIVKVbsQLrkgQ5
X-Received: by 10.15.64.1 with SMTP id n1mr13931930eex.15.1376062347906;
	Fri, 09 Aug 2013 08:32:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a6sm17621574eei.10.2013.08.09.08.32.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 08:32:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 16:32:24 +0100
Message-Id: <1376062344-29942-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mesa: fix and enable out-of-tree builds
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
X-List-Received-Date: Fri, 09 Aug 2013 15:32:28 -0000

One patch (submitted upstream) for when Gallium is enabled, and another
(inappropriate for upstream) to fix out-of-tree builds with
0003-EGL-Mutate-NativeDisplayType-depending-on-config.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc      |    2 +-
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 +++++++++++++++++
 .../mesa/mesa/0006-fix-out-of-tree-egl.patch       |   48 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.6.bb           |    2 +
 meta/recipes-graphics/mesa/mesa_git.bb             |    2 +
 5 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 979f44b..eb19e0f 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -440,7 +440,7 @@ B_pn-mc = "${SEPB}"
 B_pn-menu-cache = "${SEPB}"
 B_pn-mesa-demos = "${SEPB}"
 # src/mapi/mapi/stub.c:51:39: error: 'MAPI_TABLE_NUM_DYNAMIC' undeclared here (not in a function)
-#B_pn-mesa-dri = "${SEPB}"
+B_pn-mesa = "${SEPB}"
 B_pn-minicom = "${SEPB}"
 # Not automake, no external tree support
 #B_pn-mkelfimage = "${SEPB}"
diff --git a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
new file mode 100644
index 0000000..8c5984f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9e31e15ebb0adbf3cc0394c30cbc1ccd2b35a27f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 28 Jun 2013 11:44:58 +0100
+Subject: [PATCH] build: fix out-of-tree builds in gallium/auxiliary
+
+The rules were writing files to e.g. util/u_indices_gen.py, but in an
+out-of-tree build this directory doesn't exist in the build directory.  So,
+create the directories just in case.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/gallium/auxiliary/Makefile.am |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gallium/auxiliary/Makefile.am b/src/gallium/auxiliary/Makefile.am
+index f14279b..0c3e7ba 100644
+--- a/src/gallium/auxiliary/Makefile.am
++++ b/src/gallium/auxiliary/Makefile.am
+@@ -38,13 +38,17 @@ libgallium_la_SOURCES += \
+ endif
+ 
+ indices/u_indices_gen.c: $(srcdir)/indices/u_indices_gen.py
++	mkdir --parents indices
+ 	$(AM_V_GEN) $(PYTHON2) $< > $@
+ 
+ indices/u_unfilled_gen.c: $(srcdir)/indices/u_unfilled_gen.py
++	mkdir --parents indices
+ 	$(AM_V_GEN) $(PYTHON2) $< > $@
+ 
+ util/u_format_srgb.c: $(srcdir)/util/u_format_srgb.py
++	mkdir --parents util
+ 	$(AM_V_GEN) $(PYTHON2) $< > $@
+ 
+ util/u_format_table.c: $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format_pack.py $(srcdir)/util/u_format_parse.py $(srcdir)/util/u_format.csv
++	mkdir --parents util
+ 	$(AM_V_GEN) $(PYTHON2) $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format.csv > $@
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch b/meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
new file mode 100644
index 0000000..88a4fb0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
@@ -0,0 +1,48 @@
+Fix out of tree compilation failure due to
+0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch.
+
+Upstream-Status: Inappropriate (upstream has different solution to root problem)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/egl/drivers/dri2/Makefile.am b/src/egl/drivers/dri2/Makefile.am
+index 45f7dfa..ed0e777 100644
+--- a/src/egl/drivers/dri2/Makefile.am
++++ b/src/egl/drivers/dri2/Makefile.am
+@@ -21,6 +21,7 @@
+ 
+ AM_CFLAGS = \
+ 	-I$(top_srcdir)/include \
++	-I$(top_builddir)/include \
+ 	-I$(top_srcdir)/src/egl/main \
+ 	-I$(top_srcdir)/src/gbm/main \
+ 	-I$(top_srcdir)/src/gbm/backends/dri \
+diff --git a/src/egl/drivers/glx/Makefile.am b/src/egl/drivers/glx/Makefile.am
+index 6bf67ea..7b87047 100644
+--- a/src/egl/drivers/glx/Makefile.am
++++ b/src/egl/drivers/glx/Makefile.am
+@@ -21,6 +21,7 @@
+ 
+ AM_CFLAGS = \
+ 	-I$(top_srcdir)/include \
++	-I$(top_builddir)/include \
+ 	-I$(top_srcdir)/src/egl/main \
+ 	$(X11_CFLAGS) \
+ 	$(DEFINES)
+diff --git a/src/egl/main/Makefile.am b/src/egl/main/Makefile.am
+index ca5257a..13a5734 100644
+--- a/src/egl/main/Makefile.am
++++ b/src/egl/main/Makefile.am
+@@ -27,6 +27,7 @@ endif
+ 
+ AM_CFLAGS = \
+ 	-I$(top_srcdir)/include \
++	-I$(top_builddir)/include \
+ 	-I$(top_srcdir)/src/gbm/main \
+ 	$(DEFINES) \
+ 	$(EGL_CFLAGS) \
+@@ -135,4 +136,4 @@ egl_HEADERS = \
+ 	$(top_srcdir)/include/EGL/eglext.h \
+ 	$(top_srcdir)/include/EGL/egl.h \
+ 	$(top_srcdir)/include/EGL/eglmesaext.h \
+-	$(top_srcdir)/include/EGL/eglplatform.h
++	$(top_builddir)/include/EGL/eglplatform.h
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
index d47822f..b55fa02 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
@@ -6,6 +6,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
+           file://0005-fix-out-of-tree-builds-gallium.patch \
+           file://0006-fix-out-of-tree-egl.patch \
            "
 
 SRC_URI[md5sum] = "443a2a352667294b53d56cb1a74114e9"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 52d3d81..e3e5150 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
+           file://0005-fix-out-of-tree-builds-gallium.patch \
+           file://0006-fix-out-of-tree-egl.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


