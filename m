Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7F9E81BBB
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46680.1770641793897398669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25CBE1516
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:27 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2419C3F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/9] python3-numpy: backport a Meson patch to fix pkg-config lookups
Date: Mon,  9 Feb 2026 12:56:21 +0000
Message-ID: <20260209125628.640221-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209125628.640221-1-ross.burton@arm.com>
References: <20260209125628.640221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230790

When Meson uses pkg-config to introspect the Python install it resets
PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR to the location that the running
python3 says is the library directory. However, when it writes to
PKG_CONFIG_LIBDIR it uses the _target_ library directory without
prefixing this with the sysroot, which breaks the build if _LIBDIR is
the primary search path.

This has been fixed in Meson since 1.10.0[1] but numpy has a vendored
fork of Meson that is currently at 1.9.2, so backport the specific fix
to solve this problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-numpy/0001-python-sysroot.patch   | 34 +++++++++++++++++++
 .../python/python3-numpy_2.3.5.bb             |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-pytho=
n-sysroot.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysro=
ot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot=
.patch
new file mode 100644
index 0000000000..b22c123493
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patc=
h
@@ -0,0 +1,34 @@
+From c40218577305f5953ef63d943c26a27c5a931770 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 21 Jan 2026 14:12:36 +0000
+Subject: [PATCH] Add sysroot to pkgconfig libdir
+
+When Meson uses pkg-config to introspect the Python install it resets PK=
G_CONFIG_PATH
+and PKG_CONFIG_LIBDIR. However, when it writes to PKG_CONFIG_LIBDIR it u=
ses the
+_target_ library directory without prefixing this with the sysroot, whic=
h breaks=20
+the build if _LIBDIR is the primary search path.
+
+This has been fixed in Meson since 1.10.0[1] but numpy has a vendored fo=
rk of Meson
+that is currently at 1.9.2, so backport the specific fix to solve this p=
roblem.
+
+[1] meson 59c3dd1fd ("python: add a python.build_config option (PEP 739)=
")
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ vendored-meson/meson/mesonbuild/dependencies/python.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/vendored-meson/meson/mesonbuild/dependencies/python.py b/ve=
ndored-meson/meson/mesonbuild/dependencies/python.py
+index 7f9bd20..fdcf714 100644
+--- a/vendored-meson/meson/mesonbuild/dependencies/python.py
++++ b/vendored-meson/meson/mesonbuild/dependencies/python.py
+@@ -412,6 +412,8 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+     if DependencyMethods.PKGCONFIG in methods:
+         if from_installation:
+             pkg_libdir =3D installation.info['variables'].get('LIBPC')
++            sysroot =3D env.properties[for_machine].get_sys_root() or '=
'
++            pkg_libdir =3D sysroot + pkg_libdir
+             pkg_embed =3D '-embed' if embed and mesonlib.version_compar=
e(installation.info['version'], '>=3D3.8') else ''
+             pkg_name =3D f'python-{pkg_version}{pkg_embed}'
+=20
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb b/meta/r=
ecipes-devtools/python/python3-numpy_2.3.5.bb
index 55b8091ff8..78972c98d3 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNA=
ME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-defau=
lt-.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
+           file://0001-python-sysroot.patch \
            "
 SRC_URI[sha256sum] =3D "784db1dcdab56bf0517743e746dfb0f885fc68d948aba86e=
eec2cba234bdf1c0"
=20
--=20
2.43.0


