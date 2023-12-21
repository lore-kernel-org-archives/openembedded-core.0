Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F947C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:02:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56203.1703178122171559600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D6F1042
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 534E23F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:01 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] nativesdk: don't unset MACHINE_FEATURES, let machine-sdk/ set it
Date: Thu, 21 Dec 2023 17:01:58 +0000
Message-Id: <20231221170159.1995650-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221170159.1995650-1-ross.burton@arm.com>
References: <20231221170159.1995650-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 17:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192841

From: Ross Burton <ross.burton@arm.com>

There is actually a use for nativesdk MACHINE_FEATURES; for example
qemu-usermode being supported, as this is needed to build profile-guided
optimised code.

We shouldn't use the target MACHINE_FEATURES for this because the target
and the SDK can be entirely different, so instead set the
MACHINE_FEATURES in nativesdk.bbclass to SDK_MACHINE_FEATURES (which
defaults to "") and let the conf/machine-sdk/*.conf files set that as
appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/nativesdk.bbclass | 2 +-
 meta/conf/bitbake.conf                | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
index ccaf411f0d7..de6debda93c 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -16,7 +16,7 @@ LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
 CLASSOVERRIDE =3D "class-nativesdk"
 MACHINEOVERRIDES =3D ""
=20
-MACHINE_FEATURES =3D ""
+MACHINE_FEATURES =3D "${SDK_MACHINE_FEATURES}"
 DISTRO_FEATURES_BACKFILL =3D ""
 MACHINE_FEATURES_BACKFILL =3D ""
=20
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 83b12cbc158..ebfd297430a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -892,6 +892,8 @@ OES_BITBAKE_CONF =3D "1"
 ##################################################################
=20
 MACHINE_FEATURES ?=3D ""
+SDK_MACHINE_FEATURES ?=3D ""
+
 DISTRO_FEATURES ?=3D ""
=20
 DISTRO_EXTRA_RDEPENDS ?=3D ""
--=20
2.34.1


