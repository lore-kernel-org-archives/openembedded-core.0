Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QX9CT-0006ry-Dz
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:49:22 +0200
Received: by wye20 with SMTP id 20so1022338wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 02:45:54 -0700 (PDT)
Received: by 10.216.220.139 with SMTP id o11mr707651wep.12.1308217553864;
	Thu, 16 Jun 2011 02:45:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f73sm727276wef.19.2011.06.16.02.45.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 02:45:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 11:45:49 +0200
Message-Id: <1308217549-13701-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gst-plugins: sync packaging with OE .dev
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
X-List-Received-Date: Thu, 16 Jun 2011 09:49:22 -0000

Gst-plugins get 2 extra packages:

${PN}-apps: helper apps in ${bindir}
${PN}-meta: meta package that will drag in all plugins, libs and apps ${PN} generates

The packaging include was split out to be reused by external plugins (e.g. gst-plugin-gl, gst-fluendo-*).

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gstreamer/gst-plugins-bad_0.10.21.bb           |    2 +-
 .../gstreamer/gst-plugins-base_0.10.32.bb          |    2 +-
 .../gstreamer/gst-plugins-good_0.10.28.bb          |    2 +-
 .../gstreamer/gst-plugins-package.inc              |   34 ++++++++++++++++++++
 .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   18 +---------
 6 files changed, 40 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
index 2b8a89c..a7023e3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
index f81011f..e9fadf8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
@@ -15,7 +15,7 @@ SRC_URI += " file://gst-plugins-base-tremor.patch"
 SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
 SRC_URI[sha256sum] = "e9aabfac83f6480896da0686e9c911989f896fbad634821b7771ed84a446172b"
 
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
index b9648e3..cca63e9 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4"
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
new file mode 100644
index 0000000..dae9416
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -0,0 +1,34 @@
+LIBV = "0.10"
+
+python populate_packages_prepend () {
+	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
+	postinst = bb.data.getVar('plugin_postinst', d, 1)
+	glibdir = bb.data.expand('${libdir}', d)
+
+	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
+	do_split_packages(d, gst_libdir, '^libgst(.*)\.so$', 'gst-plugin-%s', 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
+	do_split_packages(d, gst_libdir, '^libgst(.*)\.l?a$', 'gst-plugin-%s-dev', 'GStreamer plugin for %s (development files)', extra_depends='')
+	
+	pn = bb.data.getVar('PN', d, 1)
+	metapkg =  pn + '-meta'
+	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+	bb.data.setVar('FILES_' + metapkg, "", d)
+	blacklist = [ pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc' ]
+	metapkg_rdepends = []
+	packages = bb.data.getVar('PACKAGES', d, 1).split()
+	for pkg in packages[1:]:
+		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-static'):
+			metapkg_rdepends.append(pkg)
+	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+	bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', d)
+}
+
+ALLOW_EMPTY = "1"
+
+PACKAGES += "${PN}-apps ${PN}-meta"
+FILES_${PN}-apps = "${bindir}"
+
+FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
+FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
+
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
index 76e00a5..2a79c2a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index 617aab8..c1d7cd8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -15,13 +15,6 @@ EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-LIBV = "0.10"
-#FILES_${PN} += "${libdir}/gstreamer-${LIBV}/*.so"
-#FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/*.la ${libdir}/gstreamer-${LIBV}/*.a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
-
-PACKAGES_DYNAMIC = "${PN}-*"
-
 # orc.m4 calls pkg-config ----variable=orcc orc-0.4 to get the path to orcc,
 # resulting in /usr/bin/orcc. Force it to use the staged orcc.
 do_configure_append() {
@@ -30,14 +23,7 @@ do_configure_append() {
  	done
 }
 
-python populate_packages_prepend () {
-	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
-	postinst = bb.data.getVar('plugin_postinst', d, 1)
+require gst-plugins-package.inc
 
-#	Can't package separate debug packages yet
-#	do_split_packages(d, gst_libdir, '\.debug/libgst(.*)\.so$', bb.data.expand('${PN}-%s-dbg', d), 'GStreamer plugin for %s (with debugging symbols)', recursive=True, extra_depends=bb.data.expand('${PN}-dbg', d), match_path=True)
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
-}
+PACKAGES_DYNAMIC = "${PN}-*"
 
-ALLOW_EMPTY = "1"
-- 
1.6.6.1



