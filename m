Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDA77872A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:00:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:00:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; d="scan'208";a="165982273"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 Jan 2018 07:00:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 17:00:29 +0200
Message-Id: <20180111150029.7237-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] webkitgtk: update to 2.18.5 (includes Spectre mitigations; see commit description)
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
X-List-Received-Date: Thu, 11 Jan 2018 15:00:22 -0000

This is the only available stable version with mitigation fixes for Spectre.
Webkit upstream developers do not port CVE fixes to earlier stable series,
no exception was made in this case.

More information:

https://webkit.org/blog/8048/what-spectre-and-meltdown-mean-for-webkit/
https://webkitgtk.org/security/WSA-2018-0001.html
https://webkitgtk.org/2018/01/10/webkitgtk2.18.5-released.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch | 14 +++++++-------
 .../webkit/{webkitgtk_2.18.3.bb => webkitgtk_2.18.5.bb}    |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.18.3.bb => webkitgtk_2.18.5.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
index e1b69b2a214..83fd5129a01 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -1,7 +1,7 @@
-From 3cc0e5900515cbcedd0447e0bdf487cc8d9a0f8c Mon Sep 17 00:00:00 2001
+From 9b09974003097c9a408bbeea568996768efe705b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 11 Aug 2016 17:13:51 +0300
-Subject: [PATCH 5/9] Tweak gtkdoc settings so that gtkdoc generation works
+Subject: [PATCH 05/10] Tweak gtkdoc settings so that gtkdoc generation works
  under OpenEmbedded build system
 
 This requires setting a few environment variables so that the transient
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/Source/PlatformGTK.cmake b/Source/PlatformGTK.cmake
-index 50b5393f..7a31db51 100644
+index 50b5393..7a31db5 100644
 --- a/Source/PlatformGTK.cmake
 +++ b/Source/PlatformGTK.cmake
 @@ -24,7 +24,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
@@ -30,7 +30,7 @@ index 50b5393f..7a31db51 100644
          WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
          VERBATIM
 diff --git a/Tools/gtk/gtkdoc.py b/Tools/gtk/gtkdoc.py
-index 48f862a3..18240e42 100644
+index 03c8e8e..34fbaff 100644
 --- a/Tools/gtk/gtkdoc.py
 +++ b/Tools/gtk/gtkdoc.py
 @@ -318,9 +318,9 @@ class GTKDoc(object):
@@ -39,12 +39,12 @@ index 48f862a3..18240e42 100644
              current_ld_library_path = env.get('LD_LIBRARY_PATH')
 -            if current_ld_library_path:
 +            if current_ld_library_path and 'RUN' not in env:
-                 env['RUN'] = 'LD_LIBRARY_PATH="%s:%s" ' % (self.library_path, current_ld_library_path)
+                 env['LD_LIBRARY_PATH'] = '%s:%s' % (self.library_path, current_ld_library_path)
 -            else:
 +            elif 'RUN' not in env:
-                 env['RUN'] = 'LD_LIBRARY_PATH="%s" ' % self.library_path
+                 env['LD_LIBRARY_PATH'] = self.library_path
  
          if ldflags:
 -- 
-2.14.1
+2.15.1
 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.18.5.bb
index 4938f69b7b6..a64aee22e68 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[md5sum] = "264a22d7467deae606e42b6eb5dd65af"
-SRC_URI[sha256sum] = "e15420e1616a6f70f321541d467af5ca285bff66b1e0fa68a01df3ccf1b18f9e"
+SRC_URI[md5sum] = "af18c2cfa00cadfd0b4d8db21cab011d"
+SRC_URI[sha256sum] = "0c6d80cc7eb5d32f8063041fa11a1a6f17a29765c2f69c6bc862cd47c2d539b8"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.15.1


