Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 382FC60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7Eqe4025213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:52 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:14 -0800
Message-ID: <470f5ae7d9a7283a40f9dacdcc86f3b3b36fb572.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/40] gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:52 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

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
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    4 ++--
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
1.7.9.5


