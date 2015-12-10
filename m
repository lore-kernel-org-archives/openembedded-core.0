Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC977016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:00 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v187so33920112wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GyemS0oZ9b3HTNaRLYMUvt0/Ur4BAvmkE1YB/+o5Yfg=;
	b=j2P3vVF11m8dbJkyYRBb65lAyfILMoWrpyuSpo59HAPpriZxS1R2K139JxIpZHJYsP
	D1olB+GHEQYtJ3i3WJGQRY8j87falXyIbMXRo0ZgwDEKd2u3TplQcow1FFKN8HclhBi4
	TiHHtXEwkBEcJaH1eAAYj4Up4Bc08i/vrkjhAVoLKTvV2+30v9G8eW+l/bADBLBXADAd
	gbXAyJM3xXImhXqhASo68vHCgEGPdn59MRjkR35J4jnE/uKFXINd0p3s/gWRRCvV7JbD
	vX8sN5fbXRmkWe+Ln6LXpWv10nMQ1T5m8LI7GON7+IhoPNRnz6Z0QZb/ILcYQMi5Y7TD
	O88A==
X-Received: by 10.194.114.164 with SMTP id jh4mr12917197wjb.153.1449755220839; 
	Thu, 10 Dec 2015 05:47:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i18sm12972309wmf.6.2015.12.10.05.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:28 +0100
Message-Id: <1449755316-17611-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/11] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:00 -0000

* WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libcap, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on zlib, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 0ce4b8f..edaafe8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
+    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib v4l2\
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


