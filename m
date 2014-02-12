Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A2EA26E7F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 17:27:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2014 09:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,833,1384329600"; d="scan'208";a="454320533"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2014 09:27:40 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 19:27:42 +0200
Message-Id: <1392226062-3797-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH_V2] mesa: upgrade to 9.2.5
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
X-List-Received-Date: Wed, 12 Feb 2014 17:27:42 -0000

tested on qemux86, genericx86 for core-image-sato
and core-image-weston.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../mesa/{mesa-gl_9.2.2.bb => mesa-gl_9.2.5.bb}                |  0
 meta/recipes-graphics/mesa/{mesa_9.2.2.bb => mesa_9.2.5.bb}    | 10 ++++++++--
 meta/recipes-graphics/mesa/mesa_git.bb                         | 10 ++++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.2.bb => mesa-gl_9.2.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.2.bb => mesa_9.2.5.bb} (38%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa_9.2.2.bb b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
similarity index 38%
rename from meta/recipes-graphics/mesa/mesa_9.2.2.bb
rename to meta/recipes-graphics/mesa/mesa_9.2.5.bb
index 60eba01..f37586b 100644
--- a/meta/recipes-graphics/mesa/mesa_9.2.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
@@ -5,7 +5,13 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0006-fix-out-of-tree-egl.patch \
            "
 
-SRC_URI[md5sum] = "20887f8020db7d1736a01ae9cd5d8c38"
-SRC_URI[sha256sum] = "c78a5035233672844cf2492fe82dc10877e12026be227d04469d6ca6ac656a3d"
+SRC_URI[md5sum] = "9fb4de29ca1d9cfd03cbdefa123ba336"
+SRC_URI[sha256sum] = "b46ab9efed176df0591993397594d712ada9da6a47fd31bbe75050fe28eb6bf0"
 
 S = "${WORKDIR}/Mesa-${PV}"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+}
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 19d3e70..320b8d5 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -5,8 +5,8 @@ DEFAULT_PREFERENCE = "-1"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
 
 PR = "${INC_PR}.0"
-SRCREV = "8f0742051e8501e737affb392996aef172034ca8"
-PV = "9.2.2+git${SRCPV}"
+SRCREV = "4636e87191fddd492ed8c61ba61faf4b2d89b2e4"
+PV = "9.2.5+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
@@ -14,3 +14,9 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
            "
 
 S = "${WORKDIR}/git"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+}
-- 
1.8.3.2


