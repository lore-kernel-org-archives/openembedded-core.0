Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB2D7D6C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 07:43:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Dec 2019 23:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,358,1571727600"; d="scan'208";a="208010809"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 25 Dec 2019 23:43:38 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Dec 2019 15:43:34 +0800
Message-Id: <1577346215-70009-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 1/2] libva: upgrade 2.5.0 -> 2.6.0
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
X-List-Received-Date: Thu, 26 Dec 2019 07:43:39 -0000

Release details can be found here:
https://github.com/intel/libva/releases/tag/2.6.0

Also switched to meson.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../libva/{libva_2.5.0.bb => libva_2.6.0.bb}              | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.5.0.bb => libva_2.6.0.bb} (73%)

diff --git a/meta/recipes-graphics/libva/libva_2.5.0.bb b/meta/recipes-graphics/libva/libva_2.6.0.bb
similarity index 73%
rename from meta/recipes-graphics/libva/libva_2.5.0.bb
rename to meta/recipes-graphics/libva/libva_2.6.0.bb
index 73e2e01..d14e191 100644
--- a/meta/recipes-graphics/libva/libva_2.5.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.0.bb
@@ -17,24 +17,21 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "3688212fb7a87947070f3729e91ff7cf"
-SRC_URI[sha256sum] = "3aa89cd369a506ac4dbe5de7c0ef5da4f3d220bf986403f02fa1f6f702af6878"
+SRC_URI = "git://github.com/intel/libva.git;branch=v2.6-branch"
+SRCREV = "5f693d9e603e0e83928cec67c30b6ac902d7aa85"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
 DEPENDS = "libdrm virtual/mesa"
 
-inherit autotools pkgconfig features_check
+inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "ac_cv_prog_WAYLAND_SCANNER=wayland-scanner"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland"
+PACKAGECONFIG[x11] = "-Dwith_x11=yes, -Dwith_x11=no,virtual/libx11 libxext libxfixes"
+PACKAGECONFIG[wayland] = "-Dwith_wayland=yes, -Dwith_wayland=no,wayland-native wayland"
 
 PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
 
-- 
2.7.4


