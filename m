Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.8820.1620711101100585514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 22:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id F1BAA20B7178;
	Mon, 10 May 2021 22:31:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F1BAA20B7178
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH v2] baremetal-helloworld: Enable RISC-V 64 port
Date: Mon, 10 May 2021 23:31:34 -0600
Message-Id: <20210511053134.3353286-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add support for MACHINE=3Dqemuriscv64.

$ runqemu nographic

KERNEL: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuris=
cv64.bin]
MACHINE: [qemuriscv64]
FSTYPE: [bin]

runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/=
recipe-sysroot-native/usr/bin/qemu-system-riscv64

Hello OpenEmbedded on RISC-V 64!

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-examples/baremetal-helloworld_git.bb |  5 +++--
 meta/classes/baremetal-image.bbclass               | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal=
-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/b=
aremetal-helloworld_git.bb
index ee945c1ff0..19ef16988f 100644
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
diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremeta=
l-image.bbclass
index b0f5e885b5..319b61c7cd 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -73,7 +73,19 @@ QB_DEFAULT_KERNEL ?=3D "${IMAGE_LINK_NAME}.bin"
 QB_MEM ?=3D "-m 256"
 QB_DEFAULT_FSTYPE ?=3D "bin"
 QB_DTB ?=3D ""
-QB_OPT_APPEND =3D "-nographic"
+QB_OPT_APPEND_append =3D " -nographic"
+
+# RISC-V tunes set the BIOS, unset, and instruct QEMU to
+# ignore the BIOS and boot from -kernel
+QB_DEFAULT_BIOS_qemuriscv64 =3D ""
+QB_OPT_APPEND_append_qemuriscv64 =3D " -bios none"
+
+
+# Use the medium-any code model for the RISC-V 64 bit implementation,
+# since medlow can only access addresses below 0x80000000 and RAM
+# starts at 0x80000000 on RISC-V 64
+CFLAGS_append_qemuriscv64 =3D " -mcmodel=3Dmedany"
+
=20
 # This next part is necessary to trick the build system into thinking
 # its building an image recipe so it generates the qemuboot.conf
--=20
2.25.1

