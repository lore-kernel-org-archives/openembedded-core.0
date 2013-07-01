Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id A6DBF6AFAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 19:36:28 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so2324099eae.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 12:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gU7Mtr8asl7ZUVuGeYRIc7v0uMc0/3RAA8knUV1zSYo=;
	b=ne/0wE9IOW8V4nDhm1TACEWdDDLqfxoiAkBFUXrQpuF93WQklm6TUUu3RkcSCSKMur
	fvZOuHIonS5IntQewiXKd2iu9wx3EZ7AEp833JTRqvHFXL2qP01IpjRJZobsdVxomDS4
	uGkccsqbFnJDpoGdpVhL7BrWNz839qvtfH19rfLrj7HvQRXeHdYDGVWNcX93sai/0rV2
	Jcv79y9er4cnyVUx4faEYICD+DhmPlY2VrVkGROpf5MCRYRRkU+x9oizAXdD3N7+HANf
	0IJVMzBPEs1qYf+Lr2+Leos+I2buImREBwFq+VIZaPA9IYeB3q+v/y7qYV4DyxA2E0i+
	ZmQg==
X-Received: by 10.14.241.136 with SMTP id g8mr22706007eer.104.1372707389331;
	Mon, 01 Jul 2013 12:36:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm31722490eeu.4.2013.07.01.12.36.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 12:36:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 21:36:25 +0200
Message-Id: <4251b618a76523e6f46d090b904ab36f614e6452.1372707180.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <814d1612d36ac296ec0e5b522722b4a10f57ea16.1372707180.git.Martin.Jansa@gmail.com>
References: <814d1612d36ac296ec0e5b522722b4a10f57ea16.1372707180.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372707180.git.Martin.Jansa@gmail.com>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] mesa: fix pipe_loader_sw build without libx11
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
X-List-Received-Date: Mon, 01 Jul 2013 19:36:29 -0000

* this is needed to fix pipe_loader_sw build without libx11,
  but building with HAVE_PIPE_LOADER_XLIB enabled still doesn't
  work (nobody is using this and it was removed in newer SRCREV).
  See https://bugs.freedesktop.org/show_bug.cgi?id=66357 for details.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ..._sw-include-xlib_sw_winsys.h-only-when-HA.patch | 52 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |  1 +
 meta/recipes-graphics/mesa/mesa_git.bb             |  1 +
 3 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch

diff --git a/meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch b/meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
new file mode 100644
index 0000000..2df5e61
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
@@ -0,0 +1,52 @@
+From debac5531f7107d239530ff6e29eeda72b9ec1e9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Jun 2013 11:20:51 +0200
+Subject: [PATCH 2/4] pipe_loader_sw: include xlib_sw_winsys.h only when
+ HAVE_PIPE_LOADER_XLIB
+
+* HAVE_WINSYS_XLIB was removed in
+  commit b3f1f665b0fef178ae193e6b111f14c9a5ad3b25
+  Author: Matt Turner <mattst88@gmail.com>
+  Date:   Sun Jan 20 15:32:08 2013 -0800
+  build: Get rid of GALLIUM_WINSYS_DIRS
+
+* HAVE_PIPE_LOADER_XLIB is set correctly:
+  if test "x$NEED_WINSYS_XLIB" = xyes; then
+      GALLIUM_PIPE_LOADER_DEFINES="$GALLIUM_PIPE_LOADER_DEFINES -DHAVE_PIPE_LOADER_XLIB"
+      GALLIUM_PIPE_LOADER_LIBS="$GALLIUM_PIPE_LOADER_LIBS \$(top_builddir)/src/gallium/winsys/sw/xlib/libws_xlib.la"
+  fi
+
+* fixes build of pipe_loader_sw without libx11 headers available
+
+Upstream-Status: Submitted https://bugs.freedesktop.org/show_bug.cgi?id=66357
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c b/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
+index c2b78c6..0da3f4d 100644
+--- a/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
++++ b/src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
+@@ -31,7 +31,9 @@
+ #include "util/u_dl.h"
+ #include "sw/null/null_sw_winsys.h"
+ #include "target-helpers/inline_sw_helper.h"
++#ifdef HAVE_PIPE_LOADER_XLIB
+ #include "state_tracker/xlib_sw_winsys.h"
++#endif
+ 
+ struct pipe_loader_sw_device {
+    struct pipe_loader_device base;
+@@ -44,7 +46,7 @@ struct pipe_loader_sw_device {
+ static struct pipe_loader_ops pipe_loader_sw_ops;
+ 
+ static struct sw_winsys *(*backends[])() = {
+-#ifdef HAVE_WINSYS_XLIB
++#ifdef HAVE_PIPE_LOADER_XLIB
+    x11_sw_create,
+ #endif
+    null_sw_create
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
index ec95c10..bbeacd3 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
@@ -5,6 +5,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://fix-glsl-cross.patch \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
            file://0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
+           file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            "
 
 SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 5e252af..09a9531 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://fix-glsl-cross.patch \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
            file://0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
+           file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.8.2.1


