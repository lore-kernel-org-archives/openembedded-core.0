Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 582DF77266
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:57:21 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so2053551wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Wnh7+YGBpF5BHSLW6BQl3k8+nf9/xvZrglYQcRJIcbs=;
	b=g8LW4uCMNcZeI9o2nGoaqSuGyFnInJx7UNp4grrcyTsEUJ2lOzSfsW8nHXZ1IfowMf
	pBcg3CpGxdZMcD2CQ+Tii6MhYcrBWNhBcAYSi/k2XI/CrreBR4X2l4qxBbb99fTSac7U
	LxAiLPEt8cJjaQK2I8i86XFyY7GNABGK2dv4CM00r+IYkdP/nZ6pXapqaeYRJRQzaPr6
	YqUz+R/lla5vETZgryDoZ6+3sI45ba080KoTdwZXOMd1pBuxnFwWFPPW0pOsELulll7v
	Uzx3hElJYp4byBDg7bzZ+66s1QAXIUh5ZoCGgspTkavPtFlOgIn+chF8Oe06rBWRhHsq
	MOUQ==
X-Received: by 10.194.5.2 with SMTP id o2mr17725152wjo.98.1447358241903;
	Thu, 12 Nov 2015 11:57:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v9sm16104985wjv.45.2015.11.12.11.57.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 11:57:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 20:57:33 +0100
Message-Id: <1447358254-5676-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][master][jethro 3/4] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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

* WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libcap, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on zlib, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 0ce4b8f..6498c45 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
+    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2\
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -22,7 +22,8 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
+PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
+PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,libv4l2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
@@ -32,11 +33,10 @@ PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libraw1394 libiec61883 libavc1394"
+PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2,--disable-gst_v4l2"
 
 EXTRA_OECONF += " \
     --enable-oss \
-    --enable-gst_v4l2 \
-    --without-libv4l2 \
     --disable-directsound \
     --disable-waveform \
     --disable-oss4 \
-- 
2.6.3


