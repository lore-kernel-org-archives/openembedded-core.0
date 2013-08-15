Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 317466B88A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:08 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so178947eae.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=kKkwfB8/uabAkBY/RGEkWwJ7Dam17x0OHKEghfDxO3I=;
	b=xTVZTpf6ZvIUnYkDoAiyIRUj5wg/1ZYKdZdgeG6EZBMx6sILJwxCEHpueamY0wDfBm
	lTY+DsJjnTg+pvC4oEKyTfMWfnjlgiPzvXGW7rqKiVKZ4XNs2xCxe/CwwKoJ6g9iXQvw
	URDDAXbZzYULHYtbLBW4V5sKuZ6B94gTnjSObljMY1nAD5rM3R5UzklDDNxawerVL1+C
	ncOI/EszPk4i2Xkv2xw562ujDGVN7r6Mie+x3FJ9FtZoO25m7w8jKIbtIJsTvUdWIQEV
	ir/8k1jRf5BKyGqX+XREVXuxiFmSGcBOjIYNnrM6D43M0p4PmRGqKBEUFW/M94Dg9f15
	QWNg==
X-Received: by 10.15.108.72 with SMTP id cc48mr967167eeb.69.1376551388616;
	Thu, 15 Aug 2013 00:23:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm81953371eeb.4.2013.08.15.00.23.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:23 +0200
Message-Id: <72a235e9343bacf82686c2526303c36516d48dbf.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 12/33] gst-plugins-bad: element selection rationalisation
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:08 -0000

From: Ross Burton <ross.burton@intel.com>

Using --with-plugins means you only get the elements you enable, so we were
dropping vast numbers of useful plugins such as the MPEG muxers.

Instead, follow gst-plugins-base by using PACKAGECONFIG to enable/disable
plugins with optional dependencies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bb               | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 68451f2..7e80ce4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -6,18 +6,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base curl"
+DEPENDS += "gst-plugins-base"
 
 PR = "r4"
 
 inherit gettext gsettings
 
-EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio --disable-directfb \
-                 --with-plugins=wavpack,mpegvideoparse --disable-vdpau --disable-apexsink \
-                 --disable-orc --disable-neon"
+EXTRA_OECONF += "--disable-experimental \
+                 --disable-sdl --disable-cdaudio --disable-directfb \
+                 --disable-vdpau --disable-apexsink"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'librsvg', '', d)}"
-PACKAGECONFIG[librsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
+PACKAGECONFIG ??= "bzip curl \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'rsvg', '', d)}"
+
+PACKAGECONFIG[bzip] = "--enable-bz2,--disable-bz2,bzip2"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[rsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+PACKAGECONFIG[neon] = "--enable-neon,--disable-neon,neon"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.3.2


