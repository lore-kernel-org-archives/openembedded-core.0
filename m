Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 470F16010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 16:44:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Mar 2016 09:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="673279573"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2016 09:44:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:40:08 +0200
Message-Id: <1458578409-24996-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] gstreamer1.0-plugins-bad: fix incorrect handling of Cflags in gstreamer-gl.pc file
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
X-List-Received-Date: Mon, 21 Mar 2016 16:44:24 -0000

Cflags had GL_CFLAGS appended, which contained full sysroot path to libdrm include;
generally such dependencies should be handled by pkgconfig's Requires facility.
It's unlikely that this .pc file is used by anything, but it was causing a QA error.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch | 27 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
new file mode 100644
index 0000000..e81b065
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
@@ -0,0 +1,27 @@
+From a93ca63d01e7cd1e40b5be576992f77fac364bd5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 21 Mar 2016 18:21:17 +0200
+Subject: [PATCH] gstreamer-gl.pc.in: don't append GL_CFLAGS to CFLAGS
+
+Dependencies' include directories should not be added in this way;
+it causes problems when cross-compiling in sysroot environments.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ pkgconfig/gstreamer-gl.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
+index 5589e2a..b986450 100644
+--- a/pkgconfig/gstreamer-gl.pc.in
++++ b/pkgconfig/gstreamer-gl.pc.in
+@@ -10,4 +10,4 @@ Version: @VERSION@
+ Requires: gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
+ 
+ Libs: -L${libdir} -lgstgl-@GST_API_VERSION@ @GL_LIBS@
+-Cflags: -I${includedir} @GL_CFLAGS@
++Cflags: -I${includedir}
+-- 
+2.7.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 5be76db..ef6581b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
 "
 
 PV = "1.7.2+git${SRCPV}"
-- 
2.7.0


