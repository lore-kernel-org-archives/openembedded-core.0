Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B94CC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 16:09:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.96314.1722614964075811700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 09:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C860DA7
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Aug 2024 09:09:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 46BDA3F64C
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Aug 2024 09:09:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade 1.4.0 -> 1.5.1
Date: Fri,  2 Aug 2024 17:09:16 +0100
Message-Id: <20240802160916.3441166-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 16:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202926

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch    | 10 +++++-----
 ...module-do-not-manipulate-the-environment-when.patch |  8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch  |  4 ++--
 .../meson/{meson_1.4.0.bb =3D> meson_1.5.1.bb}           |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.4.0.bb =3D> meson_1.5.1.bb} =
(98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warni=
ngs-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch
index 94129b2f25f..04abb8b314f 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
@@ -1,4 +1,4 @@
-From c61c93f43b70ba0670d41e841bff9f2a7186cc2f Mon Sep 17 00:00:00 2001
+From 33bc81d5a262e0fa1a346ac1667a3679a17c0997 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
=20
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 0e9cd23..b44e60c 100644
+index 86bad9b..9703315 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -276,8 +276,8 @@ class MachineInfo(HoldableObject):
+@@ -277,8 +277,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(liter=
al)))
 =20
          cpu_family =3D literal['cpu_family']
@@ -26,10 +26,10 @@ index 0e9cd23..b44e60c 100644
          endian =3D literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index af69f64..248d6dd 100644
+index 5bccb90..6aa4b15 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
+@@ -387,10 +387,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
          if compilers and not any_compiler_has_define(compilers, '__mips=
64'):
              trial =3D 'mips'
 =20
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-=
manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson=
/0001-python-module-do-not-manipulate-the-environment-when.patch
index 9f3f516a5c1..b4671f591fc 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From b4c0602a56d3517ab66b98a7dbb69defe77d29a3 Mon Sep 17 00:00:00 2001
+From 66e350bbbd65e56a0d19c75710f61503e15e24a2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when c=
alling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  1 file changed, 1 insertion(+), 5 deletions(-)
=20
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies=
/python.py
-index b9b17f8..a305afb 100644
+index 883a29a..52bfbf3 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -399,9 +399,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                      empty.name =3D 'python'
                      return empty
 =20
@@ -24,7 +24,7 @@ index b9b17f8..a305afb 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs,=
 installation, True)
                  finally:
-@@ -392,8 +389,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -410,8 +407,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                              os.environ[name] =3D value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-alla=
rch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-=
building-allarch-recipes-again.patch
index fa5ea57d5b9..5149d61af4e 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
@@ -1,4 +1,4 @@
-From 7f69bfabb87d311d7409ea6699f7dee8e9b3a95b Mon Sep 17 00:00:00 2001
+From 61430cf9a80e24eb33d72c6eae4e8d536d308e08 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,7 +12,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b44e60c..c70e8cb 100644
+index 9703315..74f2477 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -28,6 +28,7 @@ from pathlib import Path
diff --git a/meta/recipes-devtools/meson/meson_1.4.0.bb b/meta/recipes-de=
vtools/meson/meson_1.5.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.4.0.bb
rename to meta/recipes-devtools/meson/meson_1.5.1.bb
index a0c2ee633ae..4f68a22fa9e 100644
--- a/meta/recipes-devtools/meson/meson_1.4.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.5.1.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b3=
30e25935b750138d"
+SRC_URI[sha256sum] =3D "567e533adf255de73a2de35049b99923caf872a455af9ce0=
3e01077e0d384bed"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.34.1


