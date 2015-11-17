Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 815AF60119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:04 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so151500952wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ftPKM/j6VuPlfd9T8dkgy/iDkBAk3EkRUW99zWicUKI=;
	b=r6+A3w+CvbVj25+KnT3qfvgb5w08p60rBPbgxh53mf8XzkvIpbZ0ckOwHEE71EucpC
	g/yNOSg5KBPAsjSHMkvyULNPuAeh0yU6LKFcKwnN54aBnfcXlHcFv8X25u/nHWtwVJCU
	M9qQdt5f/XXSG8Sa8Ot6eCiFC/25+PN4+DAYq4HhypA3OaP87WoMLyZs03Z+M14nl+Nj
	QuY0f/B2gFvmKPHXnHGKhNpMuvsCAvzlq8Pr0suZhJvYP2HAlN1qyJbceV9Q92Lko5DH
	k5G9S1KpqwGn5TF3D94TeCmlvbTnON+tPqCcjLU2I4rzLr0IVxZSZ3p+KPZ8Yc01hPB8
	ZNtg==
X-Received: by 10.28.16.72 with SMTP id 69mr2356733wmq.100.1447761485173;
	Tue, 17 Nov 2015 03:58:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q141sm23610273wmg.3.2015.11.17.03.58.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:58 +0100
Message-Id: <4c979450dc388089218a40192a5eb9ae7d6e7f5b.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 06/16] gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:05 -0000

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
index f94b12f..fe9ab97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -40,7 +40,7 @@ PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
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


