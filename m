Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7637865D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:58:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Apr 2014 06:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,857,1389772800"; d="scan'208";a="492599770"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2014 06:58:14 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Apr 2014 16:58:14 +0300
Message-Id: <1397483894-8263-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: liezhi.yang@windriver.co
Subject: [dora][PATCH_V2] mesa: double check for eglplatform.h
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
X-List-Received-Date: Mon, 14 Apr 2014 13:58:50 -0000

Even if 'egl' is in PACKAGECONFIG, mesa egl support
can be disabled explicitly (using a .bbappend, for example).
This patch adds another check for the existence
of eglplatform.h before 'sed' can alter it.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/mesa/mesa_9.1.6.bb | 4 +++-
 meta/recipes-graphics/mesa/mesa_git.bb   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
index 6e9cd82..388cfd7 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/Mesa-${PV}"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        if [ -e "${D}${includedir}/EGL/eglplatform.h" ]; then
+            sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        fi
     fi
 }
\ No newline at end of file
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 1babcc0..714911f 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -23,6 +23,8 @@ S = "${WORKDIR}/git"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        if [ -e "${D}${includedir}/EGL/eglplatform.h" ]; then
+            sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        fi
     fi
 }
-- 
1.8.3.2


