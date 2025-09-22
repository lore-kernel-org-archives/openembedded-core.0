Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70386CAC5AD
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:21:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53221.1758550861503459510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 07:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA31F236D
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:20:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 959E13F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:21:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libdnf: remove obsolete gobject-introspection support
Date: Mon, 22 Sep 2025 15:20:29 +0100
Message-ID: <20250922142031.3625684-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922142031.3625684-1-ross.burton@arm.com>
References: <20250922142031.3625684-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223827

The intention to remove G-I support was stated in [1] and the last few
pieces removed in [2], which were part of 0.15.0.

[1] libdnf a4abd42a ("Move libcheck dependency to tests/")
[2] libdnf e2f2862b ("[swdb]: C++ implementation with SWIG bindings.")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.74.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.74.0.bb
index 0dce8dc183b..aa9e18e763f 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -19,16 +19,12 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(?!4\.90)\d+=
(\.\d+)+)"
=20
 DEPENDS =3D "glib-2.0 libsolv librepo rpm gtk-doc libmodulemd json-c swi=
g-native util-linux"
=20
-inherit gtk-doc gobject-introspection cmake pkgconfig setuptools3-base
+inherit gtk-doc cmake pkgconfig setuptools3-base
=20
 EXTRA_OECMAKE =3D " -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} -D=
WITH_MAN=3DOFF -DPYTHON_DESIRED=3D3 \
-                  ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWIT=
H_GIR=3DON', '-DWITH_GIR=3DOFF', d)} \
                   -DWITH_TESTS=3DOFF \
                   -DWITH_ZCHUNK=3DOFF \
                   -DWITH_HTML=3DOFF \
                 "
-EXTRA_OECMAKE:append:class-native =3D " -DWITH_GIR=3DOFF"
-EXTRA_OECMAKE:append:class-nativesdk =3D " -DWITH_GIR=3DOFF"
-
 BBCLASSEXTEND =3D "native nativesdk"
 SKIP_RECIPE[libdnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'packa=
ge_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due d=
isabled rpm support in libsolv', d)}"
--=20
2.43.0


