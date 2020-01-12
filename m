Return-Path: <crg7475@mailbox.org>
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by mail.openembedded.org (Postfix) with ESMTP id D8B617F98C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47wddx5fG6zQlBg
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837617; bh=k7M+7yBfSjz/8Bf
	iSZ65pI4njJbOwfrUxBFvEZvi4a4=; b=bCt7+h3EyWbwcA31lG/VGoARpUdjZ/H
	ZvdO8Pr1e53BtgC7WUKthz/olSBMcvPkk3fRM4bp4Tws7vZZQALWgfaYInRhkQw0
	Rs6XghsrWTi84rGzpGp2fSc0zls8t/jir5JAtwUnH9iEgS3Th6OYc79GrLdKGp7i
	6vMmstJT5mVhpBXgipcmBGYjgDnyOILCyso7MPHaWz4rm65pd+B6qBTCkVeJ+2nn
	FoJjwcNTk8rGj6/yPyTkrp9iaEy/9xYd513QHGfVX2hWD97gurFuJM9emDmAB7m9
	0wWyzwNp1KursZ6xwOmNlbncG2UibqSmrMlDpdZeBA4DSX1PGKb096g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=RClakvN07f8wLfVbqkZQWxtSB+WQhXic5ABMmGlqieM=;
	b=W9FHFPzOVpDM3dUYG25Xl4VMrmxJMHi/nf1B1xrCw7v3IeNWgDyga8ac2DzrsfXDjBJcQo
	KUiGXABJjVn8VTGDkyn5Z9wJlRYBgP28k4AQG/NmZ0iCE5v3VJN2Q09kix5CUd3QUPiVPu
	tUaadm+uhJsGRP6bu78MFE9cU19Bh4dKhfzXWJvY7Dl1TtKBab/ZtlXHnO6Y9b0aUeLsDk
	3m5ps4MfT2t1CAXlrRf7fP9HsrTNvhlfyoXQ/eFjDw9bSmTlPSvmanNk2OAq7m715nTXae
	Hi7LsmPp1Z25p0SY53f2no3YEXEOIieCwIdZCOY/HIY8Td4Vh9U703T7ffnWyQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id YdIV8q49i0dq
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:17 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:48 +0100
Message-Id: <20200112135954.23868-6-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 06/12] gstreamer1.0-plugins-ugly: Transition to meson based builds
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:21 -0000

* Removed autotools/M4 related patch
  0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch.

* gettext handling now part of gstreamer1.0-plugins-common.inc.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer1.0-plugins-ugly_1.16.1.bb       | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index ecab318899..30961d0e02 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -1,4 +1,4 @@
-require gstreamer1.0-plugins.inc
+require gstreamer1.0-plugins-common.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
@@ -8,7 +8,6 @@ LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
-            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
 SRC_URI[sha256sum] = "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d"
@@ -17,23 +16,23 @@ S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gettext
+GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     a52dec mpeg2dec \
 "
 
-PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
-PACKAGECONFIG[amrnb]    = "--enable-amrnb,--disable-amrnb,opencore-amr"
-PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
-PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
-PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
-PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
-PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
+PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
+PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
+PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
+PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
+PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
+PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
+PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
-EXTRA_OECONF += " \
-    --disable-sidplay \
+EXTRA_OEMESON += " \
+    -Dsidplay=disabled \
 "
 
 FILES_${PN}-amrnb += "${datadir}/gstreamer-1.0/presets/GstAmrnbEnc.prs"
-- 
2.17.1


