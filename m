Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E38C6B55E
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 21:33:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2013 14:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,841,1367996400"; d="scan'208";a="359882636"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2013 14:33:28 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 21:34:27 +0000
Message-Id: <13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1375996888.git.nitin.a.kamble@intel.com>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] v4l-utils: a new recipe
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
X-List-Received-Date: Thu, 08 Aug 2013 21:33:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The v4l-utils recipe provides v4l2-ctl and other tools, which help in
understanding the configuration needed by v4l2 devices like a camera.

This recipe is imported from meta-oe layer, and then updated
and modified to work with the newest version.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb

diff --git a/meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb b/meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb
new file mode 100644
index 0000000..738e3ca
--- /dev/null
+++ b/meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "v4l2 and IR applications"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
+                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+
+PR = "r0"
+
+DEPENDS = "jpeg"
+
+inherit autotools gettext
+
+# libv4l was absorbed into this, let OE know that
+PROVIDES = "libv4l"
+
+SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-1.0.0.tar.bz2"
+
+SRC_URI[md5sum] = "2127f2d06be9162b0d346f7037a9e852"
+SRC_URI[sha256sum] = "1de3882099e04e89e354675ee408b82c8ac8afd3ca6ab27ea321771901285f30"
+
+EXTRA_OECONF = "--disable-qv4l2 --enable-shared"
+
+do_configure() {
+    # autotools_do_configure fails with:
+    # | configure.ac:139: error: required file 'build-aux/config.rpath' not found
+    autoreconf -vfi
+    oe_runconf
+}
+
+PACKAGES =+ "rc-keymaps libv4l-dbg libv4l libv4l-dev"
+
+FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
+FILES_libv4l += "${libdir}/libv4l/* ${libdir}/*.so.*"
+FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
+FILES_libv4l-dev += "${libdir}/*.so ${includedir}/lib* ${libdir}/pkgconfig/lib*"
-- 
1.8.1.4


