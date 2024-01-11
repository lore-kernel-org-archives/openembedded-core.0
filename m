Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AC8C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 15:12:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13630.1704985932009890193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 07:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83C352F4
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 07:12:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 572283F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 07:12:11 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xmlcatalog: limit to native recipes only
Date: Thu, 11 Jan 2024 15:12:09 +0000
Message-Id: <20240111151209.2991303-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 15:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193546

From: Ross Burton <ross.burton@arm.com>

The sysroot postinst is explicitly native-only, so use more overrides to
ensure that we don't try to run them outside of native recipes.

Also add a comment so this doesn't get forgotten again, and link to the
related bug.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/xmlcatalog.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/xmlcatalog.bbclass b/meta/classes-recipe=
/xmlcatalog.bbclass
index 5826d0a8b51..70f95e2a454 100644
--- a/meta/classes-recipe/xmlcatalog.bbclass
+++ b/meta/classes-recipe/xmlcatalog.bbclass
@@ -4,13 +4,17 @@
 # SPDX-License-Identifier: MIT
 #
=20
-DEPENDS =3D "libxml2-native"
+# Note that this recipe only handles XML catalogues in the native sysroo=
t, and doesn't
+# yet support catalogue management in the target sysroot or on the targe=
t itself.
+# (https://bugzilla.yoctoproject.org/13271)
=20
 # A whitespace-separated list of XML catalogs to be registered, for exam=
ple
 # "${sysconfdir}/xml/docbook-xml.xml".
 XMLCATALOGS ?=3D ""
=20
-SYSROOT_PREPROCESS_FUNCS:append =3D " xmlcatalog_sstate_postinst"
+DEPENDS:append:class-native =3D " libxml2-native"
+
+SYSROOT_PREPROCESS_FUNCS:append:class-native =3D " xmlcatalog_sstate_pos=
tinst"
=20
 xmlcatalog_complete() {
 	ROOTCATALOG=3D"${STAGING_ETCDIR_NATIVE}/xml/catalog"
--=20
2.34.1


