Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW9EW-0004IX-85
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:11:36 +0100
Received: by eaad13 with SMTP id d13so2374062eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 08:04:54 -0800 (PST)
Received: by 10.213.17.70 with SMTP id r6mr1198694eba.100.1322755493961;
	Thu, 01 Dec 2011 08:04:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d6sm18850630eec.10.2011.12.01.08.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 08:04:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 17:04:49 +0100
Message-Id: <1322755489-25533-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v3] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Thu, 01 Dec 2011 16:11:36 -0000

Upstream has grown cmake support which would allow us to dump the OE autotools hack, but the cmakefile doesn't install the .pc file either and breaks with zlib-native

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/zlib/zlib_1.2.5.bb |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

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



