Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 0787F70634
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:44:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,678,1400018400"; d="scan'208";a="55063306"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 17 Jul 2014 16:44:53 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 17 Jul 2014 16:44:53 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.174.1; Thu, 17 Jul 2014 16:44:52 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 16:44:47 +0200
Message-ID: <1405608287-10401-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B280C6@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B280C6@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
Subject: [RFC][PATCH v4] libav: set LICENSE according to PACKAGECONFIG options
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
X-List-Received-Date: Thu, 17 Jul 2014 14:45:01 -0000
Content-Type: text/plain

Experienced users can change license with 'gpl' and 'lic3' PACKAGECONFIG switches.

fix: drop unwanted --enable-libtheora & --enable-libvorbis in EXTRA_OECONF

Reported-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav.inc | 35 +++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 1d617a2..de9770b 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -7,7 +7,7 @@ DESCRIPTION = "Libav is a friendly and community-driven effort to provide its us
 HOMEPAGE = "http://libav.org/"
 SECTION = "libs"
 
-LICENSE = "GPLv2+"
+LICENSE = "LGPLv2.1+"
 LICENSE_FLAGS = "commercial"
 
 # Provides ffmpeg compat, see http://libav.org/about.html
@@ -29,7 +29,7 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
-PACKAGECONFIG ??= "bzip2 x264 theora ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "bzip2 gpl x264 theora ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
@@ -44,14 +44,35 @@ PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 
-# Check codecs that require --enable-nonfree
-USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
+# Licenses flags: allow to switch licence LGPL/GPL and v2/v3
+PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
+PACKAGECONFIG[lic3] = "--enable-version3,--disable-version3"
+
+# Check codecs and license coherency
+python () {
+	pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+	nonfree = [ 'faac', 'openssl' ]
+	gpl = [ 'x11', 'x264' ]
+	
+	if 'gpl' in pkgconfig:
+		if 'lic3' in pkgconfig:
+			d.setVar('LICENSE', 'GPLv3+')
+		else:
+			d.setVar('LICENSE', 'GPLv2+')
+	elif set(pkgconfig) & set(gpl):
+		raise bb.parse.SkipPackage("incompatible license, please add 'gpl' in PACKAGECONFIG")
+	elif 'lic3' in pkgconfig:
+		d.setVar('LICENSE', 'LGPLv3+')
+	
+	if set(pkgconfig) & set(nonfree):
+		d.setVar('LICENSE', 'Proprietary')
+		bb.note("Change LICENSE to 'Proprietary'")
+}
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
-    --enable-gpl \
-    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
+    ${@bb.utils.contains('LICENSE', 'Proprietary', '--enable-nonfree', '', d)} \
     --enable-avfilter \
     \
     --cross-prefix=${TARGET_PREFIX} \
@@ -60,8 +81,6 @@ EXTRA_OECONF = " \
     --enable-avserver \
     --enable-avplay \
     --ld="${CCLD}" \
-    --enable-libtheora  \
-    --enable-libvorbis \
     --arch=${TARGET_ARCH} \
     --target-os="linux" \
     --enable-cross-compile \
-- 
2.0.0


