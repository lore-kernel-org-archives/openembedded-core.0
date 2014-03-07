Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 67AA36F655
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 14:33:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Mar 2014 06:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,608,1389772800"; d="scan'208";a="487941810"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2014 06:33:08 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 16:33:05 +0200
Message-Id: <038dcfbf5f9f91e8e975e9d0d53f7bcee7ee2b8f.1394202750.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394202750.git.laurentiu.palcu@intel.com>
References: <cover.1394202750.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1394202750.git.laurentiu.palcu@intel.com>
References: <cover.1394202750.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] xf86-video-intel: add recipe for 2.99.910, remove the git one
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
X-List-Received-Date: Fri, 07 Mar 2014 14:33:12 -0000

Intel graphics stack releases >= 2013Q3 need
xf86-video-intel >= 2.99.902. However, keep the stable release around
too, in case people need it.

The git recipe is not really used. Remove.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/conf/distro/include/default-versions.inc      |    3 ++
 .../xorg-driver/xf86-video-intel_2.99.910.bb       |   31 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_git.bb            |   23 ---------------
 3 files changed, 34 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 53ec2e7..a9a931d 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -9,3 +9,6 @@ PREFERRED_VERSION_python-native ?= "2.7.3"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
+
+# Intel video stack 2013Q3 and newer need a version >=2.99.902
+PREFERRED_VERSION_xf86-video-intel ?= "2.99.910"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
new file mode 100644
index 0000000..b74d174
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
@@ -0,0 +1,31 @@
+require xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- Intel integrated graphics chipsets driver"
+
+DESCRIPTION = "intel is an Xorg driver for Intel integrated graphics \
+chipsets. The driver supports depths 8, 15, 16 and 24. On some chipsets, \
+the driver supports hardware accelerated 3D via the Direct Rendering \
+Infrastructure (DRI)."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
+
+DEPENDS += "virtual/libx11 drm libpciaccess pixman"
+
+SRC_URI += "file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
+           "
+
+PACKAGECONFIG ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
+
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
+PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
+PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
+PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+
+# --enable-kms-only option is required by ROOTLESS_X
+EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+SRC_URI[md5sum] = "a9a5c2c15766c06a024381efe0d724bb"
+SRC_URI[sha256sum] = "203d46064449da0e23a111418dfb189422ba96ea08707167c8dee463e2d745b1"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
deleted file mode 100644
index d4c7654..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require xorg-driver-video.inc
-
-SUMMARY = "X.Org X server -- Intel integrated graphics chipsets driver"
-
-DESCRIPTION = "intel is an Xorg driver for Intel integrated graphics \
-chipsets. The driver supports depths 8, 15, 16 and 24. On some chipsets, \
-the driver supports hardware accelerated 3D via the Direct Rendering \
-Infrastructure (DRI)."
-
-DEPENDS += "virtual/libx11 drm dri2proto glproto \
-	    virtual/libgl xineramaproto libpciaccess udev"
-
-SRCREV = "87ea531c5dc5b39809395b277c330854aaaaf019"
-PV = "2.10.0+git${SRCPV}"
-PR = "${INC_PR}.1"
-
-EXTRA_OECONF += "--disable-xvmc --enable-dri --disable-static"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel"
-
-S = "${WORKDIR}/git"
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-- 
1.7.9.5


