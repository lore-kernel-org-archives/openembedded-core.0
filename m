Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RiI5K-0001dT-E9
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 05:04:18 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 8734F30227
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 22:56:53 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 19:56:55 -0800
Message-Id: <ca6d30c4f0debf7ada329e9cfb136cecb71c246d.1325649220.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
References: <cover.1325649220.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
References: <cover.1325649220.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 8734F30227.42EB4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 5/7] libusb1: move libraries to base_libdir
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
X-List-Received-Date: Wed, 04 Jan 2012 04:04:19 -0000

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
1.7.5.4



