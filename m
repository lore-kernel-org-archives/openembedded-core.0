Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24807E81BB7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46676.1770641792953116393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5741339
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:25 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5BB43F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/9] pkgconfig: inherit the pkgconfig class
Date: Mon,  9 Feb 2026 12:56:19 +0000
Message-ID: <20260209125628.640221-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230788

Building target pkgconfig needs pkgconfig-native because pkgconfig uses
pkgconfig to find libglib.  Inherit the pkgconfig class so that the
pkgconfig recipe does not need to know the details of how pkgconfig is
integrated.

Native builds use an internal copy of glib to avoid the circular
dependency, and the self-dependency on pkgconfig-native is automatically
pruned.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
index 19b9b6bc9d..d4350be212 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/pkg-config/pk=
g-config.git;branch=3Dmaster;
 		   file://0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.pa=
tch \
            "
=20
-inherit autotools
+inherit autotools pkgconfig
=20
 # Because of a faulty test, the current auto mode always evaluates to no=
,
 # so just continue that behaviour.
@@ -29,7 +29,7 @@ EXTRA_OECONF +=3D "--disable-indirect-deps"
 PACKAGECONFIG ??=3D "glib"
 PACKAGECONFIG:class-native =3D ""
=20
-PACKAGECONFIG[glib] =3D "--without-internal-glib,--with-internal-glib,gl=
ib-2.0 pkgconfig-native"
+PACKAGECONFIG[glib] =3D "--without-internal-glib,--with-internal-glib,gl=
ib-2.0"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.43.0


