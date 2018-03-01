Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D08B9788E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:07:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:07:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134172"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:07:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:50 +0200
Message-Id: <20180301140052.1388-13-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/15] meson: upgrade 0.44.0 -> 0.44.1
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
X-List-Received-Date: Thu, 01 Mar 2018 14:07:02 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../meson/meson/0003-native_bindir.patch           | 29 +++++++++++++---------
 .../meson/{meson_0.44.0.bb => meson_0.44.1.bb}     |  4 +--
 2 files changed, 19 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.44.0.bb => meson_0.44.1.bb} (83%)

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index 8911dd6b34e..af5e6a190bf 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,6 +1,7 @@
+From ffa72eac56558aa4171dd70ac1e9c27a07338fa2 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
-Subject: [PATCH] native_bindir
+Subject: [PATCH 4/4] native_bindir
 
 Some libraries, like QT, have pre-processors that convert their input
 files into something that the cross-compiler can process. We find the
@@ -14,16 +15,17 @@ that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+
 ---
- mesonbuild/dependencies/base.py | 14 +++++++++-----
+ mesonbuild/dependencies/base.py | 16 ++++++++++------
  mesonbuild/dependencies/ui.py   |  6 +++---
- 2 files changed, 12 insertions(+), 8 deletions(-)
+ 2 files changed, 13 insertions(+), 9 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 0ef33722f196..b3f7e7c06822 100644
+index bf79bc5..c9fd08c 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -130,7 +130,7 @@ class Dependency:
+@@ -131,7 +131,7 @@ class Dependency:
      def need_threads(self):
          return False
  
@@ -32,7 +34,7 @@ index 0ef33722f196..b3f7e7c06822 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -149,7 +149,7 @@ class InternalDependency(Dependency):
+@@ -150,7 +150,7 @@ class InternalDependency(Dependency):
          self.sources = sources
          self.ext_deps = ext_deps
  
@@ -41,7 +43,7 @@ index 0ef33722f196..b3f7e7c06822 100644
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -414,10 +414,14 @@ class PkgConfigDependency(ExternalDependency):
+@@ -425,10 +425,14 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -58,16 +60,16 @@ index 0ef33722f196..b3f7e7c06822 100644
          return p.returncode, out.strip()
  
      def _convert_mingw_paths(self, args):
-@@ -499,7 +503,7 @@ class PkgConfigDependency(ExternalDependency):
-                 self.is_libtool = True
-             self.link_args.append(lib)
+@@ -522,7 +526,7 @@ class PkgConfigDependency(ExternalDependency):
+             # linkers such as MSVC, so prepend them.
+             self.link_args = ['-L' + lp for lp in libpaths] + self.link_args
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -512,7 +516,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -535,7 +539,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -77,7 +79,7 @@ index 0ef33722f196..b3f7e7c06822 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 1db518c12477..4ed1d041f6f4 100644
+index 1db518c..4ed1d04 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
 @@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
@@ -107,3 +109,6 @@ index 1db518c12477..4ed1d041f6f4 100644
  
  
  # There are three different ways of depending on SDL2:
+-- 
+2.15.1
+
diff --git a/meta/recipes-devtools/meson/meson_0.44.0.bb b/meta/recipes-devtools/meson/meson_0.44.1.bb
similarity index 83%
rename from meta/recipes-devtools/meson/meson_0.44.0.bb
rename to meta/recipes-devtools/meson/meson_0.44.1.bb
index d9c691c7f8b..6a81dab2650 100644
--- a/meta/recipes-devtools/meson/meson_0.44.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.44.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
            "
-SRC_URI[md5sum] = "26a7ca93ec9cea5facb365664261f9c6"
-SRC_URI[sha256sum] = "50f9b12b77272ef6ab064d26b7e06667f07fa9f931e6a20942bba2216ba4281b"
+SRC_URI[md5sum] = "82b1198bf714b5a4da84bfe8376c79cc"
+SRC_URI[sha256sum] = "2ea1a721574adb23160b6481191bcc1173f374e02b0ff3bb0ae85d988d97e4fa"
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
-- 
2.15.1


