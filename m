Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZYJrbGYVlEzvx0QNYplyBRj4HllEAMOR5lz71SoXEEuAP3XJGWF9Z3VXk0bvrikwQZDLZmn4tr
 u2ZM0dSw1Lpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568879"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568879"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:10 -0700
IronPort-SDR: G1XsUXr59Qh9ye+8qzQ2Dqdaii44UJe47lV2N+hYnmRnw0Ly+iz9+eCX/nt9TGEyjIXSOL+VEI
 QF23nVW/eKzQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067570"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 54/64] gdk-pixbuf: fix CVE-2021-20240
Date: Mon, 26 Apr 2021 08:53:25 +0800
Message-Id: <bd08e4d179979937604c196b4047f59c5499a960.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

