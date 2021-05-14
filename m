Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.8916.1620999975365298326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lgv/kTso;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id f18so6855022qko.7
        for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GvBUzfUSXe3/drwqgzUGVFgtOYmkn6Cw4VUULszJRTk=;
        b=Lgv/kTsoyjnWzZEy5zwRZMcDbxf4klu54YxkUJUyiIjl+UdJ8L99LAemtZrC7RJuJz
         It5KDBZe+uokiZgyzBWoBJk+HN2weO4eAupBT4UevQjsLReuQErxgGb4ge6f2m4SrGYa
         8CasgumXHplNkgKgp0o7QBpqBQ/miBWxKZDbrsJn9GvqYlNHDASZsOIved0/ksXTnW6G
         89tDKOEHmvLgDRUCcy4cXjs/JTBN7D/RzIIiMzdz0n1RzcJSuafKk/QuWYQ1oLrrBH3h
         4xzsBtAtHkCU5SAidjZFYpB5L7WmpBj/EKlHESdeSWudbkD/jnk7oGiASO4uJCGYsefN
         qgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GvBUzfUSXe3/drwqgzUGVFgtOYmkn6Cw4VUULszJRTk=;
        b=LoBGHUDPU1kIuXHt36SUun2BS3zBSkVianGGqEGhMXRGcDitDMlFiv8GRHq925oGqr
         mhlKkjEaAE3eMoMQpF90UrMHGqSenQVcRxeqlTXWMcbumFnYXeBDJFECBBf1KkXdlWbi
         znI1xFJ+PiaZPyBkPAQh/ByO3kT+HoFAjlvamCiIkbgXo/A6gqCDjv9jts2M8Tjcq47B
         nwxq9aPQpUR6iju2rpzTWlT5fr4bYXy2oyHtELfoMRu1vikQIfS0u2HROhbDFzk/f6Ip
         hhaKCKiFh7YSLEC23O3b26CjsQUMcibb4Szod4Er8YsN4ODa020r7fGX/jNUsfOrG9Yr
         EecQ==
X-Gm-Message-State: AOAM532G1201vpx505Bjs4DPnBWtnd07GgINwWN4GR8icVTrp+jB3zNo
	Nn5Lfql4T8VrCFI8XD88YI6ExBzaoR3xBTEn/I0=
X-Google-Smtp-Source: ABdhPJz3NIJVHwK/b05/OKZR22PVaffey6g7L424+gWe4HwJVNv8LwyeYmMxmT8Ewma3faYW7gV6Sj5tRZUtIjfHVBo=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr43811161qky.125.1620999974309;
 Fri, 14 May 2021 06:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210513205622.60879-1-alex.kanavin@gmail.com> <20210513205622.60879-4-alex.kanavin@gmail.com>
In-Reply-To: <20210513205622.60879-4-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 14 May 2021 06:45:48 -0700
Message-ID: <CAMKF1spKq8-K7DW42rc0X0hAvYv=1nz9mwcX1NsS5j+6wyeP3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] meson: update 0.57.2 -> 0.58.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

breaks nautilus   https://errors.yoctoproject.org/Errors/Details/581184/

