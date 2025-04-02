Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD7DC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 17:02:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.108.1743613361712083705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 10:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D02A1FC4
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 10:02:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB3473F694
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 10:02:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] meson: upgrade to 1.7.1
Date: Wed,  2 Apr 2025 18:02:35 +0100
Message-ID: <20250402170235.2868624-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402170235.2868624-1-ross.burton@arm.com>
References: <20250402170235.2868624-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 17:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214288

Drop 0001-dependencies-dev-prepend-sysroot-when-searching-for-.patch as
this is now upstreamed.

Remove the deletion of a .pyc because it uses frozenset(), this bug in
Python has been fixed since 3.11[1]

[1] https://github.com/python/cpython/commit/51999c960e7fc45feebd629421de=
c6524a5fc803

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-prepend-sysroot-when-searching-for-.patch | 33 -------------------
 .../meson/{meson_1.7.0.bb =3D> meson_1.7.1.bb}  | 13 +-------
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-dependencies-d=
ev-prepend-sysroot-when-searching-for-.patch
 rename meta/recipes-devtools/meson/{meson_1.7.0.bb =3D> meson_1.7.1.bb} =
(88%)

diff --git a/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prep=
end-sysroot-when-searching-for-.patch b/meta/recipes-devtools/meson/meson=
/0001-dependencies-dev-prepend-sysroot-when-searching-for-.patch
deleted file mode 100644
index b6579c824ef..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prepend-sys=
root-when-searching-for-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 17117c2732c33ebec39e3fec2ecd5a3515dc7d71 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 20 Nov 2024 13:09:38 +0000
-Subject: [PATCH] dependencies/dev: prepend sysroot when searching for GT=
est
- sources
-
-Don't hardcode paths in /usr when looking for the GTest sources, as in
-cross-compile or other builds with a sysroot this will find the host
-sources, not ones that we want to use in the sysroot.
-
-Closes #12690.
-
-Upstream-Status: Backport [17117c2732c33ebec39e3fec2ecd5a3515dc7d71]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- mesonbuild/dependencies/dev.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/mesonbuild/dependencies/dev.py b/mesonbuild/dependencies/de=
v.py
-index 2725a7bb4e88..0c8886b81a04 100644
---- a/mesonbuild/dependencies/dev.py
-+++ b/mesonbuild/dependencies/dev.py
-@@ -56,7 +56,9 @@ class GTestDependencySystem(SystemDependency):
-     def __init__(self, name: str, environment: 'Environment', kwargs: T=
.Dict[str, T.Any]) -> None:
-         super().__init__(name, environment, kwargs, language=3D'cpp')
-         self.main =3D kwargs.get('main', False)
--        self.src_dirs =3D ['/usr/src/gtest/src', '/usr/src/googletest/g=
oogletest/src']
-+
-+        sysroot =3D environment.properties[self.for_machine].get_sys_ro=
ot() or ''
-+        self.src_dirs =3D [sysroot + '/usr/src/gtest/src', sysroot + '/=
usr/src/googletest/googletest/src']
-         if not self._add_sub_dependency(threads_factory(environment, se=
lf.for_machine, {})):
-             self.is_found =3D False
-             return
diff --git a/meta/recipes-devtools/meson/meson_1.7.0.bb b/meta/recipes-de=
vtools/meson/meson_1.7.1.bb
similarity index 88%
rename from meta/recipes-devtools/meson/meson_1.7.0.bb
rename to meta/recipes-devtools/meson/meson_1.7.1.bb
index 44872a5f7ba..d83a5efbf5d 100644
--- a/meta/recipes-devtools/meson/meson_1.7.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.1.bb
@@ -14,9 +14,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
-           file://0001-dependencies-dev-prepend-sysroot-when-searching-f=
or-.patch \
            "
-SRC_URI[sha256sum] =3D "08efbe84803eed07f863b05092d653a9d348f7038761d900=
412fddf56deb0284"
+SRC_URI[sha256sum] =3D "155780a5be87f6dd7f427ad8bcbf0f2b2c5f62ee5fdacca7=
caa9de8439a24b89"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
@@ -25,16 +24,6 @@ RDEPENDS:${PN} =3D "ninja python3-modules python3-pkg-=
resources"
=20
 FILES:${PN} +=3D "${datadir}/polkit-1"
=20
-do_install:append () {
-	# As per the same issue in the python recipe itself:
-	# Unfortunately the following pyc files are non-deterministc due to 'fr=
ozenset'
-	# being written without strict ordering, even with PYTHONHASHSEED =3D 0
-	# Upstream is discussing ways to solve the issue properly, until then l=
et's
-	# just not install the problematic files.
-	# More info: http://benno.id.au/blog/2013/01/15/python-determinism
-	rm -f ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pyc=
ache__/mpi.cpython*
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit meson-routines
--=20
2.43.0


