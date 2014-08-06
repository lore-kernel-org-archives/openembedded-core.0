Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 43BBD701A6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 11:41:31 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so9442526wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1lPbgIJD+Yo20PdYiXibi5GobECGecl9qvDHKcQ2+CY=;
	b=OB9XY0YtHgSDgZiTb4TRf4CAisLVCC4rrwU5J0pooLp9DxdPNMdiLeuNtGV8o850wb
	IRfJJeZa4uHf9hiAcmxNVsLi6OVxJxECupTnVk5hJbFf8TJfw3Z0tiK2Vr28N+OgDJih
	fAqbKrn/r4pyJdPJhV3kDEvhnfW0+ermw2PvPCothLpggOQXyz+oOqGRD0A9vByPjyk2
	Yw/UdNK4pTABabxh3oEp3DJJMkJ4rChrF8I4ubbxvpDAq5Dxs+KAzH3V4NVAjNsUIW/O
	RSoa50r5rGTA3qVh9kF8HRPYNO05RN8Avavmz9CXdWIvD5XJtTrNPKuk8lbPdX0VRW3B
	7QrQ==
X-Received: by 10.194.184.166 with SMTP id ev6mr14639157wjc.61.1407325292425; 
	Wed, 06 Aug 2014 04:41:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs3sm5318541wic.20.2014.08.06.04.41.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 04:41:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 13:41:57 +0200
Message-Id: <1407325317-5030-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407325317-5030-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<1407325317-5030-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
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
X-List-Received-Date: Wed, 06 Aug 2014 11:41:38 -0000

* standalone libpostproc recipe depends on libav, but current PACKAGES_DYNAMIC indicated
  that libav-9.13 also provides libpostproc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc       | 5 -----
 meta/recipes-multimedia/libav/libav_0.8.11.bb | 2 ++
 meta/recipes-multimedia/libav/libav_9.13.bb   | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 5c327df..8b470c1 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -85,9 +85,6 @@ do_install_append() {
     install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
 }
 
-FFMPEG_LIBS = "libavcodec libavdevice libavformat \
-               libavutil libpostproc libswscale libavfilter"
-
 PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
 
 RSUGGESTS_${PN} = "mplayer"
@@ -140,5 +137,3 @@ python populate_packages_prepend() {
         for pkg in pkgs:
             d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
 }
-
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb b/meta/recipes-multimedia/libav/libav_0.8.11.bb
index 662d205..1344a2a 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.11.bb
@@ -16,3 +16,5 @@ PROVIDES += "libpostproc"
 EXTRA_OECONF += " \
     --enable-postproc \
 "
+
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
diff --git a/meta/recipes-multimedia/libav/libav_9.13.bb b/meta/recipes-multimedia/libav/libav_9.13.bb
index 7bfbc48..f9c413f 100644
--- a/meta/recipes-multimedia/libav/libav_9.13.bb
+++ b/meta/recipes-multimedia/libav/libav_9.13.bb
@@ -11,3 +11,6 @@ SRC_URI[md5sum] = "23b9e34bffdaee366710fdf20157a570"
 SRC_URI[sha256sum] = "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca"
 
 DEFAULT_PREFERENCE = "-1"
+
+# unlike 0.8.11 we don't provide libpostproc
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
-- 
2.0.4


