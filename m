Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E24C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:02:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17966.1736514173673593222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 825311477
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 05:03:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D948A3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 05:02:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] qemu/machine: rename QEMU_EXTRAOPTIONS for consistency
Date: Fri, 10 Jan 2025 13:01:15 +0000
Message-ID: <20250110130116.894607-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110130116.894607-1-ross.burton@arm.com>
References: <20250110130116.894607-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 13:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209649

The per-tune qemu options variable is QEMU_EXTRAOPTIONS_${TUNE_PKGARCH},
but this doesn't follow the pattern of all of the other tune-specific
variables in the machine configuration which is VARIABLE:tune-[name].

Rename QEMU_EXTRAOPTIONS_${TUNE_PKGARCH} to
QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH} for consistency.

Note that this will mean that BSPs need to update any assignments of
this variable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/qemu.bbclass              |  4 ++--
 .../machine/include/mips/tune-mips-24k.inc    | 12 +++++-----
 .../machine/include/mips/tune-mips-74k.inc    |  8 +++----
 .../machine/include/mips/tune-mips64r2.inc    | 24 +++++++++----------
 .../include/powerpc/arch-powerpc64.inc        |  2 +-
 .../machine/include/powerpc/tune-ppc7400.inc  |  2 +-
 .../include/powerpc/tune-ppce500mc.inc        |  2 +-
 .../include/powerpc/tune-ppce500v2.inc        |  2 +-
 .../machine/include/powerpc/tune-ppce5500.inc |  4 ++--
 .../machine/include/powerpc/tune-ppce6500.inc |  4 ++--
 meta/conf/machine/include/x86/tune-core2.inc  |  6 ++---
 meta/conf/machine/include/x86/tune-corei7.inc |  6 ++---
 .../machine/include/x86/tune-x86-64-v3.inc    |  4 ++--
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |  2 +-
 14 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.=
bbclass
index 42a39dd0599..e9fe757c7f7 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -60,5 +60,5 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, sin=
ce the
 # qemu-arm default CPU supports all required architecture levels.
=20
-QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s"=
 % d.getVar('TUNE_PKGARCH')) or ""}"
-QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
+QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tun=
e-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
diff --git a/meta/conf/machine/include/mips/tune-mips-24k.inc b/meta/conf=
/machine/include/mips/tune-mips-24k.inc
index 106ff62fbb5..ec4e53f63f1 100644
--- a/meta/conf/machine/include/mips/tune-mips-24k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-24k.inc
@@ -22,15 +22,15 @@ TUNE_FEATURES:tune-mips32r2-24kec-m16 =3D "${TUNE_FEA=
TURES:tune-mips32r2-24kec} mi
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2-24kc =3D "mips32r2-24kc"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2-24kc =3D "${PACKAGE_EXTRA_ARCHS:tune-m=
ips32r2-nf} mips32r2-24kc-nf"
-QEMU_EXTRAOPTIONS_mips32r2-24kc-nf =3D " -cpu 24Kc"
+QEMU_EXTRAOPTIONS:tune-mips32r2-24kc-nf =3D " -cpu 24Kc"
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2-24kec =3D "mips32r2-24kec"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2-24kec =3D "${PACKAGE_EXTRA_ARCHS:tune-=
mips32r2-24kc} mips32r2-24kec-nf"
-QEMU_EXTRAOPTIONS_mips32r2-24kec-nf =3D " -cpu 24KEc"
+QEMU_EXTRAOPTIONS:tune-mips32r2-24kec-nf =3D " -cpu 24KEc"
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2-24kec-m16 =3D "mips32r2-24kec${MIPSPKGS=
FX_MIPS16E}"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2-24kec-m16 =3D "${PACKAGE_EXTRA_ARCHS:t=
une-mips32r2-24kec} mips32r2-24kec-m16-nf"
-QEMU_EXTRAOPTIONS_mips32r2-24kec-m16-nf =3D " -cpu 24KEc"
+QEMU_EXTRAOPTIONS:tune-mips32r2-24kec-m16-nf =3D " -cpu 24KEc"
=20
=20
 # little endian: kc, kc+dsp=3Dkec, kc+dsp+mips16e=3Dkec-m16
