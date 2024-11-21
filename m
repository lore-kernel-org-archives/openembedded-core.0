Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180BCD7877A
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:56:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.162.1732200987458493925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 06:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D785912FC
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:56:56 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C7EE3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:56:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: don't look on the host for GTest when cross-compiling
Date: Thu, 21 Nov 2024 14:56:19 +0000
Message-Id: <20241121145619.2420532-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 14:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207541

When cross-compiling prepend the sysroot to the hardcoded /usr/src paths
that Meson looks in for the GoogleTest sources.

[ YOCTO #13508 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-prepend-sysroot-when-searching-for-.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/meson/meson_1.6.0.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-dependencies-d=
ev-prepend-sysroot-when-searching-for-.patch

diff --git a/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prep=
end-sysroot-when-searching-for-.patch b/meta/recipes-devtools/meson/meson=
/0001-dependencies-dev-prepend-sysroot-when-searching-for-.patch
new file mode 100644
index 00000000000..e4700bc91d4
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prepend-sys=
root-when-searching-for-.patch
@@ -0,0 +1,36 @@
+From 6f33fb67097beeb17e2345aaec3bda4a57b0b138 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 20 Nov 2024 13:09:38 +0000
+Subject: [PATCH] dependencies/dev: prepend sysroot when searching for GT=
est
+ sources
+
+Don't hardcode paths in /usr when looking for the GTest sources, as in
+cross-compile or other builds with a sysroot this will find the host
+sources, not ones that we want to use in the sysroot.
+
+Closes #12690.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/139=
34]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ mesonbuild/dependencies/dev.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/mesonbuild/dependencies/dev.py b/mesonbuild/dependencies/de=
v.py
+index 94f51ff69..cceb1756c 100644
+--- a/mesonbuild/dependencies/dev.py
++++ b/mesonbuild/dependencies/dev.py
+@@ -56,7 +56,9 @@ class GTestDependencySystem(SystemDependency):
+     def __init__(self, name: str, environment: 'Environment', kwargs: T=
.Dict[str, T.Any]) -> None:
+         super().__init__(name, environment, kwargs, language=3D'cpp')
+         self.main =3D kwargs.get('main', False)
+-        self.src_dirs =3D ['/usr/src/gtest/src', '/usr/src/googletest/g=
oogletest/src']
++
++        sysroot =3D environment.properties[self.for_machine].get_sys_ro=
ot() or ""
++        self.src_dirs =3D [sysroot + '/usr/src/gtest/src', sysroot + '/=
usr/src/googletest/googletest/src']
+         if not self._add_sub_dependency(threads_factory(environment, se=
lf.for_machine, {})):
+             self.is_found =3D False
+             return
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/meson/meson_1.6.0.bb b/meta/recipes-de=
vtools/meson/meson_1.6.0.bb
index 46127b7a9ba..078e49e9735 100644
--- a/meta/recipes-devtools/meson/meson_1.6.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.6.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
+           file://0001-dependencies-dev-prepend-sysroot-when-searching-f=
or-.patch \
            "
 SRC_URI[sha256sum] =3D "999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca6=
1139f2eec09d5496"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
--=20
2.34.1


