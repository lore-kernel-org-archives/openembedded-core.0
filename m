Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5CF780ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:01:06 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 07:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,453,1498546800"; d="scan'208";a="124383490"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 31 Aug 2017 07:00:44 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 07:00:41 -0700
Message-Id: <20170831140041.70134-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] waffle: fix REQUIRED_DISTRO_FEATURES and PACKAGECONFIG virtual/libgl dependencies
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
X-List-Received-Date: Thu, 31 Aug 2017 14:01:07 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Waffle's REQUIRED_DISTRO_FEATURES statement looks into DEPENDS and if
virtual/libgl is present, it includes opengl as distro feature. However,
in a multilib environment, recipes provides virtual/${MLPREFIX}libgl,
thus waffle recipe needs to include the prefix. Also PACKAGECONFIG
statements need this change in order to properly include the libgl
dependency.

The way this error showed up was in a multilib environment and a distro
not containing opengl, i.e. nodistro, leading the following error when
building world -S none (because opengl was not included as required distro
feature):

    ERROR: Nothing PROVIDES 'virtual/lib32-libgl' (but virtual:multilib:lib32:/meta/recipes-graphics/waffle/waffle_1.5.2.bb DEPENDS on or otherwise requires it). Close matches:
      virtual/lib32-libsdl
      virtual/lib32-libc
      virtual/lib32-libsdl2
    ERROR: Required build target 'lib32-meta-world-pkgdata' has no buildable providers.
    Missing or unbuildable dependency chain was: ['lib32-meta-world-pkgdata', 'meta-world-pkgdata', 'lib32-waffle', 'virtual/lib32-libgl']

    Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

[YOCTO #10900]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-graphics/waffle/waffle_1.5.2.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
index 9d6b0e0e0d..a5179db1da 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
@@ -21,20 +21,20 @@ PACKAGECONFIG ??= "glx"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
 
 # virtual/libgl requires opengl in DISTRO_FEATURES.
-REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/libgl', 'opengl', '', d)}"
+REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX}libgl', 'opengl', '', d)}"
 
 # I say virtual/libgl, actually wants gl.pc
-PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/libgl libx11"
+PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/${MLPREFIX}libgl libx11"
 
 # I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
 # DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,-Dwaffle_has_wayland=0,virtual/libgl wayland"
+PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,-Dwaffle_has_wayland=0,virtual/${MLPREFIX}libgl wayland"
 
 # I say virtual/libgl, actually wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] = "-Dwaffle_has_gbm=1,-Dwaffle_has_gbm=0,virtual/libgl udev"
+PACKAGECONFIG[gbm] = "-Dwaffle_has_gbm=1,-Dwaffle_has_gbm=0,virtual/${MLPREFIX}libgl udev"
 
 # I say virtual/libgl, actually wants egl.pc
-PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,-Dwaffle_has_x11_egl=0,virtual/libgl libxcb"
+PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,-Dwaffle_has_x11_egl=0,virtual/${MLPREFIX}libgl libxcb"
 
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake \
                     ${libdir}/cmake/Waffle/"
-- 
2.12.3


