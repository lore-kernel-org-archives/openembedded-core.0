Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B888CCA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:45:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17686.1756917902118855198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57B901655
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 09:44:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A0F43F6A8
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 09:45:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nativesdk-sdk-provides-dummy: allow pkgconfig to be installed into SDKs
Date: Wed,  3 Sep 2025 17:44:59 +0100
Message-ID: <20250903164459.2758128-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222877

This recipe is a dummy provider of pkgconfig, but we want our SDKs to
ship a pkgconfig binary if requested as otherwise that's a host tool
that would be required to use the SDK. On Linux that's easily solved,
but meta-mingw/meta-darwin SDKs can't really assume that pkgconfig will
be present on the host.

This behaviour dates back to 2014 when construction of SDKs with RPM
packages was added[1] and notably the same behaviour didn't exist for
ipkg-based SDKs.

[1] oe-core 417b27ce5c1 ("lib/oe/sdk.py: support RpmRootfs")
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/met=
a/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4e..96caf968eef 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -1,8 +1,6 @@
 DUMMYARCH =3D "sdk-provides-dummy-${SDKPKGSUFFIX}"
=20
-DUMMYPROVIDES_PACKAGES =3D "\
-    pkgconfig \
-"
+DUMMYPROVIDES_PACKAGES =3D ""
=20
 DUMMYPROVIDES =3D "\
     /bin/sh \
--=20
2.43.0


