Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 12C0B60069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:26:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jan 2018 08:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,412,1511856000"; d="scan'208";a="198779095"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 25 Jan 2018 08:26:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 18:20:11 +0200
Message-Id: <20180125162011.6673-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] gstreamer1.0: add a patch to further fix up the documentation generation
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
X-List-Received-Date: Thu, 25 Jan 2018 16:26:12 -0000

Gstreamer would attempt to launch gst-plugin-scanner binary installed on the host
if the target binary was failing (and it does, intentionally, fail in our case). Most
of the time the host binary is absent, and so this has no effect, but sometimes
it's present, and so the whole thing (running under qemu) fails.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...inloader.c-when-env-var-is-set-do-not-fal.patch | 35 ++++++++++++++++++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia/gstreamer/files/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
new file mode 100644
index 00000000000..67a872cddb9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
@@ -0,0 +1,35 @@
+From a1d7c582392c8bc87fa9411af77b20e011944357 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 25 Jan 2018 17:55:02 +0200
+Subject: [PATCH] gst/gstpluginloader.c: when env var is set do not fall
+ through to system plugin scanner
+
+If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to use that and only that.
+
+Falling through to the one installed on the system is problamatic in cross-compilation
+environemnts, regardless of whether one pointed to by the env var succeeded or failed.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst/gstpluginloader.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
+index 430829d..3a75731 100644
+--- a/gst/gstpluginloader.c
++++ b/gst/gstpluginloader.c
+@@ -471,9 +471,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
+     helper_bin = g_strdup (env);
+     res = gst_plugin_loader_try_helper (loader, helper_bin);
+     g_free (helper_bin);
+-  }
+-
+-  if (!res) {
++  } else {
+     GST_LOG ("Trying installed plugin scanner");
+ 
+ #ifdef G_OS_WIN32
+-- 
+2.15.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index f523ef59f93..c2df1f32583 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -17,6 +17,7 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 SRC_URI_append = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://gtk-doc-tweaks.patch \
+    file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
 "
 
 PACKAGECONFIG ??= ""
-- 
2.15.1


