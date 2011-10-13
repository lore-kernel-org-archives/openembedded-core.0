Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJcl-00043l-S9
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:55 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=innEmgwPGlGtFNP2eXbLSfjRWm2OKsDpWYAo9+jft/s=;
	b=Q6Lm4taseYUOgmyOju5we4aF9BljwpqgNkMuDUtqWbQ6cVIgFsrU4oLG3mQcZ+xsBw
	ihyl3JjQ7bjMcDpyuS6MSj5MG6OGkLn9LXj4kj8ZN6Bk5d+RKvkMRbtTTFjEbFIabhHk
	wmXSif5e2+JTXGles/OWYfWAd1TYpl7TZToXw=
Received: by 10.204.142.202 with SMTP id r10mr2353294bku.56.1318505594326;
	Thu, 13 Oct 2011 04:33:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm3291729bkv.3.2011.10.13.04.33.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:33:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:37 +0200
Message-Id: <c0bd2bf5b89018ffe7d4a35c3faa2aaee1e3bc47.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 19/20] mesa-git: upgrade from 7.7+git to 7.11+git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 11:42:20 -0000

* progs package is also gone like in 7.11 (moved to separate recipe)
* uclibc.patch was updated a bit to apply again

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc          |   39 ++----
 meta/recipes-graphics/mesa/mesa-git/uclibc.patch |   57 ++++++++
 meta/recipes-graphics/mesa/mesa/cross2.patch     |   46 ------
 meta/recipes-graphics/mesa/mesa/i586/matypes.h   |  162 ----------------------
 4 files changed, 71 insertions(+), 233 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-git/uclibc.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/cross2.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/i586/matypes.h

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 2f27ef1..c9b17a9 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -1,30 +1,19 @@
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://cross2.patch \
-           file://matypes.h"
-#           file://mesa-DRI2Swapbuffer.patch "
-S = "${WORKDIR}/git"
-
-SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
-PV = "7.7+git${SRCPV}"
-
-PACKAGES =+ "${PN}-xprogs"
+DEPENDS += "mesa-dri-glsl-native"
 
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
+SRCREV = "983fa4ad523535debf2e94cf6ac1fd4c5630c0d2"
+PV = "7.11+gitr${SRCPV}"
 
-do_configure_prepend () {
-    cp ${WORKDIR}/matypes.h ${S}/src/mesa/x86
-    touch ${S}/src/mesa/x86/matypes.h
-}
+FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
 
-do_compile () {
-	oe_runmake clean
-	oe_runmake -C src/glsl CC='${BUILD_CC}' CFLAGS=""
-	mv ${S}/src/glsl/apps/compile ${S}/host_compile
-	oe_runmake clean
-	oe_runmake GLSL_CL="${S}/host_compile"
-}
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git"
+SRC_URI += "file://uclibc.patch \
+            file://crossfix.patch \
+           "
+S = "${WORKDIR}/git"
 
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
+do_configure_prepend() {
+  #check for python not python2, because python-native does not stage python2 binary/link
+  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
+  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
+  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
 }
