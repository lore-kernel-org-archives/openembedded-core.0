Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNDU-00025L-GD
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:55:20 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so9309171bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tFUJVLwmVzpOCnbS2ZdlgpTLV4zqvvGat7MFpDNdif0=;
	b=D1M39EhGofEWcVwsRd6gDZWfWZ607d8Ddi9m9ClH91xb1davl8FqPBuvIj/hM+48X7
	kpJMY0OEs1loLHqDdyNGZ495w1FK9yOh21LDzphw8o85CdCShirKHfI+TVXYuK0N0TTH
	8CxUUTVLcuvDrRqXiqSlHvL6laJXpmJcYlIb0=
Received: by 10.204.156.82 with SMTP id v18mr27611339bkw.126.1322570923800;
	Tue, 29 Nov 2011 04:48:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm36815032bkb.8.2011.11.29.04.48.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:48:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 13:48:13 +0100
Message-Id: <572ee988031418b5bc01716ac39b873aa7b915bd.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
References: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322570605.git.Martin.Jansa@gmail.com>
References: <cover.1322570605.git.Martin.Jansa@gmail.com>
Subject: [oe-core 4/5] libsdl: enable alsa based on PACKAGECONFIG and respect DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 12:55:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index 17a3103..e5fdcc3 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642
 inherit autotools binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
-                --enable-file --disable-oss --enable-alsa --disable-esd --disable-arts \
+                --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
@@ -40,6 +40,9 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen \
                 --disable-rpath"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
+
 PARALLEL_MAKE = ""
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
-- 
1.7.8.rc4



