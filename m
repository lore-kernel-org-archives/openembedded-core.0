Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SSkGC-0003AL-SD
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 09:27:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4B7HbmX024692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 00:17:37 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 May 2012 00:17:36 -0700
Message-ID: <7e9ada8b4a3af9425d343f37de63536abd7de711.1336719792.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1336719792.git.xiaofeng.yan@windriver.com>
References: <cover.1336719792.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 11 May 2012 14:24:23 +0800
Date: Fri, 11 May 2012 15:23:15 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Fri, 11 May 2012 07:27:33 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

LSB Test Suite complains "No library libgdk_pixbuf_xlib-2.0.so.0" \
because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
Use the linuxstdbase override and also make it conditional on x11 \
being in DISTRO_FEATURES for passing lsb test.
Split libgdk_pixbuf_xlib to a single package.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index e31f717..a88700b 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
 SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig gettext
 
@@ -28,9 +28,16 @@ LIBV = "2.10.0"
 EXTRA_OECONF = "\
   --without-libtiff \
   --with-libpng \
-  --without-x11 \
+  ${X11DEPENDS} \
   --disable-introspection \
 "
+X11DEPENDS = "--without-x11"
+X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11', '--without-x11', d)}"
+
+PACKAGES =+ "${PN}-xlib"
+
+FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
+RPROVIDES_${PN}-xlib = "${PN}-xlib"
 
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
 	${libdir}/lib*.so.*"
-- 
1.7.0.4



