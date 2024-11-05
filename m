Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F18D36122
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:49:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29595.1730836145025019458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 11:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88CEE1063
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4144D3F528
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oe-selftest-image: use explicit IMAGE_FEATURES instead of debug-tweaks
Date: Tue,  5 Nov 2024 19:48:56 +0000
Message-Id: <20241105194857.3351281-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105194857.3351281-1-ross.burton@arm.com>
References: <20241105194857.3351281-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 19:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206750

debug-tweaks is vague and doesn't give any indication that the root user
can login over SSH without a password.  This behaviour is incredibly
dangerous if used unwittingly, so discourage it by using the underlying
features explicitly to spell out exactly what is being done.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/recipes-test/images/oe-selftest-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/met=
a-selftest/recipes-test/images/oe-selftest-image.bb
index 317a0712aaf..0eb40572094 100644
--- a/meta-selftest/recipes-test/images/oe-selftest-image.bb
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "An image used during oe-selftest tests"
=20
 # libudev is needed for deploy mdadm via devtool
 IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-ssh-dropbear=
 libudev"
-IMAGE_FEATURES =3D "debug-tweaks"
+IMAGE_FEATURES =3D "allow-empty-password empty-root-password allow-root-=
login"
=20
 IMAGE_LINGUAS =3D " "
=20
--=20
2.34.1


