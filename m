Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF5760119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 06:57:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2018 23:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,347,1526367600"; d="scan'208";a="64392569"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.253])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2018 23:57:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 14:57:55 +0800
Message-Id: <20180713065755.20038-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gstreamer1.0-plugins-good: disable gtk plugin
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
X-List-Received-Date: Fri, 13 Jul 2018 06:57:58 -0000

gtk-play example assumes that GTK's GL support always works if it is
compiled in and first tries to use gtkglsink element which leads to
problems if there are errors while instantiating GL context at a much
later stage. This failure isn't detected and there is no fallback at
this point.

gtkglsink works on wayland though using poky defaults with gtk+3 since
the gdk backend does support egl with wayland but it doesn't with x11.

Disable the gtk plugin to ensure gtk-play just moves on when gtkglsink
isn't present. This was the default when gtk was part of -plugins-bad
before upgrade to 1.14.0.

Fixes [YOCTO #12832]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.14.1.bb                | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
index 36eb3107ae..673bf10918 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
@@ -27,7 +27,6 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-    ${@bb.utils.contains_any('DISTRO_FEATURES', d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \
     cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2 zlib mpg123 lame \
 "
 
-- 
2.17.1


