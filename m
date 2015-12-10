Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id AC6056AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:58 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v187so33918966wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JlZuI9Hqi4MDfrhmxddlNLSzEy+/xs+kqa+ZYcsLeNg=;
	b=DMkGCWnHJGuTmSHwjSlVGZ9lpGz9rI5XfbUP4q2xnZMSrR7tfwDb1zXFWRsXzZFqQw
	BiuNNJ6acylOs1P8da130Fej5uzckQg9ZGjefc874zAeCkHfRcmyxDoBlX8Ua7LwodAG
	QWAuKhDehkyt3P0GrXGMghTAdQNt6V5cdvU4LKS7NTYLKirvZtQYmbNVa/v3C5mXvdLE
	nlNx/BTju5ydFTtq2jleYg4rCvX/u2Hr+KIq0heBVOFLOPuMq9pMIQURSd5YFpmeJDOB
	CQZnuPHZDTlujvVqoi2IP9PoS7hIAY/Dpbk9hBsehFq221mWKxskJPJAu0PJC3AdDHxR
	wKiQ==
X-Received: by 10.194.185.42 with SMTP id ez10mr14934541wjc.82.1449755219327; 
	Thu, 10 Dec 2015 05:46:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh6sm12558216wjb.0.2015.12.10.05.46.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:27 +0100
Message-Id: <1449755316-17611-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/11] gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:59 -0000

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
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index cdedb60..d7aefec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -20,7 +20,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-    orc curl uvch264 neon sndfile \
+    orc curl neon sndfile \
     hls sbc dash bz2 smoothstreaming \
     "
 
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


