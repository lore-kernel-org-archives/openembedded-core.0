Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AABFED3E3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:17:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24773.1777043859668072740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 08:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=jcHOzwVI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D50CDC5EF2E
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:18:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 131E2604EB
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:17:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 494811072090F;
	Fri, 24 Apr 2026 17:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777043856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=q6PQzE2fofatdxpmfiZsC16W1u9BAJwqFAJYDG/KFmg=;
	b=jcHOzwVIspsj0+a0rporUIWHyggd3JLun4Ajxla/H7ZFfGdAouKsdztnljbdFdvdoT8R5k
	CZ1G0V1JEKiSkvsy6ic3eQt6vdxLKC8CnmYHXFwn0RW/1XUQ+nlgftqz1fuWZ+lwaIqHA6
	8KNqHxtJjy985M3NYyvSbw+XUXTuyn4Ok95Ix62tzPq3AjD+7WpNYZ9OWKeMpUeNR/Ovjt
	FhzS4xIC/hJV7DmhV3rJz6WzsxD7vTMTqDr81lu6QlkB+F/dTFj7x/JxET8onGTKDgduOW
	3hCEDXmJR5c090e+2aIjtXvDdUW4Qrr1GpcoYEsPzCvBS/P57Y72WHGgjWJ3tQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] meta: simplify conditional operations with bb.utils.filter
Date: Fri, 24 Apr 2026 17:17:18 +0200
Message-ID: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235868

Some recipes and configuration files use bb.utils.contains to check for
a string inside a variable, and return the exact same string if true.

This can be simplified by a call to bb.utils.filter, since the result is
the same, and the inline is shorter.

Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/classes-global/insane.bbclass                        | 2 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc        | 8 ++++----
 meta/conf/machine/include/arm/feature-arm-vfp.inc         | 2 +-
 meta/recipes-connectivity/connman/connman_2.0.bb          | 2 +-
 meta/recipes-core/coreutils/coreutils_9.10.bb             | 2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                        | 2 +-
 meta/recipes-extended/at/at_3.2.5.bb                      | 2 +-
 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb          | 2 +-
 meta/recipes-graphics/waffle/waffle_1.8.1.bb              | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb          | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index feddfe0335..04700be71c 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -46,7 +46,7 @@ ERROR_QA ?=3D "\
     ${CHECKLAYER_REQUIRED_TESTS}"
=20
 # Add usrmerge QA check based on distro feature
-ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 ' usrmerge', '', d)}"
+ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', =
d)}"
 WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
=20
 FAKEROOT_QA =3D "host-user-contaminated"
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/co=
nf/machine/include/arm/feature-arm-neon.inc
index 174b9b9f2a..2ec354bfeb 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -5,16 +5,16 @@
 # 'vfp', -mfloat-abi parameter and 'hf' suffix is implemented in feature=
-arm-vfp.inc
=20
 TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', ' n=
eon', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'neon', d)}"
=20
 TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with 16 =
registers (vfpv3-d16) unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16',=
 ' vfpv3-d16', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16'=
, ' vfpv3-d16', '', d)}"
=20
 TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 reg=
isters (vfpv3) unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' =
vfpv3', '' , d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv3', d)}=
"
=20
 TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) uni=
t."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' =
vfpv4', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv4', d)}=
"
 TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4', =
'neon' ], ' neon-vfpv4', '', d)}"
=20
 TUNEVALID[vfpv4d16] =3D "Enable Vector Floating Point Version 4 with 16 =
registers (vfpv4-d16) unit."
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/con=
f/machine/include/arm/feature-arm-vfp.inc
index d020100daa..be0c19bd03 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -3,7 +3,7 @@
 # and this .inc file is included from armv5
=20
 TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vf=
p', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfp', d)}"
=20
 # simd is special, we don't pass this to the -mfpu, it's implied
 TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' % d.getVar('TUNE_CCARGS_MFPU').spl=
it()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/reci=
pes-connectivity/connman/connman_2.0.bb
index 6f7093301b..e9873f3163 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -169,7 +169,7 @@ FILES:${PN}-tools =3D "${bindir}/wispr"
 RDEPENDS:${PN}-tools =3D "${PN}"
=20
 FILES:${PN}-tests =3D "${bindir}/*-test"
-RDEPENDS:${PN}-tests =3D "${@bb.utils.contains('PACKAGECONFIG', 'iptable=
s', 'iptables', '', d)}"
+RDEPENDS:${PN}-tests =3D "${@bb.utils.filter('PACKAGECONFIG', 'iptables'=
, d)}"
=20
 FILES:${PN}-client =3D "${bindir}/connmanctl"
 RDEPENDS:${PN}-client =3D "${PN}"
diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes=
-core/coreutils/coreutils_9.10.bb
index 984c5b5292..744d930272 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -222,6 +222,6 @@ do_install_ptest:append:libc-musl () {
 }
=20
 RDEPENDS:${PN}-ptest +=3D "xz  \
-                         ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'a=
cl', '', d)} \
+                         ${@bb.utils.filter('PACKAGECONFIG', 'acl', d)} =
\
                          ${@bb.utils.contains('PACKAGECONFIG', 'xattr', =
'attr', '', d)}"
 FILES:${PN}-ptest +=3D "${bindir}/getlimits"
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index d731bca7f2..38d5d090b4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D=
06357ddc23f46577c2aeaeaf7b776
 # compiling OVMF twice, so it is disabled by default. Distros
 # may change that default.
 PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm=
', '', d)}"
+PACKAGECONFIG +=3D "${@bb.utils.filter('MACHINE_FEATURES', 'tpm', d)}"
 PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tp=
m', '', d)}"
 PACKAGECONFIG[debug] =3D ",,,"
 PACKAGECONFIG[secureboot] =3D ",,,"
diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended=
/at/at_3.2.5.bb
index 112d1c4adc..ee485f67ec 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "flex flex-native bison-native \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
=20
 PACKAGECONFIG ?=3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)=
} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
 "
=20
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux,=
"
diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/reci=
pes-graphics/libglvnd/libglvnd_1.7.0.bb
index 18eeaa5523..c76763f811 100644
--- a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl glvnd"
 inherit meson pkgconfig features_check
=20
 PACKAGECONFIG ?=3D "\
-  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+  ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '=
', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
   "
diff --git a/meta/recipes-graphics/waffle/waffle_1.8.1.bb b/meta/recipes-=
graphics/waffle/waffle_1.8.1.bb
index aefa0069cf..5d993cf254 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
@@ -21,7 +21,7 @@ DEPENDS:append =3D " python3"
 # This should be overridden per-machine to reflect the capabilities of t=
he GL
 # stack.
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx=
 x11-egl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'w=
ayland', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} =
\
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gb=
m surfaceless-egl', '', d)} \
 "
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.2.bb
index cdf3a20dff..9945e79bf7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
@@ -25,7 +25,7 @@ PACKAGECONFIG ??=3D " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)=
} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
     sndfile ttml uvch264 webp analytics \
--=20
2.47.0


