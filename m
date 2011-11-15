Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQSlT-0004tU-H6
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 00:50:07 +0100
Received: by bkbzs2 with SMTP id zs2so7986251bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 15:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2yPFHnCTzP35pLBX0tNJjt2eSjTv2vCJOrBc5zZL7n4=;
	b=pLVcEFYcaw8voPyl+N/DRh9iQ7lGZHU8wh+kNlk69cEw3/d1uJXE3JgPTXGdKvvszq
	rZ4ydGEn5LZh6pfIscOTgop6wQ/+LmTT5tFLzOjSwikTK/NwBBqDSfLeuuNV1+0Emtb1
	ZjjciFxniopHMWuwEpjTBdESSGuT1kY8WFHuk=
Received: by 10.204.143.140 with SMTP id v12mr26536547bku.15.1321400624496;
	Tue, 15 Nov 2011 15:43:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l18sm18780934fab.9.2011.11.15.15.43.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 15:43:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 00:43:34 +0100
Message-Id: <1321400614-2758-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
References: <d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2] libsdl: enable alsa based on PACKAGECONFIG and respect DISTRO_FEATURES
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
X-List-Received-Date: Tue, 15 Nov 2011 23:50:07 -0000

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
1.7.8.rc1



