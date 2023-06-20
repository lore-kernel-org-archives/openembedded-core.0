Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42307EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:04:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8471.1687262657721927506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 05:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5661063;
	Tue, 20 Jun 2023 05:05:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5ACDF3F71E;
	Tue, 20 Jun 2023 05:04:16 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] python3-dbusmock: only recommend python3-pygobject
Date: Tue, 20 Jun 2023 13:04:11 +0100
Message-Id: <20230620120411.3772623-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 12:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183132

From: Ross Burton <ross.burton@arm.com>

dbusmock doesn't actually hard-depend on pygobject, some of the templates
use it but it isn't mandatory.

Change the RDEPENDS to RRECOMMENDS, and only recommend if g-i is enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb b/me=
ta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
index 32a43e00b99..64e0ae88113 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
@@ -13,9 +13,10 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-dbus \
-    ${PYTHON_PN}-pygobject \
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
     "
=20
+RRECOMMENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-=
introspection-data', '${MLPREFIX}${PYTHON_PN}-pygobject', '', d)}"
+
 BBCLASSEXTEND =3D "native"
--=20
2.34.1


