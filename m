Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19DEC784E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402238"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:42 +0200
Message-Id: <20171114145754.9643-15-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/27] gstreamer1.0-plugins: disable introspection on mips64
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:03 -0000

The failure is weird and difficult to diagnoze, so disable the
introspection for now:

qemu-mips64: error while loading shared libraries: .../recipe-sysroot/usr/lib/libgthread-2.0.so.0: ELF file data encoding not little-endian

Note that it shows up only for one specific library (gstaudio), and only
on mips64. Introspection data for other libraries is generated just fine.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc              | 4 ++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc     | 3 +++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 4c877982b74..26ae91c4847 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -15,3 +15,7 @@ PACKAGES  =+ "${PN}-examples"
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
+
+# Needs to be disable due to a dependency on gstreamer-plugins introspection files
+EXTRA_OECONF_append_mips64 = " --disable-introspection "
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 3f6d4c37038..c40d3989119 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -49,3 +49,6 @@ patch_gtk_doc_makefiles() {
 do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
+
+# qemu-mips64: error while loading shared libraries: .../recipe-sysroot/usr/lib/libgthread-2.0.so.0: ELF file data encoding not little-endian
+EXTRA_OECONF_append_mips64 = " --disable-introspection "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 7191f9892d7..68173ce7d94 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -36,3 +36,5 @@ patch_gtk_doc_makefiles() {
 
 do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
 
+# Needs to be disable due to a dependency on gstreamer-plugins introspection files
+EXTRA_OECONF_append_mips64 = " --disable-introspection "
-- 
2.15.0


