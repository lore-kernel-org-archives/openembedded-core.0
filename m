Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAHD2-0004PX-UK
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 09:47:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2L8d2vP001683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 01:39:02 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 21 Mar 2012 01:39:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 16:38:14 +0800
Message-ID: <89c2f191e064e431f50af0b36ede86a32c76a86a.1332318835.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332318835.git.liezhi.yang@windriver.com>
References: <cover.1332318835.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
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
X-List-Received-Date: Wed, 21 Mar 2012 08:47:57 -0000
Content-Type: text/plain

Remove the do_configure_prepend which is used for removing
${S}/m4/lib-link.m4 to compile under libtool 2.2.2, but our libtool has
been upgraded to 2.4.2, and:

for the 3 recipes:
    gst-plugins-bad_0.10.22.bb
    gst-plugins-base_0.10.35.bb
    gst-plugins-good_0.10.30.bb

They don't have m4/lib-link.m4 any more.

For the gst-plugins-ugly_0.10.18.bb, though it has m4/lib-link.m4, our
libtool version is now 2.4.2, so we can remove the do_configure_prepend
from all of them.

[YOCTO #2148]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    7 +------
 4 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
index 2c97a10..5c613c3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r3"
+PR = "r4"
 
 inherit gettext
 
@@ -17,10 +17,5 @@ EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disab
 
 ARM_INSTRUCTION_SET = "arm"
 
-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
-}
-
 SRC_URI[md5sum] = "9a2acee1f386f71247003d0d7090fb1c"
 SRC_URI[sha256sum] = "d8f7102f43ffea076646427115ffdccb3975954f1e9367bd304f7ee01e12070c"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
index 93f8eb3..812d209 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
@@ -14,13 +14,8 @@ SRC_URI += " file://gst-plugins-base-tremor.patch"
 SRC_URI[md5sum] = "1d300983525f4f09030eb3ba47cb04b0"
 SRC_URI[sha256sum] = "cd24f01bb5258a1f400bc4f2c212bb7cee9ee23c9ffb80d537a24ef366d17103"
 
-PR = "r1"
+PR = "r2"
 
 inherit gettext
 
 EXTRA_OECONF += "--disable-freetypetest --disable-pango --disable-gnome_vfs"
-
-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm -f ${S}/m4/lib-link.m4
-}
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index ebd49ab..7810b5b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
@@ -7,17 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r5"
+PR = "r6"
 
 inherit gettext gconf
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check"
 
-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
-}
-
 SRC_URI[md5sum] = "62fd7a3ef187c4f99b3d7c352d58dae9"
 SRC_URI[sha256sum] = "b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
index 7f87cd3..1a3c96b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
@@ -8,16 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r1"
+PR = "r2"
 
 inherit gettext
 
 EXTRA_OECONF += "--with-plugins=a52dec,lame,id3tag,mad,mpeg2dec,mpegstream,mpegaudioparse,asfdemux,realmedia"
 
-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
-}
-
 SRC_URI[md5sum] = "04a7009a4efea2844075949c111f5e4d"
 SRC_URI[sha256sum] = "f9c16748cd9269fae86422d8254a579fa6db073797a5a19a9dc5c72cd66c8e14"
-- 
1.7.1



