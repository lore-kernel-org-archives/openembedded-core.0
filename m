Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6BAC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:02:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9848.1667923331305524817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D07E423A;
	Tue,  8 Nov 2022 08:02:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 103E03F73D;
	Tue,  8 Nov 2022 08:02:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] linux-firmware: don't put the firmware into the sysroot
Date: Tue,  8 Nov 2022 16:02:07 +0000
Message-Id: <20221108160207.3800143-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172972

There's no need to have linux-firmware in the sysroot. The sysroot won't
ever be used anyway as nothing needs the firmware at build-time, but this
saves us building a ~900MB sysroot (~300MB sstate tarball).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
index 6ba59a34c2f..c7ecee0d9a8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
@@ -1121,3 +1121,6 @@ INSANE_SKIP =3D "arch"
=20
 # Don't warn about already stripped files
 INSANE_SKIP:${PN} =3D "already-stripped"
+
+# No need to put firmware into the sysroot
+SYSROOT_DIRS_IGNORE +=3D "${nonarch_base_libdir}/firmware"
--=20
2.34.1


