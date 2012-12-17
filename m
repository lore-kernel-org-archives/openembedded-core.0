Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkX1q-00046R-Hd
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:30:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 01:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,299,1355126400"; d="scan'208";a="265310991"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 01:15:51 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:16:20 +0200
Message-Id: <6e221cf8c8dc11db2762fd21fa309a32759027ca.1355732782.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
Subject: [PATCH 4/7] pcmciautils: set correct udevdir and add missing debug files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 09:30:39 -0000

Fix the following warning:
WARNING: QA Issue: pcmciautils: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/udev
  /usr/lib/udev/pcmcia-socket-startup
  /usr/lib/udev/pcmcia-check-broken-cis
  /usr/lib/udev/.debug
  /usr/lib/udev/.debug/pcmcia-socket-startup
  /usr/lib/udev/.debug/pcmcia-check-broken-cis

[YOCTO #3440]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-bsp/pcmciautils/pcmciautils.inc    | 3 ++-
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index fa35daf..24231f5 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -16,7 +16,8 @@ export HOSTCC = "${BUILD_CC}"
 export etcdir = "${sysconfdir}"
 export sbindir = "${base_sbindir}"
 export pcmciaconfdir = "${sysconfdir}/pcmcia"
-export udevrulesdir = "${sysconfdir}/udev/rules.d"
+export udevdir = "${nonarch_base_libdir}/udev"
+export udevrulesdir = "${nonarch_base_libdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 202437a..3dd8a0d 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://makefile_fix.patch"
 SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
 SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
 
-PR = "r0"
+PR = "r1"
 
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
-FILES_${PN} += "${libdir}/udev"
+FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug"
+FILES_${PN} += "${nonarch_base_libdir}/udev"
-- 
1.7.11.7



