Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102r-0001XI-Ne
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:22 +0200
Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:28 -0700
Received: by mail-wg0-f42.google.com with SMTP id fm10so3244146wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=5Jxef6qIfKgjL6p2fTDwvV+DqePL7ORGN7f8RsYcMVU=;
	b=ezcEMDDa5GDG/jhWUf4M22ICBSqL6CRdP2WFsUNjW2lPEWq9RXyWDJT/n+y0uQHBpr
	BGFjAtFgf1LQ9ZF5cq3rJ+kcdZJ3pXeRWfRh1DA3ry/xPOWKi+ot4Se8sTh4UJckX+2c
	QAfXe0D2ZGnrWHfRdVgBz8ScPbrnAcoLt6hCMLqt597uLlSxT2FRruOLYjeAt4fCfgJO
	EH8JAPh5922xQbCTQ/zIZ0ridDWQ1AYaE68189IrBsemc8Tw4V1TpiOEwcfQeGp18IXv
	QH/9xqF7JAF45EH++xQXkWv3I3Qdcg+CdEmw3dBKbESJoah+cNyFboaiNpYTRg1DzYGW
	r7lw==
Received: by 10.180.81.38 with SMTP id w6mr20720958wix.10.1344884368429;
	Mon, 13 Aug 2012 11:59:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:46 +0100
Message-Id: <85e94354fe996587ec8ff7a9035103ebc3dd63dd.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlh1Xce/fZnVraICNP6h7GamFHNRNYQLk3m9xXOAufyfYjooIUGhZnLCDjuwlV5snmlUzGH
Subject: [PATCH 7/8] mesa: respect x11 DISTRO_FEATURE
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:23 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   15 +++++-----
 meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
 4 files changed, 39 insertions(+), 8 deletions(-)
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
index 24cc3d0..feb152b 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,14 +12,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r1"
+INC_PR = "r2"
 PE = "2"
 
-
-PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
-
-DEPENDS = "makedepend-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
+DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
 
@@ -31,10 +27,13 @@ inherit autotools pkgconfig pythonnative
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls \
                 --enable-shared-glapi"
 
-PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
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