@@ -40,12 +40,12 @@ TUNE_FEATURES:tune-mips32r2el-24kec-m16 =3D "${TUNE_F=
EATURES:tune-mips32r2el-24kec
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2el-24kc =3D "mips32r2el-24kc"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2el-24kc =3D "${PACKAGE_EXTRA_ARCHS:tune=
-mips32r2el-nf} mips32r2el-24kc-nf"
-QEMU_EXTRAOPTIONS_mips32r2el-24kc-nf =3D " -cpu 24Kc"
+QEMU_EXTRAOPTIONS:tune-mips32r2el-24kc-nf =3D " -cpu 24Kc"
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2el-24kec =3D "mips32r2el-24kec"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2el-24kec =3D "${PACKAGE_EXTRA_ARCHS:tun=
e-mips32r2el-24kc} mips32r2el-24kec-nf"
-QEMU_EXTRAOPTIONS_mips32r2el-24kec-nf =3D " -cpu 24KEc"
+QEMU_EXTRAOPTIONS:tune-mips32r2el-24kec-nf =3D " -cpu 24KEc"
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2el-24kec-m16 =3D "mips32r2el-24kec${MIPS=
PKGSFX_MIPS16E}"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2el-24kec-m16 =3D "${PACKAGE_EXTRA_ARCHS=
:tune-mips32r2el-24kec} mips32r2el-24kec-m16-nf"
-QEMU_EXTRAOPTIONS_mips32r2el-24kec-m16-nf =3D " -cpu 24KEc"
+QEMU_EXTRAOPTIONS:tune-mips32r2el-24kec-m16-nf =3D " -cpu 24KEc"
diff --git a/meta/conf/machine/include/mips/tune-mips-74k.inc b/meta/conf=
/machine/include/mips/tune-mips-74k.inc
index e4927a1ce00..0ec90ca0760 100644
--- a/meta/conf/machine/include/mips/tune-mips-74k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-74k.inc
@@ -18,11 +18,11 @@ TUNE_FEATURES:tune-mips32r2-74kc-m16 =3D "${TUNE_FEAT=
URES:tune-mips32r2-74kc} mips
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2-74kc =3D "mips32r2-74kc"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2-74kc =3D "${PACKAGE_EXTRA_ARCHS:tune-m=
ips32r2-nf} mips32r2-74kc-nf"
-QEMU_EXTRAOPTIONS_mips32r2-74kc-nf =3D " -cpu 24Kc"
+QEMU_EXTRAOPTIONS:tune-mips32r2-74kc-nf =3D " -cpu 24Kc"
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2-74kc-m16 =3D "mips32r2-74kc${MIPSPKGSFX=
_MIPS16E}"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2-74kc-m16 =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-mips32r2-74kc} mips32r2-74kc-m16-nf"
-QEMU_EXTRAOPTIONS_mips32r2-74kc-m16-nf =3D " -cpu 24KEc"
+QEMU_EXTRAOPTIONS:tune-mips32r2-74kc-m16-nf =3D " -cpu 24KEc"
=20
 # little endian: kc+dsp2=3Dkc, kc+dsp2+mips16e=3Dkc-m16
 TUNE_FEATURES:tune-mips32r2el-74kc =3D "${TUNE_FEATURES:tune-mips32r2el-=
