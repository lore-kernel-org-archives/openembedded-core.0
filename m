Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF70BC32771
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 17:22:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.10903.1663521751515706207
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 10:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=im5PP4js;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id B615640003;
	Sun, 18 Sep 2022 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1663521749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CWW1EL/amf/B9UO6Gw/XTyNrKa92si4sZpOtU1EhMV0=;
	b=im5PP4jsrWfFTvd1dcfUYdne8MtIBDC0iODE74B61rd4a7UaQvEp9ZWm+RaZKFKDxRrrf9
	QeaThbO9w7poAjGj4tVHFsXWasrg+13NXD6HJUwSemEQ5nYbG0h/A0/zNXx3chFqI8BJs8
	UroS5Ch70U/7YwwZg07d5bGAOzJwiEnUpwLf2KfHiD12BAlqWMMXmiUJbPKox84dgx6q4J
	ppQIuTrPetJAEHge3pbgKnWsRKLUVBQPtlY18EW4LQ6RKic4u3RJmNNUQysn9kyNND+31d
	mJ9y9otVT9WGvjHq8uH+HWrTBub/l7QlhjRjesPnLARF2Mq/5DWpkASlylCx5Q==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] flac: Update 1.3.4 to 1.4.0
Date: Sun, 18 Sep 2022 10:22:02 -0700
Message-Id: <20220918172202.2619187-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 17:22:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170851

This is a major update with some breaking library changes. Full release
notes are available at: https://xiph.org/flac/changelog.html

As part of this update, make some changes to the recipe:
* Development has moved from sourceforge to github, update BUGTRACKER
  link.
* Move ogg support to a PACKAGECONFIG option rather than force enabled.
  Keep it enabled by default to retain previous behavior.
* Move altivec, vsx, and sse flags to PACKAGECONFIG as well to make them
  easier to toggle. Add new avx flag which enables runtime detection of
  AVX/AVX2 instructions.
* Remove liboggflac and liboggflac++ packaging. This was merged into the
  main libflac and libflac++ libraries in version 1.1.3, so these
  packages have been empty.

License-Update: Updated copyright years

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../flac/{flac_1.3.4.bb => flac_1.4.0.bb}     | 38 +++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.3.4.bb => flac_1.4.0.bb} (51%)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.4.bb b/meta/recipes-multimedia/flac/flac_1.4.0.bb
similarity index 51%
rename from meta/recipes-multimedia/flac/flac_1.3.4.bb
rename to meta/recipes-multimedia/flac/flac_1.4.0.bb
index 012da0a0a0..360396380d 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.4.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.0.bb
@@ -1,45 +1,43 @@
 SUMMARY = "Free Lossless Audio Codec"
 DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compression format."
 HOMEPAGE = "https://xiph.org/flac/"
-BUGTRACKER = "http://sourceforge.net/p/flac/bugs/"
+BUGTRACKER = "https://github.com/xiph/flac/issues"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=17;md5=09501c864f89dfc7ead65553129817ca \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=146d2c8c2fd287545cc1bd81f31e8758 \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/flac/main.c;beginline=1;endline=18;md5=09777e2934947a36f13568d0beb81199 \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=f56cb4ba9a3bc9ec6102e8df03215271 \
-                    file://COPYING.Xiph;md5=b59c1b6d7fc0fb7965f821a3d36505e3 \
+                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=73c74192ce89ee6238d15a171e00c971 \
+                    file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
-DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
-"
-
-SRC_URI[sha256sum] = "8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737"
+SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
+SRC_URI[sha256sum] = "af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506"
 
 CVE_PRODUCT = "libflac flac"
 
 inherit autotools gettext
 
 EXTRA_OECONF = "--disable-oggtest \
-                --with-ogg-libraries=${STAGING_LIBDIR} \
-                --with-ogg-includes=${STAGING_INCDIR} \
                 --disable-xmms-plugin \
                 --without-libiconv-prefix \
                 ac_cv_prog_NASM="" \
                 "
 
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "vsx", " --enable-vsx", " --disable-vsx", d)}"
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "core2", " --enable-sse", "", d)}"
-EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "corei7", " --enable-sse", "", d)}"
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
+    ${@bb.utils.contains_any("TUNE_FEATURES", "core2 corei7", "sse", "", d)} \
+    ogg \
+"
+PACKAGECONFIG[sse] = "--enable-sse,--disable-sse"
+PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
+PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
+PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
+PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg-libraries=${STAGING_LIBDIR} --with-ogg-includes=${STAGING_INCDIR},--disable-ogg,libogg"
 
-PACKAGES += "libflac libflac++ liboggflac liboggflac++"
+PACKAGES += "libflac libflac++"
 FILES:${PN} = "${bindir}/*"
 FILES:libflac = "${libdir}/libFLAC.so.*"
 FILES:libflac++ = "${libdir}/libFLAC++.so.*"
-FILES:liboggflac = "${libdir}/libOggFLAC.so.*"
-FILES:liboggflac++ = "${libdir}/libOggFLAC++.so.*"
-
-- 
2.35.1


