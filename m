Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHX-00032Y-H2
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397471"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:20 -0700
Message-Id: <4ff372f76123e82c0cfcbd8c0e12a23c67bb28ee.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
Subject: [PATCH 08/11] glib-networking: Fix packaging warnings
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:16 -0000

WARNING: QA Issue: non -staticdev package contains static .a library: glib-networking path '/work/armv5te-poky-linux-gnueabi/glib-networking-2.28.7-r1/packages-split/glib-networking/usr/lib/gio/modules/libgiognutls.a'
WARNING: QA Issue: non -staticdev package contains static .a library: glib-networking path '/work/armv5te-poky-linux-gnueabi/glib-networking-2.28.7-r1/packages-split/glib-networking/usr/lib/gio/modules/libgiolibproxy.a'
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../telepathy/telepathy-glib_0.17.4.bb             |    2 +-
 .../glib-networking/glib-networking_2.28.7.bb      |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
index 64473df..731ab74 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
index c8536e8..990fb54 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 SECTION = "libs"
 DEPENDS = "glib-2.0 gnutls intltool-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.28/${BPN}-${PV}.tar.bz2"
 
@@ -19,5 +19,7 @@ EXTRA_OECONF = "--without-ca-certificates"
 
 inherit autotools pkgconfig
 
-FILES_${PN} += "${libdir}/gio/modules/libgio* ${datadir}/dbus-1/services/"
+FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
+FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
+FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
-- 
1.7.7.6



