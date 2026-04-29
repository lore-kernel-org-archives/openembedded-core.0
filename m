Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE516CD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.931.1777481312092712271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=S/V93ugZ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B4D33EA
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BDEE3F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481311; bh=TDBYjBCoe68rGO/sn/P1z8FVavhpkxlnPAXbNaQ5TBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S/V93ugZh4JzywxO+LWy+fi5oqvEYFXsYFgmxEyGkAC1D2WXL5tvch55rUXYLpgft
	 eJPPY7ViXK8VAL53MYoNz+2btu9Ah0VOHtocKSnBTYQJe9OQWB/PY7omaFXK5Kcj/D
	 YmK+sDxo1Ihb0swL+3wIO1nwXOXtE26E2gPTMfy4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] linux-firmware: delink some tegra firmware to avoid pulling in full nvidia firmware
Date: Wed, 29 Apr 2026 17:48:18 +0100
Message-ID: <20260429164821.3425757-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236119

Some Nvidia firmware is shared between products but the symlinks cross
product/driver boundaries, resulting in the -nvidia-tegra package
depending on the ~150MB -nvidia-gpu package for a few 10kb files.

If we replace the symlinks with the actual content of the files then this
dependency disappears.

linux-firmware/linux-firmware-nvidia-tegra: RDEPENDS: removed "linux-firm=
ware-nvidia-gpu"

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20260410.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
index cdd16ba33db..6bb6034d6c7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
@@ -511,6 +511,14 @@ do_install() {
                         path_to_file=3D$(dirname $path_to_file)
                 done
         done
+
+        # Some Nvidia firmware is shared but the symlinks cross product/=
driver boundaries,
+        # resulting in the -nvidia-tegra package depending on the ~150MB=
 -nvidia-gpu package
+        # for a single 10kb file.
+        # Replace these symlinks with duplicates of the files to avoid t=
his.
+        for symlink in $(find ${D}${firmwaredir}/nvidia/g*b/gr/ -type l =
-name sw_\*_init.bin); do
+          cp --remove-destination "$(readlink -f $symlink)" $symlink
+        done
 }
=20
 PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
--=20
2.43.0


