Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTTB-0001lA-FQ
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117517"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:44 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:30 -0800
Message-Id: <53045517c1c561db50b21fd7f9cbf979f89211ea.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 12/20] gstreamer: refactor packages for staticdev
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:29 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    5 +++--
 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    2 +-
 .../gstreamer/gst-plugins-package.inc              |    9 +++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index a1b7cbb..5ee5066 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
 SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = "--with-ffmpeg-extra-configure=\"--target-os=linux\" "
 
@@ -33,7 +33,8 @@ EXTRA_OECONF_append_x86 = " --disable-yasm "
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
index ec067b8..56c54b5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 8ff9f82..a71d896 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -7,7 +7,8 @@ python populate_packages_prepend () {
 
 	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
 	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
+	do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
+	do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', bb.data.expand('${PN}-%s-staticdev', d), 'GStreamer plugin for %s (static development files)', extra_depends=bb.data.expand('${PN}-staticdev',d))
 	
 	pn = d.getVar('PN', 1)
 	metapkg =  pn + '-meta'
@@ -17,7 +18,7 @@ python populate_packages_prepend () {
 	metapkg_rdepends = []
 	packages = d.getVar('PACKAGES', 1).split()
 	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-static'):
+		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
 			metapkg_rdepends.append(pkg)
 	d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 	d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
@@ -25,10 +26,10 @@ python populate_packages_prepend () {
 
 ALLOW_EMPTY = "1"
 
-PACKAGES += "${PN}-apps ${PN}-meta"
+PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
 
 FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
 FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
-
+FILES_${PN}-glib = "${datadir}/glib-2.0"
 
-- 
1.7.6.5



