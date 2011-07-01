Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcZt2-0004r1-QB for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:19:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p619G1mh009025
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 10:16:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08550-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 10:15:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p619Fph3009019
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 10:15:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Jul 2011 10:15:30 +0100
Message-ID: <1309511730.20015.514.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: cairo: Clean up packaging and fix warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 09:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There were a number of QA errors being reported when packaging cairo. This patch
ensures the debug files go in the -dbg package, the .so development links go into
the -dev package, .a files into -staticdev.

It also switches back to relying on debian package naming for the library name.
Since this is working correctly now the files are in the correct packages, we
can simplify the recipe and there is no change in the resulting package names
from a package feed perspective.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/cairo/cairo_1.10.2.bb |   30 +++++++-------------------
 1 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 572e1f6..6047428 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -9,21 +9,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 SRC_URI[md5sum] = "f101a9e88b783337b20b2e26dfd26d5f"
 SRC_URI[sha256sum] = "32018c7998358eebc2ad578ff8d8559d34fc80252095f110a572ed23d989fc41"
 
-RDEPENDS_${PN} += "libcairo2 libcairo-gobject2 libcairo-script-interpreter2 \
-		  cairo-perf-utils"
-
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
+PACKAGES =+ "libcairo-gobject2 libcairo-script-interpreter2 cairo-perf-utils"
 
 SUMMARY_libcairo2 = "The Cairo 2D vector graphics library"
 DESCRIPTION_libcairo2 = "Cairo is a multi-platform library providing anti-aliased \
@@ -44,10 +30,10 @@ to replay rendering."
 
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
+FILES_libcairo-gobject2 = "${libdir}/libcairo-gobject.so.*"
+FILES_libcairo-script-interpreter2 = "${libdir}/libcairo-script-interpreter.so.*"
+FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.so.*"



