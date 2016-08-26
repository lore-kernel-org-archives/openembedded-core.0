Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1FCE734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525559"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:24 +0300
Message-Id: <decef7d1166452d8095ce5e5dd6c0e3d1c6886f7.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/28] webkitgtk: enable gtk-doc support
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-settings-so-that-gtkdoc-generation-work.patch | 49 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb       |  5 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch

diff --git a/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
new file mode 100644
index 0000000..586dd23
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -0,0 +1,49 @@
+From 4eeeaec775e190cf3f5885d7c6717acebd0201a8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 11 Aug 2016 17:13:51 +0300
+Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
+ OpenEmbedded build system
+
+This requires setting a few environment variables so that the transient
+binary is build and linked correctly, and disabling the tweaks to RUN
+variable from gtkdoc.py script so that our qemu wrapper is taken into use.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/PlatformGTK.cmake | 2 +-
+ Tools/gtk/gtkdoc.py      | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Source/PlatformGTK.cmake b/Source/PlatformGTK.cmake
+index af4d2e3..b7b93c7 100644
+--- a/Source/PlatformGTK.cmake
++++ b/Source/PlatformGTK.cmake
+@@ -25,7 +25,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
+     add_custom_command(
+         OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
+         DEPENDS ${DocumentationDependencies}
+-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS} ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS} LD=${CMAKE_C_COMPILER} LDFLAGS=${CMAKE_C_LINK_FLAGS} RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper GIR_EXTRA_LIBS_PATH=${CMAKE_BINARY_DIR}/lib ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
+         COMMAND touch ${_stamp_name}
+         WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
+     )
+diff --git a/Tools/gtk/gtkdoc.py b/Tools/gtk/gtkdoc.py
+index 4c8237b..c0205f0 100644
+--- a/Tools/gtk/gtkdoc.py
++++ b/Tools/gtk/gtkdoc.py
+@@ -318,9 +318,9 @@ class GTKDoc(object):
+                     additional_ldflags = '%s %s' % (additional_ldflags, arg)
+             ldflags = ' "-L%s" %s ' % (self.library_path, additional_ldflags) + ldflags
+             current_ld_library_path = env.get('LD_LIBRARY_PATH')
+-            if current_ld_library_path:
++            if current_ld_library_path and 'RUN' not in env:
+                 env['RUN'] = 'LD_LIBRARY_PATH="%s:%s" ' % (self.library_path, current_ld_library_path)
+-            else:
++            elif 'RUN' not in env:
+                 env['RUN'] = 'LD_LIBRARY_PATH="%s" ' % self.library_path
+ 
+         if ldflags:
+-- 
+2.8.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index d9f1c30..263992b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -18,11 +18,12 @@ SRC_URI = "\
   file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
   file://musl-fixes.patch \
   file://ppc-musl-fix.patch \
+  file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
   "
 SRC_URI[md5sum] = "aebb4029c09dd81664aa830e4a584c85"
 SRC_URI[sha256sum] = "173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307"
 
-inherit cmake lib_package pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even
+inherit cmake lib_package pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
 # We cannot inherit pythonnative because that would conflict with inheriting python3native
 # (which is done by gobject-introspection). But webkit only needs the path to native Python 2.x binary
@@ -59,7 +60,7 @@ EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		-DENABLE_GTKDOC=OFF \
+		${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
 		"
 
-- 
2.9.3


