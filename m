Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVkVk-0007KA-6i
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 14:47:44 +0100
Received: by eekc1 with SMTP id c1so350284eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 05:41:03 -0800 (PST)
Received: by 10.14.8.16 with SMTP id 16mr278408eeq.246.1322660463548;
	Wed, 30 Nov 2011 05:41:03 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a60sm6341283eeb.4.2011.11.30.05.41.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 05:41:02 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 14:40:59 +0100
Message-Id: <1322660459-333-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Wed, 30 Nov 2011 13:47:44 -0000

Upstream has grown cmake support which would allow us to dump the OE autotools hack, but the cmakefile doesn't install the .pc file either and breaks with zlib-native

Also remove unused site config file

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/zlib/site_config/headers |    1 -
 meta/recipes-core/zlib/zlib_1.2.5.bb       |   18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/site_config/headers

diff --git a/meta/recipes-core/zlib/site_config/headers b/meta/recipes-core/zlib/site_config/headers
deleted file mode 100644
index 5026891..0000000
--- a/meta/recipes-core/zlib/site_config/headers
+++ /dev/null
@@ -1 +0,0 @@
-zlib.h
diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zlib/zlib_1.2.5.bb
index bca400c..b5756d9 100644
--- a/meta/recipes-core/zlib/zlib_1.2.5.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
@@ -7,12 +7,12 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=084e9c30e4e6272c3b057b13c6467f3d"
 
 DEPENDS = "libtool-cross"
-PR = "r1"
+PR = "r3"
 
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://configure.ac \
            file://Makefile.am \
-	   file://fix.inverted.LFS.logic.patch"
+           file://fix.inverted.LFS.logic.patch"
 
 SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
 SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
@@ -24,4 +24,18 @@ do_configure_prepend () {
 	cp ${WORKDIR}/Makefile.am ${S}/
 }
 
+do_install_append () {
+	sed \
+		-e 's:@prefix@:${prefix}:' \
+		-e 's:@exec_prefix@:${exec_prefix}:' \
+		-e 's:@libdir@:${libdir}:' \
+		-e 's:@sharedlibdir@:${libdir}:' \
+		-e 's:@includedir@:${includedir}:' \
+		-e 's:@VERSION@:${PV}:' \
+		zlib.pc.in > zlib.pc
+
+	install -d ${D}${libdir}/pkgconfig
+	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2.5



