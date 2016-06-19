Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 795836612D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:30:35 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r201so34966116wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 12:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=M34FavrfDZTcHKkPLhhUHiHmM+71QzQ9OnXqaF/jdBI=;
	b=SZTPinyhcXHBo0CAgzj8qW/n0wr1r8ycPl6HIr1APhj+uIM51IVARuNMzcgl3+Qn+G
	zJmSFc4rkbepTKODgiWKrABAt7nB6eiogn92PWRWfyZeAuzdpK6hJnF4hRkieDSlitzW
	xeotMskuk0qW2dvbdOcCk3ycqWEiQG43rMAe26+hLCotJFSPqmtrm8h9aLyFwtVacTeH
	desuF0Epk70Z3vwhfuX1Ngd95YiW2RXVaZcYKwAafIBSpTPklFVHVQOsZykV/SQkZmRl
	XEXWvd5huryYKHDO4hdWwB1Ps7qG/CR4zTB8rabGXCLP/PdVVb7bIu2hvg5gErAw0h89
	U9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M34FavrfDZTcHKkPLhhUHiHmM+71QzQ9OnXqaF/jdBI=;
	b=CSPobBIXi8gAh3c9V7/HWTLaoPcl4+jd48y52/K7MzpseiA+jx5pPNpxlME8cRvNMh
	HewzLC1Cb0/co6h8a8rGMiT9HCQNLiGMPTJb2ak6ND/m+WgfEtnZLLLo2e9vean/XngK
	CUFgQKSl+6vBNWISzN4bGPDDGgRfJ4meeBZQvblHrIT8cE3gxljsRqRrqzlU6zppbn2q
	UIzBKQb+zEX/drMOudLCKhuaTrzvs5Z48BcdCEF8K1/VP+x9C7ZQ4Kk8Wt2gqrXHlmFA
	61gor2ttFprnjunql+v6wdk3kKjfVHC7svMRYuTnQzI9RqvAEJ6HI+f6UKCxqKD0Ds+F
	70lA==
X-Gm-Message-State: ALyK8tKT8w8NF8jwOhwrRHCf929+/kIUf1eawcHMKPfy+uXOghF5Cuhbea95mSruW3DNfO43
X-Received: by 10.28.182.68 with SMTP id g65mr8221951wmf.12.1466364635828;
	Sun, 19 Jun 2016 12:30:35 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z5sm4701092wme.5.2016.06.19.12.30.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 12:30:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 20:30:30 +0100
Message-Id: <1466364630-24750-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] gst-player: upgrade to latest HEAD
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jun 2016 19:30:37 -0000

Update to the latest revision now that we have gst-plugins-bad 1.8.x which has
integrated the GstPlayer object.  This upstream is now just the user interface,
so remove all redundant items from the packaging and package the binaries in PN
instead of PN-bin.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-multimedia/gstreamer/gst-player_git.bb | 31 ++++++++++------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 6d39c2d..b09244b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -1,20 +1,20 @@
 SUMMARY = "GStreamer playback helper library and examples"
 LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
+LIC_FILES_CHKSUM = "file://gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+3"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3"
 
 SRC_URI = "git://github.com/sdroege/gst-player.git \
-           file://filechooser.patch \
-           file://Fix-pause-play.patch \
-           file://Add-error-signal-emission-for-missing-plugins.patch \
+           file://filechooser.patch;apply=0 \
+           file://Fix-pause-play.patch;apply=0 \
+           file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
            file://gst-player.desktop"
 
-SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
+SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
+inherit autotools pkgconfig distro_features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -22,17 +22,14 @@ do_configure_prepend() {
 	touch ${S}/ChangeLog
 }
 
-EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
-
 do_install_append() {
 	install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
 }
 
-FILES_${PN}-bin += "${datadir}/applications/*.desktop"
-
-RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
-RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
-                         gstreamer1.0-plugins-good-meta \
-                         gstreamer1.0-plugins-bad-meta \
-                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
-                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
+RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback"
+RRECOMMENDS_${PN} = "gstreamer1.0-plugins-base-meta \
+                     gstreamer1.0-plugins-good-meta \
+                     gstreamer1.0-plugins-bad-meta \
+                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
+                     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
+RPROVIDES_${PN} += "${PN}-bin"
-- 
2.8.0.rc3


