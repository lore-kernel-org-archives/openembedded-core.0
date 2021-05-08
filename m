Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3985.1620462639466391106
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 01:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9A3BF20B7178;
	Sat,  8 May 2021 01:30:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A3BF20B7178
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-helloworld: Enable RISC-V 64 port
Date: Sat,  8 May 2021 02:30:31 -0600
Message-Id: <20210508083031.1448886-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add support for MACHINE=3Dqemuriscv64.

$ runqemu nographic

BIOS: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuriscv=
64.elf]
MACHINE: [qemuriscv64]

runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/=
recipe-sysroot-native/usr/bin/qemu-system-riscv64

Hello OpenEmbedded on RISC-V 64!

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-examples/baremetal-helloworld_git.bb   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal=
-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/b=
aremetal-helloworld_git.bb
index ee945c1ff0..3b7b8193a7 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-hellow=
orld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-hellow=
orld_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "These are introductory examples to showc=
ase the use of QEMU to ru
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f56f4=
449"
=20
-SRCREV =3D "99f4fa4a3b266b42b52af302610b0f4f429ba5e3"
+SRCREV =3D "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
 PV =3D "0.1+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
@@ -28,12 +28,13 @@ inherit baremetal-image
 # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
 # but the examples can also be run on other architectures/machines
 # such as vexpress-a15 by overriding the setting on the machine.conf
-COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64"
+COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
=20
 BAREMETAL_QEMUARCH ?=3D ""
 BAREMETAL_QEMUARCH_qemuarmv5 =3D "versatile"
 BAREMETAL_QEMUARCH_qemuarm =3D "arm"
 BAREMETAL_QEMUARCH_qemuarm64 =3D "aarch64"
+BAREMETAL_QEMUARCH_qemuriscv64 =3D "riscv64"
=20
 EXTRA_OEMAKE_append =3D " QEMUARCH=3D${BAREMETAL_QEMUARCH} V=3D1"
=20
@@ -49,3 +50,10 @@ FILES_${PN} +=3D " \
     ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
     ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
 "
+
+# RISC-V tunes set the BIOS, redefine since runqemu jumps there
+QB_DEFAULT_BIOS_qemuriscv64 =3D "${IMAGE_LINK_NAME}.elf"
+
+# Use the medium-any code model for the RISC-V 64 bit implementation,
+# since medlow can only access addresses below 0x80000000
+CFLAGS_append_qemuriscv64 =3D " -mcmodel=3Dmedany"
--=20
2.25.1

