Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D975D6C6F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 08:16:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 27 May 2015 01:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,503,1427785200"; d="scan'208";a="700840502"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2015 01:16:41 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 11:16:53 +0300
Message-Id: <0d2c28c23ef2121b32f94a5817fbf33765302ae4.1432713868.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1432713868.git.jussi.kukkonen@intel.com>
References: <cover.1432713868.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] waffle: Upgrade 1.3.0 -> 1.5.1
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
X-List-Received-Date: Wed, 27 May 2015 08:16:42 -0000

* Update SRC_URI to waffle-gl.org
* Add new cmake files to -dev package
* Inherit lib_package so the new wflinfo binary is packaged properly
* Fix PACKAGECONFIG line for gbm
* Add the not-found configuration for all PACKAGECONFIG options to make
  builds reproducible (the default builds if dependencies are there)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../waffle/{waffle_1.3.0.bb => waffle_1.5.1.bb}       | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.3.0.bb => waffle_1.5.1.bb} (51%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.3.0.bb b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
similarity index 51%
rename from meta/recipes-graphics/waffle/waffle_1.3.0.bb
rename to meta/recipes-graphics/waffle/waffle_1.5.1.bb
index a21fcbb..b8aa05a 100644
--- a/meta/recipes-graphics/waffle/waffle_1.3.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
@@ -3,11 +3,11 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5020ecc249096c881e1f59ee961f3d41"
-SRC_URI[sha256sum] = "340ee04172dba878249469018cd7ec9d1ecd41af26b612c741b8b52e713bca8e"
+SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "c0d802bc3d0aba87c51e423a3a8bdd69"
+SRC_URI[sha256sum] = "cbab0e926515064e818bf089a5af04be33307e5f40d07659fb40d59b2bfe20aa"
 
-inherit cmake distro_features_check
+inherit cmake distro_features_check lib_package
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
@@ -17,16 +17,17 @@ PACKAGECONFIG ??= "glx"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
 
 # I say virtual/libgl, actually wants gl.pc
-PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
+PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/libgl libx11"
 
 # I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
 # DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,,virtual/libgl wayland"
+PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,-Dwaffle_has_wayland=0,virtual/libgl wayland"
 
 # I say virtual/libgl, actually wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
+PACKAGECONFIG[gbm] = "-Dwaffle_has_gbm=1,-Dwaffle_has_gbm=0,virtual/libgl udev"
 
 # I say virtual/libgl, actually wants egl.pc
-PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
+PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,-Dwaffle_has_x11_egl=0,virtual/libgl libxcb"
 
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake \
+                    ${libdir}/cmake/Waffle/"
-- 
2.1.4


