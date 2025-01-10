Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF2AE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:13:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18250.1736514791343335455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D2291063
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 05:13:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 911173F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 05:13:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH scarthgap] classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package architecture
Date: Fri, 10 Jan 2025 13:13:04 +0000
Message-ID: <20250110131304.923187-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 13:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209651

Using the package architecture to select the right qemu options to pass
to qemu-user is incorrect, and fails for recipes that set PACKAGE_ARCH
to MACHINE_ARCH (as the qemuppc workarounds suggest) because there are
not typically any options set for the machine name.

Solve this by using TUNE_PKGARCH instead: for the majority of recipes
this is the same value, but for machine-specific recipes it remains the
same instead of changing to the machine name.

This means we can remove the qemuppc workarounds, as they're obsolete.

Also update the gcc-testsuite recipe which uses the same pattern to use
TUNE_PKGARCH, and generalise the else codepath to avoid needing to
update the list of architectures.

[ YOCTO #15647 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/qemu.bbclass            | 8 ++------
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.=
bbclass
index dbb5ee0b666..8d7c82668b4 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -60,8 +60,8 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, sin=
ce the
 # qemu-arm default CPU supports all required architecture levels.
=20
-QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('PACKAGE_ARCH')) or ""}"
-QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
+QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
=20
 QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
@@ -71,7 +71,3 @@ QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
 QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
-# Some packages e.g. fwupd sets PACKAGE_ARCH =3D MACHINE_ARCH and uses m=
eson which
-# needs right options to usermode qemu
-QEMU_EXTRAOPTIONS_qemuppc =3D " -cpu 7400"
-QEMU_EXTRAOPTIONS_qemuppc64 =3D " -cpu POWER9"
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-d=
evtools/gcc/gcc-testsuite.inc
index f16d471478c..eb9ddead08f 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -53,8 +53,8 @@ python check_prepare() {
         #   - valid for x86*, powerpc, arm, arm64
         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
             args +=3D ["-cpu", "max"]
-        elif qemu_binary.endswith(("ppc", "mips", "mips64")):
-            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAG=
E_ARCH'))
+        else:
+            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_P=
KGARCH'))
             if extra:
                 args +=3D extra.split()
         # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) h=
owever they either have MSA
--=20
2.43.0


