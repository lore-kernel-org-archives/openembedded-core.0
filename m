Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7DFC83F34
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:50:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11793.1753188644885335729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0BC51595;
	Tue, 22 Jul 2025 05:50:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F41373F59E;
	Tue, 22 Jul 2025 05:50:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH 2/2] classes/toolchain/clang: depend on lld-native if ld-is-lld is set
Date: Tue, 22 Jul 2025 13:50:41 +0100
Message-ID: <20250722125041.3301907-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722125041.3301907-1-ross.burton@arm.com>
References: <20250722125041.3301907-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 12:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220742

As lld is no longer part of the clang recipe, also depend on lld-native
if ld-is-lld has been set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/toolchain/clang.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchai=
n/clang.bbclass
index 7c6ed57fb31..76419e510b4 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -27,7 +27,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cro=
ss-canadian =3D "clang-cros
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =3D =
"clang-crosssdk-${SDK_SYS}"
=20
=20
-BASE_DEFAULT_DEPS:append:class-target =3D " compiler-rt libcxx"
+BASE_DEFAULT_DEPS:append:class-target =3D " compiler-rt libcxx ${@bb.uti=
ls.contains('DISTRO_FEATURES', 'ld-is-lld', ' lld-native', '', d)}"
=20
 TUNE_CCARGS +=3D "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " =
--dyld-prefix=3D/usr", "", d)}"
=20
--=20
2.43.0


