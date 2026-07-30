Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F87EC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 14:02:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12520.1785420122189183939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 07:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VIw681m2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96DB21688
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 07:01:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61B463F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785420121; bh=Iurd7y0Ml7kVe5Oxb9HCOFhxazweo0n8CGEji3NcS3Y=;
	h=From:To:Subject:Date:From;
	b=VIw681m2wo10zJBRwap+zKSbRt1rl2y3iEr4cowL2Fnw3V50oEko5lhb/SeSR8D1b
	 0zAOV7VL2rEwypM5yGdx1t29JA4YStMj7rIEHlZnleVs2rlqeqDBcit9O7Bfj1Q0uw
	 bE1Xwh8gLo2kOzaXMKGTTqgTNf15GAI3eR4vA4ng=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: allow building for mingw targets
Date: Thu, 30 Jul 2026 15:01:57 +0100
Message-ID: <20260730140157.2843778-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 14:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242362

The recent upgrade to qemu 11[1] introduced overly-tight COMPATIBLE_HOST
statements that don't allow mingw builds.  Remove the -linux from the
nativesdk-qemu and nativesdk-qemu-helper recipes so that 64-bit mingw
builds of qemu are possible.

[1] oe-core f74d4025afc ("qemu: upgrade 10.2.0 -> 11.0.0")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/me=
ta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index e591cf0f292..e1f343989a5 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Qemu helper scripts"
 LICENSE =3D "GPL-2.0-only"
 # QEMU 11.0.0+ requires a 64-bit host architecture
-COMPATIBLE_HOST =3D "(aarch64|x86_64|ppc64|ppc64le|riscv64|loongarch64|m=
ips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST =3D "(aarch64|x86_64|ppc64|ppc64le|riscv64|loongarch64|m=
ips64|s390x|sparc64).*-.*"
 RDEPENDS:${PN} =3D "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl native=
sdk-python3-logging \
                 "
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index e440d748b25..9ec522124cc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -64,7 +64,7 @@ COMPATIBLE_HOST:riscv32 =3D "null"
=20
 # QEMU 11.0.0+ requires a 64-bit host architecture for emulator builds
 COMPATIBLE_HOST:class-target =3D "(aarch64|x86_64|ppc64|ppc64le|riscv64|=
loongarch64|mips64|s390x|sparc64).*-linux"
-COMPATIBLE_HOST:class-nativesdk =3D "(aarch64|x86_64|ppc64|ppc64le|riscv=
64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-nativesdk =3D "(aarch64|x86_64|ppc64|ppc64le|riscv=
64|loongarch64|mips64|s390x|sparc64).*-.*"
=20
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.=
html
 # upstream states qemu doesn't work without optimization
--=20
2.43.0


