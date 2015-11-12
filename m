Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6B90E77265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:57:20 +0000 (UTC)
Received: by wmec201 with SMTP id c201so50583056wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DEvgh51z2s0ho3CIUBHjufXKt3zgqjCMoTUVjPXyoK0=;
	b=rLT/quZvl9KegfeDRAcZNVrBUaW5XL+jFeubEkO12iIMiRFNJc5iUXiBQI3FEZJIY9
	COekwAkM2GrKotjo23MhAgpLBkTe5yp3wTll4jkhcJvJcGBtMKLo8SANt8KRmA5scD2W
	E5Ra0Nrvt600OtwH74/hC4Jy9bjo7nUNya9FfTn4N8YPXrUaQJ7p8p5mE9Z0dgLp7vJS
	I0K/UaS3r0uEs1wDucUhi9MFIdVUUGisf7h9Tz1/kx22/91O5KMmlazth/B6fLnplPDa
	yrJCeYFuDDXl1CD+AiXWPbhLXR72Ob1+6CESU+6qb40XZ5riCUg9pUZqw5KrbEPM9DCy
	hkcw==
X-Received: by 10.28.153.137 with SMTP id b131mr20616010wme.3.1447358240717;
	Thu, 12 Nov 2015 11:57:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	at4sm16132994wjc.9.2015.11.12.11.57.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 11:57:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 20:57:32 +0100
Message-Id: <1447358254-5676-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][master][jethro 2/4] gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
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
X-List-Received-Date: Thu, 12 Nov 2015 19:57:22 -0000

* ERROR: gstreamer1.0-plugins-bad: gstreamer1.0-plugins-bad-uvch264 package isn't created when building with minimal dependencies?
* ERROR: gstreamer1.0-plugins-bad: gstreamer1.0-plugins-bad-uvch264-dev package isn't created when building with minimal dependencies?

* it's because it should depend on libgudev not udev:
  configure: *** for plug-ins: uvch264 ***
  checking linux/uvcvideo.h usability... yes
  checking linux/uvcvideo.h presence... yes
  checking for linux/uvcvideo.h... yes
  checking for GST_VIDEO... yes
  checking for G_UDEV... no
  checking for LIBUSB... yes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index cdedb60..3b32c49 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -38,7 +38,7 @@ PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
-PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 udev"
+PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
-- 
2.6.3


