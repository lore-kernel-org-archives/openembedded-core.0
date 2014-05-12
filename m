Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f179.google.com (unknown [209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 86AA066056
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:35:26 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id c11so7360945lbj.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Q8jQnMVQz5jXoAa7qCsQ5x5WP8sKxBHsnryJqnttKgw=;
	b=CYg+s6u/jXtVzER3L5kQXcR17d09TEwU8wGlv6O0CSFJuoCMPu9Hba4XWU4U/3yzdJ
	xk4n+z61vjIg4SYLhtwPXemLnF9Gfk4aIaCndO2i8WuVRrPPfxcgEBu0iTXGJ1HGLu5b
	OjO3k4JUH+aoNBtVAnmvdNqmhyAAI5ZFrrrU3oMBSsvWyqXi5vvQ0+Rsp5SrjgvUTg44
	6K8ewcbQnCAyLQCEhwRZKrYpicyKy5RPqDmQXyHkjlvO7xl2tIizApgsTh40ZgLjw50s
	TAotVLD7KXy+OOOjY49S5U/dAuFx4vcLR9O+i90tY2UN1LJ/QXw8c8PHLOuN4m/UJ/au
	usnA==
X-Received: by 10.152.87.52 with SMTP id u20mr1209058laz.52.1399894526574;
	Mon, 12 May 2014 04:35:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dl4sm13589526lbc.4.2014.05.12.04.35.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:35:25 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:58 +0200
Message-Id: <19cb19e06985eb37cdce09e2dec17daa4b7dc105.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 09/10] gst-plugins-good: add PACKAGECONFIG for x11
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
X-List-Received-Date: Mon, 12 May 2014 11:35:27 -0000

* fixes following issues from test-dependencies report:
  gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on libxdamage

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e044340..88f90f3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 PR = "r8"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} jpeg"
+PACKAGECONFIG ?= "jpeg \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
@@ -16,6 +19,7 @@ PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
 PACKAGECONFIG[v4l] = "--with-libv4l2,--without-libv4l2,libv4l"
 PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+PACKAGECONFIG[x11] = "--enable-x,--disable-x,virtual/libx11 libxfixes libxdamage"
 
 DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
             speex libsoup-2.4"
-- 
1.9.2