On Thu, May 13, 2021 at 1:56 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Rebase patches; dropped chunks (and cross-prop-default.patch)
> have been removed upstream.
>
> Move native-only patches to all-patches, as they're a pain to rebase
> separately.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  11 +-
>  .../0001-Make-CPU-family-warnings-fatal.patch |  18 +-
>  ...sues-that-arise-when-cross-compiling.patch |   8 +-
>  ...-not-manipulate-the-environment-when.patch |  14 +-
>  ...pport-building-allarch-recipes-again.patch |  10 +-
>  .../meson/meson/0003-native_bindir.patch      |  58 +--
>  ...2c19e693a69b0650ce6c8a8903163c959996.patch | 412 ++++++++++++++++++
>  .../meson/meson/cross-prop-default.patch      |  23 -
>  .../{meson_0.57.2.bb => meson_0.58.0.bb}      |   0
>  ...on_0.57.2.bb => nativesdk-meson_0.58.0.bb} |   0
>  10 files changed, 456 insertions(+), 98 deletions(-)
>  create mode 100644 meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
>  delete mode 100644 meta/recipes-devtools/meson/meson/cross-prop-default.patch
>  rename meta/recipes-devtools/meson/{meson_0.57.2.bb => meson_0.58.0.bb} (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.57.2.bb => nativesdk-meson_0.58.0.bb} (100%)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> index 10e7d8a1ce..f60381453b 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -12,16 +12,13 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0003-native_bindir.patch \
>             file://0001-python-module-do-not-manipulate-the-environment-when.patch \
>             file://disable-rpath-handling.patch \
> -           file://cross-prop-default.patch \
>             file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
>             file://gi-target-dep.patch \
> +           file://0001-Make-CPU-family-warnings-fatal.patch \
> +           file://0002-Support-building-allarch-recipes-again.patch \
> +           file://4e312c19e693a69b0650ce6c8a8903163c959996.patch \
>             "
> -SRC_URI[sha256sum] = "3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
> -
> -SRC_URI_append_class-native = " \
> -    file://0001-Make-CPU-family-warnings-fatal.patch \
> -    file://0002-Support-building-allarch-recipes-again.patch \
> -"
> +SRC_URI[sha256sum] = "f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd"
>
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> index 300797f9ee..bcccfabd17 100644
> --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
> @@ -1,34 +1,33 @@
> -From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00 2001
> +From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 3 Jul 2018 13:59:09 +0100
> -Subject: [PATCH] Make CPU family warnings fatal
> +Subject: [PATCH 1/2] Make CPU family warnings fatal
>
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
>  ---
>   mesonbuild/envconfig.py   | 2 +-
>   mesonbuild/environment.py | 4 +---
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index ba35d16..2d3c34c 100644
> +index c6a4df3..4d58c91 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
> -@@ -262,7 +262,7 @@ class MachineInfo:
> +@@ -266,7 +266,7 @@ class MachineInfo:
>
>           cpu_family = literal['cpu_family']
>           if cpu_family not in known_cpu_families:
> --            mlog.warning('Unknown CPU family {}, please report this at https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
> +-            mlog.warning(f'Unknown CPU family {cpu_family}, please report this at https://github.com/mesonbuild/meson/issues/new')
>  +            raise EnvironmentException('Unknown CPU family {}, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.'.format(cpu_family))
>
>           endian = literal['endian']
>           if endian not in ('little', 'big'):
>  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> -index 756dd81..4d2c2b6 100644
> +index fc9b703..eea8345 100644
>  --- a/mesonbuild/environment.py
>  +++ b/mesonbuild/environment.py
> -@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
> +@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
>               trial = 'ppc64'
>
>       if trial not in known_cpu_families:
> @@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644
>
>       return trial
>
> +--
> +2.24.0
> +
> diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> index 471f1500da..ce90e515da 100644
> --- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> @@ -1,4 +1,4 @@
> -From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001
> +From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 4 Aug 2017 16:16:41 +0300
>  Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
> @@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index bcf77b9..6a4b472 100644
> +index dc2979e..c9ff9bd 100644
>  --- a/mesonbuild/modules/gnome.py
>  +++ b/mesonbuild/modules/gnome.py
> -@@ -974,6 +974,10 @@ This will become a hard error in the future.''')
> -             args.append('--{}={}'.format(program_name, path))
> +@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
> +             args.append(f'--{program_name}={path}')
>           if namespace:
>               args.append('--namespace=' + namespace)
>  +        gtkdoc_exe_wrapper = state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> index eb0e90dbdd..fdadc6869b 100644
> --- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> @@ -1,4 +1,4 @@
> -From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001
> +From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 19 Nov 2018 14:24:26 +0100
>  Subject: [PATCH] python module: do not manipulate the environment when calling
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 12 deletions(-)
>
>  diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> -index 07be318..b770603 100644
> +index 422155b..aaf5844 100644
>  --- a/mesonbuild/modules/python.py
>  +++ b/mesonbuild/modules/python.py
> -@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
> +@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
>                   old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
>                   old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
>
> @@ -26,9 +26,9 @@ index 07be318..b770603 100644
>  -
>                   try:
>                       self.pkgdep = PkgConfigDependency(pkg_name, environment, kwargs)
> -                     mlog.debug('Found "{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_name, pkg_libdir))
> -@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
> -                     mlog.debug('"{}" could not be found in LIBPC ({})'.format(pkg_name, pkg_libdir))
> +                     mlog.debug(f'Found "{pkg_name}" via pkgconfig lookup in LIBPC ({pkg_libdir})')
> +@@ -83,13 +78,6 @@ class PythonDependency(ExternalDependency):
> +                     mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir})')
>                       mlog.debug(e)
>
>  -                if old_pkg_path is not None:
> @@ -39,5 +39,5 @@ index 07be318..b770603 100644
>  -                else:
>  -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
>               else:
> -                 mlog.debug('"{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_name, pkg_libdir))
> +                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir}), this is likely due to a relocated python installation')
>
> diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> index f6175a194c..dcc1ce9c27 100644
> --- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> +++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
> @@ -1,19 +1,18 @@
> -From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00 2001
> +From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Thu, 26 Jul 2018 16:32:49 +0200
> -Subject: [PATCH] Support building allarch recipes again
> +Subject: [PATCH 2/2] Support building allarch recipes again
>
>  This registers "allarch" as a known CPU family.
>
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> -
>  ---
>   mesonbuild/envconfig.py | 1 +
>   1 file changed, 1 insertion(+)
>
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index 2d3c34c..b9e7908 100644
> +index 4d58c91..ff01ad1 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
>  @@ -36,6 +36,7 @@ from pathlib import Path
> @@ -24,3 +23,6 @@ index 2d3c34c..b9e7908 100644
>       'aarch64',
>       'alpha',
>       'arc',
> +--
> +2.24.0
> +
> diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> index ed85116c4f..89257b9e05 100644
> --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> +++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> @@ -1,4 +1,4 @@
> -From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00 2001
> +From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 2001
>  From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>  Date: Wed, 15 Nov 2017 15:05:01 +0100
>  Subject: [PATCH] native_bindir
> @@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
>  ---
>   mesonbuild/dependencies/base.py | 19 +++++++++++--------
> - mesonbuild/dependencies/ui.py   |  6 +++---
> - 2 files changed, 14 insertions(+), 11 deletions(-)
> + 1 file changed, 11 insertions(+), 8 deletions(-)
>
>  diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
> -index cd77b4b..7e3f338 100644
> +index 14380d4..d0c443f 100644
>  --- a/mesonbuild/dependencies/base.py
>  +++ b/mesonbuild/dependencies/base.py
> -@@ -192,7 +192,7 @@ class Dependency:
> +@@ -179,7 +179,7 @@ class Dependency:
>       def get_exe_args(self, compiler):
>           return []
>
>  -    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
>  +    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
> -         raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
> +         raise DependencyException(f'{self.name!r} is not a pkgconfig dependency')
>
>       def get_configtool_variable(self, variable_name):
> -@@ -280,7 +280,7 @@ class InternalDependency(Dependency):
> +@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
>               return True
>           return any(d.is_built() for d in self.ext_deps)
>
> @@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644
>           raise DependencyException('Method "get_pkgconfig_variable()" is '
>                                     'invalid for an internal dependency')
>
> -@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
>           return s.format(self.__class__.__name__, self.name, self.is_found,
>                           self.version_reqs)
>
> @@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644
>           p, out, err = Popen_safe(cmd, env=env)
>           rc, out, err = p.returncode, out.strip(), err.strip()
>           call = ' '.join(cmd)
> -@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):
> -             env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
> -             mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
> +@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
> +             if key.startswith('PKG_'):
> +                 mlog.debug(f'env[{key}]: {value}')
>
>  -    def _call_pkgbin(self, args, env=None):
>  +    def _call_pkgbin(self, args, env=None, use_native=False):
>           # Always copy the environment since we're going to modify it
>           # with pkg-config variables
>           if env is None:
> -@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
>           targs = tuple(args)
>           cache = PkgConfigDependency.pkgbin_cache
>           if (self.pkgbin, targs, fenv) not in cache:
> @@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644
>           return cache[(self.pkgbin, targs, fenv)]
>
>       def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
> -@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
>                                         (self.name, out_raw))
>           self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
>
> @@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644
>           options = ['--variable=' + variable_name, self.name]
>
>           if 'define_variable' in kwargs:
> -@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):
> +@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
>
>               options = ['--define-variable=' + '='.join(definition)] + options
>
> @@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644
>           variable = ''
>           if ret != 0:
>               if self.required:
> -diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
> -index d897d76..a598d2e 100644
> ---- a/mesonbuild/dependencies/ui.py
> -+++ b/mesonbuild/dependencies/ui.py
> -@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
> -         self.bindir = self.get_pkgconfig_host_bins(core)
> -         if not self.bindir:
> -             # If exec_prefix is not defined, the pkg-config file is broken
> --            prefix = core.get_pkgconfig_variable('exec_prefix', {})
> -+            prefix = core.get_pkgconfig_variable('exec_prefix', {}, use_native=True)
> -             if prefix:
> -                 self.bindir = os.path.join(prefix, 'bin')
> -
> -@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):
> -         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
> -         for application in applications:
> -             try:
> --                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}))
> -+                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}, use_native=True))
> -             except MesonException:
> -                 pass
> -
> -@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):
> -         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
> -
> -     def get_pkgconfig_host_bins(self, core):
> --        return core.get_pkgconfig_variable('host_bins', {})
> -+        return core.get_pkgconfig_variable('host_bins', {}, use_native=True)
> -
> -     def get_private_includes(self, mod_inc_dir, module):
> -         return _qt_get_private_includes(mod_inc_dir, module, self.version)
> diff --git a/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch b/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
> new file mode 100644
> index 0000000000..76daf019b0
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
> @@ -0,0 +1,412 @@
> +From 4e312c19e693a69b0650ce6c8a8903163c959996 Mon Sep 17 00:00:00 2001
> +From: Xavier Claessens <xavier.claessens@collabora.com>
> +Date: Tue, 11 May 2021 09:18:47 -0400
> +Subject: [PATCH] gnome: Fix gtkdoc generation
> +
> +install_scripts used to replace @BUILD_ROOT@ and @SOURCE_ROOT@ but it
> +was not documented and got removed in Meson 0.58.0. gnome.gtkdoc() was
> +relying on that behaviour, but it has always been broken in the case the
> +source or build directory contains spaces.
> +
> +Fix this by changing get_include_args() to substitue paths directly
> +which will then get escaped correctly.
> +
> +Add a unit test that builds GObject documentation which is where this
> +issue has been spotted.
> +
> +Fixes: #8744
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + mesonbuild/modules/__init__.py                | 54 +++++++++----------
> + mesonbuild/modules/gnome.py                   | 15 +++---
> + mesonbuild/modules/hotdoc.py                  |  3 +-
> + mesonbuild/modules/qt.py                      |  4 +-
> + mesonbuild/modules/windows.py                 |  5 +-
> + .../10 gtk-doc/doc/foobar1/foobar-docs.sgml   |  2 +-
> + .../doc/foobar1/foobar-sections.txt           | 16 ++++++
> + .../10 gtk-doc/doc/foobar1/foobar.types       |  4 ++
> + .../10 gtk-doc/doc/foobar1/meson.build        |  6 ++-
> + test cases/frameworks/10 gtk-doc/foo.c        | 30 +++++++++++
> + .../frameworks/10 gtk-doc/include/foo.h       | 18 +++++++
> + test cases/frameworks/10 gtk-doc/meson.build  | 12 +++++
> + test cases/frameworks/10 gtk-doc/test.json    |  4 +-
> + 13 files changed, 127 insertions(+), 46 deletions(-)
> + create mode 100644 test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt
> + create mode 100644 test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
> + create mode 100644 test cases/frameworks/10 gtk-doc/foo.c
> +
> +diff --git a/mesonbuild/modules/__init__.py b/mesonbuild/modules/__init__.py
> +index ddb5e3e6cf3..c0970294c34 100644
> +--- a/mesonbuild/modules/__init__.py
> ++++ b/mesonbuild/modules/__init__.py
> +@@ -56,6 +56,33 @@ def __init__(self, interpreter: 'Interpreter') -> None:
> +         self.target_machine = interpreter.builtin['target_machine'].held_object
> +         self.current_node = interpreter.current_node
> +
> ++    def get_include_args(self, include_dirs, prefix='-I'):
> ++        if not include_dirs:
> ++            return []
> ++
> ++        srcdir = self.environment.get_source_dir()
> ++        builddir = self.environment.get_build_dir()
> ++
> ++        dirs_str = []
> ++        for dirs in unholder(include_dirs):
> ++            if isinstance(dirs, str):
> ++                dirs_str += [f'{prefix}{dirs}']
> ++                continue
> ++
> ++            # Should be build.IncludeDirs object.
> ++            basedir = dirs.get_curdir()
> ++            for d in dirs.get_incdirs():
> ++                expdir = os.path.join(basedir, d)
> ++                srctreedir = os.path.join(srcdir, expdir)
> ++                buildtreedir = os.path.join(builddir, expdir)
> ++                dirs_str += [f'{prefix}{buildtreedir}',
> ++                             f'{prefix}{srctreedir}']
> ++            for d in dirs.get_extra_build_dirs():
> ++                dirs_str += [f'{prefix}{d}']
> ++
> ++        return dirs_str
> ++
> ++
> + class ModuleObject:
> +     """Base class for all objects returned by modules
> +     """
> +@@ -71,33 +98,6 @@ def __init__(self, interpreter: T.Optional['Interpreter'] = None) -> None:
> + class ExtensionModule(ModuleObject):
> +     pass
> +
> +-def get_include_args(include_dirs, prefix='-I'):
> +-    '''
> +-    Expand include arguments to refer to the source and build dirs
> +-    by using @SOURCE_ROOT@ and @BUILD_ROOT@ for later substitution
> +-    '''
> +-    if not include_dirs:
> +-        return []
> +-
> +-    dirs_str = []
> +-    for dirs in unholder(include_dirs):
> +-        if isinstance(dirs, str):
> +-            dirs_str += [f'{prefix}{dirs}']
> +-            continue
> +-
> +-        # Should be build.IncludeDirs object.
> +-        basedir = dirs.get_curdir()
> +-        for d in dirs.get_incdirs():
> +-            expdir = os.path.join(basedir, d)
> +-            srctreedir = os.path.join('@SOURCE_ROOT@', expdir)
> +-            buildtreedir = os.path.join('@BUILD_ROOT@', expdir)
> +-            dirs_str += [f'{prefix}{buildtreedir}',
> +-                         f'{prefix}{srctreedir}']
> +-        for d in dirs.get_extra_build_dirs():
> +-            dirs_str += [f'{prefix}{d}']
> +-
> +-    return dirs_str
> +-
> + def is_module_library(fname):
> +     '''
> +     Check if the file is a library-like file generated by a module-specific
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index d0b053d4f76..c91cda66f8b 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -26,7 +26,6 @@
> + from .. import mesonlib
> + from .. import interpreter
> + from . import GResourceTarget, GResourceHeaderTarget, GirTarget, TypelibTarget, VapiTarget
> +-from . import get_include_args
> + from . import ExtensionModule
> + from . import ModuleReturnValue
> + from ..mesonlib import (
> +@@ -394,7 +393,7 @@ def _get_dependencies_flags(self, deps, state, depends, include_rpath=False,
> +                     gi_includes.update([girdir])
> +             if isinstance(dep, InternalDependency):
> +                 cflags.update(dep.get_compile_args())
> +-                cflags.update(get_include_args(dep.include_directories))
> ++                cflags.update(state.get_include_args(dep.include_directories))
> +                 for lib in unholder(dep.libraries):
> +                     if isinstance(lib, build.SharedLibrary):
> +                         internal_ldflags.update(self._get_link_args(state, lib, depends, include_rpath))
> +@@ -443,7 +442,7 @@ def _get_dependencies_flags(self, deps, state, depends, include_rpath=False,
> +                     else:
> +                         external_ldflags.update([lib])
> +             elif isinstance(dep, (build.StaticLibrary, build.SharedLibrary)):
> +-                cflags.update(get_include_args(dep.get_include_dirs()))
> ++                cflags.update(state.get_include_args(dep.get_include_dirs()))
> +                 depends.append(dep)
> +             else:
> +                 mlog.log(f'dependency {dep!r} not handled to build gir files')
> +@@ -853,7 +852,7 @@ def generate_gir(self, state, args, kwargs):
> +         scan_command += self._scan_header(kwargs)
> +         scan_command += self._scan_extra_args(kwargs)
> +         scan_command += ['-I' + srcdir, '-I' + builddir]
> +-        scan_command += get_include_args(girtargets_inc_dirs)
> ++        scan_command += state.get_include_args(girtargets_inc_dirs)
> +         scan_command += ['--filelist=' + self._make_gir_filelist(state, srcdir, ns, nsversion, girtargets, libsources)]
> +         scan_command += self._scan_link_withs(state, depends, kwargs)
> +         scan_command += self._scan_include(state, depends, gir_inc_dirs, kwargs)
> +@@ -863,8 +862,8 @@ def generate_gir(self, state, args, kwargs):
> +         scan_command += ['--cflags-begin']
> +         scan_command += cflags
> +         scan_command += ['--cflags-end']
> +-        scan_command += get_include_args(inc_dirs)
> +-        scan_command += get_include_args(list(gi_includes) + gir_inc_dirs + inc_dirs, prefix='--add-include-path=')
> ++        scan_command += state.get_include_args(inc_dirs)
> ++        scan_command += state.get_include_args(list(gi_includes) + gir_inc_dirs + inc_dirs, prefix='--add-include-path=')
> +         scan_command += list(internal_ldflags)
> +         scan_command += self._scan_gir_targets(state, girtargets)
> +         scan_command += self._scan_langs(state, [lc[0] for lc in langs_compilers])
> +@@ -886,7 +885,7 @@ def generate_gir(self, state, args, kwargs):
> +
> +         typelib_output = f'{ns}-{nsversion}.typelib'
> +         typelib_cmd = [gicompiler, scan_target, '--output', '@OUTPUT@']
> +-        typelib_cmd += get_include_args(gir_inc_dirs, prefix='--includedir=')
> ++        typelib_cmd += state.get_include_args(gir_inc_dirs, prefix='--includedir=')
> +
> +         for incdir in typelib_includes:
> +             typelib_cmd += ["--includedir=" + incdir]
> +@@ -1127,7 +1126,7 @@ def _get_build_args(self, kwargs, state, depends):
> +                     'Gir include dirs should be include_directories().')
> +
> +         cflags.extend(deps_cflags)
> +-        cflags.extend(get_include_args(inc_dirs))
> ++        cflags.extend(state.get_include_args(inc_dirs))
> +         ldflags = []
> +         ldflags.extend(internal_ldflags)
> +         ldflags.extend(external_ldflags)
> +diff --git a/mesonbuild/modules/hotdoc.py b/mesonbuild/modules/hotdoc.py
> +index bf8cd229c0d..89a5d938ea7 100644
> +--- a/mesonbuild/modules/hotdoc.py
> ++++ b/mesonbuild/modules/hotdoc.py
> +@@ -22,7 +22,6 @@
> + from mesonbuild.coredata import MesonException
> + from . import ModuleReturnValue
> + from . import ExtensionModule
> +-from . import get_include_args
> + from ..dependencies import Dependency, InternalDependency
> + from ..interpreterbase import FeatureNew, InvalidArguments, noPosargs, noKwargs
> + from ..interpreter import CustomTargetHolder
> +@@ -191,7 +190,7 @@ def process_dependencies(self, deps):
> +         for dep in mesonlib.listify(ensure_list(deps)):
> +             dep = getattr(dep, "held_object", dep)
> +             if isinstance(dep, InternalDependency):
> +-                inc_args = get_include_args(dep.include_directories)
> ++                inc_args = self.state.get_include_args(dep.include_directories)
> +                 cflags.update([self.replace_dirs_in_string(x)
> +                                for x in inc_args])
> +                 cflags.update(self.process_dependencies(dep.libraries))
> +diff --git a/mesonbuild/modules/qt.py b/mesonbuild/modules/qt.py
> +index b7389bd59af..1bf0099d1df 100644
> +--- a/mesonbuild/modules/qt.py
> ++++ b/mesonbuild/modules/qt.py
> +@@ -23,7 +23,7 @@
> + from ..mesonlib import MesonException, extract_as_list, File, unholder, version_compare
> + from ..dependencies import Dependency
> + import xml.etree.ElementTree as ET
> +-from . import ModuleReturnValue, get_include_args, ExtensionModule
> ++from . import ModuleReturnValue, ExtensionModule
> + from ..interpreterbase import noPosargs, permittedKwargs, FeatureNew, FeatureNewKwargs
> + from ..interpreter import extract_required_kwarg
> + from ..programs import NonExistingExternalProgram
> +@@ -239,7 +239,7 @@ def preprocess(self, state, args, kwargs):
> +             ui_gen = build.Generator([self.uic], ui_kwargs)
> +             ui_output = ui_gen.process_files(f'Qt{self.qt_version} ui', ui_files, state)
> +             sources.append(ui_output)
> +-        inc = get_include_args(include_dirs=include_directories)
> ++        inc = state.get_include_args(include_dirs=include_directories)
> +         compile_args = []
> +         for dep in unholder(dependencies):
> +             if isinstance(dep, Dependency):
> +diff --git a/mesonbuild/modules/windows.py b/mesonbuild/modules/windows.py
> +index d7a86380885..c4fdc196681 100644
> +--- a/mesonbuild/modules/windows.py
> ++++ b/mesonbuild/modules/windows.py
> +@@ -19,7 +19,6 @@
> + from .. import mlog
> + from .. import mesonlib, build
> + from ..mesonlib import MachineChoice, MesonException, extract_as_list, unholder
> +-from . import get_include_args
> + from . import ModuleReturnValue
> + from . import ExtensionModule
> + from ..interpreter import CustomTargetHolder
> +@@ -83,12 +82,12 @@ def compile_resources(self, state, args, kwargs):
> +         wrc_depends = extract_as_list(kwargs, 'depends', pop = True)
> +         for d in wrc_depends:
> +             if isinstance(d, CustomTargetHolder):
> +-                extra_args += get_include_args([d.outdir_include()])
> ++                extra_args += state.get_include_args([d.outdir_include()])
> +         inc_dirs = extract_as_list(kwargs, 'include_directories', pop = True)
> +         for incd in inc_dirs:
> +             if not isinstance(incd.held_object, (str, build.IncludeDirs)):
> +                 raise MesonException('Resource include dirs should be include_directories().')
> +-        extra_args += get_include_args(inc_dirs)
> ++        extra_args += state.get_include_args(inc_dirs)
> +
> +         rescomp, rescomp_type = self._find_resource_compiler(state)
> +         if rescomp_type == ResourceCompilerType.rc:
> +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml
> +index 95f73efdf45..6ccd087dc18 100644
> +--- a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml
> ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml
> +@@ -35,7 +35,7 @@
> +     </partintro>
> +     <xi:include href="xml/foo.xml"/>
> +     <xi:include href="../../include/bar.xml"/>
> +-    <xi:include href="xml/foo-version.xml"/>
> ++    <xi:include href="xml/version.xml"/>
> +   </reference>
> +
> + </book>
> +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt
> +new file mode 100644
> +index 00000000000..d14c8dab010
> +--- /dev/null
> ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt
> +@@ -0,0 +1,16 @@
> ++<SECTION>
> ++<FILE>foo</FILE>
> ++<TITLE>FooObj</TITLE>
> ++FooObj
> ++FooObjClass
> ++foo_do_something
> ++</SECTION>
> ++
> ++<SECTION>
> ++<FILE>version</FILE>
> ++<TITLE>version</TITLE>
> ++FOO_MAJOR_VERSION
> ++FOO_MINOR_VERSION
> ++FOO_MICRO_VERSION
> ++</SECTION>
> ++
> +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
> +new file mode 100644
> +index 00000000000..0a9c046f3ed
> +--- /dev/null
> ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
> +@@ -0,0 +1,4 @@
> ++% This include is useless it's a regression test for https://github.com/mesonbuild/meson/issues/8744
> ++#include <foo.h>
> ++
> ++foo_obj_get_type
> +diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> +index 149c6e956aa..f4b3724dbae 100644
> +--- a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> ++++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
> +@@ -1,5 +1,9 @@
> + gnome.gtkdoc('foobar',
> +-  src_dir : inc,
> ++  src_dir : [inc, '.'],
> +   main_sgml : 'foobar-docs.sgml',
> +   content_files : [docbook, version_xml],
> ++  dependencies: foo_dep,
> ++  # Manually written types file for regression test:
> ++  # https://github.com/mesonbuild/meson/issues/8744
> ++  gobject_typesfile: 'foobar.types',
> +   install : true)
> +diff --git a/test cases/frameworks/10 gtk-doc/foo.c b/test cases/frameworks/10 gtk-doc/foo.c
> +new file mode 100644
> +index 00000000000..36c0639ec08
> +--- /dev/null
> ++++ b/test cases/frameworks/10 gtk-doc/foo.c
> +@@ -0,0 +1,30 @@
> ++#include <foo.h>
> ++
> ++
> ++struct _FooObj {
> ++  GObject parent;
> ++  int dummy;
> ++};
> ++
> ++G_DEFINE_TYPE(FooObj, foo_obj, G_TYPE_OBJECT)
> ++
> ++static void foo_obj_init (FooObj *self)
> ++{
> ++}
> ++
> ++static void foo_obj_class_init (FooObjClass *klass)
> ++{
> ++}
> ++
> ++/**
> ++ * foo_do_something:
> ++ * @self: self
> ++ *
> ++ * Useless function.
> ++ *
> ++ * Returns: 0.
> ++ */
> ++int foo_do_something(FooObj *self)
> ++{
> ++  return 0;
> ++}
> +diff --git a/test cases/frameworks/10 gtk-doc/include/foo.h b/test cases/frameworks/10 gtk-doc/include/foo.h
> +index 7b8946b6a86..510f3d1ecb5 100644
> +--- a/test cases/frameworks/10 gtk-doc/include/foo.h
> ++++ b/test cases/frameworks/10 gtk-doc/include/foo.h
> +@@ -1,5 +1,7 @@
> + #pragma once
> +
> ++#include <glib-object.h>
> ++
> + /**
> +  * FooIndecision:
> +  * @FOO_MAYBE:     Something maybe
> +@@ -13,3 +15,19 @@ typedef enum {
> +     FOO_POSSIBLY,
> + } FooIndecision;
> +
> ++/**
> ++ * FooObjClass:
> ++ *
> ++ * The class
> ++ */
> ++
> ++/**
> ++ * FooObj:
> ++ *
> ++ * The instance
> ++ */
> ++
> ++#define FOO_TYPE_OBJ foo_obj_get_type()
> ++G_DECLARE_FINAL_TYPE(FooObj, foo_obj, FOO, OBJ, GObject)
> ++
> ++int foo_do_something(FooObj *self);
> +diff --git a/test cases/frameworks/10 gtk-doc/meson.build b/test cases/frameworks/10 gtk-doc/meson.build
> +index 5c22ad0afa4..292980fafa7 100644
> +--- a/test cases/frameworks/10 gtk-doc/meson.build
> ++++ b/test cases/frameworks/10 gtk-doc/meson.build
> +@@ -24,4 +24,16 @@ if gtkdoc_ver.version_compare('<1.26')
> +   error('MESON_SKIP_TEST gtk-doc test requires gtkdoc >= 1.26.')
> + endif
> +
> ++gobject = dependency('gobject-2.0')
> ++
> ++libfoo = library('foo', 'foo.c',
> ++  include_directories: inc,
> ++  dependencies: gobject,
> ++)
> ++
> ++foo_dep = declare_dependency(
> ++  link_with: libfoo,
> ++  include_directories: inc,
> ++)
> ++
> + subdir('doc')
> +diff --git a/test cases/frameworks/10 gtk-doc/test.json b/test cases/frameworks/10 gtk-doc/test.json
> +index c44126cc741..03ad0595817 100644
> +--- a/test cases/frameworks/10 gtk-doc/test.json
> ++++ b/test cases/frameworks/10 gtk-doc/test.json
> +@@ -4,8 +4,8 @@
> +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/BAR.html"},
> +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar.devhelp2"},
> +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar.html"},
> +-    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar-foo.html"},
> +-    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar-foo-version.html"},
> ++    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/FooObj.html"},
> ++    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foo-version.html"},
> +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/home.png"},
> +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/index.html"},
> +     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/left.png"},
> diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> deleted file mode 100644
> index 772395e879..0000000000
> --- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -meson.build files that use cc.run() in native builds can silently fallback to
> -meson.get_cross_property() in cross builds without an exe-wrapper, but there's
> -no way to know that this is happening.
> -
> -As the defaults may be pessimistic (for example, disabling the support for a
> -feature that should be enabled) emit a warning when the default is used, so that
> -the recipe can explicitly set the cross property as relevant.
> -
> -Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/5071]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py
> -index 3c3cfae0..10e741ae 100644
> ---- a/mesonbuild/interpreter.py
> -+++ b/mesonbuild/interpreter.py
> -@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):
> -             return props[propname]
> -         except Exception:
> -             if len(args) == 2:
> -+                mlog.warning('Cross property %s is using default value %s' % (propname, args[1]))
> -                 return args[1]
> -             raise InterpreterException('Unknown cross property: %s.' % propname)
> -
> diff --git a/meta/recipes-devtools/meson/meson_0.57.2.bb b/meta/recipes-devtools/meson/meson_0.58.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.57.2.bb
> rename to meta/recipes-devtools/meson/meson_0.58.0.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
> --
> 2.31.1
>
>
> 
>
