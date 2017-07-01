Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id ADD1E775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:57 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id u62so75895337pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o+XhulgOUVxOZqt9rItNfnAjDBNxfjlILm0pavkJo3s=;
	b=eCiKNuatTCBh98mvuZSfj24Ozkw8t0gwqrgQAkSVda+UCXeJTgXqUadlVqWSKFF1Pr
	drO2KgmLK9piJgV2vovwmMxCfsqahk0elNBO+NzFTfZOuj9Kq1IkfpbvVmyoN/eq3q6P
	ZMJ28X74IXvsHD3MHpZZDm0hzpGuoXZNjireh6f2rVb1eR3g8xcD87mi+gwRV5QOx28q
	pbh0YLVnQ+HX1yqZDy0k4R1FyNj7aKZYYh7q78iuxHwRuMR3BemNk6qUWVWxelHDKyJl
	/rIRg3dHaBG37pv7yS0WDNjlZSOqjSt3fkqlYX+iez3BaYwkGxoKUZdwCkP7q5T7gzVW
	I9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o+XhulgOUVxOZqt9rItNfnAjDBNxfjlILm0pavkJo3s=;
	b=HmOEj3XYxZrIZI1z1lyzpzfD0yaixz0szkqcKcI0TB020LBrPdZ6j1Vrg6qM80kU5b
	SvZqQ/NnHbxvvyG4rmtbAU7N2JILsgkqsn7sO5sKMCz0aFrJyAaO0bn/ljXACVJuQmuD
	FNYTeam1KOUZ9DdRfSdr6dVk25gJPbYwzNOg/dhGrhG+MdkyGmY/y1IxtY2dt7Sadt/L
	gVRAIEvZzA2OjQP9XYEOvdLFbx9LOw9u47yd1PqdcBupmaZSRJ7kZIJFF2iYQ8sBtIuK
	tpsQxIdA4c+2GHwNP3aOp3uqdsNkosErW0Hh6KwlHiKmHt+xC11N61B/vj3Bt7iZoT9P
	EmIw==
X-Gm-Message-State: AIVw112ZhpF/zZrvjkDN2IWpj+Fu3Q3e2DIERyUQg7GP0/ZUsMiR4BU3
	A0Fbmly0k644YGl1
X-Received: by 10.98.152.208 with SMTP id d77mr937190pfk.210.1498919038305;
	Sat, 01 Jul 2017 07:23:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:16 -0700
Message-Id: <d3d4e95f15ecc1519344432372b73f388644aa25.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 13/19] gstreamer1.0-plugins-bad: Fix missing library with bcm egl
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:57 -0000

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


