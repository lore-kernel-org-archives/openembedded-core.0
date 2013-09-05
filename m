Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1699615C7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:14:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2013 17:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="398408130"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2013 17:14:27 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Wed,  4 Sep 2013 17:18:39 -0700
Message-Id: <4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
References: <b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/4] xf86-video-mga: Pull in Matrox MGA support from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 00:14:28 -0000

In support of the more generic x86 BSPs, pull in the Matrox driver
recipe from meta-intel.

Remove the checkfile patch from Ross as this is now handled adequately
with the configure prepend hack which assumes success for any checkfile
calls.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32-base.inc            |    2 ++
 .../xorg-driver/xf86-video-mga_1.6.2.bb            |   20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-mga_1.6.2.bb

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index cb542a5..e13cfca 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -45,6 +45,8 @@ XSERVER_IA32_I965 = "xf86-video-intel \
            mesa-driver-i965 \
            "
 
+XSERVER_IA32_MATROX_MGA = "xf86-video-mga"
+
 XSERVER_IA32_VESA = "xf86-video-vesa"
 
 XSERVER_IA32_FBDEV = "xf86-video-fbdev"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-mga_1.6.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-mga_1.6.2.bb
new file mode 100644
index 0000000..3fc2c77
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-mga_1.6.2.bb
@@ -0,0 +1,20 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- Matrox MGA display driver"
+
+DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3fc"
+
+DEPENDS += "virtual/libx11 drm xf86driproto glproto virtual/libgl libpciaccess"
+
+EXTRA_OECONF += "--enable-dri"
+
+PR = "r1"
+
+COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
+
+SRC_URI[md5sum] = "f543877db4e260d8b43c7da3095605ed"
+SRC_URI[sha256sum] = "3f89ce250eea93f0de890954687790e06c0bab9e3e303df393e8759a187eca6c"
+
+RDEPENDS_${PN} = "xserver-xorg-module-exa"
-- 
1.7.9.5


