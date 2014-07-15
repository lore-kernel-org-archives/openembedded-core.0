Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id A16C3705B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:54:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,665,1400018400"; d="scan'208";a="54919519"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 15 Jul 2014 16:54:44 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 15 Jul 2014 16:54:44 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.174.1; Tue, 15 Jul 2014 16:54:43 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 16:54:39 +0200
Message-ID: <1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
Subject: [PATCH v3] libav: set LICENSE and LICENSE_FLAGS according to PACKAGECONFIG options
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
X-List-Received-Date: Tue, 15 Jul 2014 14:54:56 -0000
Content-Type: text/plain

+ fix: drop unwanted --enable-libtheora & --enable-libvorbis in EXTRA_OECONF

Reported-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav.inc | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 1d617a2..cd5ac5f 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -7,8 +7,7 @@ DESCRIPTION = "Libav is a friendly and community-driven effort to provide its us
 HOMEPAGE = "http://libav.org/"
 SECTION = "libs"
 
-LICENSE = "GPLv2+"
-LICENSE_FLAGS = "commercial"
+LICENSE = "GPLv2+ & LGPLv2.1+"
 
 # Provides ffmpeg compat, see http://libav.org/about.html
 PROVIDES = "ffmpeg"
@@ -44,14 +43,20 @@ PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 
-# Check codecs that require --enable-nonfree
-USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
+# Check codecs that trigger nonfree license
+python () {
+	pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+	nonfree = [ 'faac', 'openssl' ]
+	if set(pkgconfig) & set(nonfree):
+		d.setVar('LICENSE', 'Proprietary')
+		d.setVar('LICENSE_FLAGS', 'commercial')
+}
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
     --enable-gpl \
-    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
+    ${@bb.utils.contains('LICENSE', 'Proprietary', '--enable-nonfree', '', d)} \
     --enable-avfilter \
     \
     --cross-prefix=${TARGET_PREFIX} \
@@ -60,8 +65,6 @@ EXTRA_OECONF = " \
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