diff --git a/meta/recipes-graphics/mesa/mesa-git/uclibc.patch b/meta/recipes-graphics/mesa/mesa-git/uclibc.patch
new file mode 100644
index 0000000..0b031f9
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-git/uclibc.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Pending
+
+From 904bd5127bd88f45abf4a376676e0a487cfb018a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 13 Oct 2011 12:46:53 +0200
+Subject: [PATCH] configure: add check HAVE_NEWLOCALE to fix build with uclibc
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac            |    3 +++
+ src/glsl/strtod.c       |    2 +-
+ src/mesa/main/imports.c |    2 +-
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 49e81ad..468cfd7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -507,6 +507,9 @@ AC_SUBST([DLOPEN_LIBS])
+ dnl See if posix_memalign is available
+ AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
+ 
++dnl See if newlocale is available
++AC_CHECK_FUNCS_ONCE(newlocale)
++
+ dnl SELinux awareness.
+ AC_ARG_ENABLE([selinux],
+     [AS_HELP_STRING([--enable-selinux],
+diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
+index ff34591..88aa5ef 100644
+--- a/src/glsl/strtod.c
++++ b/src/glsl/strtod.c
+@@ -44,7 +44,7 @@
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
+index 345a1c5..493e0fb 100644
+--- a/src/mesa/main/imports.c
++++ b/src/mesa/main/imports.c
+@@ -767,7 +767,7 @@ float
+ _mesa_strtof( const char *s, char **end )
+ {
+ #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && \
+-    !defined(ANDROID)
++    !defined(ANDROID) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+-- 
+1.7.7
+
diff --git a/meta/recipes-graphics/mesa/mesa/cross2.patch b/meta/recipes-graphics/mesa/mesa/cross2.patch
deleted file mode 100644
index 264c153..0000000
--- a/meta/recipes-graphics/mesa/mesa/cross2.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2009-09-01 16:38:26.000000000 +0100
-+++ git/configure.ac	2009-09-01 16:38:47.000000000 +0100
-@@ -269,15 +269,6 @@
- GLAPI_ASM_SOURCES=""
- AC_MSG_CHECKING([whether to enable assembly])
- test "x$enable_asm" = xno && AC_MSG_RESULT([no])
--# disable if cross compiling on x86/x86_64 since we must run gen_matypes
--if test "x$enable_asm" = xyes && test "x$cross_compiling" = xyes; then
--    case "$host_cpu" in
--    i?86 | x86_64)
--        enable_asm=no
--        AC_MSG_RESULT([no, cross compiling])
--        ;;
--    esac
--fi
- # check for supported arches
- if test "x$enable_asm" = xyes; then
-     case "$host_cpu" in
-Index: git/src/mesa/x86/Makefile
-===================================================================
---- git.orig/src/mesa/x86/Makefile	2009-09-01 16:40:02.000000000 +0100
-+++ git/src/mesa/x86/Makefile	2009-09-01 16:40:13.000000000 +0100
-@@ -14,19 +14,6 @@
- 	-I../tnl
- 
- 
--default: gen_matypes matypes.h
--
--clean:
--	-rm -f matypes.h gen_matypes
--
--
--gen_matypes: gen_matypes.c
--	$(HOST_CC) $(ARCH_FLAGS) $(INCLUDE_DIRS) $(HOST_CFLAGS) gen_matypes.c -o gen_matypes
--
--# need some special rules here, unfortunately
--matypes.h: ../main/mtypes.h ../tnl/t_context.h gen_matypes
--	./gen_matypes > matypes.h
--
- common_x86_asm.o: matypes.h
- 3dnow_normal.o: matypes.h
- 3dnow_xform1.o: matypes.h
diff --git a/meta/recipes-graphics/mesa/mesa/i586/matypes.h b/meta/recipes-graphics/mesa/mesa/i586/matypes.h
deleted file mode 100644
index 98d2188..0000000
--- a/meta/recipes-graphics/mesa/mesa/i586/matypes.h
+++ /dev/null
@@ -1,162 +0,0 @@
-/*
- * This file is automatically generated from the Mesa internal type
- * definitions.  Do not edit directly.
- */
-
-#ifndef __ASM_TYPES_H__
-#define __ASM_TYPES_H__
-
-
-
-/* =============================================================
- * Offsets for GLcontext
- */
-
-#define CTX_DRIVER_CTX              	996
-
-#define CTX_LIGHT_ENABLED           	39404
-#define CTX_LIGHT_SHADE_MODEL       	39408
-#define CTX_LIGHT_COLOR_MAT_FACE    	39412
-#define CTX_LIGHT_COLOR_MAT_MODE    	39416
-#define CTX_LIGHT_COLOR_MAT_MASK    	39420
-#define CTX_LIGHT_COLOR_MAT_ENABLED 	39424
-#define CTX_LIGHT_ENABLED_LIST      	39432
-#define CTX_LIGHT_NEED_VERTS        	43793
-#define CTX_LIGHT_FLAGS             	43796
-#define CTX_LIGHT_BASE_COLOR        	43800
-
-
-/* =============================================================
- * Offsets for struct vertex_buffer
- */
-
-#define VB_SIZE                	0
-#define VB_COUNT               	4
-
-#define VB_ELTS                	8
-#define VB_OBJ_PTR             	12
-#define VB_EYE_PTR             	16
-#define VB_CLIP_PTR            	20
-#define VB_PROJ_CLIP_PTR       	24
-#define VB_CLIP_OR_MASK        	28
-#define VB_CLIP_MASK           	32
-#define VB_NORMAL_PTR          	36
-#define VB_EDGE_FLAG           	44
-#define VB_TEX0_COORD_PTR      	48
-#define VB_TEX1_COORD_PTR      	52
-#define VB_TEX2_COORD_PTR      	56
-#define VB_TEX3_COORD_PTR      	60
-#define VB_INDEX_PTR           	80
-#define VB_COLOR_PTR           	88
-#define VB_SECONDARY_COLOR_PTR 	96
-#define VB_FOG_COORD_PTR       	104
-#define VB_PRIMITIVE           	108
-
-
-/*
- * Flags for struct vertex_buffer
- */
-
-#define VERT_BIT_OBJ           	0x1
-#define VERT_BIT_NORM          	0x4
-#define VERT_BIT_RGBA          	0x8
-#define VERT_BIT_SPEC_RGB      	0x10
-#define VERT_BIT_FOG_COORD     	0x20
-#define VERT_BIT_TEX0          	0x100
-#define VERT_BIT_TEX1          	0x200
-#define VERT_BIT_TEX2          	0x400
-#define VERT_BIT_TEX3          	0x800
-
-
-/* =============================================================
- * Offsets for GLvector4f
- */
-
-#define V4F_DATA          	0
-#define V4F_START         	4
-#define V4F_COUNT         	8
-#define V4F_STRIDE        	12
-#define V4F_SIZE          	16
-#define V4F_FLAGS         	20
-
-/*
- * Flags for GLvector4f
- */
-
-#define VEC_MALLOC        	0x10
-#define VEC_NOT_WRITEABLE 	0x40
-#define VEC_BAD_STRIDE    	0x100
-
-#define VEC_SIZE_1        	0x1
-#define VEC_SIZE_2        	0x3
-#define VEC_SIZE_3        	0x7
-#define VEC_SIZE_4        	0xf
-
-
-/* =============================================================
- * Offsets for GLmatrix
- */
-
-#define MATRIX_DATA   	0
-#define MATRIX_INV    	4
-#define MATRIX_FLAGS  	8
-#define MATRIX_TYPE   	12
-
-
-/* =============================================================
- * Offsets for struct gl_light
- */
-
-#define LIGHT_NEXT              	0
-#define LIGHT_PREV              	4
-
-#define LIGHT_AMBIENT           	8
-#define LIGHT_DIFFUSE           	24
-#define LIGHT_SPECULAR          	40
-#define LIGHT_EYE_POSITION      	56
-#define LIGHT_SPOT_DIRECTION    	72
-#define LIGHT_SPOT_EXPONENT     	88
-#define LIGHT_SPOT_CUTOFF       	92
-#define LIGHT_COS_CUTOFF        	100
-#define LIGHT_CONST_ATTEN       	104
-#define LIGHT_LINEAR_ATTEN      	108
-#define LIGHT_QUADRATIC_ATTEN   	112
-#define LIGHT_ENABLED           	116
-
-#define LIGHT_FLAGS             	120
-
-#define LIGHT_POSITION          	124
-#define LIGHT_VP_INF_NORM       	140
-#define LIGHT_H_INF_NORM        	152
-#define LIGHT_NORM_DIRECTION    	164
-#define LIGHT_VP_INF_SPOT_ATTEN 	180
-
-#define LIGHT_SPOT_EXP_TABLE    	184
-#define LIGHT_MAT_AMBIENT       	4280
-#define LIGHT_MAT_DIFFUSE       	4304
-#define LIGHT_MAT_SPECULAR      	4328
-
-#define SIZEOF_GL_LIGHT         	4360
-
-/*
- * Flags for struct gl_light
- */
-
-#define LIGHT_SPOT              	0x1
-#define LIGHT_LOCAL_VIEWER      	0x2
-#define LIGHT_POSITIONAL        	0x4
-
-#define LIGHT_NEED_VERTICES     	0x6
-
-
-/* =============================================================
- * Offsets for struct gl_lightmodel
- */
-
-#define LIGHT_MODEL_AMBIENT       	0
-#define LIGHT_MODEL_LOCAL_VIEWER  	16
-#define LIGHT_MODEL_TWO_SIDE      	17
-#define LIGHT_MODEL_COLOR_CONTROL 	20
-
-
-#endif /* __ASM_TYPES_H__ */
-- 
1.7.7



