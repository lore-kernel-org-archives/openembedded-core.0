Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4976.1631178068951469752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=POkjPsih;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631178069;
  x=1662714069;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oHe1nvEz3KuGMhQEw0B3ShbgccVnJ+x0QXViqr9/GBk=;
  b=POkjPsih23TijusA6gnHtpyQbZegm0mqUvm1IRCfzqP+2AQHHqho8Blb
   VnrsARidvrTOFVJKooHneV5fibXiNsSXbdqXITThfTDDch42XhBHfsGZY
   hj+yhvnttnBoPiC8VIBhthAYxr6l0Vnju0awJ8X618SJBJMn3YKGs5m0Z
   lY0+eRcqR6+NhmVGSAIdHIgL1tvE8XPQ1Ilsm+0lHBC50sbXUJi19jLVa
   eMygCvvCTkLQNU2FpxzatfMhLlrvljDvb+PXThiGXMnWNE4gu3OSlgJfX
   oEllWR0YHwou1/4LvZEz8RuAEuVnwE4zVLrhU1A0FSzVt6OTsQ4/7HccQ
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/26] meson: update 0.58.1 -> 0.59.1
Thread-Topic: [OE-core] [PATCH 01/26] meson: update 0.58.1 -> 0.59.1
Thread-Index: AQHXpNuWSSUOa/ET9E+kK2LkBFhel6ubYj/g
Date: Thu, 9 Sep 2021 09:01:05 +0000
Message-ID: <cf3cba17d82f4fb6b2c4e25aa38c314f@axis.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 8 september 2021 20:01
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Subject: [OE-core] [PATCH 01/26] meson: update 0.58.1 -> 0.59.1
>=20
> Drop 0003-native_bindir.patch: it doesn't seem to actually define
> anything where the use_native parameter is set to true.
>=20
> Also, the issue should be solved without invasive, custom patching
> of the code: via meson.cross, custom .pc files for the items in
> question or some other configuration mechanism.

We are not using QT, so I do not know what the actual effect of that=20
patch being dropped is. Thus I do not know whether it is correct to=20
drop it or not. However, it seems that the hunks that actually added=20
the use_native=3DTrue arguments were dropped from the patch with the=20
update to 0.58.0. In that release, the QT specific functions were moved=20
from mesonbuild/dependencies/ui.py to mesonbuild/dependencies/qt.py
and the relevant hunks should probably have been moved along with the=20
code instead of being removed.

