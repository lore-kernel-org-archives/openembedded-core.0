Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F24D3E774
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:33:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3246.1765391598868442060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D990175D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:11 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 33F463F762
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] meson: upgrade to 1.10.0
Date: Wed, 10 Dec 2025 18:33:07 +0000
Message-ID: <20251210183308.4022909-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183308.4022909-1-ross.burton@arm.com>
References: <20251210183308.4022909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227504

Release notes:
- Support for the `counted_by` attribute
- Added a `values()` method for dictionaries
- Add cmd_array method to ExternalProgram
- Microchip XC32 compiler support
- Added OS/2 support
- Android cross file generator
- Array `.slice()` method
- `-Db_msvcrt` on clang
- Added `build_subdir` arg to various targets
- Support for Cargo workspaces
- Experimental Codegen module
- Methods from compiler object now accept strings for include_directories
- `meson format` has a new `--check-diff` option
- `-Db_thinlto_cache` now supported for GCC
- Using `meson.get_compiler()` to get a language from another project is =
marked broken
- Experimental C++ import std support
- Common `Cargo.lock` for all Cargo subprojects
- Add a configure log in meson-logs
- Added new `namingscheme` option
- Rewriter improvements
- Passing `-C default-linker-libraries` to rustc
- `rustc` will receive `-C embed-bitcode=3Dno` and `-C lto` command line =
options
- New method to handle GNU and Windows symbol visibility for C/C++/ObjC/O=
bjC++
- Vala BuildTarget dependency enhancements
- `i18n.xgettext` now accepts CustomTarget and CustomTargetIndex as sourc=
es

Drop 0001-python-module-do-not-manipulate-the-environment-when.patch as
this code no longer exists.

Rebase 0001-Make-CPU-family-warnings-fatal.patch as code moved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Make-CPU-family-warnings-fatal.patch | 16 ++++----
 ...-not-manipulate-the-environment-when.patch | 37 -------------------
 .../meson/{meson_1.9.1.bb =3D> meson_1.10.0.bb} |  3 +-
 3 files changed, 8 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-python-module-=
do-not-manipulate-the-environment-when.patch
 rename meta/recipes-devtools/meson/{meson_1.9.1.bb =3D> meson_1.10.0.bb}=
 (96%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warni=
ngs-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch
index 46754bf5084..c2dc3fffcf9 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
@@ -25,20 +25,18 @@ index 43fad0c..27be871 100644
 =20
          endian =3D literal['endian']
          if endian not in ('little', 'big'):
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 489ef50..1567efa 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -438,10 +438,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
-         if compilers and not any_compiler_has_define(compilers, '__mips=
64'):
+diff --git i/mesonbuild/envconfig.py w/mesonbuild/envconfig.py
+index dd050b011..5277693c3 100644
+--- i/mesonbuild/envconfig.py
++++ w/mesonbuild/envconfig.py
+@@ -634,9 +634,7 @@ def detect_cpu_family(compilers: T.Dict[str, Compile=
r]) -> str:
              trial =3D 'mips'
 =20
--    if trial not in known_cpu_families:
+     if trial not in known_cpu_families:
 -        mlog.warning(f'Unknown CPU family {trial!r}, please report this=
 at '
 -                     'https://github.com/mesonbuild/meson/issues/new wi=
th the '
 -                     'output of `uname -a` and `cat /proc/cpuinfo`')
-+    if trial not in known_cpu_families and trail !=3D "riscv":
-+        raise EnvironmentException('Unknown CPU family %s, see https://=
wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
++        raise EnvironmentException(f'Unknown CPU family {trial!r}, see =
https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.')
 =20
      return trial
 =20
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-=
manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson=
/0001-python-module-do-not-manipulate-the-environment-when.patch
deleted file mode 100644
index c1b82935931..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c0ffc404415a52bfa3358e32ecd17f064a241b38 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 19 Nov 2018 14:24:26 +0100
-Subject: [PATCH] python module: do not manipulate the environment when c=
alling
-
- pkg-config
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mesonbuild/dependencies/python.py | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies=
/python.py
-index b028d9f..3d7cd9b 100644
---- a/mesonbuild/dependencies/python.py
-+++ b/mesonbuild/dependencies/python.py
-@@ -418,9 +418,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
-                     empty.name =3D 'python'
-                     return empty
-=20
--                old_pkg_libdir =3D os.environ.pop('PKG_CONFIG_LIBDIR', =
None)
--                old_pkg_path =3D os.environ.pop('PKG_CONFIG_PATH', None=
)
--                os.environ['PKG_CONFIG_LIBDIR'] =3D pkg_libdir
-                 try:
-                     return PythonPkgConfigDependency(name, env, kwargs,=
 installation, True)
-                 finally:
-@@ -429,8 +426,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
-                             os.environ[name] =3D value
-                         elif name in os.environ:
-                             del os.environ[name]
--                    set_env('PKG_CONFIG_LIBDIR', old_pkg_libdir)
--                    set_env('PKG_CONFIG_PATH', old_pkg_path)
-+                    pass
-=20
-             # Otherwise this doesn't fulfill the interface requirements
-             wrap_in_pythons_pc_dir.log_tried =3D PythonPkgConfigDepende=
ncy.log_tried  # type: ignore[attr-defined]
diff --git a/meta/recipes-devtools/meson/meson_1.9.1.bb b/meta/recipes-de=
vtools/meson/meson_1.10.0.bb
similarity index 96%
rename from meta/recipes-devtools/meson/meson_1.9.1.bb
rename to meta/recipes-devtools/meson/meson_1.10.0.bb
index 4738484bbbf..6f629b7ec38 100644
--- a/meta/recipes-devtools/meson/meson_1.9.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.10.0.bb
@@ -11,11 +11,10 @@ GITHUB_BASE_URI =3D "https://github.com/mesonbuild/me=
son/releases/"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://meson-setup.py \
            file://meson-wrapper \
-           file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "4e076606f2afff7881d195574bddcd8d89286f35a17b4977=
a216f535dc0c74ac"
+SRC_URI[sha256sum] =3D "8071860c1f46a75ea34801490fd1c445c9d75147a65508cd=
3a10366a7006cc1c"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.43.0


