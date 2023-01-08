Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064DC54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 19:15:53 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.52547.1673205345301614181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 11:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C37420A119D;
	Sun,  8 Jan 2023 11:15:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C37420A119D
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 1/3] baremetal-helloworld: Enable x86 and x86-64 ports
Date: Sun,  8 Jan 2023 12:15:23 -0700
Message-Id: <20230108191525.1312582-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 19:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175636

- The qemux86 port for helloworld-baremetal builds in the standard way, h=
owever,
  it uses NASM syntax for the startup code, hence we include a dependency=
 to
  nasm-native, QEMU forces us to use an ELF file rather than a bin file t=
o boot
  from this architecture using the -kernel parameter.

- QEMU refuses to boot using the -kernel parameter for files containing a=
n ELF64
  header [1], instead, it requires a multiboot2 compatible image.

  We could create an image that contains a multiboot2 header by piggyback=
ing
  into grub2-native, specifically grub-mkrescue, but it requires some ext=
ra
  runtime dependencies (xorriso which is currently part of meta-oe), and =
assumes
  a grub installation exists on the host.

  Due to host contamination and dependency complications, we dont rely on=
 grub2,
  but rather do this process manually instead, the x86-64 port contains a=
 stage1
  bootloader, stage2 bootloader and a 64 bit baremetal app (multiboot2
  compatible), booting into real (16 bit), protected (32 bit) and long (6=
4 bit)
  modes, eventually running the helloworld-baremetal app. This is the rea=
son why
  we need the code changes to use a separate Makefile, and create an imag=
e
  specifically for qemux86-64.

$ runqemu nographic
Booting from ROM..
Hello OpenEmbedded on x86!

$ runqemu nographic
Starting Stage 1 Bootloader
Loading Stage 2 Bootloader
Stage 2 Loaded.
Jumping to Stage2 Bootloader
In Stage 2
Done

Hello OpenEmbedded on x86-64!

[1] https://gitlab.com/qemu-project/qemu/-/blob/v7.2.0/hw/i386/multiboot.=
c#L199

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-helloworld_git.bb               | 22 +++++++++++++++++--
 meta/classes-recipe/baremetal-image.bbclass   |  5 +++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal=
-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/b=
aremetal-helloworld_git.bb
index d11e2e530e..fede17b0f0 100644
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
-SRCREV =3D "31b4e5a337018b4a00a7426b0e5ed83b81df30c7"
+SRCREV =3D "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
 PV =3D "0.1+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
@@ -23,12 +23,15 @@ IMAGE_NAME_SUFFIX ?=3D ""
 inherit baremetal-image
=20
=20
+# startup code for x86 uses NASM syntax
+DEPENDS:qemux86:append =3D " nasm-native"
+
 # These parameters are app specific for this example
 # This will be translated automatically to the architecture and
 # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
 # but the examples can also be run on other architectures/machines
 # such as vexpress-a15 by overriding the setting on the machine.conf
-COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemurisc=
v32"
+COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemurisc=
v32|qemux86|qemux86-64"
=20
 BAREMETAL_QEMUARCH ?=3D ""
 BAREMETAL_QEMUARCH:qemuarmv5 =3D "versatile"
@@ -36,9 +39,15 @@ BAREMETAL_QEMUARCH:qemuarm =3D "arm"
 BAREMETAL_QEMUARCH:qemuarm64 =3D "aarch64"
 BAREMETAL_QEMUARCH:qemuriscv64 =3D "riscv64"
 BAREMETAL_QEMUARCH:qemuriscv32 =3D "riscv32"
+BAREMETAL_QEMUARCH:qemux86 =3D "x86"
+BAREMETAL_QEMUARCH:qemux86-64 =3D "x86-64"
=20
 EXTRA_OEMAKE:append =3D " QEMUARCH=3D${BAREMETAL_QEMUARCH} V=3D1"
=20
+# qemux86-64 uses a different Makefile
+do_compile:prepend:qemux86-64(){
+    cd x86-64
+}
=20
 # Install binaries on the proper location for baremetal-image to fetch a=
nd deploy
 do_install(){
@@ -51,3 +60,12 @@ FILES:${PN} +=3D " \
     ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
     ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
 "
+
+# qemux86-64 boots from iso rather than -kernel, create image to boot fr=
om
+do_image:append:qemux86-64(){
+    dd if=3D/dev/zero of=3D${B}/build/img.iso bs=3D1M count=3D10 status=3D=
none
+    dd if=3D${B}/build/stage1.bin of=3D${B}/build/img.iso bs=3D512 count=
=3D1 conv=3Dnotrunc
+    dd if=3D${B}/build/stage2.bin of=3D${B}/build/img.iso bs=3D512 seek=3D=
1 count=3D64 conv=3Dnotrunc
+    dd if=3D${B}/build/hello_baremetal_x86-64.bin of=3D${B}/build/img.is=
o bs=3D512 seek=3D65 conv=3Dnotrunc
+    install ${B}/build/img.iso ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.iso
+}
diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index 513155e9ae..70791f999a 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -86,6 +86,11 @@ QB_DEFAULT_FSTYPE ?=3D "bin"
 QB_DTB ?=3D ""
 QB_OPT_APPEND:append =3D " -nographic"
=20
+# QEMU x86 requires an .elf kernel to boot rather than a .bin
+QB_DEFAULT_KERNEL:qemux86 ?=3D "${IMAGE_LINK_NAME}.elf"
+# QEMU x86-64 refuses to boot from -kernel, needs a multiboot compatible=
 image
+QB_DEFAULT_FSTYPE:qemux86-64 ?=3D "iso"
+
 # RISC-V tunes set the BIOS, unset, and instruct QEMU to
 # ignore the BIOS and boot from -kernel
 QB_DEFAULT_BIOS:qemuriscv64 =3D ""
--=20
2.34.1


