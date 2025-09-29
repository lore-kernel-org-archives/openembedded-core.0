Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718E3CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 17:11:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3968.1759165892692396944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 10:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251D7150C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:11:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C51423F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:11:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-firmware: skip ldflags sanity check
Date: Mon, 29 Sep 2025 18:11:22 +0100
Message-ID: <20250929171125.2170364-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 17:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224159

Some of the firmware blobs, for example qcom/apq8016/modem.mbn, are
actually ELF files. We don't want to hold these to our exacting standard
for link flags because we're not building them and they don't run on the
target directly.

Note that as this check parses the output of ${OBJDUMP} -p it behaves
differently with binutils vs llvm.  It looks like binutils bails early
as it doesn't know what the target architecture is, whereas LLVM is more
comprehensive in its support.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20250917.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 5d5a5c8caee..1b9d1571042 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -2352,7 +2352,10 @@ python populate_packages:prepend () {
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


