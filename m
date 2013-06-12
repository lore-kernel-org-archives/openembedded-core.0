Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 907F16A9E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:52 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so4773228eek.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=1BwbxbIi2AC0E3luv+2dWbxlmpgy/AquwapSlUck55o=;
	b=oLrHG1Q1xtepThpZJGrA72IBTYxXmfIH7Tr8dM1wOwDYkdxFdncsFia2kmlqOWO0DL
	i5VNbddGTZNiNWP6uhKwWiaVkO8wtATYsyVjEjm2JiF7lJKz1GsHqYrOFAqaZBPX8YKn
	C3ZbQPQRejE9BgWQdqewRtgKzfzutZ8gsx7b6GjB+vQZCKYRJVQLtP8vuTSAJcV1nLGF
	AYIK9yLX+QQQysduWKshDBvzFLYgryC2E4hwI/9D5hSmW2LfA+KrNlZztvuvQf2ZNVsF
	8R6IrJwcAajVAs6eOxizrSJIu3lfYbgGld/4iUWF7FhKZLxIvWG45GSDT9LM5TUC4bgI
	0X5A==
X-Received: by 10.14.1.136 with SMTP id 8mr21378584eed.106.1371079193296;
	Wed, 12 Jun 2013 16:19:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y2sm39837907eeu.2.2013.06.12.16.19.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:20:03 +0200
Message-Id: <927fda032a87b33dd1fe491e6a47de9affa49db3.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] mesa: introduce gallium-llvmpipe PACKAGECONFIG
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc                |  6 ++
 ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch | 65 ++++++++++++++++++++++
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch | 42 ++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |  2 +
 meta/recipes-graphics/mesa/mesa_git.bb             |  2 +
 5 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b4e9b84..6aba0cb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,6 +51,12 @@ PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
 GALLIUMDRIVERS = "swrast"
 PACKAGECONFIG[gallium] = "--enable-gallium --with-gallium-drivers=${GALLIUMDRIVERS}, --disable-gallium --without-gallium-drivers"
 
