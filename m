Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAL-0001q3-I9
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:54 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:16 -0700
Received: by wibhq12 with SMTP id hq12so4394659wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=mXLYp/cFjoiaaPoESwQPF/5q8nFJ7G245ipRP/5zalE=;
	b=PslPd0huzJ5EH35e5XaOBKRBSTmx2LE+BxV7gWMGVjp5F3AH24F67xVdOeiZYIc+tS
	hTv91deUX1Wd+hyXphqLQNclw4dceZN8RKLDsMFpOhL4QKYjndnyk4AsIGg1EGUh7URK
	keyQyENg6hOObncqYpm3OAnh+mJFi3Wh10o9Er834xItc6pIZyU7XHPUFx5MCJ/wr6wk
	MGwUOG4xDO71Yu9Pj4kavx9I6y1N8QDrE3cx3pvzdUlga8AihCRelPGi+46HXXrHfAIr
	+mLiWeHewY1jx/NpINATIkUAHQLbCTK9GoCbrL7J3IAl0fDaS7599oy48hvjmBwopjmg
	q6gA==
Received: by 10.180.95.193 with SMTP id dm1mr12674886wib.10.1343835434900;
	Wed, 01 Aug 2012 08:37:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:36 +0100
Message-Id: <3eb1f36bdbb11d0094a86f865a3b8c910897c9c2.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn6U93uD0l0WUxZRySV23mzVK7inv/YpESqxdyUtdVYHwPZzVKz+peMMvrWTwq7hEMl+vYl
Subject: [PATCH 09/11] mesa: respect x11 DISTRO_FEATURE
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:55 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   16 ++++++-----
 meta/recipes-graphics/mesa/mesa-dri.inc            |    4 +--
 meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
 5 files changed, 43 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch

diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
index d9d17bb..9afb35d 100644
--- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
+++ b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
@@ -5,6 +5,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-cross-compile.patch \
            file://0003-fix-for-x32.patch \
            "
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index e5eb28c..661e76e 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,14 +12,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r2"
+INC_PR = "r3"
 PE = "2"
 
-
-PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
-
-DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
+DEPENDS = "libxml2-native makedepend-native python-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
@@ -31,8 +27,14 @@ inherit autotools pkgconfig pythonnative
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls \
                 --enable-shared-glapi"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'x11', '--enable-glx-tls', '--disable-glx', d)}"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'egl', 'egl', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index d558f06..35d17a4 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -8,14 +8,14 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
-EGL_PLATFORMS  = "drm,x11"
+EGL_PLATFORMS  = "drm"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
 EXTRA_OECONF += "--enable-gles1 --enable-gles2"
 EXTRA_OECONF += "--enable-gbm"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'egl', 'egl', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}", "--disable-egl"
 
 python populate_packages_prepend() {
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 32b1d96..7910eb6 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -11,6 +11,8 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0002-cross-compile.patch \
            file://0003-fix-for-x32.patch \
            "
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
+
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
diff --git a/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
new file mode 100644
index 0000000..cf9dee2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
@@ -0,0 +1,29 @@
+gross hack to prevent from install libgl
+
+This patch is not suitable for upstream. This is only needed for the 8.0.x
+branch, master (8.1.x) has a largely different build system (using automake)
+and does not need it. It is fully expected to drop the patch with the next bump
+to a stable version based on 8.1.x.
+
+Upstream-Status: Inappropriate
+
+---
+ src/mesa/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mesa/Makefile b/src/mesa/Makefile
+index 0e15d61..a0a2cb5 100644
+--- a/src/mesa/Makefile
++++ b/src/mesa/Makefile
+@@ -166,7 +166,7 @@ install: default $(DRICORE_INSTALL_TARGET)
+ 	            else \
+ 	              $(MAKE) install-osmesa || exit 1 ; \
+ 	            fi ;; \
+-	    dri)    $(MAKE) install-libgl install-dri || exit 1 ;; \
++	    dri)    $(MAKE) install-dri || exit 1 ;; \
+ 	    *)      $(MAKE) install-libgl || exit 1 ;; \
+ 	  esac ; \
+ 	done
+-- 
+1.7.10.4
+
-- 
1.7.10



