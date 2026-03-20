Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A127108B919
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11419.1774009660041545513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85BD0165C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F5463F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] pkgconf: ensure pkgconf-native doesn't try and look on the host
Date: Fri, 20 Mar 2026 12:27:27 +0000
Message-ID: <20260320122732.1630715-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233601

Neuter the native build of pkgconf so that it doesn't default to looking
on the build host for .pc files, to avoid accidental host contamination.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_2.5.1.bb
index a8455577f63..277ef9786c4 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -24,6 +24,12 @@ SRC_URI[sha256sum] =3D "cd05c9589b9f86ecf044c10a226982=
2bc9eb001eced2582cfffd658b0a
=20
 inherit autotools pkgconfig
=20
+# Tell the native pkgconf to use directories that don't exist, so we _ne=
ed_ to
+# tell it the paths with environment variables.
+EXTRA_OECONF:append:class-native =3D " --with-pkg-config-dir=3D'/not/exi=
st' \
+                                     --with-system-includedir=3D/not/exi=
st/include \
+                                     --with-system-libdir=3D/not/exist/l=
ib"
+
 do_install:append () {
     # Install a wrapper which deals, as much as possible with pkgconf vs
     # pkg-config compatibility issues.
--=20
2.43.0


