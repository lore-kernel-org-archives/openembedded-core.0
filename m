Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 58A1265CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 06:29:27 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so57835272iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jP9nzPexhNDDxhoszkmCAxgOuTT3Aj9zOuVeebTP3Yk=;
	b=MzGxknuq1ZDvtrjiDFrGPPJGlj1oMMVuqhDg+1HXbELciYT0BHDYfD63vNv7FvDD1T
	Hwrc+QP3db+DTZSPr5mqWGg7bFMM3sZ3cOQAWTZM/6S20nEF9UrzoLSjZpc50VL3PY8j
	qdNqJJsx0FowSWLiLyiFlTrjhXuqT7iTS1siNelguzSxOmSgQqAjMBkpEfYbb40eFmz6
	Y/dN+VeHGjLMxbkr4xKWMcgDwch+lz/6BfFiW9HjOHUnT/U7MnNuLGtBe7EbdXXRIMZA
	CFCYE4CCCSugq6MEpkZJeUiU+oBkAnSWrhSp7t3g8VW5BWXarhsdAkHJ1keWXilLDJf/
	JAvg==
X-Received: by 10.50.60.72 with SMTP id f8mr13513378igr.31.1426746568968;
	Wed, 18 Mar 2015 23:29:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id k2sm330179iok.11.2015.03.18.23.29.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Mar 2015 23:29:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 23:29:18 -0700
Message-Id: <1426746558-2920-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gst-plugins-good: fix nondeterministic udev dependency
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
X-List-Received-Date: Thu, 19 Mar 2015 06:29:28 -0000

Make the v4l PACKAGECONFIG option control building of the video4linux2
plug-in (not use of libv4l, as it did before) and enable by default.
Add a separate libv4l PACKAGECONFIG to control use of libv4l (disabled
by default since libv4l is not part of oe-core).

The default config for gst-plugins-good and gstreamer1.0-plugins-good
is now aligned with regards to v4l, ie:

  v4l support: enabled by default
  v4l use of libgudev: enabled by default
  v4l use of libv4l2: disabled by default

This commit fixes the following build-deps QA Warnings:

  WARNING: QA Issue: gst-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency? [build-deps]
  WARNING: QA Issue: gst-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency? [build-deps]

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 85f2196..af18281 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 PR = "r8"
 
-PACKAGECONFIG ?= "jpeg \
+PACKAGECONFIG ?= "jpeg v4l \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
@@ -16,7 +16,9 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[v4l] = "--with-libv4l2,--without-libv4l2,libv4l"
+PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,udev"
+# sub-feature of v4l, but control separately since libv4l is not part of oe-core
+PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
 PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[x11] = "--enable-x,--disable-x,virtual/libx11 libxfixes libxdamage"
-- 
1.9.1


