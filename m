Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104DDC98324
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 12:48:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7367.1790340513452981773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 05:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AjFfALKm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B94B169C;
	Fri, 25 Sep 2026 05:48:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 683ED3F86C;
	Fri, 25 Sep 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790340512; bh=HEmsde4QrH60HwFwpbaMyBkDl64+jqX5fbeibL7QXoA=;
	h=From:To:Cc:Subject:Date:From;
	b=AjFfALKmOF3vgl+94kDdNSQul4RAhCb/RowxltQlUNmZpcZBS8E9f4baHjE4EB6sS
	 ZoUo1iEWQ864wwAz1F6C6e9GaFIcNhuIOFZPfoTgFLNMvVF6ARqGxuNc0ID4AVTIwL
	 cYSiH9KBCaarrMfejUuWw5J19J7gupHMTPIdYHpA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [PATCH 1/2] linux-yocto-dev: drop DeviceTree validation dependencies
Date: Fri, 25 Sep 2026 13:48:24 +0100
Message-ID: <20260925124825.1868909-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 12:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246617

The mandatory DeviceTree schema checking was added in 5.16-rc4[1] but it
was reverted in 5.16-rc5[2], so drop it from from linux-yocto-dev.bb.

Note that linux-yocto.bb went from 5.15 to 5.19, so this change never
impacted that recipe.

[1] linux 53182e81f47d4 ("kbuild: Enable DT schema checks for %.dtb targe=
ts")
[2] linux 75e895343d5a2 ("Revert "kbuild: Enable DT schema checks for %.d=
tb targets"")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
index 03999c5318a..be5a33bdd61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -35,16 +35,6 @@ PV =3D "${LINUX_VERSION}+git"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
-# yaml and dtschema are required for 5.16+ device tree validation, libya=
ml is checked
-# via pkgconfig, so must always be present, but we can wrap the others t=
o make them
-# conditional
-DEPENDS +=3D "libyaml-native"
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[dt-validation] =3D ",,python3-dtschema-native"
-# we need the wrappers if validation isn't in the packageconfig
-DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '',=
 'python3-dtschema-wrapper-native', d)}"
-
 COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qe=
mumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
=20
 KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
--=20
2.43.0


