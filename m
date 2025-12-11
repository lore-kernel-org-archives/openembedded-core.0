Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA60D41D7B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:56:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16027.1765475793858602989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 371C71063
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:56:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1831C3F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:56:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/8] classes/meson: clean up path arguments
Date: Thu, 11 Dec 2025 17:55:44 +0000
Message-ID: <20251211175547.3944470-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211175547.3944470-1-ross.burton@arm.com>
References: <20251211175547.3944470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227556

The --bindir (etc.) arguments can be absolute paths, so there's no need
to work out the relative paths and we can instead pass them directly.

Also re-order the options to match the order in the Meson manual, for
ease of checking that we pass all the paths that Meson uses.

Notably, we don't set --licensedir, but we handle license manifests
ourselves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 4cf5de6753e..0709a1313a4 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -25,24 +25,22 @@ MESON_TARGET ?=3D ""
 # Since 0.60.0 you can specify custom tags to install
 MESON_INSTALL_TAGS ?=3D ""
=20
-def noprefix(var, d):
-    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
-
 MESON_BUILDTYPE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain=
', d)}"
 MESON_BUILDTYPE[vardeps] +=3D "DEBUG_BUILD"
-MESONOPTS =3D " --prefix ${prefix} \
-              --buildtype ${MESON_BUILDTYPE} \
-              --bindir ${@noprefix('bindir', d)} \
-              --sbindir ${@noprefix('sbindir', d)} \
-              --datadir ${@noprefix('datadir', d)} \
-              --libdir ${@noprefix('libdir', d)} \
-              --libexecdir ${@noprefix('libexecdir', d)} \
-              --includedir ${@noprefix('includedir', d)} \
-              --mandir ${@noprefix('mandir', d)} \
-              --infodir ${@noprefix('infodir', d)} \
-              --sysconfdir ${sysconfdir} \
+
+MESONOPTS =3D " --buildtype ${MESON_BUILDTYPE} \
+              --prefix ${prefix} \
+              --bindir ${bindir} \
+              --datadir ${datadir} \
+              --includedir ${includedir} \
+              --infodir ${infodir} \
+              --libdir ${libdir} \
+              --libexecdir ${libexecdir} \
               --localstatedir ${localstatedir} \
+              --mandir ${mandir} \
+              --sbindir ${sbindir} \
               --sharedstatedir ${sharedstatedir} \
+              --sysconfdir ${sysconfdir} \
               --wrap-mode nodownload \
               --native-file ${WORKDIR}/meson.native"
=20
--=20
2.43.0


