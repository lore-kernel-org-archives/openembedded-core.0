Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.9347.1619079002513822565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 01:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13M8A1jT023934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 01:10:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 01:10:00 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 01:10:00 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH][hardknott] gdk-pixbuf: fix CVE-2021-20240
Date: Thu, 22 Apr 2021 16:09:59 +0800
Message-ID: <20210422080959.3147-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gdk-pixbuf/CVE-2021-20240.patch           | 40 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
new file mode 100644
index 0000000000..fe594b24bb
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
@@ -0,0 +1,40 @@
+From 086e8adf4cc352cd11572f96066b001b545f354e Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Wed, 1 Apr 2020 18:11:55 +0100
+Subject: [PATCH] Check the memset length argument
+
+Avoid overflows by using the checked multiplication macro for gsize.
+
+Fixes: #132
+
+Upstream-Status: Backported [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/086e8adf4cc352cd11572f96066b001b545f354e]
+CVE: CVE-2021-20240
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ gdk-pixbuf/io-gif-animation.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/io-gif-animation.c b/gdk-pixbuf/io-gif-animation.c
+index c9db3c66e..49674fd2e 100644
+--- a/gdk-pixbuf/io-gif-animation.c
++++ b/gdk-pixbuf/io-gif-animation.c
+@@ -412,11 +412,15 @@ gdk_pixbuf_gif_anim_iter_get_pixbuf (GdkPixbufAnimationIter *anim_iter)
+ 
+         /* If no rendered frame, render the first frame */
+         if (anim->last_frame == NULL) {
++                gsize len = 0;
+                 if (anim->last_frame_data == NULL)
+                         anim->last_frame_data = gdk_pixbuf_new (GDK_COLORSPACE_RGB, TRUE, 8, anim->width, anim->height);
+                 if (anim->last_frame_data == NULL)
+                         return NULL;
+-                memset (gdk_pixbuf_get_pixels (anim->last_frame_data), 0, gdk_pixbuf_get_rowstride (anim->last_frame_data) * anim->height);
++                if (g_size_checked_mul (&len, gdk_pixbuf_get_rowstride (anim->last_frame_data), anim->height))
++                        memset (gdk_pixbuf_get_pixels (anim->last_frame_data), 0, len);
++                else
++                        return NULL;
+                 composite_frame (anim, g_list_nth_data (anim->frames, 0));
+         }
+ 
+-- 
+GitLab
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 226e1c7b89..f01da32e71 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
            file://missing-test-data.patch \
            file://CVE-2020-29385.patch \
+           file://CVE-2021-20240.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.17.1

