Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636E0C3ABD4
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6622.1746866652789275179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8103D153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C9CA3F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/23] core-image-sato: fix SDK dependency on glib
Date: Sat, 10 May 2025 09:43:45 +0100
Message-ID: <20250510084400.269726-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216260

Adding nativesdk-glib-2.0 to the SDK isn't actually very useful as that
is just the library and not the ancillery tools (since [1]).

Switch the dependency to glib-2.0-utils so that the host-side tools are
available in SDKs.

[1] oe-core b649cf5c09a ("glib-2.0: add dependencies to fix ptest failure=
s")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-s=
ato/images/core-image-sato.bb
index 9200ae54401..5ff35d772c1 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -10,8 +10,8 @@ LICENSE =3D "MIT"
=20
 inherit core-image
=20
-TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool nativesdk-glib-2.0"
-TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D " nativesdk-intltoo=
l nativesdk-glib-2.0"
+TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool nativesdk-glib-2.0-u=
tils"
+TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D " nativesdk-intltoo=
l nativesdk-glib-2.0-utils"
=20
 QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", =
"-m 256", d)}'
 QB_MEM:qemuarmv5 =3D "-m 256"
--=20
2.43.0


