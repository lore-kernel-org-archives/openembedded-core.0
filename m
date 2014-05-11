Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f180.google.com (unknown [209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA1365FCF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 06:47:52 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id db12so7111024veb.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 23:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VivR/IJKSBTOmds2EnkPd8tq1EoETD/EXSabIuL4Ek4=;
	b=QO3YWPjcnSQC9UeVLiAnERjicaGtsYweWWVkjXSJmqgbone9vfBpD6F3fTgCKTmEsh
	o6LWad1o6mEX/mw/lvhoM9/ofnzB1h2MICnvKYRTwJApu+nE2zUjmZckSHLuDai40Smo
	oE9xFXH514qSRxGZu4ywKS19lRt6dgWyZEpx/DNIlhHXUcqYuWpbvqWws/dDBjdYWQS0
	0T0eTPrhU8SKLyP/cCvhQc5tWIB0uAuMrWjnjzF+6CyN69a4NPEZ99BznHa6bgGu/P6V
	4aUzQxbO2+1Vf6DHlTUplDdJPa25S7J509ImdT9aRP7d58mtPxSMOQfeCsb0ubCaUrn8
	qw3Q==
X-Received: by 10.52.173.165 with SMTP id bl5mr14067536vdc.13.1399790873203;
	Sat, 10 May 2014 23:47:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	us17sm16225427vdb.19.2014.05.10.23.47.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:47:52 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 May 2014 08:48:09 +0200
Message-Id: <1399790890-32695-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399790890-32695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399790890-32695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] gst-plugins-good: add PACKAGECONFIG for x11
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
X-List-Received-Date: Sun, 11 May 2014 06:47:57 -0000

* fixes following issues from test-dependencies report:
  gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on libxdamage

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index c87e018..88f90f3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 PR = "r8"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} jpeg"
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


