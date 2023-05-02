Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBD1C7EE23
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:34:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1364.1683038041547139168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EA2DC14;
	Tue,  2 May 2023 07:34:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 828193F5A1;
	Tue,  2 May 2023 07:34:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] gtk+3: upgrade 3.24.36 -> 3.24.37
Date: Tue,  2 May 2023 15:33:56 +0100
Message-Id: <20230502143357.1725361-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180734

Drop merged introspection patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...d-introspection-according-to-option-.patch | 34 -------------------
 .../{gtk+3_3.24.36.bb =3D> gtk+3_3.24.37.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-=
introspection-according-to-option-.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.36.bb =3D> gtk+3_3.24.37.bb} =
(76%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introsp=
ection-according-to-option-.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-me=
son.build-build-introspection-according-to-option-.patch
deleted file mode 100644
index 11effd421fd..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-=
according-to-option-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6e533d5598ef875f30b84d931aae11b768465869 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 2 Jan 2023 15:00:02 +0100
-Subject: [PATCH] meson.build: build introspection according to option on=
ly
-
-The way the check is written, if the build is native, then the
-introspection option has no effect.
-
-Particularly yocto project does want to disable introspection in
-native builds and enable it in cross builds (both via the option),
-and without this patch the former is not possible.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk/-/merge_r=
equests/5382]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index bfc33af0f6..94ffaa7769 100644
---- a/meson.build
-+++ b/meson.build
-@@ -854,7 +854,7 @@ endif
-=20
- # Introspection
- gir =3D find_program('g-ir-scanner', required : get_option('introspecti=
on'))
--build_gir =3D gir.found() and (not meson.is_cross_build() or get_option=
('introspection'))
-+build_gir =3D gir.found() and get_option('introspection')
-=20
- subdir('gdk')
- subdir('gtk')
---=20
-2.30.2
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.37.bb
similarity index 76%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
index 41c189d7f1d..1f01cf549c5 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
@@ -4,9 +4,8 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+=
-${PV}.tar.xz \
            file://opengl.patch \
-           file://0001-meson.build-build-introspection-according-to-opti=
on-.patch \
            "
-SRC_URI[sha256sum] =3D "27a6ef157743350c807ffea59baa1d70226dbede82a5e953=
ffd58ea6059fe691"
+SRC_URI[sha256sum] =3D "6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf=
3d39fe9fe5fb7f57"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.34.1


