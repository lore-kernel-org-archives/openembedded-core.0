Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3843774CFF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254289"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:42 +0300
Message-Id: <20180504123244.43049-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/14] meson: update to 0.46.0
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
X-List-Received-Date: Fri, 04 May 2018 12:38:51 -0000

Rebase a couple of patches

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...rospection-determine-g-ir-scanner-and-g-i.patch | 17 +++----
 .../meson/meson/0003-native_bindir.patch           | 57 ++++++++++++----------
 .../meson/{meson_0.45.1.bb => meson_0.46.0.bb}     |  4 +-
 3 files changed, 41 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.45.1.bb => meson_0.46.0.bb} (83%)

diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
index ded42d14f7f..f32267d0c41 100644
--- a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
+++ b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
@@ -1,7 +1,7 @@
-From 972667e0d789a6969a5d79249404f3539f891810 Mon Sep 17 00:00:00 2001
+From 0b860cb8a22ae876b6088939dbabca216bc29431 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:18:47 +0300
-Subject: [PATCH 1/2] gobject-introspection: determine g-ir-scanner and
+Subject: [PATCH] gobject-introspection: determine g-ir-scanner and
  g-ir-compiler paths from pkgconfig
 
 Do not hardcode the name of those binaries; gobject-introspection
@@ -16,19 +16,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 4f7fe30..9610cf6 100644
+index b29bab9..dc4c401 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -390,8 +390,6 @@ class GnomeModule(ExtensionModule):
+@@ -393,8 +393,6 @@ class GnomeModule(ExtensionModule):
              raise MesonException('Gir takes one argument')
          if kwargs.get('install_dir'):
              raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
--        giscanner = find_program('g-ir-scanner', 'Gir')
--        gicompiler = find_program('g-ir-compiler', 'Gir')
+-        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
+-        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
          girtarget = args[0]
          while hasattr(girtarget, 'held_object'):
              girtarget = girtarget.held_object
-@@ -402,6 +400,8 @@ class GnomeModule(ExtensionModule):
+@@ -405,6 +403,8 @@ class GnomeModule(ExtensionModule):
                  self.gir_dep = PkgConfigDependency('gobject-introspection-1.0',
                                                     state.environment,
                                                     {'native': True})
@@ -37,6 +37,3 @@ index 4f7fe30..9610cf6 100644
              pkgargs = self.gir_dep.get_compile_args()
          except Exception:
              raise MesonException('gobject-introspection dependency was not found, gir cannot be generated.')
--- 
-2.15.0
-
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index af5e6a190bf..f00327714b6 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,7 +1,7 @@
-From ffa72eac56558aa4171dd70ac1e9c27a07338fa2 Mon Sep 17 00:00:00 2001
+From 0eec9428376450917098c68539a6c9dd60b85d93 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
-Subject: [PATCH 4/4] native_bindir
+Subject: [PATCH] native_bindir
 
 Some libraries, like QT, have pre-processors that convert their input
 files into something that the cross-compiler can process. We find the
@@ -17,15 +17,15 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 
 ---
- mesonbuild/dependencies/base.py | 16 ++++++++++------
+ mesonbuild/dependencies/base.py | 19 +++++++++++--------
  mesonbuild/dependencies/ui.py   |  6 +++---
- 2 files changed, 13 insertions(+), 9 deletions(-)
+ 2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index bf79bc5..c9fd08c 100644
+index 0114a14..f4f19c5 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -131,7 +131,7 @@ class Dependency:
+@@ -141,7 +141,7 @@ class Dependency:
      def need_threads(self):
          return False
  
@@ -34,7 +34,7 @@ index bf79bc5..c9fd08c 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -150,7 +150,7 @@ class InternalDependency(Dependency):
+@@ -178,7 +178,7 @@ class InternalDependency(Dependency):
          self.sources = sources
          self.ext_deps = ext_deps
  
