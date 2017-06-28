Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 20CC171A62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:51 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id t186so34136164pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o+XhulgOUVxOZqt9rItNfnAjDBNxfjlILm0pavkJo3s=;
	b=FCvox5sH2lY/cRmUuGRIMZVa86LhnNBbY0lt6KiCnN1A2XNLFiV3+EALpheWCglx5e
	p3BMtFNJa0aGOKelPvBvUVwoxlzNJpAhLjXMCl6ZkGFqI3WOYHwn7VbHZslDvfNqSiy+
	omoShF1isJbIB71mJF80dZH9D+99y1ZqRktNAz1Q2GQC+C4zw74Xgr5f0QJlqAYoOlKw
	rjHhKzTWpMKyZIhe6er/u38xh9usWULBubQhrGNejYa/MD3/lb4wE5gfXPtwwe+6N1/j
	zYw4SIKut7plhyJXVmyJXonoqXsbfyOcRiksgjFZhRQeovcHWKyq1PS23ydfLDuvff6v
	V+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o+XhulgOUVxOZqt9rItNfnAjDBNxfjlILm0pavkJo3s=;
	b=Y1CuGgZQbeFAlROeLlyHYVvpFfyCaqx+aRyDE6qHSenAo1XNrvarBg9igyOhkZSeg5
	Lcsrftdm0JXZQDKH8lOJzvAsjzvHcTLeZjhr7saGMsjytTw2vhGlLpRcA3mUNB9o19Vz
	hSqgemMiSNazGADf94H9Z8Masdd6yuFW/OrH67dZ16jis4ff/pDIrp+Lyuv80Q+T764i
	OLxbch7FUmASeE97RP4PUANutQwKQTOidT0CC7jI0UHOTrL9D7RG9KFKP1NyF+WGul0U
	Mmvqz6Q/DIjjnWjziGsVfXdh5oObDb6hx212BCrdqKF9GvhYxIciGGEPAL64H8cBoWnS
	Ag9w==
X-Gm-Message-State: AKS2vOwQVM6lu1V2idqJ9oIArto6xQajFywWCljFqNv92B+wOT6R/mYF
	XvWNdHBkg4wa09el
X-Received: by 10.99.18.65 with SMTP id 1mr11313499pgs.132.1498665892722;
	Wed, 28 Jun 2017 09:04:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:23 -0700
Message-Id: <4df4ce341657694b6afb95eb72c832618c49db87.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 10/10] gstreamer1.0-plugins-bad: Fix missing library with bcm egl
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:52 -0000

userland graphics driver provided libegl for rpi depends upon
symbols from vchostif library, therefore add it to linker cmdline

helps with loadng gst-gl plugins on rpi

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../link-with-libvchostif.patch                    | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
new file mode 100644
index 0000000000..c382b17586
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
@@ -0,0 +1,35 @@
+Add -lvchostif to link when using -lEGL on rpi
+
+This is required because libEGL from userland uses sybols
+from this library.
+
+lib/libEGL.so.1.0.0                                                                                                                                                                                                                              121: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
+  1552: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
+
+These symbols are provided by libvchostif as seen below
+
+lib/libvchostif.so
+   252: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
+   809: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
+
+With this explicit link, plugins fail during runtime
+
+(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstomx.so': Error relocating /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
+(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstopengl.so': Error relocating /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: gst-plugins-bad-1.10.4/configure.ac
+===================================================================
+--- gst-plugins-bad-1.10.4.orig/configure.ac
++++ gst-plugins-bad-1.10.4/configure.ac
+@@ -785,7 +785,7 @@ case $host in
+                             HAVE_EGL=yes
+                             HAVE_GLES2=yes
+                             HAVE_EGL_RPI=yes
+-                            EGL_LIBS="-lbcm_host -lvcos -lvchiq_arm"
++                            EGL_LIBS="-lbcm_host -lvchostif -lvcos -lvchiq_arm"
+                             EGL_CFLAGS=""
+                             AC_DEFINE(USE_EGL_RPI, [1], [Use RPi platform])
+                           ])
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053e43..def03a9b81 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
+    file://link-with-libvchostif.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
2.13.2


