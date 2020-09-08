Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20591.1599573444416258242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 06:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C13251684
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 06:57:23 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64D413F73C
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 06:57:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] harfbuzz: fix a build race around hb-version.h
Date: Tue,  8 Sep 2020 14:57:17 +0100
Message-Id: <20200908135717.3781613-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908135717.3781613-1-ross.burton@arm.com>
References: <20200908135717.3781613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../harfbuzz/harfbuzz/version-race.patch      | 121 ++++++++++++++++++
 .../harfbuzz/harfbuzz_2.7.2.bb                |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/version-race.=
patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch b=
/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
new file mode 100644
index 0000000000..2d692f36b5
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/version-race.patch
@@ -0,0 +1,121 @@
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/5=
aff83104e03d6d2617987d24a51e490ab7a5cd1]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From bc1c93fbe04459a4b12c76c713ba1b750d2d9108 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 7 Sep 2020 17:11:17 +0100
+Subject: [PATCH 1/2] [build] No need to pass source directory to
+ gen-hb-version
+
+The input file is by definition in the source directory, so dirname()
+that instead of needing the directory to be passed.
+
+Needed because a follow-up commit will change when this is called, and t=
he
+source directory isn't trivially available at that point.
+---
+ src/gen-hb-version.py | 6 +++---
+ src/meson.build       | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/gen-hb-version.py b/src/gen-hb-version.py
+index 15e56b93..bf16f88a 100755
+--- a/src/gen-hb-version.py
++++ b/src/gen-hb-version.py
+@@ -4,15 +4,15 @@
+=20
+ import os, sys, shutil
+=20
+-if len (sys.argv) < 5:
++if len (sys.argv) < 4:
+ 	sys.exit(__doc__)
+=20
+ version =3D sys.argv[1]
+ major, minor, micro =3D version.split (".")
+=20
+ OUTPUT =3D sys.argv[2]
+-CURRENT_SOURCE_DIR =3D sys.argv[3]
+-INPUT =3D sys.argv[4]
++INPUT =3D sys.argv[3]
++CURRENT_SOURCE_DIR =3D os.path.dirname(INPUT)
+=20
+ with open (INPUT, "r", encoding=3D'utf-8') as template:
+ 	with open (OUTPUT, "wb") as output:
+diff --git a/src/meson.build b/src/meson.build
+index 5d7cd578..2d78c992 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -286,7 +286,7 @@ custom_target('hb-version.h',
+   input: 'hb-version.h.in',
+   output: 'hb-version.h',
+   command: [find_program('gen-hb-version.py'), meson.project_version(),
+-            '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
++            '@OUTPUT@', '@INPUT@'],
+ )
+=20
+ ragel =3D find_program('ragel', required: false)
+--=20
+2.28.0
+
+
+From 5aff83104e03d6d2617987d24a51e490ab7a5cd1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 7 Sep 2020 10:55:33 +0100
+Subject: [PATCH 2/2] [build] generate hb-version.h once at configure tim=
e with
+ Meson
+
+Currently with Meson hb-version.h is generated during the build without
+any explicit dependencies which can result in build failures due races
+over the file.
+
+Change this to be generated at configure time, so that the file is alway=
s
+generated once before the build itself.
+
+Closes #2667
+---
+ src/meson.build | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 2d78c992..19290245 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -1,3 +1,10 @@
++hb_version_h =3D configure_file(
++               command: [find_program('gen-hb-version.py'), meson.proje=
ct_version(), '@OUTPUT@', '@INPUT@'],
++               input: 'hb-version.h.in',
++               output: 'hb-version.h',
++               install: true,
++               install_dir: join_paths(get_option('includedir'), meson.=
project_name()))
++
+ # Base and default-included sources and headers
+ hb_base_sources =3D files(
+   'hb-aat-layout-ankr-table.hh',
+@@ -214,9 +221,9 @@ hb_base_headers =3D files(
+   'hb-shape.h',
+   'hb-style.h',
+   'hb-unicode.h',
+-  'hb-version.h',
+   'hb.h',
+ )
++hb_base_headers +=3D hb_version_h
+=20
+ # Optional Sources and Headers with external deps
+=20
+@@ -281,14 +288,6 @@ hb_gobject_headers =3D files(
+   'hb-gobject-structs.h',
+ )
+=20
+-custom_target('hb-version.h',
+-  build_by_default: true,
+-  input: 'hb-version.h.in',
+-  output: 'hb-version.h',
+-  command: [find_program('gen-hb-version.py'), meson.project_version(),
+-            '@OUTPUT@', '@INPUT@'],
+-)
+-
+ ragel =3D find_program('ragel', required: false)
+ if not ragel.found()
+   warning('You have to install ragel if you are going to develop HarfBu=
zz itself')
+--=20
+2.28.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb b/meta/reci=
pes-graphics/harfbuzz/harfbuzz_2.7.2.bb
index 8416eb93d8..f95273f686 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
@@ -13,6 +13,7 @@ UPSTREAM_CHECK_REGEX =3D "harfbuzz-(?P<pver>\d+(\.\d+)+=
).tar"
 SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${=
BPN}-${PV}.tar.xz \
            file://0001-Do-not-disable-introspection-in-cross-builds.patc=
h \
            file://0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-f=
ile.patch \
+           file://version-race.patch \
            "
 SRC_URI[sha256sum] =3D "b8c048d7c2964a12f2c80deb6634dfc836b603dd12bf0d0a=
3df1627698e220ce"
=20
--=20
2.28.0

