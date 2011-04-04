Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q6pQM-00080l-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 21:26:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,299,1299484800"; d="scan'208";a="905453619"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
Message-Id: <9f80f893644fe051ebf4f751561532926f68952d.1301921659.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1301921659.git.nitin.a.kamble@intel.com>
References: <cover.1301921659.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 29 Mar 2011 10:46:45 -0700
Date: Mon, 04 Apr 2011  5:56:21 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] libxcb: fix for broken library link in the image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Apr 2011 19:26:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

log.do_package:
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/libxcb-dri2.so.0
NOTE:   /usr/lib/libxcb-dri2.so.0.0.0
NOTE: libxcb-dev contains dangling symlink to
/usr/lib/libxcb-dri2.so.0.0.0

Then because of the dangling symlink, ldconfig fails at the time of
rootfs creation of image.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-graphics/xcb/libxcb.inc       |    4 +++-
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb |    2 +-
 meta/recipes-graphics/xcb/libxcb_1.7.bb    |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb    |    1 +
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 81d4a20..3bb210a 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -19,10 +19,12 @@ PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
              libxcb-randr libxcb-record libxcb-render libxcb-res \
              libxcb-screensaver libxcb-shape libxcb-shm libxcb-sync \
              libxcb-xevie libxcb-xf86dri libxcb-xfixes libxcb-xlib \
-             libxcb-xprint libxcb-xtest libxcb-xv libxcb-xvmc"
+             libxcb-xprint libxcb-xtest libxcb-xv libxcb-xvmc \
+             libxcb-dri2"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
 #FILES_${PN}-dev = "${libdir}/libxcb.* ${libdir}/pkgconfig/*.pc ${includedir}/xcb/*.h"
+FILES_libxcb-dri2 = "${libdir}/libxcb-dri2.so.*"
 FILES_libxcb-composite = "${libdir}/libxcb-composite.so.*"
 FILES_libxcb-damage = "${libdir}/libxcb-damage.so.*"
 FILES_libxcb-dpms = "${libdir}/libxcb-dpms.so.*"
diff --git a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
index ae0cc57..7ea7451 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
@@ -1,5 +1,5 @@
 include libxcb.inc
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libpthread-stubs xcb-proto-native"
 
diff --git a/meta/recipes-graphics/xcb/libxcb_1.7.bb b/meta/recipes-graphics/xcb/libxcb_1.7.bb
index 426f790..0f30c88 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.7.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.7.bb
@@ -3,7 +3,7 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "libpthread-stubs xcb-proto-native"
 
diff --git a/meta/recipes-graphics/xcb/libxcb_git.bb b/meta/recipes-graphics/xcb/libxcb_git.bb
index faa5231..86ba036 100644
--- a/meta/recipes-graphics/xcb/libxcb_git.bb
+++ b/meta/recipes-graphics/xcb/libxcb_git.bb
@@ -2,6 +2,7 @@ DEFAULT_PREFERENCE = "-1"
 
 include libxcb.inc
 PV = "1.1.90.1+gitr${SRCPV}"
+PR = "r1"
 
 DEPENDS += "libpthread-stubs xcb-proto-native"
 
-- 
1.7.2.2



