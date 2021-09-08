Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.15608.1631124091372592344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=STZem3le;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id g74so2383094wmg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jp/MvOs/iyjaMQmDP+nXtAWHYdB5tcU9ZQwsU7kRyMQ=;
        b=STZem3lerzut5dypE183R2f+6E60RCoSMtP41AicKPGBfNstae/nlvi//6iRvqgHl6
         gXj5lM+WWMSNIn4TbmOUjmY+OBSN3CI5KMwGTaKUsmZSGqKlK7vT+vDQGxNA7MSFe8qF
         riJg6HCLkupXSm7W4jQ10G917UMT1jsPpQwEak/TJMQY1LzWoyQBXJ4BJuvpXflkMhFb
         /aWbeycQn8vHzdH0fZQxi6+FurjmvR8SFRDXbBmXTwBbBwW5mm6c3Zk2fezJQiEmiSQY
         gwb7pVyGmdNwuXPsiOh8eXiKwhbmY4111+YuS4zq/GN4tzA5nSsKKZlQHUBVwLGtqPnq
         ggJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jp/MvOs/iyjaMQmDP+nXtAWHYdB5tcU9ZQwsU7kRyMQ=;
        b=E0mT+nB9PXuXA87xwn64gm8nmLU55AmQZqZ+G+RLb2btt81icHwPWqQVq+PQZbJYeC
         D33N4fBLp4/N3BrKgS4EZD8xdJ24sn4sIG8KW8R4e+bI0NMzf3rTpRY4J6VtMLSpYgdn
         XXE6xrRdnB25JpAJBW+SSlwd49P+mERmcTC1AnQt9yUl3xTtpTdfnA2dKAmZDsTcswTP
         R7aYaQHG3Ne6/taswBp8MFxxy2NsAmn41iGx7DZWgqVJqJTSDk5ANPmvZRuxXY8/i0wu
         1tl5pV7roBAh21KQaD6eH8sgJ5kQ6qxznxL7hgcDAQ9mICTKp/ca93X7vxW6iRh7WVeL
         hKqA==
X-Gm-Message-State: AOAM533aK8nRcgn6Aay2chMbG9BrHcO/3KzfJj7tI9ROkXSYlecftSWz
	P4pUbj4VmB671oREUxSfaueC7T9wWYM=
X-Google-Smtp-Source: ABdhPJy5iJbxxXBxi5ky6KTWZF5SZwMtzvLXcP62+g/XLUCdi0l9HExlg0MWEj/Q7lgwtuoI2UKXIg==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr4913247wmc.3.1631124089836;
        Wed, 08 Sep 2021 11:01:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/26] meson: update 0.58.1 -> 0.59.1
Date: Wed,  8 Sep 2021 20:01:00 +0200
Message-Id: <20210908180125.103473-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0003-native_bindir.patch: it doesn't seem to actually define
anything where the use_native parameter is set to true.

Also, the issue should be solved without invasive, custom patching
of the code: via meson.cross, custom .pc files for the items in
question or some other configuration mechanism.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  4 +-
 .../0001-Make-CPU-family-warnings-fatal.patch | 20 ++--
 .../meson/meson/0003-native_bindir.patch      | 94 -------------------
 .../meson/meson/gi-target-dep.patch           | 41 --------
 .../{meson_0.58.1.bb => meson_0.59.1.bb}      |  0
 ...on_0.58.1.bb => nativesdk-meson_0.59.1.bb} |  0
 6 files changed, 10 insertions(+), 149 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0003-native_bindir.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/gi-target-dep.patch
 rename meta/recipes-devtools/meson/{meson_0.58.1.bb => meson_0.59.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.58.1.bb => nativesdk-meson_0.59.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index f1746d2094..c83ea406f0 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -9,15 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
-           file://0003-native_bindir.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
-           file://gi-target-dep.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "3144a3da662fcf79f1e5602fa929f2821cba4eba28c2c923fe0a7d3e3db04d5d"
+SRC_URI[sha256sum] = "db586a451650d46bbe10984a87b79d9bcdc1caebf38d8e189f8848f8d502356d"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index bcccfabd17..c5be526b10 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,20 +1,21 @@
-From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 2001
+From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH 1/2] Make CPU family warnings fatal
+Subject: [PATCH] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 ---
  mesonbuild/envconfig.py   | 2 +-
  mesonbuild/environment.py | 4 +---
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index c6a4df3..4d58c91 100644
+index 307aac3..66fb7ec 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -266,7 +266,7 @@ class MachineInfo:
+@@ -267,7 +267,7 @@ class MachineInfo(HoldableObject):
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
@@ -24,20 +25,17 @@ index c6a4df3..4d58c91 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index fc9b703..eea8345 100644
+index 71286a5..179917e 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -352,9 +352,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
              trial = 'ppc64'
  
      if trial not in known_cpu_families:
