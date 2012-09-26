Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGqlS-0007tV-Sg
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:30:54 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGqSv-0006PO-9k
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:11:45 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 13:11:44 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348661505.31293.106.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] gdk-pixbuf: Use qemu to run postinsts in offline root mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 12:30:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This makes it possible to use gdk-pixbuf on a read-only rootfs.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 82a7eaa..df35b8d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 SECTION = "libs"
 
-DEPENDS = "libpng glib-2.0 jpeg"
+DEPENDS = "libpng glib-2.0 jpeg qemu-native"
 DEPENDS_append_linuxstdbase = " virtual/libx11"
 
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.xz \
@@ -21,9 +21,9 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
 SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r7"
+PR = "r8"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext qemu
 
 LIBV = "2.10.0"
 
@@ -41,26 +41,31 @@ PACKAGES =+ "${PN}-xlib"
 FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
+loadersdir = "${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders"
+
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
 	${libdir}/lib*.so.*"
 
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
 	${includedir}/* \
-	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
+	${loadersdir}/*.la \
 "
 
 FILES_${PN}-dbg += " \
         ${libdir}/.debug/* \
-	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
+	${loadersdir}/.debug/* \
 "
 
 postinst_pixbufloader () {
 if [ "x$D" != "x" ]; then
-    exit 1
+	if [ ! -f "$D${loadersdir}/../loaders.cache" ]; then
+		${@qemu_target_binary(d)} -drop-ld-preload -L $D $D${bindir}/gdk-pixbuf-query-loaders > "$D${loadersdir}/../loaders.cache"
+	fi
+	exit 0
 fi
 
-GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
+GDK_PIXBUF_MODULEDIR="${loadersdir}" gdk-pixbuf-query-loaders --update-cache
 
 if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
     for icondir in /usr/share/icons/*; do
-- 
1.7.10.4





