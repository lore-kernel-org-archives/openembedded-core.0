Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D385171DCF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:45 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id e7so1957464pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o+XhulgOUVxOZqt9rItNfnAjDBNxfjlILm0pavkJo3s=;
	b=eZzQPc4B/I/VKQCgB7vpx8BqjSt7H6mNqkq6tHeQvqb1msRVwkyKPkgLyq85xdOr9y
	GZU+R9/uthA4Djr/lSlLT39BkvlXmr4EPXaqcPnGkDMMjuxkNl+Jo8Jz6yLCCClHMnvq
	i297QfSwm+vRFrYtvvmonJGVL0mZSEQl920wWXZXgtT07IveHF8L3ribWKYv81fc7pBd
	+3pjbyCBkjlfmny5qNmaMAq53lGYtEpype0sTOoj2ScM84EkfRTt6ZtY3DFep4u3ApSP
	iOdcEgGzz5Fm6Joia31dgz58b4SjeVKyAEHSYtKNFPZdU+vAeC6h4tMTFtyJITJd3dAl
	QCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o+XhulgOUVxOZqt9rItNfnAjDBNxfjlILm0pavkJo3s=;
	b=FxXsDrw0ORqVVxXyRui1x/zWxFZ5AHDcOY/vzxLF0qq8s2RDeC02k3K2/InQ91Mjiz
	fcYF/PuXj45V1P5BrcUGPZGt+6vi0vt84f6Ma6OPf32LzD3FjB+P/cpj6qdZzazRzJuc
	d2LjYlKrXgecU4O1d9Bmssug1lN7gbIaBQ0Eou0rwwh1rrhFSrp/SCiW/2HcuDRYLcfZ
	fQtUUGYtNeAvS6RHBGcgbQ+UUXXH8RjteARVgWof/GLc3jPLQE+pJoAV6mUzLx0eA1Ls
	3xANaIoqPrSJlEXfEGhrLbCg9BZM7Ap22HjGaARwSGxw/3YSAj0noDV2h/c/guSFUUG1
	Ybkg==
X-Gm-Message-State: AIVw111XzRfL6hqVFsHQOlEck/LkJSDm+L6UW+Z1kaj7feb8TfBqfJMA
	XDSPoBJQYOqyahyC
X-Received: by 10.84.132.104 with SMTP id 95mr28690852ple.228.1499351626673;
	Thu, 06 Jul 2017 07:33:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:09 -0700
Message-Id: <0ef2355c4904c7632a6e8e3cb08d1c80b92bb423.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 08/22] gstreamer1.0-plugins-bad: Fix missing library with bcm egl
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:46 -0000

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


