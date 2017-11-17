Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3C778860
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:02:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2017 04:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,409,1505804400"; 
   d="scan'208";a="3341769"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 17 Nov 2017 04:02:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 14:02:53 +0200
Message-Id: <ee8d4bcb2a170b396f6c4dff37ab01772665fd72.1510920094.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/9] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Fri, 17 Nov 2017 12:02:50 -0000

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

The update to 0.43.0 forgot to add this patch required for qt builds.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../meson/meson/0003-native_bindir.patch           | 95 ++++++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.43.0.bb        |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0003-native_bindir.patch

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
new file mode 100644
index 00000000000..1df1536a722
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -0,0 +1,95 @@
+From 01dd18c9c9c042268b87d576624c16fc74253cd9 Mon Sep 17 00:00:00 2001
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
+index 0d9742d426cb..0c8e79a8e9e3 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -114,7 +114,7 @@ class Dependency:
+     def need_threads(self):
+         return False
+ 
+-    def get_pkgconfig_variable(self, variable_name):
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
+         raise NotImplementedError('{!r} is not a pkgconfig dependency'.format(self.name))
+ 
+ 
+@@ -256,8 +256,12 @@ class PkgConfigDependency(ExternalDependency):
+         return s.format(self.__class__.__name__, self.name, self.is_found,
+                         self.version_reqs)
+ 
+-    def _call_pkgbin(self, args):
+-        p, out = Popen_safe([self.pkgbin] + args, env=os.environ)[0:2]
++    def _call_pkgbin(self, args, use_native=False):
++        if use_native:
++            pkgbin = [self.pkgbin + "-native"]
++        else:
++            pkgbin = [self.pkgbin]
++        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
+         return p.returncode, out.strip()
+ 
+     def _set_cargs(self):
+@@ -291,8 +295,8 @@ class PkgConfigDependency(ExternalDependency):
+                 self.is_libtool = True
+             self.link_args.append(lib)
+ 
+-    def get_pkgconfig_variable(self, variable_name):
+-        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name])
++    def get_pkgconfig_variable(self, variable_name, use_native=False):
++        ret, out = self._call_pkgbin(['--variable=' + variable_name, self.name], use_native=use_native)
+         variable = ''
+         if ret != 0:
+             if self.required:
+diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
+index 8f183e54d4d2..34ef33e79ad9 100644
+--- a/mesonbuild/dependencies/ui.py
++++ b/mesonbuild/dependencies/ui.py
+@@ -239,7 +239,7 @@ class QtBaseDependency(ExternalDependency):
+         self.bindir = self.get_pkgconfig_host_bins(core)
+         if not self.bindir:
+             # If exec_prefix is not defined, the pkg-config file is broken
+-            prefix = core.get_pkgconfig_variable('exec_prefix')
++            prefix = core.get_pkgconfig_variable('exec_prefix', use_native=True)
+             if prefix:
+                 self.bindir = os.path.join(prefix, 'bin')
+ 
+@@ -359,7 +359,7 @@ class Qt4Dependency(QtBaseDependency):
+         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
+         for application in applications:
+             try:
+-                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application))
++                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, use_native=True))
+             except MesonException:
+                 pass
+ 
+@@ -369,7 +369,7 @@ class Qt5Dependency(QtBaseDependency):
+         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
+ 
+     def get_pkgconfig_host_bins(self, core):
+-        return core.get_pkgconfig_variable('host_bins')
++        return core.get_pkgconfig_variable('host_bins', use_native=True)
+ 
+ 
+ # There are three different ways of depending on SDL2:
+-- 
+2.15.0
+
diff --git a/meta/recipes-devtools/meson/meson_0.43.0.bb b/meta/recipes-devtools/meson/meson_0.43.0.bb
index 59dfc0f3795..7b5c459157c 100644
--- a/meta/recipes-devtools/meson/meson_0.43.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.43.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
+           file://0003-native_bindir.patch \
            "
 SRC_URI[md5sum] = "b0d389cc5937928c2f5114656dc5a99a"
 SRC_URI[sha256sum] = "c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340"
-- 
2.15.0


