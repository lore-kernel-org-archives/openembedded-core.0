Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 76FC17847B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 00:52:17 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id f11so10325353otj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 16:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KUoWAmXUHpm262bJTh8NNl/lr7/4h0pkhsaSpffoRgg=;
	b=AEg5xdsWUBKpNXJGnKqVFLrTbJHvU6X7ypwcYGe2/dX2MhGOEtr7C1NS9+w68HR+12
	UCwoYG2xKe6WhKbsggxzdHMFf53MtHCJwrTJfvH12XHwzS39GnH61KIA8Izc/CvsGg9K
	6mQS+dZ5Xsy/crWauluNDzOtN/OsRVE5yKrCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KUoWAmXUHpm262bJTh8NNl/lr7/4h0pkhsaSpffoRgg=;
	b=MKS4CAEZCVPxptlZ57xWWIKYoutj2cQY+NjpIOdouPvR50tVRQEvUElrkKk1dFdVZC
	StX8ZaEtt/Q8YOzg9j/v+GzrXqGYNWdrHjnuO90sTLUAHE493BsW2aXHBKmfJQey9HwN
	4TdfTfb+prz4OAddecZA3FfZZItCnKTq7Xqr5UAqznMStsvsCAu1Di0rz839eYxPUvvu
	Y6+mw0qpogy3J2Phmdk9g/U9s27Xpw5x5cFbDYjDi7dcjuZzv1hTDM5y0a9/39in9QuV
	o2GawiDtfANr1ussq2Rhpc/sXgJB96zQxbAKClUMo77N2RQKNPbUE9CVvKnyILYVkIlO
	FYCw==
X-Gm-Message-State: APf1xPAyqfeDFb7eyEAl35/jvppVzlvIVX/ycff4mHk/AWPGhrC00NJs
	wOaEmXhxRVmkrSwd1vCunyoU3McOVT4=
X-Google-Smtp-Source: AG47ELsppTGLc3WhmP8BX/SF/osDCEkmF8a7cZaKTNdbmbkyAkNjiO5n+K36/DQXDgYHDpmruyE8Zw==
X-Received: by 10.157.85.156 with SMTP id m28mr5129865oth.72.1520038337711;
	Fri, 02 Mar 2018 16:52:17 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	r58sm4048601otb.58.2018.03.02.16.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 16:52:16 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 18:51:54 -0600
Message-Id: <1520038314-26446-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kmscube: Add patch for missing GBM function
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
X-List-Received-Date: Sat, 03 Mar 2018 00:52:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some implementations of GBM, like the one included with
libMali, do not have gbm_bo_map() nor gbm_bo_unmap().
This patch enables kmscube to work with those implementations
even if it doesn't work as great.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch | 116 +++++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb       |   3 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
new file mode 100644
index 0000000..3605446
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
@@ -0,0 +1,116 @@
+From 761bf993ca55095f46380c0238583791c1797295 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Tue, 11 Jul 2017 14:50:37 -0500
+Subject: [PATCH kmscube] Detect gst_bo_map/_unmap and use it (or avoid it)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Those functions are not available on libMali, thus breaking
+builds and creating havoc.
+
+Removing the specific parts of the code that deal with
+gbm_bo_map() and gbm_bo_unmap() renders the kmscube utility
+a little less useful, but still valuable.
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Cc: Rob Clark <robdclark@gmail.com>
+Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
+
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/mesa-dev/2017-July/163020.html]
+---
+ Makefile.am   | 5 ++++-
+ configure.ac  | 3 +++
+ gst-decoder.c | 7 ++++++-
+ kmscube.c     | 4 ++++
+ 4 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a36087d..ab4adbf 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -43,7 +43,6 @@ kmscube_SOURCES = \
+ 	common.c \
+ 	common.h \
+ 	cube-smooth.c \
+-	cube-tex.c \
+ 	drm-atomic.c \
+ 	drm-common.c \
+ 	drm-common.h \
+@@ -59,3 +58,7 @@ kmscube_LDADD += $(GST_LIBS)
+ kmscube_CFLAGS += $(GST_CFLAGS)
+ kmscube_SOURCES += cube-video.c gst-decoder.c
+ endif
++
++if ENABLE_GBM_MAP
++kmscube_SOURCES += cube-tex.c
++endif
+diff --git a/configure.ac b/configure.ac
+index 8397f7b..c7f1f4d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,5 +65,8 @@ if test "x$enable_gbm_modifiers" = xyes; then
+ 	AC_DEFINE(HAVE_GBM_MODIFIERS, 1, [Define if you can use GBM properties.])
+ fi
+ 
++AC_CHECK_LIB([gbm], [gbm_bo_map], [HAVE_GBM_BO_MAP=yes], [])
++AM_CONDITIONAL(ENABLE_GBM_MAP, [test "x$HAVE_GBM_BO_MAP" = "xyes"])
++
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
+diff --git a/gst-decoder.c b/gst-decoder.c
+index 2d6d581..b84980e 100644
+--- a/gst-decoder.c
++++ b/gst-decoder.c
+@@ -332,6 +332,7 @@ set_last_frame(struct decoder *dec, EGLImage frame, GstSample *samp)
+ 	dec->last_samp = samp;
+ }
+ 
++#if HAVE_GBM_BO_MAP
+ // TODO this could probably be a helper re-used by cube-tex:
+ static int
+ buf_to_fd(const struct gbm *gbm, int size, void *ptr)
+@@ -357,6 +358,7 @@ buf_to_fd(const struct gbm *gbm, int size, void *ptr)
+ 
+ 	return fd;
+ }
++#endif
+ 
+ static EGLImage
+ buffer_to_image(struct decoder *dec, GstBuffer *buf)
+@@ -410,12 +412,15 @@ buffer_to_image(struct decoder *dec, GstBuffer *buf)
+ 
+ 	if (is_dmabuf_mem) {
+ 		dmabuf_fd = dup(gst_dmabuf_memory_get_fd(mem));
+-	} else {
++	}
++#if HAVE_GBM_BO_MAP
++	else {
+ 		GstMapInfo map_info;
+ 		gst_buffer_map(buf, &map_info, GST_MAP_READ);
+ 		dmabuf_fd = buf_to_fd(dec->gbm, map_info.size, map_info.data);
+ 		gst_buffer_unmap(buf, &map_info);
+ 	}
++#endif
+ 
+ 	if (dmabuf_fd < 0) {
+ 		GST_ERROR("could not obtain DMABUF FD");
+diff --git a/kmscube.c b/kmscube.c
+index 3a2c4dd..276dc55 100644
+--- a/kmscube.c
++++ b/kmscube.c
+@@ -142,7 +142,11 @@ int main(int argc, char *argv[])
+ 	else if (mode == VIDEO)
+ 		egl = init_cube_video(gbm, video);
+ 	else
++#if HAVE_GBM_BO_MAP
+ 		egl = init_cube_tex(gbm, mode);
++#else
++		printf("gbm_bo_map() support missing\n");
++#endif
+ 
+ 	if (!egl) {
+ 		printf("failed to initialize EGL\n");
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 4265f8a..5b64ed6 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -7,7 +7,8 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
 SRCREV = "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"
-SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git \
+    file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


