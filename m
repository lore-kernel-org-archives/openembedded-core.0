Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4166EC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:25:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21990.1691684700085689283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36DE1113E;
	Thu, 10 Aug 2023 09:25:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E53A3F6C4;
	Thu, 10 Aug 2023 09:24:59 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 8/9] python3-pygobject: add explicit check for qemu-usermode MACHINE_FEATURE
Date: Thu, 10 Aug 2023 17:24:50 +0100
Message-Id: <20230810162451.1766532-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810162451.1766532-1-ross.burton@arm.com>
References: <20230810162451.1766532-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185809

From: Ross Burton <ross.burton@arm.com>

When building for the target this recipe absolutely needs
gobject-introspection to be enabled, so add an explict
---
 meta/recipes-devtools/python/python3-pygobject_3.44.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.44.1.bb
index 6f7d9a09ecd..797a7cec8ba 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
@@ -8,9 +8,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076=
e631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D ""
=20
-inherit gnomebase setuptools3-base gobject-introspection upstream-versio=
n-is-even features_check
+inherit gnomebase setuptools3-base gobject-introspection upstream-versio=
n-is-even
=20
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+python() {
+    if d.getVar('CLASSOVERRIDE') =3D=3D "class-target" and not bb.utils.=
to_boolean(d.getVar("GI_DATA_ENABLED")):
+        raise bb.parse.SkipRecipe("GI not available")
+}
=20
 DEPENDS +=3D "python3 glib-2.0"
=20
--=20
2.34.1


