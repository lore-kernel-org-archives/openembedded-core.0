Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SAmlc-0006HY-CP
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 19:29:44 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 19:20:45 +0100
Message-Id: <1332440445-21028-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gst-plugins: remove obsolete orcc hack
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
X-List-Received-Date: Thu, 22 Mar 2012 18:29:44 -0000

* The sed script replacing ${bindir}/orcc with
  ${STAGING_BINDIR_NATIVE}/orcc causes orcc to not be found.
  It may have been a workaround for older versions of pkg-config
  or older gst-plugins. Removing it makes gst-plugins use
  orcc from 'orc-native' successfully, if available.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* v2: Added --disable-orc to gst-plugins-{base,good,base,ugly}_*.bb.
      Removed unused PR from gst-plugins.inc.

 .../gstreamer/gst-plugins-bad_0.10.23.bb           |    5 +++--
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 ++--
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    5 +++--
 .../gstreamer/gst-plugins-ugly_0.10.19.bb          |    5 +++--
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   10 ----------
 5 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index fac5fe3..656b61e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -8,12 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
 EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio --disable-directfb \
-                 --with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink"
+                 --with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink \
+                 --disable-orc"
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 9b169ec..5499829 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -14,11 +14,11 @@ SRC_URI += " file://gst-plugins-base-tremor.patch"
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r1"
+PR = "r2"
 
 inherit gettext
 
-EXTRA_OECONF += "--disable-freetypetest --disable-pango --disable-gnome_vfs"
+EXTRA_OECONF += "--disable-freetypetest --disable-pango --disable-gnome_vfs --disable-orc"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 4fdd272..e0eaf7b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r0"
+PR = "r1"
 
 inherit gettext gconf
 
-EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check"
+EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
+                 --disable-orc"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
index 233778d..125d09c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
@@ -8,11 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
-EXTRA_OECONF += "--with-plugins=a52dec,lame,id3tag,mad,mpeg2dec,mpegstream,mpegaudioparse,asfdemux,realmedia"
+EXTRA_OECONF += "--with-plugins=a52dec,lame,id3tag,mad,mpeg2dec,mpegstream,mpegaudioparse,asfdemux,realmedia \
+                 --disable-orc"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index a71a868..f11a4af 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -6,8 +6,6 @@ DEPENDS = "gstreamer"
 
 inherit autotools pkgconfig
 
-PR = "r1"
-
 FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
@@ -16,14 +14,6 @@ EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-# orc.m4 calls pkg-config ----variable=orcc orc-0.4 to get the path to orcc,
-# resulting in /usr/bin/orcc. Force it to use the staged orcc.
-do_configure_append() {
- 	for i in $(find ${S} -name "Makefile") ; do
-		sed -i -e s:${bindir}/orcc:${STAGING_BINDIR_NATIVE}/orcc:g $i
- 	done
-}
-
 require gst-plugins-package.inc
 
 PACKAGES_DYNAMIC = "${PN}-*"
-- 
1.7.5.4



