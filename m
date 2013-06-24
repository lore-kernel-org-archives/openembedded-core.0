Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id AC5626ADCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 10:30:02 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so8362455wgg.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=ta52QAb6RkEJrUAJDpRBPTEuIEKC7z9aP0BMYYGPFmM=;
	b=KAlyzMHhPcUpZODsmg90YoMVgg00n6xSb5P20Y37oqB0/x/MeBf2zXYGh/QGIf0DWm
	9zvkRB/QjsvGrRuaIIqhmb+mTevXlNnDxamwr/rrBB+g5apzY5cpzkvjxARdy6cUZFb9
	6uT/dxTdFKTuOZVsn93IpxH/wPuE5zYLhcc79m9TrCURaU+mfCqI6C77IqMEvSnzgvgA
	H7pL2NvHekFbsPPecwMdA1ZEjXnHjZTxhMVuEPz6G8fI3nk9hO9K4A7+2S/QDXTKoBYV
	4YVD/Qel0WptpV66X+cz+SqRVGe2/uML4o3UNg6QXINY3r1/Q8aWFlW3cAVan3UF2zd8
	VU3A==
X-Received: by 10.180.76.103 with SMTP id j7mr5605981wiw.21.1372069803149;
	Mon, 24 Jun 2013 03:30:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fs8sm15570508wib.0.2013.06.24.03.30.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 03:30:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2013 11:26:27 +0100
Message-Id: <ba347e773d2aae10eadfa0a4aac12aebbf541352.1372069538.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlsAyG0GZBiw32AJiadq4zP2GMtBQuV7McO7mReF2V3R3ax5AuWaAMxLYa6gLWXtk719t3w
Subject: [PATCH 3/4] gst-plugins-base: element selection rationalisation
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
X-List-Received-Date: Mon, 24 Jun 2013 10:30:03 -0000

Use PACKAGECONFIG to control the X11 elements, and add statements for the
elements that we don't always enable.

Remove the freetype dependency as it's apparently (but not really) only needed
by the examples.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gst-plugins-base_0.10.36.bb                  |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 462c54d..26c562c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv libsm libice', '', d)}"
-DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
+DEPENDS += "alsa-lib liboil libogg libvorbis libtheora util-linux tremor"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
             file://configure.ac-fix-subparse-plugin.patch"
@@ -19,7 +18,14 @@ PR = "r7"
 
 inherit gettext
 
-EXTRA_OECONF += "--disable-freetypetest --disable-pango --disable-gnome_vfs --disable-orc"
+EXTRA_OECONF += "--disable-freetypetest"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+PACKAGECONFIG[gnomevfs] = "--enable-gnome_vfs,--disable-gnome_vfs,gnome-vfs"
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[x11] = "--enable-x --enable-xvideo,--disable-x --disable-xvideo,virtual/libx11 libxv libsm libice"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.7.10.4


