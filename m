Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 62E5973FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:58:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2015 06:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="495065470"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by FMSMGA003.fm.intel.com with ESMTP; 18 May 2015 06:58:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:58:39 +0300
Message-Id: <1431957520-14510-6-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/6] webkitgtk: disable audio and video support
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
X-List-Received-Date: Mon, 18 May 2015 13:58:29 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

This allows removal of gstreamer 0.10 dependency from webkit recipe

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 3f19c2d..e5447d2 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -14,7 +14,7 @@ ICU_LIB = "icu"
 ICU_LIB_powerpc = "pango"
 
 DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
-           gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
+           gtk+ flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
 SRC_URI = "\
@@ -39,6 +39,9 @@ inherit autotools lib_package gtk-doc pkgconfig
 
 S = "${WORKDIR}/webkit-${PV}/"
 
+# Disabled by default because it pulls in obsolete gstreamer 0.10
+WEBKIT_AUDIOVIDEO ?= "--disable-video --disable-web-audio"
+
 EXTRA_OECONF = "\
                 --enable-debug=no \
                 --enable-svg \
@@ -48,6 +51,7 @@ EXTRA_OECONF = "\
                 --enable-link-prefetch \
                 --with-gtk=2.0 \
                 --disable-geolocation \
+		${WEBKIT_AUDIOVIDEO} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
-- 
2.1.4


