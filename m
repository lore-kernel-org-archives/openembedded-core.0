Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 38DEB601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 09:41:14 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f65so70605430wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=c/bXib6ktHn+ugL72zYBdBQ1mdY2gomLLAzhp4cvmdA=;
	b=HGzk6twJn3vnKD15lc6e9CQg4NqwnSmfpHYPjpeRlE9Z5sI1Y3kuvx/Ht+n3qrphUG
	Qps+Z6LZ3oEpVY43YllM7UG9bfSDXFvC+cuZnyfbszXTThuBu+96A8A8eJq3XuWcRVqm
	rHZgiSTp0PiH83yPva6qi14rxNn9w8WGmwElE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c/bXib6ktHn+ugL72zYBdBQ1mdY2gomLLAzhp4cvmdA=;
	b=lZxMdxHRk3IHEDNvSp/jhkkO65v3Qookd/uHj1iDaPNWod2mdXg/LvjxZcihScGSFc
	cOxMuLqfT/mLLwEGD5k2R2p3LWxM2ES22n2iKaIQnCYUsky3BgGJ3GB4OZPamaNHzaqw
	2owgEIe6hM3HBVJcZbIKxq65NL+9rvoYJF31RQtXe5t/93a4xEWcGL4Osas7rx6fLaq6
	09KNIzhxzFX5lHjmjrmAM+NJUsr80pOYmA5ByfgecrDWhzrRu4taVsGjEL8FjA2s53Rt
	L/xamVM7fEDTKRNWLWfoxhD2dPiiZJDlsWOsea/eh5WX3tmLufcGFdw2pMfQ6LjKfe4o
	YpKQ==
X-Gm-Message-State: AE9vXwMrtbzDqnCBXKrEfNhBZxH0CAG9rNwqnnNhrL9FTC91Ol75B5Ntp64a8loJyxyseh/B
X-Received: by 10.28.155.212 with SMTP id d203mr9139579wme.103.1472463674974; 
	Mon, 29 Aug 2016 02:41:14 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	pm1sm33438125wjb.40.2016.08.29.02.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Aug 2016 02:41:14 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 10:40:35 +0100
Message-Id: <1472463635-1124-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] gstreamer1.0-plugins-bad: add packageconfig for egl
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
X-List-Received-Date: Mon, 29 Aug 2016 09:41:15 -0000

In commit 9c3a94aea1d (gstreamer1.0-plugins-bad: Move EGL requirement for
Wayland), --enable-egl was explicitely added to the wayland packageconfig. While
this is correct that enabling wayland requires egl, it should be possible to
enable egl without wayland, even when using X11. For example, glimagesink can be
used for GPU based color conversion using EGL/GLES.

As such, let's make egl and wayland two separate PACKAGECONFIG flags.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
Changes in v2:
 * Set egl flag when wayland is set in DISTRO_FEATURES, instead of hardcoding 
   --enable-egl directly from wayland PACAKGECONFIG

 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d8c8179..a815c50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -21,7 +21,7 @@ PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
     bz2 curl dash dtls hls neon rsvg sbc smoothstreaming sndfile uvch264 webp \
 "
 
@@ -32,6 +32,7 @@ PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
 PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
+PACKAGECONFIG[egl]             = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
 PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
@@ -58,7 +59,7 @@ PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland-native wayland virtual/egl"
+PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
-- 
2.7.0


