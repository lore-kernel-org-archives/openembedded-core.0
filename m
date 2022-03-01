Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E250FC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 15:25:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9348.1646148340259894677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 07:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21E5C1042
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 07:25:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0BCB3F70D
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 07:25:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package: do_package should depend on binutils
Date: Tue,  1 Mar 2022 15:25:35 +0000
Message-Id: <20220301152535.1958806-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 15:25:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162560

splitdebuginfo() in do_package uses objcopy, but there is no dependency.
It usually gets pulled in via the toolchain but if
INHIBIT_DEFAULT_DEPS=3D"1" there is no dependency on a toolchain, so make
it explicit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f822258150..4b72bf2039 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -53,6 +53,8 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_va=
lues(d, 'PACKAGE_ARCHS')}"
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
 PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
+PACKAGE_DEPENDS:append:class-target =3D " virtual/${TARGET_PREFIX}binuti=
ls"
+PACKAGE_DEPENDS:append:class-nativesdk =3D " virtual/${SDK_PREFIX}binuti=
ls-crosssdk"
=20
=20
 # If your postinstall can execute at rootfs creation time rather than on
--=20
2.25.1


