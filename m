Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 26B6C7803F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 17:15:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w69so19277239pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=svn77VS+UokAoLuEGM4qoEeh+Rzx3Iv6gkNJa6op7pY=;
	b=Jo2dpkZ4h23mXkHgnTTSfFaCfCoo7H4zn024R6+3kZffpI710g1HryfXPsN/9S9M6q
	bDiuxd1ieKV48+BzhKVBB1i52vQE/6pqJ2qCeshkSRSIy6l5Qpn5cqhbhXnmzJicDGx8
	VJoXwz2m40ZzTefLEPLiie3UIKSQSV5NxinRNqioCxVr2FuDAEjjH7zP4BqI6D4RnVGo
	Z7tnYG1XEsvRsdk59cYt3QOdfoJ8CFMVVUAjC2z1p6Cxz+FWrQFg3/fsLUM7Coud+HUZ
	xD65mZ38CKSdSeNaTJPRwgEsnWvHktQptUIlaIgqO0bwZVuCh4upeBUFwugd/ah+64j/
	E6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=svn77VS+UokAoLuEGM4qoEeh+Rzx3Iv6gkNJa6op7pY=;
	b=mnANvo+IcZNjI7PluHpVn8WgBvFfEdhcZ19q850HUP+N+pau2iBf4AWTIQKqrXUYHN
	bYCemFZeKU850Cdm2jI+sP2BTZZ3USyePH8/IZ5EStx3bT6tU5QLqoPA6BKYZFZXSP4C
	bo8mhTaH2ukGsqMMJlBo9utl2rKSlRohqD2thRlEpuzvGrGQlbfOn/Bu9cGxJ2pmJQEx
	W/5tiAe3M9tCJVxvZr0OY5P7BA/6DItzSy1NHeMTBlnOQY162Un/nL8o+ktmejWxCINy
	k0OUiReXTUpA0FyUYmxVGvJ64AxLGzpmf0IHl1kzOw4CPR+0XqW0TNYjoRcZavv4PpuL
	Lolg==
X-Gm-Message-State: AODbwcBJL1Ho+LQnhK5nvKAGYzfpH3U3zy2YCgfjMnKSDaKVG0IPdFX6
	tFHNJnVegMpisdQh
X-Received: by 10.99.140.9 with SMTP id m9mr27277283pgd.49.1496164533725;
	Tue, 30 May 2017 10:15:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	n24sm28071137pgd.57.2017.05.30.10.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 10:15:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 10:15:21 -0700
Message-Id: <20170530171523.37470-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 1/3] gstreamer1.0-plugins-bad: Fix missing library with bcm egl
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
X-List-Received-Date: Tue, 30 May 2017 17:15:33 -0000

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
2.13.0


