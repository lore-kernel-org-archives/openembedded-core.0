Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TGq4w-0004nw-Va
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 13:46:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2012 04:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; d="scan'208";a="213509474"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.36])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2012 04:34:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 12:34:05 +0100
Message-Id: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gstreamer: make pulseaudio support dependent on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 26 Sep 2012 11:46:59 -0000

This should be no change to the previous situation unless you
explicitly have pulseaudio in DISTRO_FEATURES_BACKFILL_CONSIDERED
(currently).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 641de7c..07fda87 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -6,15 +6,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
-	    speex libsoup-2.4 pulseaudio"
-PR = "r5"
+            speex libsoup-2.4 \
+            ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+
+PR = "r6"
 
 inherit gettext gconf
 
 SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
-                 --disable-orc --disable-examples"
+                 --disable-orc --disable-examples \
+                 ${@base_contains('DISTRO_FEATURES', 'pulseaudio', '--enable-pulse', '--disable-pulse', d)}"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.7.9.5