+export WANT_LLVM_RELEASE = "3.2"
+PACKAGECONFIG[gallium-llvmpipe] = "--enable-gallium-llvm --enable-gallium-egl --enable-gallium-gbm --with-llvm-shared-libs --with-gallium-drivers=${GALLIUMDRIVERS}, --disable-gallium --without-gallium-drivers, llvm3.2"
+
+# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
+FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
+
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch b/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
new file mode 100644
index 0000000..9f7002a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
@@ -0,0 +1,65 @@
+From 877b8ea9a79d1d51f8e6b032801731538590d39e Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Tue, 4 Jun 2013 06:04:44 -0700
+Subject: [PATCH] configure: Avoid use of AC_CHECK_FILE for cross compiling
+
+The AC_CHECK_FILE macro can't be used for cross compiling as it will
+result in "error: cannot check for file existence when cross compiling".
+Replace it with the AS_IF macro.
+
+Upstream-Status: Submitted
+http://lists.freedesktop.org/archives/mesa-dev/2013-June/040168.html
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 36065f1..2b4a374 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1694,8 +1694,8 @@ if test "x$enable_gallium_llvm" = xyes; then
+                 CLANG_LIBDIR=${LLVM_LIBDIR}
+             fi
+             CLANG_RESOURCE_DIR=$CLANG_LIBDIR/clang/${LLVM_VERSION}
+-            AC_CHECK_FILE("$CLANG_RESOURCE_DIR/include/stddef.h",,
+-                AC_MSG_ERROR([Could not find clang internal header stddef.h in $CLANG_RESOURCE_DIR Use --with-clang-libdir to specify the correct path to the clang libraries.]))
++            AS_IF([test ! -f "$CLANG_RESOURCE_DIR/include/stddef.h"],
++                [AC_MSG_ERROR([Could not find clang internal header stddef.h in $CLANG_RESOURCE_DIR Use --with-clang-libdir to specify the correct path to the clang libraries.])])
+         fi
+     else
+ 	MESA_LLVM=0
+@@ -1912,7 +1912,7 @@ if test "x$MESA_LLVM" != x0; then
+     if test "x$with_llvm_shared_libs" = xyes; then
+         dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
+         LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
+-        AC_CHECK_FILE("$LLVM_LIBDIR/lib$LLVM_SO_NAME.so", llvm_have_one_so=yes,)
++        AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.so"], [llvm_have_one_so=yes])
+ 
+         if test "x$llvm_have_one_so" = xyes; then
+             dnl LLVM was built using auto*, so there is only one shared object.
+@@ -1920,8 +1920,8 @@ if test "x$MESA_LLVM" != x0; then
+         else
+             dnl If LLVM was built with CMake, there will be one shared object per
+             dnl component.
+-            AC_CHECK_FILE("$LLVM_LIBDIR/libLLVMTarget.so",,
+-                    AC_MSG_ERROR([Could not find llvm shared libraries:
++            AS_IF([test ! -f "$LLVM_LIBDIR/libLLVMTarget.so"],
++                    [AC_MSG_ERROR([Could not find llvm shared libraries:
+ 	Please make sure you have built llvm with the --enable-shared option
+ 	and that your llvm libraries are installed in $LLVM_LIBDIR
+ 	If you have installed your llvm libraries to a different directory you
+@@ -1932,7 +1932,7 @@ if test "x$MESA_LLVM" != x0; then
+ 		--enable-opencl
+ 	If you do not want to build with llvm shared libraries and instead want to
+ 	use llvm static libraries then remove these options from your configure
+-	invocation and reconfigure.]))
++	invocation and reconfigure.])])
+ 
+            dnl We don't need to update LLVM_LIBS in this case because the LLVM
+            dnl install uses a shared object for each compoenent and we have
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
new file mode 100644
index 0000000..b74fddc
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
@@ -0,0 +1,42 @@
+From 9915636fb8afe75ee2e8e013e4f495a4cb937afb Mon Sep 17 00:00:00 2001
+From: Brian Paul <brianp@vmware.com>
+Date: Wed, 6 Mar 2013 16:57:20 -0700
+Subject: [PATCH] llvmpipe: remove the power of two sizeof(struct cmd_block)
+ assertion
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It fails on 32-bit systems (I only tested on 64-bit).  Power of two
+size isn't required, so just remove the assertion.
+
+Reviewed-by: José Fonseca <jfonseca@vmware.com>
+
+Upstream-Status: Backport
+http://cgit.freedesktop.org/mesa/mesa/commit/?id=9915636fb8afe75ee2e8e013e4f495a4cb937afb
+
+---
+ src/gallium/drivers/llvmpipe/lp_scene.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/gallium/drivers/llvmpipe/lp_scene.c b/src/gallium/drivers/llvmpipe/lp_scene.c
+index dd0943e..a0912eb 100644
+--- a/src/gallium/drivers/llvmpipe/lp_scene.c
++++ b/src/gallium/drivers/llvmpipe/lp_scene.c
+@@ -76,13 +76,6 @@ lp_scene_create( struct pipe_context *pipe )
+       assert(maxCommandBytes < LP_SCENE_MAX_SIZE);
+       /* We'll also need space for at least one other data block */
+       assert(maxCommandPlusData <= LP_SCENE_MAX_SIZE);
+-
+-      /* Ideally, the size of a cmd_block object will be a power of two
+-       * in order to avoid wasting space when we allocation them from
+-       * data blocks (which are power of two also).
+-       */
+-      assert(sizeof(struct cmd_block) ==
+-             util_next_power_of_two(sizeof(struct cmd_block)));
+    }
+ #endif
+
+--
+1.8.3
+
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
index fc193f5..ec95c10 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
@@ -3,6 +3,8 @@ require ${BPN}.inc
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://fix-glsl-cross.patch \
+           file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
+           file://0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
 SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index ef0bec4..5e252af 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -10,6 +10,8 @@ PV = "9.1.3+git${SRCPV}"
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://fix-glsl-cross.patch \
+           file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
+           file://0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.8.2.1


