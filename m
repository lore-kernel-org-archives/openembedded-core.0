Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D206C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 21:46:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6280.1678311998104691613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 13:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 243F2FEC;
	Wed,  8 Mar 2023 13:47:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 394F83F67D;
	Wed,  8 Mar 2023 13:46:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] meson: remove obsolete RPATH stripping patch
Date: Wed,  8 Mar 2023 21:46:35 +0000
Message-Id: <20230308214635.3767034-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 21:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178201

As per the release notes for 0.55.0[1], this patch is no longer needed
as Meson now only removes the RPATHs that it adds itself, any RPATHs
added via LDFLAGS or pkgconfig files are left untouched.

[1] https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-no=
w-more-careful

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../meson/meson/disable-rpath-handling.patch  | 37 -------------------
 meta/recipes-devtools/meson/meson_1.0.1.bb    |  1 -
 2 files changed, 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/disable-rpath-handl=
ing.patch

diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.pat=
ch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
deleted file mode 100644
index 7aaed8b4a38..00000000000
--- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 18600f7a1cddf23aeabd188f86e66983f27ccfe3 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 23 Nov 2018 15:28:28 +0000
-Subject: [PATCH] meson: Disable rpath stripping at install time
-
-We need to allow our rpaths generated through the compiler flags to make=
 it into
-our binaries. Therefore disable the meson manipulations of these unless =
there
-is a specific directive to do something differently in the project.
-
-RP 2018/11/23
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2=
567]
----
- mesonbuild/minstall.py | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 7d0da13..17d50db 100644
---- a/mesonbuild/minstall.py
-+++ b/mesonbuild/minstall.py
-@@ -718,8 +718,11 @@ class Installer:
-             if file_copied:
-                 self.did_install_something =3D True
-                 try:
--                    self.fix_rpath(outname, t.rpath_dirs_to_remove, ins=
tall_rpath, final_path,
--                                   install_name_mappings, verbose=3DFal=
se)
-+                    if install_rpath:
-+                        self.fix_rpath(outname, t.rpath_dirs_to_remove,=
 install_rpath, final_path,
-+                                       install_name_mappings, verbose=3D=
False)
-+                    else:
-+                        print("RPATH changes at install time disabled")
-                 except SystemExit as e:
-                     if isinstance(e.code, int) and e.code =3D=3D 0:
-                         pass
---=20
-2.20.1
-
diff --git a/meta/recipes-devtools/meson/meson_1.0.1.bb b/meta/recipes-de=
vtools/meson/meson_1.0.1.bb
index ce12a3126bc..fd478b21612 100644
--- a/meta/recipes-devtools/meson/meson_1.0.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.0.1.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://meson-setup.py \
            file://meson-wrapper \
            file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
-           file://disable-rpath-handling.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch =
\
--=20
2.34.1


