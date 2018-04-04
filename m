Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0877474D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:19:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599798"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:19:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:05 +0300
Message-Id: <20180404111321.10824-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/22] gobject-introspection: update to 1.56.0
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
X-List-Received-Date: Wed, 04 Apr 2018 11:19:59 -0000

License-Update: bug tracker link changed

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-giscanner-add-a-lib-dirs-envvar-option.patch       | 13 +++++--------
 ...rospection_1.54.1.bb => gobject-introspection_1.56.0.bb} | 13 +++++++------
 2 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.54.1.bb => gobject-introspection_1.56.0.bb} (94%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
index 4ec527dcc0f..232480f3f56 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -1,4 +1,4 @@
-From e48f1e18f5ea41656f0ba10fe61d69d2604b0064 Mon Sep 17 00:00:00 2001
+From 06ebdaa5c8f9721acf93cc3e75a877a3c963867f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 3 Jan 2018 17:02:01 +0200
 Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index 29de0ee..928eae8 100644
+index a8bd5b1..6cf25d5 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
 @@ -109,7 +109,7 @@ class CCompiler(object):
@@ -32,7 +32,7 @@ index 29de0ee..928eae8 100644
          # is being built in the current directory.
  
 @@ -119,7 +119,7 @@ class CCompiler(object):
-         if self.check_is_msvc():
+         if os.name == 'nt':
              runtime_path_envvar = ['LIB', 'PATH']
          else:
 -            runtime_path_envvar = ['LD_LIBRARY_PATH']
@@ -41,7 +41,7 @@ index 29de0ee..928eae8 100644
              # (This flag is not supported nor needed for Visual C++)
              args.append('-L.')
 diff --git a/giscanner/dumper.py b/giscanner/dumper.py
-index 7f77bd2..db96df6 100644
+index 3c7220b..0abd565 100644
 --- a/giscanner/dumper.py
 +++ b/giscanner/dumper.py
 @@ -259,7 +259,8 @@ class DumpCompiler(object):
@@ -55,7 +55,7 @@ index 7f77bd2..db96df6 100644
  
          else:
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 38a45c1..b603850 100755
+index d262785..51c9570 100755
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
 @@ -130,6 +130,9 @@ def _get_option_parser():
@@ -68,6 +68,3 @@ index 38a45c1..b603850 100755
      parser.add_option("", "--program-arg",
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
--- 
-2.15.1
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.0.bb
similarity index 94%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.0.bb
index e3306672393..8f84f832b03 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.0.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2+ & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
-                    file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
-                    file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
-                    file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6317a809f70ed9848fa5673121908586 \
+                    file://tools/compiler.c;md5=fc5007fc20022720e6c0b0cdde41fabd;endline=20 \
+                    file://giscanner/sourcescanner.c;md5=194d6e0c1d00662f32d030ce44de8d39;endline=22 \
+                    file://girepository/giregisteredtypeinfo.c;md5=661847611ae6979465415f31a759ba27;endline=21 \
+                    "
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
@@ -16,8 +17,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            "
-SRC_URI[md5sum] = "126c29e4d54adbed2ed4e2b04483de41"
-SRC_URI[sha256sum] = "b88ded5e5f064ab58a93aadecd6d58db2ec9d970648534c63807d4f9a7bb877e"
+SRC_URI[md5sum] = "8064b5cd8fa02feeab850a0f6ef72b0f"
+SRC_URI[sha256sum] = "0d7059fad7aa5ec50d9678aea4ea139acab23737e9cf9ca0d86c615cecbaa0f8"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
-- 
2.16.1


