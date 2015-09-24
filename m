Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76D34734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 17:42:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2015 10:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="567818851"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2015 10:42:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 20:42:06 +0300
Message-Id: <1443116526-16989-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gstreamer1.0-plugins-bad: change glimagesink rank to marginal
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
X-List-Received-Date: Thu, 24 Sep 2015 17:42:06 -0000

[YOCTO #7787]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-glimagesink-Downrank-to-marginal.patch    | 32 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb    |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
new file mode 100644
index 0000000..f677603
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
@@ -0,0 +1,32 @@
+From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 24 Sep 2015 19:47:32 +0300
+Subject: [PATCH] glimagesink: Downrank to marginal
+
+On desktop, where there is good OpenGL, xvimagesink will come up first,
+on other platforms, OpenGL can't be trusted because it's either software (like
+in a VM) or broken (like on embedded)., so let ximagesink come above.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=751684]
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ext/gl/gstopengl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
+index a4b2540..0ccaacd 100644
+--- a/ext/gl/gstopengl.c
++++ b/ext/gl/gstopengl.c
+@@ -101,7 +101,7 @@ plugin_init (GstPlugin * plugin)
+ #endif
+ 
+   if (!gst_element_register (plugin, "glimagesink",
+-          GST_RANK_SECONDARY, GST_TYPE_GLIMAGE_SINK)) {
++          GST_RANK_MARGINAL, GST_TYPE_GLIMAGE_SINK)) {
+     return FALSE;
+   }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
index 59065de..6873669 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch"
+SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch \
+           file://0001-glimagesink-Downrank-to-marginal.patch \
+           "
 
 SRC_URI[md5sum] = "e0bb39412cf4a48fe0397bcf3a7cd451"
 SRC_URI[sha256sum] = "152fad7250683d72f9deb36c5685428338365fe4a4c87ffe15e38783b14f983c"
-- 
2.1.4


