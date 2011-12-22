Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc2-0005N8-FW
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233764"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:22 -0800
Message-Id: <c7cdaf7703c569f592bd1f21ff6d8f709f383039.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/26] libusb1: move libraries to base_libdir
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:52 -0000

From: Scott Garman <scott.a.garman@intel.com>

udev links to libusb1, and so these libraries need to be in
base_libdir (/lib) instead of libdir (/usr/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/libusb/libusb1_1.0.8.bb |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
index 302a8be..5a921e0 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "userspace library to access USB (version 1.0)"
+DESCRIPTION = "Userspace library to access USB (version 1.0)"
 HOMEPAGE = "http://libusb.sf.net"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
 
@@ -15,3 +15,15 @@ SRC_URI[sha256sum] = "21d0d3a5710f7f4211c595102c6b9eccb42435a17a4f5bd2c3f4166ab1
 S = "${WORKDIR}/libusb-${PV}"
 
 inherit autotools pkgconfig
+
+EXTRA_OECONF = "--libdir=${base_libdir}"
+
+do_install_append() {
+	install -d ${D}${libdir}
+	mv ${D}${base_libdir}/*.la ${D}${libdir}
+	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+}
+
+FILES_${PN} += "${base_libdir}/*.so.*"
+
+FILES_${PN}-dev += "${base_libdir}/*.so"
-- 
1.7.6.4



