Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4A06013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 11:26:57 +0000 (UTC)
Received: by qkx62 with SMTP id 62so84107843qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=NhozIqb3PhmDyFvkUiLemVsmJdczahBxwBzeQH7X02Y=;
	b=ONtkV30zHWXELfRwnR+cLAXo5umd/fgDAoJT04XIeObOVzMX2u0TYGoMnrl3A+hS7t
	D8zZFk2XqmggePretyXw3ww4DhUGn/pKLZ4D+vyNj1AKaDK74CJIFjNGDRvTYRXJNk2w
	ZHExcyAiepvXAy2bT2BHxMilrqIvWz3jJ9CtAfSRnpLniohGHd7zLYuaXw1hxTkFDzej
	zmnoF8j2X/EhCzkz901M8iu+++vYpcvw5UnhEAzy7BoblZx7CHOVzh6BKozjb4oR/q+j
	82zAowbo97N+ZkoSqTE9OmFBxdJJuaBsRbRwk/B4TxmTxe50eVpdN6cLzN0+HVePf1TH
	ms+w==
X-Received: by 10.55.43.220 with SMTP id r89mr20553270qkr.27.1431343619134;
	Mon, 11 May 2015 04:26:59 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	b137sm10284964qhc.18.2015.05.11.04.26.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 04:26:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 076321CE97B00; Mon, 11 May 2015 08:26:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 08:26:47 -0300
Message-Id: <1431343607-2820-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] gstreamer1.0-plugins-bad: Move EGL requirement for Wayland
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
X-List-Received-Date: Mon, 11 May 2015 11:27:01 -0000

The EGL is used by the Wayland backend. When building using Software
Rendering and without Wayland support the EGL backend is not available
so we should not require EGL for GLES2 support.

This fixes following build error:

,----
| ...
| checking for bcm_host_init in -lbcm_host... no
| checking for WAYLAND_EGL... no
| configure: error: Could not find the required EGL libraries
| Configure failed. The contents of all config.log files follows to aid debugging
| ERROR: oe_runconf failed
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index e2752af..84a0a58 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -27,7 +27,7 @@ PACKAGECONFIG ??= " \
 # dash = Dynamic Adaptive Streaming over HTTP
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[gles2]           = "--enable-gles2 --enable-egl,--disable-gles2 --disable-egl,virtual/libgles2 virtual/egl"
+PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
@@ -37,7 +37,7 @@ PACKAGECONFIG[mpg123]          = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland"
+PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 udev"
 PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
-- 
2.1.4


