Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQe-0006gd-6a
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:06:01 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772212"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:47 -0700
Message-Id: <b3ff416dd9d2bd73be97b2acdf924d7f47c9925a.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/36] cairo: Update to 1.12.2
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
X-List-Received-Date: Thu, 03 May 2012 02:07:15 -0000

Clean up some packaging issues, cairo-sphinx was installed
and is a testing tool that does not need to be packaged

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cairo/{cairo_1.10.2.bb => cairo_1.12.2.bb}     |   20 ++++++++++++++------
 1 files changed, 14 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.10.2.bb => cairo_1.12.2.bb} (72%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.12.2.bb
similarity index 72%
rename from meta/recipes-graphics/cairo/cairo_1.10.2.bb
rename to meta/recipes-graphics/cairo/cairo_1.12.2.bb
index 56aff53..c2e7cc6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.2.bb
@@ -2,12 +2,12 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r6"
+PR = "r0"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
+SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f101a9e88b783337b20b2e26dfd26d5f"
-SRC_URI[sha256sum] = "32018c7998358eebc2ad578ff8d8559d34fc80252095f110a572ed23d989fc41"
+SRC_URI[md5sum] = "87649eb75789739d517c743e94879e51"
+SRC_URI[sha256sum] = "b786bc4a70542bcb09f2d9d13e5e6a0c86408cbf6d1edde5f0de807eecf93f96"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
@@ -32,8 +32,16 @@ DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
 FILES_${PN} = "${libdir}/libcairo.so.*"
 FILES_${PN}-dev += "${libdir}/cairo/*.la ${libdir}/cairo/*.so"
-FILES_${PN}-dbg += "${libdir}/cairo/.debug"
-FILES_${PN}-staticdev += "${libdir}/cairo/*.a"
+#FILES_${PN}-dbg += "${libdir}/cairo/.debug"
+#FILES_${PN}-staticdev += "${libdir}/cairo/*.a"
 FILES_cairo-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_cairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.so.*"
+
+do_install_append () {
+	rm -rf ${D}${bindir}/cairo-sphinx
+	rm -rf ${D}${libdir}/cairo/cairo-fdr*
+	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
+	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
+	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
+}
-- 
1.7.7.6



