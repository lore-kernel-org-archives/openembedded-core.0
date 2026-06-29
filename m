Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C3C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 15:39:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34.1782747586797111064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 08:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nyxl8Gjh;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4CAE1650
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:39:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C75E63F673
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782747586; bh=5FL45DFzzV4+m31cJ5D/jBsweEVHkCWHax+yHxmF+Jw=;
	h=From:To:Subject:Date:From;
	b=nyxl8Gjh2+FxaQhXT36hMc7Aj//KLRw6Ewgd2J5HDOW7mXId0POVQZUT0hY9l9RCa
	 3kwXFBBN9NsNl2Qyd+04jom7WUrEWhdArb3/phYHxTrrgYFzz/aZYswrc38BNxxopC
	 A94N6KhxAkwAOyTY4OqqXA0lbeLoxViXSXSKxEfY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: refresh gio-querymodules install path patch
Date: Mon, 29 Jun 2026 16:39:42 +0100
Message-ID: <20260629153942.2661497-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239811

This patch was badly rebased onto upstream changes and ended up setting
install_dir twice. Refresh the patch to change the existing value
instead of adding another.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...nstall-gio-querymodules-as-libexec_PROGRAM.patch | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodul=
es-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Insta=
ll-gio-querymodules-as-libexec_PROGRAM.patch
index 18d69c4a43e..6211c31c8f8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-l=
ibexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-l=
ibexec_PROGRAM.patch
@@ -16,11 +16,12 @@ diff --git a/gio/meson.build b/gio/meson.build
 index a3e6f18..c7da257 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1071,6 +1071,7 @@ gio_querymodules =3D executable('gio-querymodules'=
, 'gio-querymodules.c', 'giomodu
+@@ -1067,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+
+ gio_querymodules =3D executable('gio-querymodules', 'gio-querymodules.c=
', 'giomodule-priv.c',
+   install : true,
+-  install_dir : multiarch_bindir,
++  install_dir : glib_libexecdir,
+   install_tag : 'bin',
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
-   link_args : noseh_link_args,
-+  install_dir: glib_libexecdir,
-   dependencies : [libgio_dep, libgobject_dep, libgmodule_dep, libglib_d=
ep, app_profile_dep])
-=20
- glib_compile_schemas =3D executable('glib-compile-schemas',
--=20
2.43.0


