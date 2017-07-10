Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 87D5D7198A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 11:54:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2017 04:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,340,1496127600"; d="scan'208";a="1170678267"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2017 04:54:13 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4754C5804D2;
	Mon, 10 Jul 2017 04:54:11 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, gizero@gmail.com,
	otavio@ossystems.com.br
Date: Mon, 10 Jul 2017 14:54:08 +0300
Message-Id: <1499687648-44734-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa: Split --with-platforms from egl PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Jul 2017 11:54:13 -0000

Mesa platforms no longer depend directly on egl. Current
implementation breaks without egl with x11 (which can happen with
mesa-gl).

Separate the platform selection. Make drm platform depend on gbm
PACKAGECONFIG by default.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This keeps the defaults as they were (compared to upstreams probing
approach we skip 'surfaceless' platform), and mesa-gl should now
be fine as well.

Cheers,
  Jussi


 meta/recipes-graphics/mesa/mesa.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 59e8923..1b712a2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,12 @@ inherit autotools pkgconfig gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "--enable-shared-glapi --with-llvm-prefix=${STAGING_BINDIR_NATIVE}"
+PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
+               ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)}"
+
+EXTRA_OECONF = "--enable-shared-glapi \
+                --with-llvm-prefix=${STAGING_BINDIR_NATIVE} \
+                --with-platforms='${PLATFORMS}'"
 
 PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 vulkan', d)} \
@@ -47,10 +52,7 @@ PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=intel, --without-vulkan-drivers"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
-EGL_PLATFORMS  = "drm"
-EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
-EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
-PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS}, --disable-egl --with-platforms=''"
+PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[imx] = ""
-- 
2.1.4