nf} 74kc"
@@ -30,8 +30,8 @@ TUNE_FEATURES:tune-mips32r2el-74kc-m16 =3D "${TUNE_FEAT=
URES:tune-mips32r2el-74kc}
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2el-74kc =3D "mips32r2el-74kc"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2el-74kc =3D "${PACKAGE_EXTRA_ARCHS:tune=
-mips32r2el-nf} mips32r2el-74kc-nf"
-QEMU_EXTRAOPTIONS_mips32r2el-74kc-nf =3D " -cpu 24Kc"
+QEMU_EXTRAOPTIONS:tune-mips32r2el-74kc-nf =3D " -cpu 24Kc"
=20
 MIPSPKGSFX_VARIANT:tune-mips32r2el-74kc-m16 =3D "mips32r2el-74kc${MIPSPK=
GSFX_MIPS16E}"
 PACKAGE_EXTRA_ARCHS:tune-mips32r2el-74kc-m16 =3D "${PACKAGE_EXTRA_ARCHS:=
tune-mips32r2el-74kc} mips32r2el-74kc-m16-nf"
-QEMU_EXTRAOPTIONS_mips32r2el-74kc-m16-nf =3D " -cpu 24KEc"
+QEMU_EXTRAOPTIONS:tune-mips32r2el-74kc-m16-nf =3D " -cpu 24KEc"
diff --git a/meta/conf/machine/include/mips/tune-mips64r2.inc b/meta/conf=
/machine/include/mips/tune-mips64r2.inc
index e9ca4201ffc..226f443ff9d 100644
--- a/meta/conf/machine/include/mips/tune-mips64r2.inc
+++ b/meta/conf/machine/include/mips/tune-mips64r2.inc
@@ -12,13 +12,13 @@ TUNE_FEATURES:tune-mips64r2 =3D "${TUNE_FEATURES:tune=
-mips64} mips64r2"
 BASE_LIB:tune-mips64r2 =3D "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2 =3D "mips64r2"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2 =3D "mips64 mips64r2"
-QEMU_EXTRAOPTIONS_mips64r2 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2 =3D " -cpu MIPS64R2-generic"
=20
 TUNE_FEATURES:tune-mips64r2el =3D "${TUNE_FEATURES:tune-mips64el} mips64=
r2"
 BASE_LIB:tune-mips64r2el =3D "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2el =3D "mips64r2el"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el =3D "mips64el mips64r2el"
-QEMU_EXTRAOPTIONS_mips64r2el =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2el =3D " -cpu MIPS64R2-generic"
=20
 # MIPS 64r2 Soft Float
 AVAILTUNES +=3D "mips64r2-nf mips64r2el-nf"
@@ -27,13 +27,13 @@ TUNE_FEATURES:tune-mips64r2-nf =3D "${TUNE_FEATURES:t=
une-mips64-nf} mips64r2"
 BASE_LIB:tune-mips64r2-nf =3D "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2-nf =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-nf =3D "mips64-nf mips64r2-nf"
-QEMU_EXTRAOPTIONS_mips64r2-nf =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2-nf =3D " -cpu MIPS64R2-generic"
=20
 TUNE_FEATURES:tune-mips64r2el-nf =3D "${TUNE_FEATURES:tune-mips64el-nf} =
mips64r2"
 BASE_LIB:tune-mips64r2el-nf =3D "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-nf =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-nf =3D "mips64el-nf mips64r2el-nf"
-QEMU_EXTRAOPTIONS_mips64r2el-nf =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2el-nf =3D " -cpu MIPS64R2-generic"
=20
 # MIPS 64r2 n32
 AVAILTUNES +=3D "mips64r2-n32 mips64r2el-n32"
@@ -42,13 +42,13 @@ TUNE_FEATURES:tune-mips64r2-n32 =3D "${TUNE_FEATURES:=
tune-mips64-n32} mips64r2"
 BASE_LIB:tune-mips64r2-n32 =3D "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2-n32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-n32 =3D "mips64-n32 mips64r2-n32"
-QEMU_EXTRAOPTIONS_mips64r2-n32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2-n32 =3D " -cpu MIPS64R2-generic"
=20
 TUNE_FEATURES:tune-mips64r2el-n32 =3D "${TUNE_FEATURES:tune-mips64el-n32=
} mips64r2"
 BASE_LIB:tune-mips64r2el-n32 =3D "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-n32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-n32 =3D "mips64el-n32 mips64r2el-n32=
