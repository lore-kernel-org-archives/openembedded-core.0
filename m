Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0066B6F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:45:24 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 649802798; Wed, 02 Dec 2015 05:45:22 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a44uW-0002lb-QU; Wed, 02 Dec 2015 10:45:20 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a44uW-0005A0-Q0; Wed, 02 Dec 2015 10:45:20 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:45:11 +0000
Message-Id: <1449053111-19775-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449053111-19775-1-git-send-email-mac@mcrowe.com>
References: <1449053111-19775-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] libav: Add PACKAGECONFIG options: avdevice, avfilter, avplay, gpl
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
X-List-Received-Date: Wed, 02 Dec 2015 10:45:25 -0000

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-multimedia/libav/libav.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index a8c78be..e55038c 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -34,9 +34,13 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
-PACKAGECONFIG ??= "bzip2 x264 theora ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "avdevice avfilter avplay bzip2 gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
+PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
+PACKAGECONFIG[avplay] = "--enable-avplay,--disable-avplay"
 PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
+PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
 PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
@@ -56,14 +60,11 @@ USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ],
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
-    --enable-gpl \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
-    --enable-avfilter \
     \
     --cross-prefix=${TARGET_PREFIX} \
     --prefix=${prefix} \
     \
-    --enable-avplay \
     --ld="${CCLD}" \
     --arch=${TARGET_ARCH} \
     --target-os="linux" \
@@ -87,7 +88,9 @@ do_configure() {
 }
 
 do_install_append() {
-    install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
+    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'avfilter', 'yes', '', d)}" ]; then
+        install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
+    fi
 }
 
 PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
-- 
2.1.4


