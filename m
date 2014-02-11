Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 870DA6EE62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 18:08:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2014 10:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,826,1384329600"; d="scan'208";a="479773116"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2014 10:08:12 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 20:08:13 +0200
Message-Id: <1392142093-9057-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: upgrade to 9.2.5
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
X-List-Received-Date: Tue, 11 Feb 2014 18:08:14 -0000

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
index 60eba01..8d7d88f 100644
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
+do_configure_append() {
+    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${S}/include/EGL/eglplatform.h
+}
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 19d3e70..af499a9 100644
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
+do_configure_append() {
+    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${S}/include/EGL/eglplatform.h
+}
-- 
1.8.3.2


