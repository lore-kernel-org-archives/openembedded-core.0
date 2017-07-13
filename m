Return-Path: <clopez@igalia.com>
X-Greylist: delayed 2339 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Jul 2017 13:28:56 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 9567471A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=8gS44CP+Jhz7AgNo/Z+lamarnHuN6fSLIw6PG4WDlE8=; 
	b=NftVAi5ynUIF+/mV7kZ65YXlwvOwMPLUWrFIiG3emziwi+YO3Iix2n6BSvzREXamVSoLOLaYsXbf7AooZhZpHSSAR3xMQdo7NKT+mdyOCVlL9rrKeQcJPw3ETMw3E5RMEe76fl8R9uHjX6sa9nBpkFAg+jtzMOcOnjeBYEFknkAKyIBL+KEakitm0eUVMOvZBc8fmmlQf3ZTIVj8rdUhbKSi+lKu9Zee+IhSWRGUEwoUx2EkzTLBEqADWWp+xXguWaAg6Q/gkU4nG2tLi2Obj9mzoY0GIxWnJquuFU2VRFVgmUFGcZ4SF42I2L4wKl+DBjS92G2MD5LLT8nHNDYL/w==;
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dVdZ8-00044z-60 for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 14:49:58 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 14:49:54 +0200
Message-Id: <20170713124954.9373-1-clopez@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] webkitgtk: Upgrade to 2.16.5
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
X-List-Received-Date: Thu, 13 Jul 2017 13:28:58 -0000

Adjust some dependencies: libgcrypt is now required (instead of gnutls)
and the following build deps where missing: gettext-native, glib-2.0
and glib-2.0-native.

Also the CMake argument ENABLE_CREDENTIAL_STORAGE has been renamed to
USE_LIBSECRET.

This new upstream release (2.16.4 actually) includes security fixes for
CVE: CVE-2017-2538

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 .../webkit/{webkitgtk_2.16.3.bb => webkitgtk_2.16.5.bb}        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.3.bb => webkitgtk_2.16.5.bb} (94%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
similarity index 94%
rename from meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
index 5feca17be3..dcaf8a6ed7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
@@ -22,19 +22,21 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://gcc7.patch \
            file://detect-atomics-during-configure.patch \
            "
-SRC_URI[md5sum] = "34dbbcad8a87a929519d93c67edd6d87"
-SRC_URI[sha256sum] = "204e9131da0101b9bc8765716e70a897121af04b964d9827cd9f20816a77b512"
+
+SRC_URI[md5sum] = "fce72dc89cd310a663d9eb97133861fe"
+SRC_URI[sha256sum] = "8e0396f3428e757898c5856e642eed4fcd5a20ae03d96d3eaa03b76634be7dd4"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
 
-DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
+DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
+	   gettext-native glib-2.0 glib-2.0-native \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
@@ -51,7 +53,7 @@ PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_G
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
 PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
-PACKAGECONFIG[libsecret] = "-DENABLE_CREDENTIAL_STORAGE=ON,-DENABLE_CREDENTIAL_STORAGE=OFF,libsecret"
+PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 
 EXTRA_OECMAKE = " \
-- 
2.11.0