"
-QEMU_EXTRAOPTIONS_mips64r2el-n32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2el-n32 =3D " -cpu MIPS64R2-generic"
=20
 # MIPS 64r2 n32 and Soft Float
 AVAILTUNES +=3D "mips64r2-nf-n32 mips64r2el-nf-n32"
@@ -57,13 +57,13 @@ TUNE_FEATURES:tune-mips64r2-nf-n32 =3D "${TUNE_FEATUR=
ES:tune-mips64-nf-n32} mips64
 BASE_LIB:tune-mips64r2-nf-n32 =3D "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2-nf-n32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-nf-n32 =3D "mips64-nf-n32 mips64r2-nf-=
n32"
-QEMU_EXTRAOPTIONS_mips64r2-nf-n32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2-nf-n32 =3D " -cpu MIPS64R2-generic"
=20
 TUNE_FEATURES:tune-mips64r2el-nf-n32 =3D "${TUNE_FEATURES:tune-mips64el-=
nf-n32} mips64r2"
 BASE_LIB:tune-mips64r2el-nf-n32 =3D "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-nf-n32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-nf-n32 =3D "mips64el-nf-n32 mips64r2=
el-nf-n32"
-QEMU_EXTRAOPTIONS_mips64r2el-nf-32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2el-nf-32 =3D " -cpu MIPS64R2-generic"
=20
 # MIPS 64r2 o32
 AVAILTUNES +=3D "mips64r2-o32 mips64r2el-o32"
@@ -72,13 +72,13 @@ TUNE_FEATURES:tune-mips64r2-o32 =3D "${TUNE_FEATURES:=
tune-mips64-o32} mips64r2"
 BASE_LIB:tune-mips64r2-o32 =3D "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2-o32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-o32 =3D "mips mips64-o32 mips64r2-o32"
-QEMU_EXTRAOPTIONS_mips64r2-o32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2-o32 =3D " -cpu MIPS64R2-generic"
=20
 TUNE_FEATURES:tune-mips64r2el-o32 =3D "${TUNE_FEATURES:tune-mips64el-o32=
} mips64r2"
 BASE_LIB:tune-mips64r2el-o32 =3D "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-o32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-o32 =3D "mipsel mips64el-o32 mips64r=
2el-o32"
-QEMU_EXTRAOPTIONS_mips64r2el-o32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2el-o32 =3D " -cpu MIPS64R2-generic"
=20
 # MIPS 64r2 o32 and Soft Float
 AVAILTUNES +=3D "mips64r2-nf-o32 mips64r2el-nf-o32"
@@ -87,10 +87,10 @@ TUNE_FEATURES:tune-mips64r2-nf-o32 =3D "${TUNE_FEATUR=
ES:tune-mips64-nf-o32} mips64
 BASE_LIB:tune-mips64r2-nf-o32 =3D "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2-nf-o32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-nf-o32 =3D "mips-nf mips64r2-nf-o32"
-QEMU_EXTRAOPTIONS_mips64r2-nf-o32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2-nf-o32 =3D " -cpu MIPS64R2-generic"
=20
 TUNE_FEATURES:tune-mips64r2el-nf-o32 =3D "${TUNE_FEATURES:tune-mips64el-=
nf-o32} mips64r2"
 BASE_LIB:tune-mips64r2el-nf-o32 =3D "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-nf-o32 =3D "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-nf-o32 =3D "mipsel-nf mips64r2el-nf-=
