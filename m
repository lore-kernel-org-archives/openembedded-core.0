Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BC0E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:02:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18004.1736514173011133834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA4731E32
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 05:03:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D1C93F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 05:02:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] classes/qemu: move QEMU_EXTRAOPTIONS for PPC to the relevant tunes
Date: Fri, 10 Jan 2025 13:01:14 +0000
Message-ID: <20250110130116.894607-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110130116.894607-1-ross.burton@arm.com>
References: <20250110130116.894607-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 13:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209648

Every other architecture has the QEMU_EXTRAOPTIONS assignments in the
tune files, so move the PPC ones too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/qemu.bbclass                     | 9 ---------
 meta/conf/machine/include/powerpc/arch-powerpc64.inc | 1 +
 meta/conf/machine/include/powerpc/tune-ppc7400.inc   | 1 +
 meta/conf/machine/include/powerpc/tune-ppce500mc.inc | 1 +
 meta/conf/machine/include/powerpc/tune-ppce500v2.inc | 1 +
 meta/conf/machine/include/powerpc/tune-ppce5500.inc  | 2 ++
 meta/conf/machine/include/powerpc/tune-ppce6500.inc  | 2 ++
 7 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.=
bbclass
index 8d7c82668b4..42a39dd0599 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -62,12 +62,3 @@ def qemu_run_binary(data, rootfs_path, binary):
=20
 QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('TUNE_PKGARCH')) or ""}"
 QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
-
-QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
-QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
-QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/=
conf/machine/include/powerpc/arch-powerpc64.inc
index 2533151869b..af0635a641f 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -21,3 +21,4 @@ TUNE_FEATURES:tune-powerpc64le =3D "m64 fpu-hard"
 BASE_LIB:tune-powerpc64le =3D "lib64"
 TUNE_PKGARCH:tune-powerpc64le =3D "powerpc64le"
 PACKAGE_EXTRA_ARCHS:tune-powerpc64le =3D "powerpc64le"
+QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc b/meta/co=
nf/machine/include/powerpc/tune-ppc7400.inc
index 49b94f5ee1c..6d3c158bbb5 100644
--- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
@@ -9,3 +9,4 @@ AVAILTUNES +=3D "ppc7400"
 TUNE_FEATURES:tune-ppc7400 =3D "m32 fpu-hard ppc7400 altivec bigendian"
 TUNE_PKGARCH:tune-ppc7400 =3D "ppc7400"
 PACKAGE_EXTRA_ARCHS:tune-ppc7400 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc=
} ppc7400"
+QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc b/meta/=
conf/machine/include/powerpc/tune-ppce500mc.inc
index 036f8b26315..8c4630b368c 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
@@ -9,6 +9,7 @@ AVAILTUNES +=3D "ppce500mc"
 TUNE_FEATURES:tune-ppce500mc =3D "m32 fpu-hard ppce500mc bigendian"
 TUNE_PKGARCH:tune-ppce500mc =3D "ppce500mc"
 PACKAGE_EXTRA_ARCHS:tune-ppce500mc =3D "${PACKAGE_EXTRA_ARCHS:tune-power=
pc} ppce500mc"
+QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
=20
 # pass -mcpu=3De500mc for ppce500mc kernel cross compile
 TARGET_CC_KERNEL_ARCH =3D "-mcpu=3De500mc"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500v2.inc b/meta/=
conf/machine/include/powerpc/tune-ppce500v2.inc
index 461164d818f..204580ee15a 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
@@ -18,3 +18,4 @@ AVAILTUNES +=3D "ppce500v2"
 TUNE_FEATURES:tune-ppce500v2 =3D "m32 ppce500v2 bigendian"
 TUNE_PKGARCH:tune-ppce500v2 =3D "ppce500v2"
 PACKAGE_EXTRA_ARCHS:tune-ppce500v2 =3D "ppce500v2"
+QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/c=
onf/machine/include/powerpc/tune-ppce5500.inc
index 4915b81ee4d..8976c1612fd 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
@@ -10,11 +10,13 @@ TUNE_FEATURES:tune-ppce5500 =3D "m32 fpu-hard e5500 b=
igendian"
 BASE_LIB:tune-ppce5500 =3D "lib"
 TUNE_PKGARCH:tune-ppce5500 =3D "ppce5500"
 PACKAGE_EXTRA_ARCHS:tune-ppce5500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerp=
c} ppce5500"
+QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e500mc"
=20
 TUNE_FEATURES:tune-ppc64e5500 =3D "m64 fpu-hard e5500 bigendian"
 BASE_LIB:tune-ppc64e5500 =3D "lib64"
 TUNE_PKGARCH:tune-ppc64e5500 =3D "ppc64e5500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powe=
rpc64} ppc64e5500"
+QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e500mc"
=20
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D "${@bb.utils.contains('T=
UNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/c=
onf/machine/include/powerpc/tune-ppce6500.inc
index f6310ab4c44..b0efe1924c5 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
@@ -10,11 +10,13 @@ TUNE_FEATURES:tune-ppce6500 =3D "m32 fpu-hard e6500 a=
ltivec bigendian"
 BASE_LIB:tune-ppce6500 =3D "lib"
 TUNE_PKGARCH:tune-ppce6500 =3D "ppce6500"
 PACKAGE_EXTRA_ARCHS:tune-ppce6500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerp=
c} ppce6500"
+QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
=20
 TUNE_FEATURES:tune-ppc64e6500 =3D "m64 fpu-hard e6500 altivec bigendian"
 BASE_LIB:tune-ppc64e6500 =3D "lib64"
 TUNE_PKGARCH:tune-ppc64e6500 =3D "ppc64e6500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powe=
rpc64} ppc64e6500"
+QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
=20
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D "${@bb.utils.contains('T=
UNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
--=20
2.43.0


