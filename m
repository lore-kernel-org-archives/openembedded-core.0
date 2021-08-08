Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.6241.1628396115711638045
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 21:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3B41E209FD2F;
	Sat,  7 Aug 2021 21:15:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3B41E209FD2F
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-helloworld: Enable RISC-V 32 port
Date: Sat,  7 Aug 2021 22:14:51 -0600
Message-Id: <20210808041451.1319775-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

$ runqemu nographic
runqemu - INFO - Running bitbake -e ...
KERNEL: [tmp/deploy/images/qemuriscv32/baremetal-helloworld-image-qemuris=
cv32.bin]
MACHINE: [qemuriscv32]
runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/=
recipe-sysroot-native/usr/bin/qemu-system-riscv32

Hello OpenEmbedded on RISC-V 32!

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-examples/baremetal-helloworld_git.bb           | 5 +++--
 meta/classes/baremetal-image.bbclass                         | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal=
-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/b=
aremetal-helloworld_git.bb
index 37193f5a33..d11e2e530e 100644
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
-SRCREV =3D "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
+SRCREV =3D "31b4e5a337018b4a00a7426b0e5ed83b81df30c7"
 PV =3D "0.1+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
@@ -28,13 +28,14 @@ inherit baremetal-image
 # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
 # but the examples can also be run on other architectures/machines
 # such as vexpress-a15 by overriding the setting on the machine.conf
-COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
+COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemurisc=
v32"
=20
 BAREMETAL_QEMUARCH ?=3D ""
 BAREMETAL_QEMUARCH:qemuarmv5 =3D "versatile"
 BAREMETAL_QEMUARCH:qemuarm =3D "arm"
 BAREMETAL_QEMUARCH:qemuarm64 =3D "aarch64"
 BAREMETAL_QEMUARCH:qemuriscv64 =3D "riscv64"
+BAREMETAL_QEMUARCH:qemuriscv32 =3D "riscv32"
=20
 EXTRA_OEMAKE:append =3D " QEMUARCH=3D${BAREMETAL_QEMUARCH} V=3D1"
=20
diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremeta=
l-image.bbclass
index 9ec3f1460b..089c445522 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -82,12 +82,15 @@ QB_OPT_APPEND:append =3D " -nographic"
 # RISC-V tunes set the BIOS, unset, and instruct QEMU to
 # ignore the BIOS and boot from -kernel
 QB_DEFAULT_BIOS:qemuriscv64 =3D ""
+QB_DEFAULT_BIOS:qemuriscv32 =3D ""
 QB_OPT_APPEND:append:qemuriscv64 =3D " -bios none"
+QB_OPT_APPEND:append:qemuriscv32 =3D " -bios none"
=20
=20
 # Use the medium-any code model for the RISC-V 64 bit implementation,
 # since medlow can only access addresses below 0x80000000 and RAM
 # starts at 0x80000000 on RISC-V 64
+# Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB)
 CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
=20
=20
--=20
2.25.1

