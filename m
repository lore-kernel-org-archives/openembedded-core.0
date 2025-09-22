Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78024CAC5AA
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:20:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58440.1758561636577309384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 10:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02D8F236D
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 10:20:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C548D3F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 10:20:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-firmware: skip ldflags sanity check
Date: Mon, 22 Sep 2025 18:20:23 +0100
Message-ID: <20250922172025.184116-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922172025.184116-1-ross.burton@arm.com>
References: <20250922172025.184116-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223834

Some of the firmware blobs, for example qcom/apq8016/modem.mbn, are
actually ELF files. We don't want to hold these to our exacting standard
for link flags because we're not building them and they don't run on the
target directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20250808.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
index be38a8edf35..d5e45e6ed8d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
@@ -2342,7 +2342,10 @@ python populate_packages:prepend () {
=20
 # Firmware files are generally not ran on the CPU, so they can be
 # allarch despite being architecture specific
-INSANE_SKIP =3D "arch"
+INSANE_SKIP +=3D "arch"
+
+# They can also be ELF files, but obviously won't have the linkage we ex=
pect
+INSANE_SKIP +=3D "ldflags"
=20
 # Don't warn about already stripped files
 INSANE_SKIP:${PN} =3D "already-stripped"
--=20
2.43.0


