Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA71CFD653
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:14:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8110.1767798888827889345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fEtJn8ZP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB0B8C1EC93
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 15:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1891A606F8
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 15:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89C40103C87C4;
	Wed,  7 Jan 2026 16:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767798886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xPLUKIFqo5deg+N2Z5LQ0r3KPyWmbf5Yi5gzt5R6h4c=;
	b=fEtJn8ZPf8x5tIf1q+/DO/UlvXV+zpaCBsWrWKOje9gnyVfmz0j/cNzo0J9sB2Zx8hz4wb
	+rVxOfviZCxybzVQaUXnV+lBjVb/lMmqQ1YKMJM3fjhUqldOGXBax1N/z23RumqGzKV/Lh
	3Hxijbzt/E0PEmwXFbxPqlfeTqmEk9C419Jj8zeVpfUu0wuMQzl2lAgGLCZkVw1bzPNghY
	z2lmCG4RJX5jAWmE4PoHi2QB10ZNjjCVuF/ncqNmEcpBTerr05/E0tWWOqh7nnI0cHm5UY
	Ek2Yy/zigLe9hoXbnfkpoO1BpiwFBuP35T9pofJtHsm3daff3S68z+Vx4/LQLg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 1/2] u-boot: relocate SRC_URI_RISCV into recipe
Date: Wed,  7 Jan 2026 16:14:35 +0100
Message-ID: <20260107151436.964819-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
References: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229005

In a custom u-boot recipe that requires u-boot-common.inc, the config
fragments end up in SRC_URI. However, the custom recipe's FILESPATH does
not contain the path to oe-core's u-boot directory (as expected), which
leads to the error below:

ERROR: .../build/../meta-custom/recipes-bsp/u-boot/u-boot-custom_2025.10.=
bb:
Unable to get checksum for u-boot-custom SRC_URI entry u-boot-riscv-isa_c=
lear.cfg: file could not be found
The following paths were searched:
(...)

Move SRC_URI_RISCV - along with the appends - out of the common
definitions.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 12 ------------
 meta/recipes-bsp/u-boot/u-boot_2025.10.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
index 93ff0ca6ca..08cd189f64 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,18 +16,6 @@ SRCREV =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
=20
 SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Dv${PV}"
=20
-SRC_URI_RISCV =3D "\
-    file://u-boot-riscv-isa_clear.cfg \
-    ${@bb.utils.contains    ("TUNE_FEATURES", "a",      "file://u-boot-r=
iscv-isa_a.cfg", "", d)} \
-    ${@bb.utils.contains    ("TUNE_FEATURES", "f",      "file://u-boot-r=
iscv-isa_f.cfg", "", d)} \
-    ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-r=
iscv-isa_d.cfg", "", d)} \
-    ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-r=
iscv-isa_zbb.cfg", "", d)} \
-    ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-r=
iscv-isa_zicbom.cfg", "", d)} \
-    "
-
-SRC_URI:append:riscv32 =3D "${SRC_URI_RISCV}"
-SRC_URI:append:riscv64 =3D "${SRC_URI_RISCV}"
-
 B =3D "${WORKDIR}/build"
=20
 inherit pkgconfig
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta/recipes-bsp=
/u-boot/u-boot_2025.10.bb
index 25f264c961..5259fd5832 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2025.10.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2025.10.bb
@@ -6,3 +6,15 @@ DEPENDS +=3D "bc-native dtc-native gnutls-native python3=
-pyelftools-native"
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
 SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
+
+SRC_URI_RISCV =3D "\
+    file://u-boot-riscv-isa_clear.cfg \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "a",      "file://u-boot-r=
iscv-isa_a.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "f",      "file://u-boot-r=
iscv-isa_f.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-r=
iscv-isa_d.cfg", "", d)} \
+    ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-r=
iscv-isa_zbb.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-r=
iscv-isa_zicbom.cfg", "", d)} \
+    "
+
+SRC_URI:append:riscv32 =3D "${SRC_URI_RISCV}"
+SRC_URI:append:riscv64 =3D "${SRC_URI_RISCV}"
--=20
2.47.0