@@ -43,24 +43,34 @@ index bf79bc5..c9fd08c 100644
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -425,10 +425,14 @@ class PkgConfigDependency(ExternalDependency):
+@@ -517,11 +517,14 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
--    def _call_pkgbin(self, args, env=None):
-+    def _call_pkgbin(self, args, env=None, use_native=False):
-         if not env:
-             env = os.environ
--        p, out = Popen_safe([self.pkgbin] + args, env=env)[0:2]
+-    def _call_pkgbin_real(self, args, env):
+-        p, out = Popen_safe(self.pkgbin.get_command() + args, env=env)[0:2]
++    def _call_pkgbin_real(self, args, env, use_native=False):
 +        if use_native:
-+            pkgbin = [self.pkgbin + "-native"]
++            p, out = Popen_safe(self.pkgbin.get_command() + "-native" + args, env=env)[0:2]
 +        else:
-+            pkgbin = [self.pkgbin]
-+        p, out = Popen_safe(pkgbin + args, env=env)[0:2]
++            p, out = Popen_safe(self.pkgbin.get_command() + args, env=env)[0:2]
          return p.returncode, out.strip()
  
+-    def _call_pkgbin(self, args, env=None):
++    def _call_pkgbin(self, args, env=None, use_native=False):
+         if env is None:
+             fenv = env
+             env = os.environ
+@@ -530,7 +533,7 @@ class PkgConfigDependency(ExternalDependency):
+         targs = tuple(args)
+         cache = PkgConfigDependency.pkgbin_cache
+         if (self.pkgbin, targs, fenv) not in cache:
+-            cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env)
++            cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env, use_native)
+         return cache[(self.pkgbin, targs, fenv)]
+ 
      def _convert_mingw_paths(self, args):
-@@ -522,7 +526,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -630,7 +633,7 @@ class PkgConfigDependency(ExternalDependency):
              # linkers such as MSVC, so prepend them.
              self.link_args = ['-L' + lp for lp in libpaths] + self.link_args
  
@@ -69,7 +79,7 @@ index bf79bc5..c9fd08c 100644
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -535,7 +539,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -643,7 +646,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -79,10 +89,10 @@ index bf79bc5..c9fd08c 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 1db518c..4ed1d04 100644
+index 2f31196..916f648 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
-@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
+@@ -240,7 +240,7 @@ class QtBaseDependency(ExternalDependency):
          self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
@@ -91,7 +101,7 @@ index 1db518c..4ed1d04 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -374,7 +374,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -100,7 +110,7 @@ index 1db518c..4ed1d04 100644
              except MesonException:
                  pass
  
-@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
+@@ -384,7 +384,7 @@ class Qt5Dependency(QtBaseDependency):
          QtBaseDependency.__init__(self, 'qt5', env, kwargs)
  
      def get_pkgconfig_host_bins(self, core):
@@ -109,6 +119,3 @@ index 1db518c..4ed1d04 100644
  
  
  # There are three different ways of depending on SDL2:
--- 
-2.15.1
-
diff --git a/meta/recipes-devtools/meson/meson_0.45.1.bb b/meta/recipes-devtools/meson/meson_0.46.0.bb
similarity index 83%
rename from meta/recipes-devtools/meson/meson_0.45.1.bb
rename to meta/recipes-devtools/meson/meson_0.46.0.bb
index 9decdd0c24c..7334045e05f 100644
--- a/meta/recipes-devtools/meson/meson_0.45.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.46.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
            "
-SRC_URI[md5sum] = "4d9c7b3a7365b7b472f00af14e034949"
-SRC_URI[sha256sum] = "4d0bb0dbb1bb556cb7a4092fdfea3d6e76606bd739a4bc97481c2d7bc6200afb"
+SRC_URI[md5sum] = "e3301606017e364a0d7e1c3b755e7a28"
+SRC_URI[sha256sum] = "b7df91b01a358a8facdbfa33596a47cda38a760435ab55e1985c0bff06a9cbf0"
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
-- 
2.16.1


