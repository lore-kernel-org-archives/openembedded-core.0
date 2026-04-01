Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6371076387
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 17:01:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18207.1775062890743655376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 10:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WVyKRb3O;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7769C1596
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 10:01:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F162B3F7D8
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775062890; bh=aMIBtEoR1YJNKwMZvyKNVbN13CwhI1PjrqpjFR0BL94=;
	h=From:To:Subject:Date:From;
	b=WVyKRb3OWlJEAyWU5FHaf1pYM1VzpxcOPCBXPVHhMPihPs0oXgxqRJCxUTkV/N1g/
	 vjnwGOJ9IoOw4Y7Py9W8GcaJ+IhL+sXtKp2YGxDOy02E0VWTtoEG1IP5rK7B6mReeG
	 JiUjqfvO+SfV1TlTsWLtR/xXd/a1WfdtiAUw3NTs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fragments/sbom-cve-check: inherit create-spdx
Date: Wed,  1 Apr 2026 18:01:26 +0100
Message-ID: <20260401170126.2869064-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234449

The sbom-cve-check integration is dependent on SPDX being generated, so
add it to INHERIT in this fragment to ensure that it has been.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/fragments/yocto/sbom-cve-check.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/fr=
agments/yocto/sbom-cve-check.conf
index a3f229acf28..73ed35be270 100644
--- a/meta/conf/fragments/yocto/sbom-cve-check.conf
+++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
@@ -7,8 +7,12 @@ BB_CONF_FRAGMENT_DESCRIPTION =3D "Enables sbom-cve-check=
 and applies the following
    allowing CVEs to be excluded if the source is not compiled. \
 "
=20
+INHERIT +=3D "create-spdx"
+
 IMAGE_CLASSES:append =3D " sbom-cve-check"
+
 SRCREV:pn-sbom-cve-check-update-nvd-native =3D "${AUTOREV}"
 SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "${AUTOREV}"
+
 SPDX_INCLUDE_VEX =3D "all"
 SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
--=20
2.43.0


