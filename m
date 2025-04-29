Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E4DC3ABAC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 11:21:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17434.1745925664335384353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 04:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB6571515
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:20:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 662F23F673
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:21:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade to 1.8.0
Date: Tue, 29 Apr 2025 12:20:56 +0100
Message-ID: <20250429112056.766690-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 11:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215657

- New argument android_exe_type for executables
- Changes to the b_sanitize option
- New C standard c2y (and gnu2y)
- i18n module xgettext
- version_compare now accept multiple compare strings
- Improvements to Objective-C and Objective-C++
- Per project subproject options rewrite
- objects added correctly to Rust executables
- rust.test now supports link_whole
- Meson can run "rustdoc" on Rust projects
- The Wayland module is stable
- New swift_std compiler option
- New option to execute a slice of tests
- Valgrind now fails tests if errors are found

Full release notes: https://mesonbuild.com/Release-notes-for-1-8-0.html.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch | 10 +++++-----
 ...ule-do-not-manipulate-the-environment-when.patch | 13 +++++++------
 ...002-Support-building-allarch-recipes-again.patch |  6 +++---
 .../meson/{meson_1.7.2.bb =3D> meson_1.8.0.bb}        |  2 +-
 4 files changed, 16 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.7.2.bb =3D> meson_1.8.0.bb} =
(98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warni=
ngs-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch
index ca2bcef1ee7..b5d05469679 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
@@ -1,4 +1,4 @@
-From 8ba2c1f596206d45e8f14d4f4d2439023a3de9e7 Mon Sep 17 00:00:00 2001
+From a503c007d3db87acf711d110c01e11c2d087f99c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
=20
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 6726d4e..844b611 100644
+index 43fad0c..27be871 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -278,8 +278,8 @@ class MachineInfo(HoldableObject):
+@@ -287,8 +287,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(liter=
al)))
 =20
          cpu_family =3D literal['cpu_family']
@@ -26,10 +26,10 @@ index 6726d4e..844b611 100644
          endian =3D literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 386316e..b4a0d88 100644
+index f322cda..53a0ac0 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -419,10 +419,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
+@@ -429,10 +429,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
          if compilers and not any_compiler_has_define(compilers, '__mips=
64'):
              trial =3D 'mips'
 =20
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-=
manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson=
/0001-python-module-do-not-manipulate-the-environment-when.patch
index 84a9c18c518..85a93c8e7a1 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
@@ -1,7 +1,8 @@
-From f264b7fd2c86edfd5db77da264e8bf05f5e2bfeb Mon Sep 17 00:00:00 2001
+From 859711f99ea9b183a1dffb9b97de09ad0fe9803b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when c=
alling
+
  pkg-config
=20
 Upstream-Status: Inappropriate [oe-core specific]
@@ -11,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  1 file changed, 1 insertion(+), 5 deletions(-)
=20
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies=
/python.py
-index 326e605..f5eb50f 100644
+index 3dab31c..b9307fc 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -403,9 +403,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -410,9 +410,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                      empty.name =3D 'python'
                      return empty
 =20
@@ -24,7 +25,7 @@ index 326e605..f5eb50f 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs,=
 installation, True)
                  finally:
-@@ -414,8 +411,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -421,8 +418,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                              os.environ[name] =3D value
                          elif name in os.environ:
                              del os.environ[name]
@@ -32,5 +33,5 @@ index 326e605..f5eb50f 100644
 -                    set_env('PKG_CONFIG_PATH', old_pkg_path)
 +                    pass
 =20
-             candidates.append(functools.partial(wrap_in_pythons_pc_dir,=
 pkg_name, env, kwargs, installation))
-             # We only need to check both, if a python install has a LIB=
PC. It might point to the wrong location,
+             # Otherwise this doesn't fulfill the interface requirements
+             wrap_in_pythons_pc_dir.log_tried =3D PythonPkgConfigDepende=
ncy.log_tried  # type: ignore[attr-defined]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-alla=
rch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-=
building-allarch-recipes-again.patch
index d3120e84e89..ed35498c306 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
@@ -1,4 +1,4 @@
-From bcdd72ed1956e0a1b1b725e552fa391c549c2099 Mon Sep 17 00:00:00 2001
+From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,10 +12,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt=
@axis.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 9703315..74f2477 100644
+index 27be871..994ac77 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -28,6 +28,7 @@ from pathlib import Path
+@@ -31,6 +31,7 @@ if T.TYPE_CHECKING:
 =20
 =20
  known_cpu_families =3D (
diff --git a/meta/recipes-devtools/meson/meson_1.7.2.bb b/meta/recipes-de=
vtools/meson/meson_1.8.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.7.2.bb
rename to meta/recipes-devtools/meson/meson_1.8.0.bb
index 45a74612cef..6e3886e0a58 100644
--- a/meta/recipes-devtools/meson/meson_1.7.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.0.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "4d40d63aa748a9c139cc41ab9bffe43edd113c5639d78bde=
81544ca955aea890"
+SRC_URI[sha256sum] =3D "0a9b23311271519bd03dca12d7d8b0eab582c3a2c5da433d=
465b6e519dc88e2f"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.43.0


