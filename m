Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D783CC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 18:48:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4263.1789498094049616151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 11:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MLgvoqBC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66FB5152B
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 11:48:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAF3D3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789498093; bh=382Id4v8xoW2BgVoRcceg8Jw1wWpEjoc8mw6cDnjITQ=;
	h=From:To:Subject:Date:From;
	b=MLgvoqBCojzgRqCrJ4+L7UVa4BeDYhHeKGTC7HROkfsrCQqvdGA/jKtql5+BIUm2r
	 +f+VJeaQwrZKcCc3djgNTisADQ2s5sp/kD9ik7dfiM879JOS1x3FX4z1zwdmSpR97g
	 RRXLhBZTrrSaT+bOKHhGp/VgWRpkhLB69BpkFwHs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libical: use PACKAGECONFIGS for gobject-introspection and vala support
Date: Tue, 15 Sep 2026 19:48:09 +0100
Message-ID: <20260915184809.1375968-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 18:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245865

No change to the arguments being passed, but makes the recipe easier
to read.  GI_DATA_ENABLED is disabled in native builds so there is no
need for the override.

Remove the assignment of VAPIGEN, cmake finds the binary on its own.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libical/libical_4.0.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libical/libical_4.0.5.bb b/meta/recipes=
-support/libical/libical_4.0.5.bb
index 952e2c60540..edff836dcc4 100644
--- a/meta/recipes-support/libical/libical_4.0.5.bb
+++ b/meta/recipes-support/libical/libical_4.0.5.bb
@@ -19,11 +19,14 @@ inherit cmake pkgconfig gobject-introspection vala gi=
thub-releases
=20
 DEPENDS +=3D "libical-native"
=20
-PACKAGECONFIG ??=3D "icu glib"
+PACKAGECONFIG ??=3D "icu glib \
+                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'intr=
ospection vala', '', d)}"
 PACKAGECONFIG[bdb] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=3DTrue,db"
 PACKAGECONFIG[glib] =3D "-DLIBICAL_GLIB=3DTrue,-DLIBICAL_GLIB=3DFalse,gl=
ib-2.0-native libxml2-native glib-2.0 libxml2"
 # ICU is used for RSCALE (RFC7529) support
 PACKAGECONFIG[icu] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_ICU=3DTrue,icu"
+PACKAGECONFIG[introspection] =3D "-DLIBICAL_GOBJECT_INTROSPECTION=3DON,-=
DLIBICAL_GOBJECT_INTROSPECTION=3DOFF"
+PACKAGECONFIG[vala] =3D "-DLIBICAL_GLIB_VAPI=3DON,-DLIBICAL_GLIB_VAPI=3D=
OFF"
=20
 # No need to use perl-native, the host perl is sufficient.
 EXTRA_OECMAKE +=3D "-DPERL_EXECUTABLE=3D${HOSTTOOLS_DIR}/perl"
@@ -34,9 +37,6 @@ EXTRA_OECMAKE +=3D "-DLIBICAL_GLIB_BUILD_DOCS=3Dfalse"
 # gobject-introspection
 EXTRA_OECMAKE:append:class-target =3D " -DGObjectIntrospection_COMPILER=3D=
${STAGING_BINDIR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target =3D " -DGObjectIntrospection_SCANNER=3D=
${STAGING_BINDIR}/g-ir-scanner-wrapper"
-EXTRA_OECMAKE +=3D "-DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen"
-EXTRA_OECMAKE +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DL=
IBICAL_GOBJECT_INTROSPECTION=3DON -DLIBICAL_GLIB_VAPI=3DON', '-DLIBICAL_G=
OBJECT_INTROSPECTION=3DOFF -DLIBICAL_GLIB_VAPI=3DOFF', d)}"
-EXTRA_OECMAKE:append:class-native =3D " -DLIBICAL_GOBJECT_INTROSPECTION=3D=
OFF -DLIBICAL_GLIB_VAPI=3DOFF"
 # no java
 EXTRA_OECMAKE +=3D "-DLIBICAL_JAVA_BINDINGS=3DFalse"
=20
--=20
2.43.0


