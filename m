Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id EBB406ADCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 10:30:03 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p60so8178128wes.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=DtW5iPTcmyVTqL7yIipJKkibaYsO16kKxr4PQxOSqHE=;
	b=Ra9MfgDYar4+SSHDi2S/9ijwPlOh8UCm1x+vWU9xHVKkiFp4e1yM2ET+5+H9FTcvsZ
	1JxCQZhJv+tyNQ8O4NmZ7iBd7fGHmdjLUV5U3I4liNgJJbjy4ZE8t4PilrfrBTFlxX1C
	ljx9vS64g4eqbgWoqjtKpV2lxIJ9msHzSYnt0mHhfYMA+TJxfiDyJVvM9RmrI2cKyfrD
	bH+KlRhaphzPVX5QQFPDmCjS9biTdoqxRRZK8uiv/5tU1SwK9K7xF8hY0wBoYFCP/CP3
	HRkgS5vX6fBPQnhxDWIJkct91w4WoGHfbvV0eM+wwHwKHOzaoef+QjQ+Ok4ApFIgmVyT
	XH5w==
X-Received: by 10.180.96.227 with SMTP id dv3mr2216620wib.59.1372069804432;
	Mon, 24 Jun 2013 03:30:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fs8sm15570508wib.0.2013.06.24.03.30.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 03:30:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2013 11:26:28 +0100
Message-Id: <f8e66c6a3d0ae67e780bfd2d8191ba3a729f2800.1372069538.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkmmFrfoBKmqqfIAeIO1bne8TVcOm+oymagXJtJ6B3oJFgF8k3oYd+ivCF+D2UGinu1PCtS
Subject: [PATCH 4/4] gst-plugins-bad: element selection rationalisation
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
X-List-Received-Date: Mon, 24 Jun 2013 10:30:04 -0000

Using --with-plugins means you only get the elements you enable, so we were
dropping vast numbers of useful plugins such as the MPEG muxers.

Instead, follow gst-plugins-base by using PACKAGECONFIG to enable/disable
plugins with optional dependencies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bb             |   18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 87f338f..a3a1204 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -6,18 +6,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base curl"
+DEPENDS += "gst-plugins-base"
 
 PR = "r4"
 
 inherit gettext
 
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
1.7.10.4