o32"
-QEMU_EXTRAOPTIONS_mips64r2el-nf-o32 =3D " -cpu MIPS64R2-generic"
+QEMU_EXTRAOPTIONS:tune-mips64r2el-nf-o32 =3D " -cpu MIPS64R2-generic"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/=
conf/machine/include/powerpc/arch-powerpc64.inc
index af0635a641f..f627fbc6718 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -21,4 +21,4 @@ TUNE_FEATURES:tune-powerpc64le =3D "m64 fpu-hard"
 BASE_LIB:tune-powerpc64le =3D "lib64"
 TUNE_PKGARCH:tune-powerpc64le =3D "powerpc64le"
 PACKAGE_EXTRA_ARCHS:tune-powerpc64le =3D "powerpc64le"
-QEMU_EXTRAOPTIONS_powerpc64le =3D " -cpu POWER9"
+QEMU_EXTRAOPTIONS:tune-powerpc64le =3D " -cpu POWER9"
diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc b/meta/co=
nf/machine/include/powerpc/tune-ppc7400.inc
index 6d3c158bbb5..4d149cf5b6a 100644
--- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
@@ -9,4 +9,4 @@ AVAILTUNES +=3D "ppc7400"
 TUNE_FEATURES:tune-ppc7400 =3D "m32 fpu-hard ppc7400 altivec bigendian"
 TUNE_PKGARCH:tune-ppc7400 =3D "ppc7400"
 PACKAGE_EXTRA_ARCHS:tune-ppc7400 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc=
} ppc7400"
-QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
+QEMU_EXTRAOPTIONS:tune-ppc7400 =3D " -cpu 7400"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc b/meta/=
conf/machine/include/powerpc/tune-ppce500mc.inc
index 8c4630b368c..3dc173808f4 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
@@ -9,7 +9,7 @@ AVAILTUNES +=3D "ppce500mc"
 TUNE_FEATURES:tune-ppce500mc =3D "m32 fpu-hard ppce500mc bigendian"
 TUNE_PKGARCH:tune-ppce500mc =3D "ppce500mc"
 PACKAGE_EXTRA_ARCHS:tune-ppce500mc =3D "${PACKAGE_EXTRA_ARCHS:tune-power=
pc} ppce500mc"
-QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
+QEMU_EXTRAOPTIONS:tune-ppce500mc =3D " -cpu e500mc"
=20
 # pass -mcpu=3De500mc for ppce500mc kernel cross compile
 TARGET_CC_KERNEL_ARCH =3D "-mcpu=3De500mc"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500v2.inc b/meta/=
conf/machine/include/powerpc/tune-ppce500v2.inc
index 204580ee15a..99bbb3382af 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
@@ -18,4 +18,4 @@ AVAILTUNES +=3D "ppce500v2"
 TUNE_FEATURES:tune-ppce500v2 =3D "m32 ppce500v2 bigendian"
 TUNE_PKGARCH:tune-ppce500v2 =3D "ppce500v2"
 PACKAGE_EXTRA_ARCHS:tune-ppce500v2 =3D "ppce500v2"
-QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
+QEMU_EXTRAOPTIONS:tune-ppce500v2 =3D " -cpu e500v2"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/c=
onf/machine/include/powerpc/tune-ppce5500.inc
index 8976c1612fd..446b344c3d2 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
@@ -10,13 +10,13 @@ TUNE_FEATURES:tune-ppce5500 =3D "m32 fpu-hard e5500 b=
igendian"
 BASE_LIB:tune-ppce5500 =3D "lib"
 TUNE_PKGARCH:tune-ppce5500 =3D "ppce5500"
 PACKAGE_EXTRA_ARCHS:tune-ppce5500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerp=
c} ppce5500"
-QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e500mc"
+QEMU_EXTRAOPTIONS:tune-ppce5500 =3D " -cpu e500mc"
=20
 TUNE_FEATURES:tune-ppc64e5500 =3D "m64 fpu-hard e5500 bigendian"
 BASE_LIB:tune-ppc64e5500 =3D "lib64"
 TUNE_PKGARCH:tune-ppc64e5500 =3D "ppc64e5500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powe=
