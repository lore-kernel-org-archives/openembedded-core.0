Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvtw-0006aP-O3
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:04:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889665"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:17 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:44 +0200
Message-Id: <5a5f493e2a1759e9db1c18dfb1346beef07879ee.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
Subject: [PATCH v2 4/7] pcmciautils: set correct udevdir and add missing debug files
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
X-List-Received-Date: Tue, 18 Dec 2012 12:04:01 -0000

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
index fa35daf..80271d6 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -16,7 +16,8 @@ export HOSTCC = "${BUILD_CC}"
 export etcdir = "${sysconfdir}"
 export sbindir = "${base_sbindir}"
 export pcmciaconfdir = "${sysconfdir}/pcmcia"
-export udevrulesdir = "${sysconfdir}/udev/rules.d"
+export udevdir = "${base_libdir}/udev"
+export udevrulesdir = "${nonarch_base_libdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 202437a..41fd799 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://makefile_fix.patch"
 SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
 SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
 
-PR = "r0"
+PR = "r1"
 
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
-FILES_${PN} += "${libdir}/udev"
+FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
+FILES_${PN} += "${base_libdir}/udev ${nonarch_base_libdir}/udev"
-- 
1.7.11.7



