Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RzcAS-0000WO-5D
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2012 23:57:12 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2012 23:56:10 +0100
Message-Id: <1329519371-12600-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/2] gst-plugins-base: depend on libx11 and libxv conditionally
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
X-List-Received-Date: Mon, 20 Feb 2012 22:57:12 -0000

* gst-plugins-base currently doesn't build if x11 is
  unavailable, due to unconditional dependencies on libx11
  and libxv. However, they are not required to build
  gst-plugins-base.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
index e49a00c..0b287bc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis libxv libtheora avahi util-linux tremor"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
+DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux tremor"
 
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
-- 
1.7.5.4



