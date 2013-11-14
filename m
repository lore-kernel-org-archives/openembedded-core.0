Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D09196D8A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 02:45:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAE2jp8N004489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:45:52 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 18:45:51 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 21:45:48 -0500
Message-ID: <a76adb5f8a6cc260988f37bc71aa89946021b12f.1384396593.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384396593.git.wenzong.fan@windriver.com>
References: <cover.1384396593.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] udev: remove extra -dev/-dbg packages
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
X-List-Received-Date: Thu, 14 Nov 2013 02:45:50 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

We don't support multiple -dbg/-dev packages, the package can generate
them but the system does not correctly handle them. Just move all devel
stuffs into 'udev-dev' and all debug stuffs into 'udev-dbg'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/udev/udev.inc |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 02cab3b..db09c54 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -45,8 +45,8 @@ EXTRA_OECONF = "--disable-introspection \
                "
 
 PACKAGES =+ "udev-utils udev-cache"
-PACKAGES =+ "libudev libudev-dev libudev-dbg"
-PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
+PACKAGES =+ "libudev"
+PACKAGES =+ "libgudev"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
@@ -61,15 +61,13 @@ FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
-FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
+FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
+                   ${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
+                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
+                   ${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
+                   ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
-FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
-                     ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
 FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
-FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
-FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
-                     ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
 FILES_udev-utils = "${bindir}/udevadm"
-- 
1.7.9.5


