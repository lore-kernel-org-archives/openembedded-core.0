Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QcfX9-0007qT-SW
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:21:35 +0200
Received: by rex (Postfix, from userid 1000)
	id 1850F2FE0B; Fri,  1 Jul 2011 16:17:27 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:17:19 +0100
Message-Id: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
References: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/6] cairo: Clean up packaging and fix warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 15:21:35 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

There were a number of QA errors being reported when packaging cairo. This patch
ensures the debug files go in the -dbg package, the .so development links go into
the -dev package, .a files into -staticdev.

It also switches back to relying on debian package naming for the library name.
Since this is working correctly now the files are in the correct packages, we
can simplify the recipe and there is no change in the resulting package names
from a package feed perspective.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/cairo/cairo_1.10.2.bb |   44 +++++++++-----------------
 1 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 572e1f6..d2cadd2 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,31 +2,17 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f101a9e88b783337b20b2e26dfd26d5f"
 SRC_URI[sha256sum] = "32018c7998358eebc2ad578ff8d8559d34fc80252095f110a572ed23d989fc41"
 
-RDEPENDS_${PN} += "libcairo2 libcairo-gobject2 libcairo-script-interpreter2 \
-		  cairo-perf-utils"
+PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-ALLOW_EMPTY = "1"
-
-#
-# Old version (1.8.10 or below) is automatically named as libcairo2 by
-# debian_package_name_hook. To keep backword compatibility,
-# it is necessary to explicitly name the package as libcairo2 here
-#
-PACKAGES =+ "libcairo2 libcairo2-dev libcairo2-dbg \
-		     libcairo-gobject2 \
-			 libcairo-script-interpreter2 \
-		     cairo-perf-utils \
-			"
-
-SUMMARY_libcairo2 = "The Cairo 2D vector graphics library"
-DESCRIPTION_libcairo2 = "Cairo is a multi-platform library providing anti-aliased \
+SUMMARY_${PN} = "The Cairo 2D vector graphics library"
+DESCRIPTION_${PN} = "Cairo is a multi-platform library providing anti-aliased \
 vector-based rendering for multiple target backends. Paths consist \
 of line segments and cubic splines and can be rendered at any width \
 with various join and cap styles. All colors may be specified with \
@@ -34,20 +20,20 @@ optional translucence (opacity/alpha) and combined using the \
 extended Porter/Duff compositing algebra as found in the X Render \
 Extension."
 
-SUMMARY_libcairo-gobject2 = "The Cairo library GObject wrapper library"
-DESCRIPTION_libcairo-gobject2 = "A GObject wrapper library for the Cairo API."
+SUMMARY_cairo-gobject = "The Cairo library GObject wrapper library"
+DESCRIPTION_cairo-gobject = "A GObject wrapper library for the Cairo API."
 
-SUMMARY_libcairo-script-interpreter2 = "The Cairo library script interpreter"
-DESCRIPTION_libcairo-script-interpreter2 = "The Cairo script interpreter implements \
+SUMMARY_cairo-script-interpreter = "The Cairo library script interpreter"
+DESCRIPTION_cairo-script-interpreter = "The Cairo script interpreter implements \
 CairoScript.  CairoScript is used by tracing utilities to enable the ability \
 to replay rendering."
 
 DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
-FILES_libcairo2 = "${libdir}/libcairo.so*"
-FILES_libcairo2-dev = "${includedir} ${libdir}/*.la ${libdir}/*.a \
-					   ${libdir}/*.o ${libdir}/pkgconfig"
-FILES_libcairo2-dbg = "${libdir}/.debug ${libdir}/cairo/.debug"
-FILES_libcairo-gobject2 = "${libdir}/libcairo-gobject.so*"
-FILES_libcairo-script-interpreter2 = "${libdir}/libcairo-script-interpreter.so*"
-FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.*"
+FILES_${PN} = "${libdir}/libcairo.so.*"
+FILES_${PN}-dev += "${libdir}/cairo/*.la ${libdir}/cairo/*.so"
+FILES_${PN}-dbg += "${libdir}/cairo/.debug"
+FILES_${PN}-staticdev += "${libdir}/cairo/*.a"
+FILES_cairo-gobject = "${libdir}/libcairo-gobject.so.*"
+FILES_cairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
+FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.so.*"
-- 
1.7.4.1



