Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2B653731C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:35:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jul 2016 06:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345527"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:24 +0300
Message-Id: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 1/9] mesa-demos: Require X11 distro feature
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
X-List-Received-Date: Mon, 18 Jul 2016 13:35:18 -0000

Mesa-demos theoretically does not require X11 (apart from xdemos/)
but reality is that every other binary requires glut. So:
 * 'non-glut' part of mesa-demos requires X11
 * current freeglut recipe also depends on X11

There is apparently wayland support in freeglut now: This recipe
should be modified when meta-oe freeglut recipe has that feature.

The change became necessary now because mesa no longer mistakenly
installs GL files when X11 is disabled (and mesa-demos configure
currently requires GL).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
index ee0bb02..fab0bdb 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
@@ -24,10 +24,10 @@ SRC_URI[sha256sum] = "c173154bbd0d5fb53d732471984def42fb1b14ac85fcb834138fb9518b
 
 inherit autotools pkgconfig distro_features_check
 # depends on virtual/egl, virtual/libgl ...
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew glu glx', '', d)}"
+                  x11 glew glu glx"
 
 # The Wayland code doesn't work with Wayland 1.0, so disable it for now
 #${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
-- 
2.1.4