rpc64} ppc64e5500"
-QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e500mc"
+QEMU_EXTRAOPTIONS:tune-ppc64e5500 =3D " -cpu e500mc"
=20
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D "${@bb.utils.contains('T=
UNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/c=
onf/machine/include/powerpc/tune-ppce6500.inc
index b0efe1924c5..4444705b2d6 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
@@ -10,13 +10,13 @@ TUNE_FEATURES:tune-ppce6500 =3D "m32 fpu-hard e6500 a=
ltivec bigendian"
 BASE_LIB:tune-ppce6500 =3D "lib"
 TUNE_PKGARCH:tune-ppce6500 =3D "ppce6500"
 PACKAGE_EXTRA_ARCHS:tune-ppce6500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerp=
c} ppce6500"
-QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e500mc"
+QEMU_EXTRAOPTIONS:tune-ppce6500 =3D " -cpu e500mc"
=20
 TUNE_FEATURES:tune-ppc64e6500 =3D "m64 fpu-hard e6500 altivec bigendian"
 BASE_LIB:tune-ppc64e6500 =3D "lib64"
 TUNE_PKGARCH:tune-ppc64e6500 =3D "ppc64e6500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 =3D "${PACKAGE_EXTRA_ARCHS:tune-powe=
rpc64} ppc64e6500"
-QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e500mc"
+QEMU_EXTRAOPTIONS:tune-ppc64e6500 =3D " -cpu e500mc"
=20
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D "${@bb.utils.contains('T=
UNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/x86/tune-core2.inc b/meta/conf/mac=
hine/include/x86/tune-core2.inc
index 082fd4efc3f..a4ec09072d8 100644
--- a/meta/conf/machine/include/x86/tune-core2.inc
+++ b/meta/conf/machine/include/x86/tune-core2.inc
@@ -21,18 +21,18 @@ TUNE_FEATURES:tune-core2-32 =3D "${TUNE_FEATURES:tune=
-x86} core2"
 BASE_LIB:tune-core2-32 =3D "lib"
 TUNE_PKGARCH:tune-core2-32 =3D "core2-32"
 PACKAGE_EXTRA_ARCHS:tune-core2-32 =3D "${PACKAGE_EXTRA_ARCHS:tune-i686} =
core2-32"
-QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu Nehalem,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-core2-32 =3D " -cpu Nehalem,check=3Dfalse"
=20
 AVAILTUNES +=3D "core2-64"
 TUNE_FEATURES:tune-core2-64 =3D "${TUNE_FEATURES:tune-x86-64} core2"
 BASE_LIB:tune-core2-64 =3D "lib64"
 TUNE_PKGARCH:tune-core2-64 =3D "core2-64"
 PACKAGE_EXTRA_ARCHS:tune-core2-64 =3D "${PACKAGE_EXTRA_ARCHS:tune-x86-64=
} core2-64"
-QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu Nehalem,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-core2-64 =3D " -cpu Nehalem,check=3Dfalse"
=20
 AVAILTUNES +=3D "core2-64-x32"
 TUNE_FEATURES:tune-core2-64-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32} co=
re2"
 BASE_LIB:tune-core2-64-x32 =3D "libx32"
 TUNE_PKGARCH:tune-core2-64-x32 =3D "core2-64-x32"
 PACKAGE_EXTRA_ARCHS:tune-core2-64-x32 =3D "${PACKAGE_EXTRA_ARCHS:tune-x8=
6-64-x32} core2-64-x32"
-QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-core2-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
diff --git a/meta/conf/machine/include/x86/tune-corei7.inc b/meta/conf/ma=
chine/include/x86/tune-corei7.inc
index 7798288a74b..076af97c71c 100644
--- a/meta/conf/machine/include/x86/tune-corei7.inc
+++ b/meta/conf/machine/include/x86/tune-corei7.inc
@@ -21,18 +21,18 @@ TUNE_FEATURES:tune-corei7-32 =3D "${TUNE_FEATURES:tun=
e-x86} corei7"
 BASE_LIB:tune-corei7-32 =3D "lib"
 TUNE_PKGARCH:tune-corei7-32 =3D "corei7-32"
 PACKAGE_EXTRA_ARCHS:tune-corei7-32 =3D "${PACKAGE_EXTRA_ARCHS:tune-core2=
