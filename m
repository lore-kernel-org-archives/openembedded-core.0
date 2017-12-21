Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 942D17886E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 13:10:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2017 05:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,435,1508828400"; d="scan'208";a="14537376"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2017 05:10:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Dec 2017 15:04:34 +0200
Message-Id: <20171221130434.24427-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 9/9] meson: Port pkgconfig-native patch to 0.44.0
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
X-List-Received-Date: Thu, 21 Dec 2017 13:10:16 -0000

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

The update to 0.44.0 did not add this patch required for qt builds.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../meson/meson/0003-native_bindir.patch           | 109 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.44.0.bb        |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0003-native_bindir.patch

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
new file mode 100644
index 00000000000..8911dd6b34e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -0,0 +1,109 @@
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Wed, 15 Nov 2017 15:05:01 +0100
+Subject: [PATCH] native_bindir
+
+Some libraries, like QT, have pre-processors that convert their input
+files into something that the cross-compiler can process. We find the
+path of those pre-processors via pkg-config-native instead of
+pkg-config.
+
+This path forces the use of pkg-config-native for host_bins arguments.
+
+There are some discussions upstream to merge this patch, but I presonaly believe
+that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ mesonbuild/dependencies/base.py | 14 +++++++++-----
+ mesonbuild/dependencies/ui.py   |  6 +++---
+ 2 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
+index 0ef33722f196..b3f7e7c06822 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -130,7 +130,7 @@ class Dependency:
+     def need_threads(self):
+         return False
+ 
+-    def get_pkgconfig_variable(self, variable_name, kwargs):
++    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+         raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
+ 
+     def get_configtool_variable(self, variable_name):
+@@ -149,7 +149,7 @@ class InternalDependency(Dependency):
+         self.sources = sources
+         self.ext_deps = ext_deps
+ 
+-    def get_pkgconfig_variable(self, variable_name, kwargs):
++    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+         raise DependencyException('Method "get_pkgconfig_variable()" is '
+                                   'invalid for an internal dependency')
+ 
+@@ -414,10 +414,14 @@ class PkgConfigDependency(ExternalDependency):
+         return s.format(self.__class__.__name__, self.name, self.is_found,
+                         self.version_reqs)
+ 
+-    def _call_pkgbin(self, args, env=None):
++    def _call_pkgbin(self, args, env=None, use_native=False):
+         if not env:
+             env = os.environ
+-        p, out = Popen_safe([self.pkgbin] + args, env=env)[0:2]
++        if use_native:
++            pkgbin = [self.pkgbin + "-native"]
++        else:
++            pkgbin = [self.pkgbin]
++        p, out = Popen_safe(pkgbin + args, env=env)[0:2]
+         return p.returncode, out.strip()
+ 
+     def _convert_mingw_paths(self, args):
+@@ -499,7 +503,7 @@ class PkgConfigDependency(ExternalDependency):
+                 self.is_libtool = True
+             self.link_args.append(lib)
+ 
+-    def get_pkgconfig_variable(self, variable_name, kwargs):
++    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+         options = ['--variable=' + variable_name, self.name]
+ 
+         if 'define_variable' in kwargs:
+@@ -512,7 +516,7 @@ class PkgConfigDependency(ExternalDependency):
+ 
+             options = ['--define-variable=' + '='.join(definition)] + options
+ 
+-        ret, out = self._call_pkgbin(options)
++        ret, out = self._call_pkgbin(options, use_native=use_native)
+         variable = ''
+         if ret != 0:
+             if self.required:
+diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
+index 1db518c12477..4ed1d041f6f4 100644
+--- a/mesonbuild/dependencies/ui.py
++++ b/mesonbuild/dependencies/ui.py
+@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
+         self.bindir = self.get_pkgconfig_host_bins(core)
+         if not self.bindir:
+             # If exec_prefix is not defined, the pkg-config file is broken
+-            prefix = core.get_pkgconfig_variable('exec_prefix', {})
++            prefix = core.get_pkgconfig_variable('exec_prefix', {}, use_native=True)
+             if prefix:
+                 self.bindir = os.path.join(prefix, 'bin')
+ 
+@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
+         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
+         for application in applications:
+             try:
+-                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}))
++                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}, use_native=True))
+             except MesonException:
+                 pass
+ 
+@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
+         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
+ 
+     def get_pkgconfig_host_bins(self, core):
+-        return core.get_pkgconfig_variable('host_bins', {})
++        return core.get_pkgconfig_variable('host_bins', {}, use_native=True)
+ 
+ 
+ # There are three different ways of depending on SDL2:
diff --git a/meta/recipes-devtools/meson/meson_0.44.0.bb b/meta/recipes-devtools/meson/meson_0.44.0.bb
index 9b4c7e6ab10..d9c691c7f8b 100644
--- a/meta/recipes-devtools/meson/meson_0.44.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.44.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
+           file://0003-native_bindir.patch \
            "
 SRC_URI[md5sum] = "26a7ca93ec9cea5facb365664261f9c6"
 SRC_URI[sha256sum] = "50f9b12b77272ef6ab064d26b7e06667f07fa9f931e6a20942bba2216ba4281b"
-- 
2.15.1


