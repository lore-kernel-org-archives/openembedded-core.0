Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BC4EF71A68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 19:58:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a136so1183764pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dq1/4zY9jMT9SvzjIaYWPsFMp8EZ6LnpqO89hW7oOF8=;
	b=zR81EGWjS4/wt/xysWSIbyou+zVa7qdmQCB9DSdeen0k9C0jvZ7FWW/dClb0itPZ16
	XCZMf3mfc9QqjbIcXzPJDz9GgcXJxOpzu71iJCTIiolf+b+/N6tEmrjbctPdtzXNiFbY
	K0ogChyNQjCkz3EHLlo5rUKURr7VVcYAZS2162u3NeIl0BrSGllTGn2hLpHFJICUzgMk
	41gebAPaq1xvW7zCT+MLSXDTSq/iCOCGpYxY2VZkjr8/Rtw8fFFSeZ+kP+oO8yhaE9a1
	0e+MUokbyV4IlKyMAFU9Zhl6xvo4w9vx3Q6gr0GHaJIKMPqoQxB7rBHslTV/mfEbqMrF
	AfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dq1/4zY9jMT9SvzjIaYWPsFMp8EZ6LnpqO89hW7oOF8=;
	b=ITrDpbq7jZWuGqHV3m7tN0XCSBD+X0H6s3g9mbzdwESx48h9uclicmGAbZZoM2w8nv
	5+8b5sweNVxpBvmL7cTCD7iXfJn/MxzGN8M76XZ8IUMiIOrWESJutGWer6ExMUCPtokd
	AOUHXIOZ6ODLjRdMbnyTh0ydAiXieLjgxVmRpCnuUsYPtwy0W/ZYqFOj7cexIPz0Zeem
	Pto3iUFGwdVd8YeCcrNrihvMbs+qdMnZEChBfSi7U8rTDaAPE9d8ZRWIqJbeg1a+faDM
	J1O6BLcL9cLsnRQc+LL1IynfM+NjzKFzWA4+QeMWAALaooSK7dd09TRySj6MGVCdcjbi
	+6ag==
X-Gm-Message-State: ABUngvcHGd8pRuho/HdVEsIXopzAGE1L7fsLrUhMdY582d+ihcdctLOPp8A39Lcp+B5+VA==
X-Received: by 10.98.201.28 with SMTP id k28mr35932806pfg.25.1477771114076;
	Sat, 29 Oct 2016 12:58:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	p20sm9105671pfi.78.2016.10.29.12.58.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Oct 2016 12:58:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2016 12:58:20 -0700
Message-Id: <20161029195820.22088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] gstreamer-plugins: Move introspection to individual recipes
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
X-List-Received-Date: Sat, 29 Oct 2016 19:58:32 -0000

inc files are also used by plugins in other layers but they do
not use same srcrev for gst-common repo for various reasons e.g.

https://github.com/ndechesne/meta-qcom/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-v4l2.bb

Currently, this patch is forced on these external packages too
and fails to patch cleanly in some cases. Therefore its
better to move this SRC_URI_append to the individual .bb files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb  | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb    | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb   | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb   | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb   | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc           | 2 --
 9 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
index 108f4db..ae3f04d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
     file://0008-gl-implement-GstGLMemoryEGL.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
 SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 1370380..609ea0b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 PV = "1.8.2+git${SRCPV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
index 986b5ac..84cbc04 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
     file://make-gio_unix_2_0-dependency-configurable.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 SRC_URI[md5sum] = "4d03dd81828ea6b98a44c8f1ab7f4976"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 3c2b504..bdd4cb8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
     file://make-gio_unix_2_0-dependency-configurable.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 PV = "1.8.2+git${SRCPV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
index 5cc6578..840df15 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 SRC_URI[md5sum] = "473ebb1f15c67de99ddb6e4d027c0876"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 9b79af2..120629c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 PV = "1.8.2+git${SRCPV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
index 2745937..4a9a437 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 SRC_URI[md5sum] = "4fc66c77253b0ad5ce224bda654b2e7d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 22cca3a..61cdbe8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;branch=1.8;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 PV = "1.8.2+git${SRCPV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 9cfcec3..3f6d4c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -28,8 +28,6 @@ EXTRA_OECONF = " \
     --disable-examples \
 "
 
-SRC_URI_append = " file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
-
 delete_pkg_m4_file() {
 	# This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
 	rm "${S}/common/m4/pkg.m4" || true
-- 
2.10.1


