Return-Path: <kirgene@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id A8B2D6AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 13:58:29 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2131066eek.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GTYReZVI0B5plV9Y+niVcgevkmBEZcaAzeswxM0Rnq4=;
	b=CIjRWvrKu/QddvELTORVvYWQUPGGuzMOs8V7Z75KwgNV9dKdbew6BSA8BQqzlZ+EVu
	814zvxk7Yzl3YvXG4pDMr5TW2djYh3KdVAuHpUgRm3bZECqPRQf5EjW5+PT2WK762PN9
	rlo98kSAMK/JRWTiCrYmTuv3qyqa2Rjo50VpPCBTtpcMFQys2f0dLt60tP7ZMLw8DEbH
	no/PEmOBF4rzPJO3fjX95BnCPB8WTjCtkfM6HeQZE3c4NQjHoCsY+uJBlc/6QmhAVwXf
	2IyU5x2k+EOHcluH3vbxRw4RSNhHWOEGQbFpb2c5zDuYtGZaUhHkU7D4enWvrpqXUxOv
	xEyg==
X-Received: by 10.15.111.136 with SMTP id cj8mr671383eeb.91.1376056709372;
	Fri, 09 Aug 2013 06:58:29 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPSA id t6sm28905196eel.12.2013.08.09.06.58.27
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 06:58:28 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 16:58:16 +0300
Message-Id: <1376056696-31679-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v1] gst-plugins-good: fix compilation of v4l2 against newer kernel headers.
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
X-List-Received-Date: Fri, 09 Aug 2013 13:58:30 -0000

Patch fixes "'V4L2_CID_VCENTER_DEPRECATED' undeclared" error.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../0002-v4l2-fix-build-with-recent-kernels.patch  | 25 ++++++++++++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bb          |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0002-v4l2-fix-build-with-recent-kernels.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0002-v4l2-fix-build-with-recent-kernels.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0002-v4l2-fix-build-with-recent-kernels.patch
new file mode 100644
index 0000000..25c2550
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0002-v4l2-fix-build-with-recent-kernels.patch
@@ -0,0 +1,25 @@
+From 8e633d2059cb835448021cf79becb487aff10975 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Mon, 18 Mar 2013 14:59:35 +0000
+Subject: v4l2: fix compilation against newer kernel headers as on FC19
+
+---
+diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
+index 07d390a..4c10f4f 100644
+--- a/sys/v4l2/v4l2_calls.c
++++ b/sys/v4l2/v4l2_calls.c
+@@ -291,8 +291,12 @@ gst_v4l2_fill_lists (GstV4l2Object * v4l2object)
+         break;
+       case V4L2_CID_HFLIP:
+       case V4L2_CID_VFLIP:
++#ifndef V4L2_CID_PAN_RESET
+       case V4L2_CID_HCENTER:
++#endif
++#ifndef V4L2_CID_TILT_RESET
+       case V4L2_CID_VCENTER:
++#endif
+ #ifdef V4L2_CID_PAN_RESET
+       case V4L2_CID_PAN_RESET:
+ #endif
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 8868ba7..570031d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -22,7 +22,8 @@ DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
 
 inherit gettext gconf
 
-SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
+SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
+            file://0002-v4l2-fix-build-with-recent-kernels.patch"
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
                  --disable-orc --disable-examples --disable-taglib"
-- 
1.8.1.2


