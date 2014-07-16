Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 316357037D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:13:47 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so1205859wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xBABE5DMS0D/9tKolv4NquaVi7CIfk1PdOhUDXi/xLE=;
	b=S1D87L1ZQVIrDnN0ZElYPz9B9pVMeJnx/eUt6VdL6i2VS38TsdT7uOOuuQFoxCAMon
	pra3KI8RdgwwXzOIv+ESKS2+jFjUzEtoOkJkR815rauh01aqt1oWs/s+iW3IXIflNNhB
	sj5wa8WDhVxX68nEvNFpww2i2J33WDwDwIXWXWj/LXhkPjJt/qyDZGx5djd2dAw/HLwz
	G6+paZefriSHm38zXZhnVXfzsAbb/gt0BnZDY2oseUsUUU3JMFK5MjSMcO+zn6L82uUt
	Dm0APwz89Muronf92a/92sMSamzShOTt0fXQ7jH+JXKhNve0rmanw/lBaEcW2DodY9mD
	qwAA==
X-Received: by 10.180.221.172 with SMTP id qf12mr3542813wic.54.1405512828640; 
	Wed, 16 Jul 2014 05:13:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w9sm8378101wif.12.2014.07.16.05.13.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 05:13:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:13:54 +0200
Message-Id: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [RFC][PATCH] libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
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
X-List-Received-Date: Wed, 16 Jul 2014 12:13:51 -0000

* standalone libpostproc recipe depends on libav, but current PACKAGES_DYNAMIC indicated
  that libav-9.13 also provides libpostproc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc       | 5 -----
 meta/recipes-multimedia/libav/libav_0.8.11.bb | 2 ++
 meta/recipes-multimedia/libav/libav_9.13.bb   | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 1d617a2..ff1ab0e 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -87,9 +87,6 @@ do_install_append() {
     install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
 }
 
-FFMPEG_LIBS = "libavcodec libavdevice libavformat \
-               libavutil libpostproc libswscale libavfilter"
-
 PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
 
 RSUGGESTS_${PN} = "mplayer"
@@ -142,5 +139,3 @@ python populate_packages_prepend() {
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
2.0.0


