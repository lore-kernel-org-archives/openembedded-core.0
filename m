Return-Path: <armccurdy@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id B14116FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 22:17:25 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id q190so1744977ywd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LELj/qPvGgkUOgOMLfbrN8IlTPhbig8tPDm2D7LiCA0=;
	b=wvC4ksnJ+ftfIQ0uxlGXNoBpUKdjQJFq9NS/Tcz47hUGTp+f16gq63trWF072wCwHt
	CYTcIcN/wSqM3LfUV6TvjLcYVFNNHosCweR6XtL/Z8vXWSR2UoKt2cEAmMbpXX0cDAd7
	OedhP2l/Vui7kQP5g5zL8Fpp7ntpOC0sciRRFmfT8pTzKm3LVoRvNKtHCO7DV8bgGjHX
	iT0fk/UjB3aynZa9jM3HK9/XZ+ki+UcSSwaqOgCElOKRGfeXxNolXQ6MAh1n7VrZsOGx
	ZnAzj2/5YVFLm7EK/oXdngXvAUgq6nLuPH0ZTaP7VQLbPVuh7D4nKstTW5uGvq/4Yy67
	pCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LELj/qPvGgkUOgOMLfbrN8IlTPhbig8tPDm2D7LiCA0=;
	b=M/H9FRjGW5/Jl0PyCC8pjfexWIs9yEMmsHc6Rbek+7Xb+2UoLMEsjuWKcQl5Ejezdr
	GX4RZtSaVX1PTTy7aaT48273H1fngG0YcZHWNlY/LWn3Cl6xiL/LT1ClLqnIQg+idQMv
	1lDeW0pvbPfWtUpNP0ScoOqAbIOK8LZEKi+spmJnsrmJumtPq5D+hIanw6A9kdn7YBiv
	GWfYTVldaKqIQDc23uzV8zErNHmq5122ZfSgF7TSk7tR2WkO1Du15rCkWzjrtEWtZJ5T
	z28QLAetRaVJQvi6P2y1g4zwblz7Bv8SzjQMyWIY3WF7bdJY8kTibMI7+QsyBRDcMN78
	kbAg==
X-Gm-Message-State: AG10YOTfobNmvdgZ15NMkoyiJ/mPwurxGZdnryPAKgtQPRAZ8nrSNX8LFNepKOfanhv6Vw==
X-Received: by 10.129.147.2 with SMTP id k2mr24088512ywg.69.1455141949301;
	Wed, 10 Feb 2016 14:05:49 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l78sm895235oib.21.2016.02.10.14.05.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 14:05:48 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:05:37 -0800
Message-Id: <1455141937-23225-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455141937-23225-1-git-send-email-armccurdy@gmail.com>
References: <1455141937-23225-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-bad_git: fix gst_structure_get() etc compiler warnings
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
X-List-Received-Date: Wed, 10 Feb 2016 22:17:25 -0000

 | ../../../gst-plugins-bad-1.7.1/sys/decklink/gstdecklinkaudiosrc.cpp: In function 'gboolean gst_decklink_audio_src_set_caps(GstBaseSrc*, GstCaps*)':
 | ../../../gst-plugins-bad-1.7.1/sys/decklink/gstdecklinkaudiosrc.cpp:315:59: error: missing sentinel in function call [-Werror=format=]
 |	    g_object_get (videosrc, "connection", &vconn, NULL);
 |							      ^
 | cc1plus: all warnings being treated as errors

For GStreamer functions declared with G_GNUC_NULL_TERMINATED,
ie __attribute__((__sentinel__)), gcc will generate a warning if the
last parameter passed to the function is not NULL (where a valid NULL
in this context is defined as zero with any pointer type).

The C callers to such functions within gst-plugins-bad use the C NULL
definition (ie ((void*)0)), which is a valid sentinel.

However the C++ NULL definition (ie 0L), is not a valid sentinel
without an explicit cast to a pointer type.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...valid-sentinels-for-gst_structure_get-etc.patch | 67 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
new file mode 100644
index 0000000..8ccaaa0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
@@ -0,0 +1,67 @@
+From 3164f23cd6ae338d0e423fccb4e11539cd220e2f Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 9 Feb 2016 14:00:00 -0800
+Subject: [PATCH] ensure valid sentinals for gst_structure_get() etc
+
+For GStreamer functions declared with G_GNUC_NULL_TERMINATED,
+ie __attribute__((__sentinel__)), gcc will generate a warning if the
+last parameter passed to the function is not NULL (where a valid NULL
+in this context is defined as zero with any pointer type).
+
+The C callers to such functions within gst-plugins-bad use the C NULL
+definition (ie ((void*)0)), which is a valid sentinel.
+
+However the C++ NULL definition (ie 0L), is not a valid sentinel
+without an explicit cast to a pointer type.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ sys/decklink/gstdecklink.cpp          | 2 +-
+ sys/decklink/gstdecklinkaudiosrc.cpp  | 2 +-
+ sys/decklink/gstdecklinkvideosink.cpp | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
+index c0d1128..6f2ef75 100644
+--- a/sys/decklink/gstdecklink.cpp
++++ b/sys/decklink/gstdecklink.cpp
+@@ -328,7 +328,7 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e)
+       "interlace-mode", G_TYPE_STRING,
+       mode->interlaced ? "interleaved" : "progressive", "pixel-aspect-ratio",
+       GST_TYPE_FRACTION, mode->par_n, mode->par_d, "colorimetry", G_TYPE_STRING,
+-      mode->colorimetry, "chroma-site", G_TYPE_STRING, "mpeg2", NULL);
++      mode->colorimetry, "chroma-site", G_TYPE_STRING, "mpeg2", (void *) NULL);
+ }
+ 
+ GstCaps *
+diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
+index e5ac8ae..a153851 100644
+--- a/sys/decklink/gstdecklinkaudiosrc.cpp
++++ b/sys/decklink/gstdecklinkaudiosrc.cpp
+@@ -312,7 +312,7 @@ gst_decklink_audio_src_set_caps (GstBaseSrc * bsrc, GstCaps * caps)
+       g_mutex_unlock (&self->input->lock);
+ 
+       if (videosrc) {
+-        g_object_get (videosrc, "connection", &vconn, NULL);
++        g_object_get (videosrc, "connection", &vconn, (void *) NULL);
+         gst_object_unref (videosrc);
+ 
+         switch (vconn) {
+diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
+index 7111cb1..b958fda 100644
+--- a/sys/decklink/gstdecklinkvideosink.cpp
++++ b/sys/decklink/gstdecklinkvideosink.cpp
+@@ -158,7 +158,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
+     gpointer user_data)
+ {
+   gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
+-      G_MAXINT, 1, NULL);
++      G_MAXINT, 1, (void *) NULL);
+ 
+   return TRUE;
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 0ebf622..f5b2d70 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://configure-allow-to-disable-libssh2.patch \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
+    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1


