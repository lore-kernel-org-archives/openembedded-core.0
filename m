Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDEDC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 15:05:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6210.1647011134010338260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 07:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 173D0175A
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 07:05:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B809E3F7F5
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 07:05:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] setuptools3-base: improve RDEPENDS assignment
Date: Fri, 11 Mar 2022 15:05:30 +0000
Message-Id: <20220311150530.3488995-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 15:05:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163056

Use :append instead of +=3D so that recipes can assign to RDEPENDS:${PN}.
This fixes missing RDEPENDS for sixteen recipes in oe-core alone.

Also instead of using obscure inline Python we can just use the
class-target override.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools3-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/setuptools3-base.bbclass b/meta/classes/setupto=
ols3-base.bbclass
index 5098ae9d64..15abe1dd63 100644
--- a/meta/classes/setuptools3-base.bbclass
+++ b/meta/classes/setuptools3-base.bbclass
@@ -1,6 +1,6 @@
 DEPENDS:append:class-target =3D " ${PYTHON_PN}-native ${PYTHON_PN}"
 DEPENDS:append:class-nativesdk =3D " ${PYTHON_PN}-native ${PYTHON_PN}"
-RDEPENDS:${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
+RDEPENDS:${PN}:append:class-target =3D " ${PYTHON_PN}-core"
=20
 export STAGING_INCDIR
 export STAGING_LIBDIR
--=20
2.25.1


