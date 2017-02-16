Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A0E19771EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:34:56 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id B2B30AD00BEC; Thu, 16 Feb 2017 11:34:50 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 11:34:48 +0100
Message-Id: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] ffmpeg: use static package list
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
X-List-Received-Date: Thu, 16 Feb 2017 10:34:56 -0000

Dynamic packaging isn't useful if every library needs to be
listed manually.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb | 53 +++++++++-----------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
index e206222..52c266b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
@@ -107,7 +107,25 @@ do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
 
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util|resample)|swscale|swresample|postproc).*"
+PACKAGES =+ "libavcodec \
+             libavdevice \
+             libavfilter \
+             libavformat \
+             libavresample \
+             libavutil \
+             libpostproc \
+             libswresample \
+             libswscale"
+
+FILES_libavcodec = "${libdir}/libavcodec${SOLIBS}"
+FILES_libavdevice = "${libdir}/libavdevice${SOLIBS}"
+FILES_libavfilter = "${libdir}/libavfilter${SOLIBS}"
+FILES_libavformat = "${libdir}/libavformat${SOLIBS}"
+FILES_libavresample = "${libdir}/libavresample${SOLIBS}"
+FILES_libavutil = "${libdir}/libavutil${SOLIBS}"
+FILES_libpostproc = "${libdir}/libpostproc${SOLIBS}"
+FILES_libswresample = "${libdir}/libswresample${SOLIBS}"
+FILES_libswscale = "${libdir}/libswscale${SOLIBS}"
 
 # ffmpeg disables PIC on some platforms (e.g. x86-32)
 INSANE_SKIP_${MLPREFIX}libavcodec = "textrel"
@@ -119,36 +137,3 @@ INSANE_SKIP_${MLPREFIX}libavresample = "textrel"
 INSANE_SKIP_${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP_${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP_${MLPREFIX}libpostproc = "textrel"
-
-python populate_packages_prepend() {
-    av_libdir = d.expand('${libdir}')
-    av_pkgconfig = d.expand('${libdir}/pkgconfig')
-
-    # Runtime package
-    do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
-                      output_pattern='lib%s',
-                      description='libav %s library',
-                      extra_depends='',
-                      prepend=True,
-                      allow_links=True)
-
-    # Development packages (-dev, -staticdev)
-    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
-                      output_pattern='lib%s-dev',
-                      description='libav %s development package',
-                      extra_depends='${PN}-dev',
-                      prepend=True,
-                      allow_links=True)
-    do_split_packages(d, av_pkgconfig, '^lib(.*)\.pc$',
-                      output_pattern='lib%s-dev',
-                      description='libav %s development package',
-                      extra_depends='${PN}-dev',
-                      prepend=True)
-    do_split_packages(d, av_libdir, '^lib(.*)\.a$',
-                      output_pattern='lib%s-staticdev',
-                      description='libav %s development package - static library',
-                      extra_depends='${PN}-dev',
-                      prepend=True,
-                      allow_links=True)
-
-}
-- 
2.7.4