//Peter

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  4 +-
>  .../0001-Make-CPU-family-warnings-fatal.patch | 20 ++--
>  .../meson/meson/0003-native_bindir.patch      | 94 -------------------
>  .../meson/meson/gi-target-dep.patch           | 41 --------
>  .../{meson_0.58.1.bb =3D> meson_0.59.1.bb}      |  0
>  ...on_0.58.1.bb =3D> nativesdk-meson_0.59.1.bb} |  0
>  6 files changed, 10 insertions(+), 149 deletions(-)
>  delete mode 100644 meta/recipes-devtools/meson/meson/0003-
> native_bindir.patch
>  delete mode 100644 meta/recipes-devtools/meson/meson/gi-target-dep.patch
>  rename meta/recipes-devtools/meson/{meson_0.58.1.bb =3D> meson_0.59.1.bb=
}
> (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.58.1.bb =3D>
> nativesdk-meson_0.59.1.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-
> devtools/meson/meson.inc
> index f1746d2094..c83ea406f0 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -9,15 +9,13 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>=20
>  SRC_URI =3D
> "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-
> ${PV}.tar.gz \
>             file://0001-gtkdoc-fix-issues-that-arise-when-cross-
> compiling.patch \
> -           file://0003-native_bindir.patch \
>             file://0001-python-module-do-not-manipulate-the-environment-
> when.patch \
>             file://disable-rpath-handling.patch \
>             file://0001-modules-python.py-do-not-substitute-python-s-
> install.patch \
> -           file://gi-target-dep.patch \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "3144a3da662fcf79f1e5602fa929f2821cba4eba28c2c923fe0a7d3e3db04d5d"
> +SRC_URI[sha256sum] =3D
> "db586a451650d46bbe10984a87b79d9bcdc1caebf38d8e189f8848f8d502356d"
>=20
>  UPSTREAM_CHECK_URI =3D "https://github.com/mesonbuild/meson/releases"
>  UPSTREAM_CHECK_REGEX =3D "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
> warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-
> family-warnings-fatal.patch
> index bcccfabd17..c5be526b10 100644
> --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-
> fatal.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-
> fatal.patch
> @@ -1,20 +1,21 @@
> -From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 2001
> +From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 3 Jul 2018 13:59:09 +0100
> -Subject: [PATCH 1/2] Make CPU family warnings fatal
> +Subject: [PATCH] Make CPU family warnings fatal
>=20
>  Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
>  ---
>   mesonbuild/envconfig.py   | 2 +-
>   mesonbuild/environment.py | 4 +---
>   2 files changed, 2 insertions(+), 4 deletions(-)
>=20
>  diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> -index c6a4df3..4d58c91 100644
> +index 307aac3..66fb7ec 100644
>  --- a/mesonbuild/envconfig.py
>  +++ b/mesonbuild/envconfig.py
> -@@ -266,7 +266,7 @@ class MachineInfo:
> +@@ -267,7 +267,7 @@ class MachineInfo(HoldableObject):
>=20
>           cpu_family =3D literal['cpu_family']
>           if cpu_family not in known_cpu_families:
> @@ -24,20 +25,17 @@ index c6a4df3..4d58c91 100644
>           endian =3D literal['endian']
>           if endian not in ('little', 'big'):
>  diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> -index fc9b703..eea8345 100644
> +index 71286a5..179917e 100644
>  --- a/mesonbuild/environment.py
>  +++ b/mesonbuild/environment.py
> -@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
> +@@ -352,9 +352,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
> str:
>               trial =3D 'ppc64'
>=20
>       if trial not in known_cpu_families:
> --        mlog.warning('Unknown CPU family {!r}, please report this at '
> +-        mlog.warning(f'Unknown CPU family {trial!r}, please report this
> at '
>  -                     'https://github.com/mesonbuild/meson/issues/new
> with the '
> --                     'output of `uname -a` and `cat
> /proc/cpuinfo`'.format(trial))
> +-                     'output of `uname -a` and `cat /proc/cpuinfo`')
>  +        raise EnvironmentException('Unknown CPU family %s, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' %
> trial)
>=20
>       return trial
>=20
> ---
> -2.24.0
> -
> diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> deleted file mode 100644
> index 89257b9e05..0000000000
> --- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 2001
> -From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> -Date: Wed, 15 Nov 2017 15:05:01 +0100
> -Subject: [PATCH] native_bindir
> -
> -Some libraries, like QT, have pre-processors that convert their input
> -files into something that the cross-compiler can process. We find the
> -path of those pre-processors via pkg-config-native instead of
> -pkg-config.
> -
> -This path forces the use of pkg-config-native for host_bins arguments.
> -
> -There are some discussions upstream to merge this patch, but I presonaly
> believe
> -that is is OE only.
> https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
> -
> -Upstream-Status: Inappropriate [OE specific]
> -Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> -
> ----
> - mesonbuild/dependencies/base.py | 19 +++++++++++--------
> - 1 file changed, 11 insertions(+), 8 deletions(-)
> -
> -diff --git a/mesonbuild/dependencies/base.py
> b/mesonbuild/dependencies/base.py
> -index 14380d4..d0c443f 100644
> ---- a/mesonbuild/dependencies/base.py
> -+++ b/mesonbuild/dependencies/base.py
> -@@ -179,7 +179,7 @@ class Dependency:
> -     def get_exe_args(self, compiler):
> -         return []
> -
> --    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any]) -> str:
> -+    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any], use_native=3DFalse) -> str:
> -         raise DependencyException(f'{self.name!r} is not a pkgconfig
> dependency')
> -
> -     def get_configtool_variable(self, variable_name):
> -@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
> -             return True
> -         return any(d.is_built() for d in self.ext_deps)
> -
> --    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any]) -> str:
> -+    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any], use_native=3DFalse) -> str:
> -         raise DependencyException('Method "get_pkgconfig_variable()" is
> '
> -                                   'invalid for an internal dependency')
> -
> -@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
> -         return s.format(self.__class__.__name__, self.name,
> self.is_found,
> -                         self.version_reqs)
> -
> --    def _call_pkgbin_real(self, args, env):
> --        cmd =3D self.pkgbin.get_command() + args
> -+    def _call_pkgbin_real(self, args, env, use_native=3DFalse):
> -+        if use_native:
> -+            cmd =3D [self.pkgbin.get_command()[0] + "-native"] + args
> -+        else:
> -+            cmd =3D self.pkgbin.get_command() + args
> -         p, out, err =3D Popen_safe(cmd, env=3Denv)
> -         rc, out, err =3D p.returncode, out.strip(), err.strip()
> -         call =3D ' '.join(cmd)
> -@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
> -             if key.startswith('PKG_'):
> -                 mlog.debug(f'env[{key}]: {value}')
> -
> --    def _call_pkgbin(self, args, env=3DNone):
> -+    def _call_pkgbin(self, args, env=3DNone, use_native=3DFalse):
> -         # Always copy the environment since we're going to modify it
> -         # with pkg-config variables
> -         if env is None:
> -@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
> -         targs =3D tuple(args)
> -         cache =3D PkgConfigDependency.pkgbin_cache
> -         if (self.pkgbin, targs, fenv) not in cache:
> --            cache[(self.pkgbin, targs, fenv)] =3D
> self._call_pkgbin_real(args, env)
> -+            cache[(self.pkgbin, targs, fenv)] =3D
> self._call_pkgbin_real(args, env, use_native)
> -         return cache[(self.pkgbin, targs, fenv)]
> -
> -     def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
> -@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
> -                                       (self.name, out_raw))
> -         self.link_args, self.raw_link_args =3D self._search_libs(out,
> out_raw)
> -
> --    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any]) -> str:
> -+    def get_pkgconfig_variable(self, variable_name: str, kwargs:
> T.Dict[str, T.Any], use_native=3DFalse) -> str:
> -         options =3D ['--variable=3D' + variable_name, self.name]
> -
> -         if 'define_variable' in kwargs:
> -@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
> -
> -             options =3D ['--define-variable=3D' + '=3D'.join(definition=
)] +
> options
> -
> --        ret, out, err =3D self._call_pkgbin(options)
> -+        ret, out, err =3D self._call_pkgbin(options,
> use_native=3Duse_native)
> -         variable =3D ''
> -         if ret !=3D 0:
> -             if self.required:
> diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> deleted file mode 100644
> index 29e164ccc7..0000000000
> --- a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -When building gobject-introspection we want the *native* binaries (as
> they need
> -to be executed) but *host* gobject-introspection libraries, as otherwise
> the
> -native pkg-config can be used and the build will try to link native and
> host
> -binaries together.
> -
> -Upstream-Status: Backport [589236226856f591c9e8daf0cb7aa1aef8862388]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index f9660838e..2eefc3fc7 100644
> ---- a/mesonbuild/modules/gnome.py
> -+++ b/mesonbuild/modules/gnome.py
> -@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):
> -
> mlog.bold('https://github.com/mesonbuild/meson/issues/1387'),
> -                      once=3DTrue)
> -
> --    def _get_native_dep(self, state, depname, required=3DTrue):
> --        kwargs =3D {'native': True, 'required': required}
> -+    def _get_dep(self, state, depname, native=3DFalse, required=3DTrue)=
:
> -+        kwargs =3D {'native': native, 'required': required}
> -         holder =3D self.interpreter.func_dependency(state.current_node,
> [depname], kwargs)
> -         return holder.held_object
> -
> -@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):
> -             return ExternalProgram.from_entry(name, prog)
> -
> -         # Check if pkgconfig has a variable
> --        dep =3D self._get_native_dep(state, depname, required=3DFalse)
> -+        dep =3D self._get_dep(state, depname, native=3DTrue, required=
=3DFalse)
> -         if dep.found() and dep.type_name =3D=3D 'pkgconfig':
> -             value =3D dep.get_pkgconfig_variable(varname, {})
> -             if value:
> -@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):
> -
> -     def _get_gir_dep(self, state):
> -         if not self.gir_dep:
> --            self.gir_dep =3D self._get_native_dep(state, 'gobject-
> introspection-1.0')
> -+            self.gir_dep =3D self._get_dep(state, 'gobject-introspectio=
n-
> 1.0')
> -             self.giscanner =3D self._get_native_binary(state, 'g-ir-
> scanner', 'gobject-introspection-1.0', 'g_ir_scanner')
> -             self.gicompiler =3D self._get_native_binary(state, 'g-ir-
> compiler', 'gobject-introspection-1.0', 'g_ir_compiler')
> -         return self.gir_dep, self.giscanner, self.gicompiler
> diff --git a/meta/recipes-devtools/meson/meson_0.58.1.bb b/meta/recipes-
> devtools/meson/meson_0.59.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.58.1.bb
> rename to meta/recipes-devtools/meson/meson_0.59.1.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> --
> 2.31.1