-32} corei7-32"
-QEMU_EXTRAOPTIONS_corei7-32 =3D " -cpu Nehalem,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-corei7-32 =3D " -cpu Nehalem,check=3Dfalse"
=20
 AVAILTUNES +=3D "corei7-64"
 TUNE_FEATURES:tune-corei7-64 =3D "${TUNE_FEATURES:tune-x86-64} corei7"
 BASE_LIB:tune-corei7-64 =3D "lib64"
 TUNE_PKGARCH:tune-corei7-64 =3D "corei7-64"
 PACKAGE_EXTRA_ARCHS:tune-corei7-64 =3D "${PACKAGE_EXTRA_ARCHS:tune-core2=
-64} corei7-64"
-QEMU_EXTRAOPTIONS_corei7-64 =3D " -cpu Nehalem,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-corei7-64 =3D " -cpu Nehalem,check=3Dfalse"
=20
 AVAILTUNES +=3D "corei7-64-x32"
 TUNE_FEATURES:tune-corei7-64-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32} c=
orei7"
 BASE_LIB:tune-corei7-64-x32 =3D "libx32"
 TUNE_PKGARCH:tune-corei7-64-x32 =3D "corei7-64-x32"
 PACKAGE_EXTRA_ARCHS:tune-corei7-64-x32 =3D "${PACKAGE_EXTRA_ARCHS:tune-c=
ore2-64-x32} corei7-64-x32"
-QEMU_EXTRAOPTIONS_corei7-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-corei7-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc b/meta/conf=
/machine/include/x86/tune-x86-64-v3.inc
index 254f03c590c..49f0dd00134 100644
--- a/meta/conf/machine/include/x86/tune-x86-64-v3.inc
+++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
@@ -21,11 +21,11 @@ TUNE_FEATURES:tune-x86-64-v3 =3D "${TUNE_FEATURES:tun=
e-x86-64} x86-64-v3"
 BASE_LIB:tune-x86-64-v3 =3D "lib64"
 TUNE_PKGARCH:tune-x86-64-v3 =3D "x86-64-v3"
 PACKAGE_EXTRA_ARCHS:tune-x86-64-v3 =3D "${PACKAGE_EXTRA_ARCHS:tune-corei=
7-64} x86-64-v3"
-QEMU_EXTRAOPTIONS_x86-64-v3 =3D " -cpu Skylake-Client,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-x86-64-v3 =3D " -cpu Skylake-Client,check=3Dfalse=
"
=20
 AVAILTUNES +=3D "x86-64-v3-x32"
 TUNE_FEATURES:tune-x86-64-v3-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32} x=
86-64-v3"
 BASE_LIB:tune-x86-64-v3-x32 =3D "libx32"
 TUNE_PKGARCH:tune-x86-64-v3-x32 =3D "x86-64-v3-x32"
 PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-x32 =3D "${PACKAGE_EXTRA_ARCHS:tune-c=
orei7-64-x32} x86-64-v3-x32"
-QEMU_EXTRAOPTIONS_x86-64-v3-x32 =3D " -cpu Skylake-Client,check=3Dfalse"
+QEMU_EXTRAOPTIONS:tune-x86-64-v3-x32 =3D " -cpu Skylake-Client,check=3Df=
alse"
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-d=
evtools/gcc/gcc-testsuite.inc
index af6c7ad5a98..3257f869077 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -54,7 +54,7 @@ python check_prepare() {
         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
             args +=3D ["-cpu", "max"]
         else:
-            extra =3D d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_P=
KGARCH'))
+            extra =3D d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('T=
UNE_PKGARCH'))
             if extra:
                 args +=3D extra.split()
         # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) h=
owever they either have MSA
--=20
2.43.0