--        mlog.warning('Unknown CPU family {!r}, please report this at '
+-        mlog.warning(f'Unknown CPU family {trial!r}, please report this at '
 -                     'https://github.com/mesonbuild/meson/issues/new with the '
--                     'output of `uname -a` and `cat /proc/cpuinfo`'.format(trial))
+-                     'output of `uname -a` and `cat /proc/cpuinfo`')
 +        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
  
      return trial
  
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
deleted file mode 100644
index 89257b9e05..0000000000
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 2001
-From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Date: Wed, 15 Nov 2017 15:05:01 +0100
-Subject: [PATCH] native_bindir
-
-Some libraries, like QT, have pre-processors that convert their input
-files into something that the cross-compiler can process. We find the
-path of those pre-processors via pkg-config-native instead of
-pkg-config.
-
-This path forces the use of pkg-config-native for host_bins arguments.
-
-There are some discussions upstream to merge this patch, but I presonaly believe
-that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-
----
- mesonbuild/dependencies/base.py | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 14380d4..d0c443f 100644
---- a/mesonbuild/dependencies/base.py
-+++ b/mesonbuild/dependencies/base.py
-@@ -179,7 +179,7 @@ class Dependency:
-     def get_exe_args(self, compiler):
-         return []
- 
--    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
-+    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
-         raise DependencyException(f'{self.name!r} is not a pkgconfig dependency')
- 
-     def get_configtool_variable(self, variable_name):
-@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
-             return True
-         return any(d.is_built() for d in self.ext_deps)
- 
--    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
-+    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
-         raise DependencyException('Method "get_pkgconfig_variable()" is '
-                                   'invalid for an internal dependency')
- 
-@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
-         return s.format(self.__class__.__name__, self.name, self.is_found,
-                         self.version_reqs)
- 
--    def _call_pkgbin_real(self, args, env):
--        cmd = self.pkgbin.get_command() + args
-+    def _call_pkgbin_real(self, args, env, use_native=False):
-+        if use_native:
-+            cmd = [self.pkgbin.get_command()[0] + "-native"] + args
-+        else:
-+            cmd = self.pkgbin.get_command() + args
-         p, out, err = Popen_safe(cmd, env=env)
-         rc, out, err = p.returncode, out.strip(), err.strip()
-         call = ' '.join(cmd)
-@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
-             if key.startswith('PKG_'):
-                 mlog.debug(f'env[{key}]: {value}')
- 
--    def _call_pkgbin(self, args, env=None):
-+    def _call_pkgbin(self, args, env=None, use_native=False):
-         # Always copy the environment since we're going to modify it
-         # with pkg-config variables
-         if env is None:
-@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
-         targs = tuple(args)
-         cache = PkgConfigDependency.pkgbin_cache
-         if (self.pkgbin, targs, fenv) not in cache:
--            cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env)
-+            cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env, use_native)
-         return cache[(self.pkgbin, targs, fenv)]
- 
-     def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
-@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
-                                       (self.name, out_raw))
-         self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
- 
--    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
-+    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
-         options = ['--variable=' + variable_name, self.name]
- 
-         if 'define_variable' in kwargs:
-@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
- 
-             options = ['--define-variable=' + '='.join(definition)] + options
- 
--        ret, out, err = self._call_pkgbin(options)
-+        ret, out, err = self._call_pkgbin(options, use_native=use_native)
-         variable = ''
-         if ret != 0:
-             if self.required:
diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
deleted file mode 100644
index 29e164ccc7..0000000000
--- a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-When building gobject-introspection we want the *native* binaries (as they need
-to be executed) but *host* gobject-introspection libraries, as otherwise the
-native pkg-config can be used and the build will try to link native and host
-binaries together.
-
-Upstream-Status: Backport [589236226856f591c9e8daf0cb7aa1aef8862388]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index f9660838e..2eefc3fc7 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):
-                      mlog.bold('https://github.com/mesonbuild/meson/issues/1387'),
-                      once=True)
- 
--    def _get_native_dep(self, state, depname, required=True):
--        kwargs = {'native': True, 'required': required}
-+    def _get_dep(self, state, depname, native=False, required=True):
-+        kwargs = {'native': native, 'required': required}
-         holder = self.interpreter.func_dependency(state.current_node, [depname], kwargs)
-         return holder.held_object
- 
-@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):
-             return ExternalProgram.from_entry(name, prog)
- 
-         # Check if pkgconfig has a variable
--        dep = self._get_native_dep(state, depname, required=False)
-+        dep = self._get_dep(state, depname, native=True, required=False)
-         if dep.found() and dep.type_name == 'pkgconfig':
-             value = dep.get_pkgconfig_variable(varname, {})
-             if value:
-@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):
- 
-     def _get_gir_dep(self, state):
-         if not self.gir_dep:
--            self.gir_dep = self._get_native_dep(state, 'gobject-introspection-1.0')
-+            self.gir_dep = self._get_dep(state, 'gobject-introspection-1.0')
-             self.giscanner = self._get_native_binary(state, 'g-ir-scanner', 'gobject-introspection-1.0', 'g_ir_scanner')
-             self.gicompiler = self._get_native_binary(state, 'g-ir-compiler', 'gobject-introspection-1.0', 'g_ir_compiler')
-         return self.gir_dep, self.giscanner, self.gicompiler
diff --git a/meta/recipes-devtools/meson/meson_0.58.1.bb b/meta/recipes-devtools/meson/meson_0.59.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.58.1.bb
rename to meta/recipes-devtools/meson/meson_0.59.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
-- 
2.31.1

