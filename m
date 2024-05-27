Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCB8C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 22:45:17 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.9395.1716849908327089224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 15:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from localhost.localdomain (unknown [37.19.221.174])
	by linux.microsoft.com (Postfix) with ESMTPSA id D77542067CFE;
	Mon, 27 May 2024 15:45:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D77542067CFE
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH v3 2/2] tclibc-picolibc: Adds a new TCLIBC variant to build with picolibc as C library
Date: Mon, 27 May 2024 16:48:16 -0600
Message-ID: <20240527224816.26277-2-alejandro@enedino.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527224816.26277-1-alejandro@enedino.org>
References: <20240527224816.26277-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199945

Enables usage of TCLIBC=3Dpicolibc extending OE functionality to build an=
d use
picolibc based toolchains to build baremetal applications.

Picolibc is a set of standard C libraries, both libc and libm, designed f=
or
smaller embedded systems with limited ROM and RAM. Picolibc includes code
from Newlib and AVR Libc, but adresses some of newlibs concerns, it retai=
ns
newlibs directory structure, math, string and locale implementations, but
removed the GPL bits used to build the library, swiches old C style code =
for
C18 and replaces autotools with meson.

This patch adds a picolibc recipe for the C library, a picolibc-helloworl=
d
recipe that contains an example application and a testcase that builds it=
.

Picolibc can be built for ARM and RISCV architectures, its been tested bo=
th
for 32 and 64 bits, the provided example recipe produces the following ou=
tput:

hello, world

Runqemu does not automatically show any output since it hides QEMU stderr=
 which
is where the QEMU monitors output is directed to when using semihosting, =
but,
manually running the same QEMU command does work properly.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/baremetal-image.bbclass   |   4 +-
 meta/classes-recipe/cross-canadian.bbclass    |   2 +-
 meta/conf/distro/include/maintainers.inc      |   2 +
 meta/conf/distro/include/tclibc-picolibc.inc  |  40 ++++++
 meta/conf/documentation.conf                  |   2 +-
 .../conf/machine/include/riscv/arch-riscv.inc |   1 +
 meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
 meta/lib/oeqa/selftest/cases/picolibc.py      |  18 +++
 .../picolibc/picolibc-helloworld_git.bb       |  40 ++++++
 meta/recipes-core/picolibc/picolibc.inc       |  21 ++++
 .../avoid_polluting_cross_directories.patch   | 119 ++++++++++++++++++
 .../picolibc/no-early-compiler-checks.cross   |   6 +
 meta/recipes-core/picolibc/picolibc_git.bb    |  35 ++++++
 meta/recipes-devtools/gcc/gcc-cross.inc       |   1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +
 meta/recipes-devtools/gcc/libgcc-common.inc   |   5 +
 16 files changed, 296 insertions(+), 5 deletions(-)
 create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc
 create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py
 create mode 100644 meta/recipes-core/picolibc/picolibc-helloworld_git.bb
 create mode 100644 meta/recipes-core/picolibc/picolibc.inc
 create mode 100644 meta/recipes-core/picolibc/picolibc/avoid_polluting_c=
ross_directories.patch
 create mode 100644 meta/recipes-core/picolibc/picolibc/no-early-compiler=
-checks.cross
 create mode 100644 meta/recipes-core/picolibc/picolibc_git.bb

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index 4e7d413626..27f2d2d10a 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -16,8 +16,8 @@
 # See meta-skeleton for a working example.
=20
=20
-# Toolchain should be baremetal or newlib based.
-# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
+# Toolchain should be baremetal or newlib/picolibc based.
+# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib" or TCLIBC=3D"picolibc"
 COMPATIBLE_HOST:libc-musl:class-target =3D "null"
 COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
=20
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-re=
cipe/cross-canadian.bbclass
index 1670217d69..059d9aa95f 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -36,7 +36,7 @@ python () {
     if d.getVar("MODIFYTOS") !=3D "1":
         return
=20
-    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
+    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', 'picolibc' ]:
         return
=20
     tos =3D d.getVar("TARGET_OS")
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 1cb2f708fa..083f9faf6c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -579,6 +579,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D "Alexander Kanavin <=
alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-perf =3D "Bruce Ashfield <bruce.ashfield@gmail.com>=
"
 RECIPE_MAINTAINER:pn-perl =3D "Alexander Kanavin <alex.kanavin@gmail.com=
>"
 RECIPE_MAINTAINER:pn-perlcross =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
+RECIPE_MAINTAINER:pn-picolibc =3D "Alejandro Hernandez <alejandro@enedin=
o.org>"
+RECIPE_MAINTAINER:pn-picolibc-helloworld =3D "Alejandro Hernandez <aleja=
ndro@enedino.org>"
 RECIPE_MAINTAINER:pn-piglit =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/dis=
tro/include/tclibc-picolibc.inc
new file mode 100644
index 0000000000..203765dfcb
--- /dev/null
+++ b/meta/conf/distro/include/tclibc-picolibc.inc
@@ -0,0 +1,40 @@
+#
+# Picolibc configuration
+#
+
+LIBCEXTENSION =3D "-picolibc"
+LIBCOVERRIDE =3D ":libc-picolibc"
+
+PREFERRED_PROVIDER_virtual/libc ?=3D "picolibc"
+PREFERRED_PROVIDER_virtual/libiconv ?=3D "picolibc"
+PREFERRED_PROVIDER_virtual/libintl ?=3D "picolibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
+
+DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
+
+IMAGE_LINGUAS =3D ""
+
+LIBC_DEPENDENCIES =3D " \
+    picolibc-dbg \
+    picolibc-dev \
+    libgcc-dev \
+    libgcc-dbg \
+    libstdc++-dev  \
+    libstdc++-staticdev \
+"
+
+ASSUME_PROVIDED +=3D "virtual/crypt"
+
+TARGET_OS =3D "elf"
+TARGET_OS:arm =3D "eabi"
+
+TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE} natives=
dk-qemu nativesdk-sdk-provides-dummy"
+TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "zlib ncurses"
+
+# RISCV linker doesnt support PIE
+SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D "${SECURITY_NOPIE_CFLAGS}"
+
+
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index b0591881ba..ad89142934 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D "Specifies the method for handlin=
g FPU code. For FPU-less targ
 TARGET_OS[doc] =3D "Specifies the target's operating system."
 TARGET_PREFIX[doc] =3D "The prefix for the cross-compile toolchain (e.g.=
 arm-linux-)."
 TARGET_SYS[doc] =3D "The target system is comprised of TARGET_ARCH,TARGE=
T_VENDOR and TARGET_OS."
-TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the bu=
ild process. You can select 'baremetal', 'glibc', 'musl' or 'newlib'."
+TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the bu=
ild process. You can select 'baremetal', 'glibc', 'musl', 'newlib', or 'p=
icolibc'."
 TCMODE[doc] =3D "Enables an external toolchain (where provided by an add=
itional layer) if set to a value other than 'default'."
 TESTIMAGE_AUTO[doc] =3D "Enables test booting of virtual machine images =
under the QEMU emulator after any root filesystems are created and runs t=
ests against those images each time an image is built."
 TEST_QEMUBOOT_TIMEOUT[doc] =3D "The time in seconds allowed for an image=
 to boot before automated runtime tests begin to run against an image."
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/m=
achine/include/riscv/arch-riscv.inc
index 230a266563..b34064e78f 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D "${@bb.utils.contains('TUNE_FEAT=
URES', 'riscv64nc', ' -marc
=20
 # Fix: ld: unrecognized option '--hash-style=3Dsysv'
 LINKER_HASH_STYLE:libc-newlib =3D ""
+LINKER_HASH_STYLE:libc-picolibc =3D ""
 # Fix: ld: unrecognized option '--hash-style=3Dgnu'
 LINKER_HASH_STYLE:libc-baremetal =3D ""
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/s=
elftest/cases/distrodata.py
index ad952c004b..043953757f 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -55,7 +55,7 @@ but their recipes claim otherwise by setting UPSTREAM_V=
ERSION_UNKNOWN. Please re
             return False
=20
         def is_maintainer_exception(entry):
-            exceptions =3D ["musl", "newlib", "linux-yocto", "linux-dumm=
y", "mesa-gl", "libgfortran", "libx11-compose-data",
+            exceptions =3D ["musl", "newlib", "picolibc", "linux-yocto",=
 "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
                           "cve-update-nvd2-native",]
             for i in exceptions:
                  if i in entry:
diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py b/meta/lib/oeqa/sel=
ftest/cases/picolibc.py
new file mode 100644
index 0000000000..e40b4fc3d3
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/picolibc.py
@@ -0,0 +1,18 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+class PicolibcTest(OESelftestTestCase):
+
+    def test_picolibc(self):
+        compatible_machines =3D ['qemuarm', 'qemuarm64', 'qemuriscv32', =
'qemuriscv64']
+        machine =3D get_bb_var('MACHINE')
+        if machine not in compatible_machines:
+            self.skipTest('This test only works with machines : %s' % ' =
'.join(compatible_machines))
+        self.write_config('TCLIBC =3D "picolibc"')
+        bitbake("picolibc-helloworld")
diff --git a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb b/meta=
/recipes-core/picolibc/picolibc-helloworld_git.bb
new file mode 100644
index 0000000000..573a571c24
--- /dev/null
+++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
@@ -0,0 +1,40 @@
+require picolibc.inc
+
+# baremetal-image overrides
+BAREMETAL_BINNAME ?=3D "hello_picolibc_${MACHINE}"
+IMAGE_LINK_NAME ?=3D "baremetal-picolibc-image-${MACHINE}"
+IMAGE_NAME_SUFFIX ?=3D ""
+QB_DEFAULT_KERNEL ?=3D "${IMAGE_LINK_NAME}.elf"
+
+inherit baremetal-image
+
+COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
+
+# Use semihosting to test via QEMU
+QB_OPT_APPEND:append =3D " -semihosting-config enable=3Don"
+
+# picolibc comes with a set of linker scripts, set the file
+# according to the architecture being built.
+PICOLIBC_LINKERSCRIPT:qemuarm64 =3D "aarch64.ld"
+PICOLIBC_LINKERSCRIPT:qemuarm =3D "arm.ld"
+PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D "riscv.ld"
+PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D "riscv.ld"
+
+# Simple compile function that manually exemplifies usage; as noted,
+# use a custom linker script, the GCC specs provided by picolibc
+# and semihost to be able to test via QEMU's monitor
+do_compile(){
+    ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${S}/hello-world/${PICOLIBC_L=
INKERSCRIPT} -specs=3Dpicolibc.specs --oslib=3Dsemihost -o ${BAREMETAL_BI=
NNAME}.elf ${S}/hello-world/hello-world.c
+    ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMETAL_BINNAME}.b=
in
+}
+
+do_install(){
+    install -d ${D}/${base_libdir}/firmware
+    install -m 755 ${B}/${BAREMETAL_BINNAME}.elf ${D}/${base_libdir}/fir=
mware/${BAREMETAL_BINNAME}.elf
+    install -m 755 ${B}/${BAREMETAL_BINNAME}.bin ${D}/${base_libdir}/fir=
mware/${BAREMETAL_BINNAME}.bin
+}
+
+FILES:${PN} +=3D " \
+    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
+    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
+"
diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/=
picolibc/picolibc.inc
new file mode 100644
index 0000000000..3b380fe7af
--- /dev/null
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -0,0 +1,21 @@
+SUMMARY =3D "C Libraries for Smaller Embedded Systems"
+HOMEPAGE =3D "https://keithp.com/picolibc"
+DESCRIPTION =3D "Picolibc is a set of standard C libraries, both libc an=
d libm, designed for smaller embedded systems with limited ROM and RAM. P=
icolibc includes code from Newlib and AVR Libc."
+SECTION =3D "libs"
+
+# Newlib based code but GPL related bits removed, test/printf-tests.c an=
d test/testcases.c
+# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of th=
e artifacts.
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D " \
+		file://COPYING.GPL2;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
+		file://COPYING.NEWLIB;md5=3D08ae03456feb75b81cfdb359e0f1ef85 \
+		file://COPYING.picolibc;md5=3De50fa9458a40929689861ed472d46bc7 \
+		"
+
+BASEVER =3D "1.8.6"
+PV =3D "${BASEVER}+git"
+SRC_URI =3D "git://github.com/picolibc/picolibc.git;protocol=3Dhttps;bra=
nch=3Dmain"
+SRCREV=3D"764ef4e401a8f4c6a86ab723533841f072885a5b"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_di=
rectories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cro=
ss_directories.patch
new file mode 100644
index 0000000000..da6460c95c
--- /dev/null
+++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directori=
es.patch
@@ -0,0 +1,119 @@
+Upstream-Status: Pending
+
+Picolibc uses its own specs file: picolibc.specs to facilitate compilati=
on, this
+needs to be passed down to GCC via the -specs argument.
+
+Using this specs file overrides some of the default options our toolchai=
n was
+built with, in this case, they modify the include_dir and lib_dir paths =
used for
+compilation, their intention was to add support for -picolibc-prefix and
+-picolibc-buildtype arguments via the C preprocessor.
+
+-isystem %{-picolibc-prefix=3D*:%*/include/; -picolibc-buildtype=3D*:/us=
r/include/%*; :/usr/include} %(picolibc_cpp)
+
+This had the unwanted effect of defaulting to /usr/include for include_d=
ir if
+those arguments are not being passed, this works fine for their flow but=
 for us
+it pollutes the include directories with paths from the host. The same e=
ffect is
+applicable for lib_dir and for the c runtime file.
+
+Our toolchain relies on --sysroot to avoid using any paths from the host=
, here we
+manually add support for a third possible argument: -sysroot , if this i=
s passed
+then the paths used by the compiler will be relative to the path passed =
by the
+--sysroot=3D cmdline argument, setting back the behavior that we intende=
d in the
+first place.
+
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
+
+Index: git/meson.build
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/meson.build
++++ git/meson.build
+@@ -622,12 +622,13 @@ else
+ #
+ picolibc_prefix_format =3D '-picolibc-prefix=3D*:@0@'
+ picolibc_buildtype_format =3D '-picolibc-buildtype=3D*:@0@'
++sysroot_format =3D '-sysroot=3D*:@0@'
+ gen_format =3D '@0@'
+=20
+ #
+ # How to glue the three options together
+ #
+-specs_option_format =3D '%{@0@; @1@; :@2@}'
++specs_option_format =3D '%{@0@; @1@; @2@; :@3@}'
+=20
+ #
+ # Build the -isystem value
+@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.
+ buildtype_include_dir =3D specs_prefix_format.format(get_option('includ=
edir') / '%*')
+ isystem_buildtype =3D picolibc_buildtype_format.format(buildtype_includ=
e_dir)
+=20
++sysroot_include_dir =3D '%*'
++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)
++
+ gen_include_dir =3D specs_prefix_format.format(get_option('includedir')=
)
+ isystem_gen =3D gen_format.format(gen_include_dir)
+=20
+-specs_isystem =3D '-isystem ' + specs_option_format.format(isystem_pref=
ix, isystem_buildtype, isystem_gen)
++specs_isystem =3D '-isystem ' + specs_option_format.format(isystem_pref=
ix, isystem_buildtype, isystem_sysroot, isystem_gen)
+=20
+ #
+ # Build the non-multilib -L value
+@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form
+ buildtype_lib_dir =3D specs_prefix_format.format(get_option('libdir') /=
 '%*')
+ lib_buildtype =3D picolibc_buildtype_format.format(buildtype_lib_dir)
+=20
++sysroot_lib_dir =3D '%*'
++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)
++
+ gen_lib_dir =3D specs_prefix_format.format(get_option('libdir'))
+ lib_gen =3D gen_format.format(gen_lib_dir)
+=20
+-specs_libpath =3D '-L' + specs_option_format.format(lib_prefix, lib_bui=
ldtype, lib_gen)
++specs_libpath =3D '-L' + specs_option_format.format(lib_prefix, lib_bui=
ldtype, lib_sysroot, lib_gen)
+=20
+ #
+ # Build the non-multilib *startfile options
+@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for
+ buildtype_crt0_path =3D specs_prefix_format.format(get_option('libdir')=
 / '%*' / crt0_expr)
+ crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_crt0_path=
)
+=20
++sysroot_crt0_path =3D '%*' + '/' + get_option('libdir') + '/' + '%*' + =
'/' + crt0_expr
++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_path)
++
+ gen_crt0_path =3D specs_prefix_format.format(get_option('libdir') / crt=
0_expr)
+ crt0_gen =3D gen_format.format(gen_crt0_path)
+=20
+@@ -686,10 +696,13 @@ if enable_multilib
+   buildtype_multilib_dir =3D specs_prefix_format.format(get_option('lib=
dir') / '%*/%M')
+   multilib_buildtype =3D picolibc_buildtype_format.format(buildtype_mul=
tilib_dir)
+=20
++  sysroot_multilib_dir =3D '%*' + '/' + get_option('libdir') + '/' + '%=
*/%M'
++  multilib_sysroot =3D sysroot_format.format(sysroot_multilib_dir)
++ =20
+   gen_multilib_dir =3D specs_prefix_format.format(get_option('libdir') =
/ '%M')
+   multilib_gen =3D gen_format.format(gen_multilib_dir)
+=20
+-  specs_multilibpath =3D '-L' + specs_option_format.format(multilib_pre=
fix, multilib_buildtype, multilib_gen)
++  specs_multilibpath =3D '-L' + specs_option_format.format(multilib_pre=
fix, multilib_buildtype, multilib_sysroot, multilib_gen)
+=20
+   #
+   # Prepend the multilib -L option to the non-multilib option
+@@ -705,6 +718,9 @@ if enable_multilib
+   buildtype_multilib_crt0_path =3D specs_prefix_format.format(get_optio=
n('libdir') / '%*/%M' / crt0_expr)
+   crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_multili=
b_crt0_path)
+=20
++  sysroot_multilib_crt0_path =3D '%*' + prefix + '/' + get_option('libd=
ir') + '/' + '/%M' + '/' + crt0_expr
++  crt0_sysroot =3D sysroot_format.format(sysroot_multilib_crt0_path)
++ =20
+   gen_multilib_crt0_path =3D specs_prefix_format.format(get_option('lib=
dir') / '%M' / crt0_expr)
+   crt0_gen =3D gen_format.format(gen_multilib_crt0_path)
+ endif
+@@ -714,7 +730,7 @@ endif
+ # above. As there's only one value, it's either the
+ # multilib path or the non-multilib path
+ #
+-specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_buildt=
ype, crt0_gen)
++specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_buildt=
ype, crt0_sysroot, crt0_gen)
+ endif
+=20
+ specs_data =3D configuration_data()
diff --git a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks=
.cross b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cro=
ss
new file mode 100644
index 0000000000..87bfbad3c5
--- /dev/null
+++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
@@ -0,0 +1,6 @@
+# We need to explicitly bypass mesons sanity check to avoid early compil=
er errors
+# otherwise meson will try to compile AND run test applications:
+# ../git/meson.build:35:0: ERROR: Executables created by c compiler are =
not runnable...
+
+[properties]
+skip_sanity_check=3Dtrue
\ No newline at end of file
diff --git a/meta/recipes-core/picolibc/picolibc_git.bb b/meta/recipes-co=
re/picolibc/picolibc_git.bb
new file mode 100644
index 0000000000..a17abbc534
--- /dev/null
+++ b/meta/recipes-core/picolibc/picolibc_git.bb
@@ -0,0 +1,35 @@
+require picolibc.inc
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
+
+PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl"
+
+COMPATIBLE_HOST:libc-musl:class-target =3D "null"
+COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
+COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
+
+SRC_URI:append =3D " file://avoid_polluting_cross_directories.patch"
+SRC_URI:append =3D " file://no-early-compiler-checks.cross"
+
+# This is being added by picolibc meson files as well to avoid
+# early compiler tests from failing, cant remember why I added it
+# to the newlib recipe but I would assume it was for the same reason
+TARGET_CC_ARCH:append =3D " -nostdlib"
+
+# When using RISCV64 use medany for both C library and application recip=
es
+TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
+
+inherit meson
+
+MESON_CROSS_FILE:append =3D " --cross-file=3D${WORKDIR}/no-early-compile=
r-checks.cross"
+
+PACKAGECONFIG ??=3D " specsdir"
+# Install GCC specs on libdir
+PACKAGECONFIG[specsdir] =3D "-Dspecsdir=3D${libdir},-Dspecsdir=3Dnone"
+
+
+FILES:${PN}-dev:append =3D " ${libdir}/*.specs ${libdir}/*.ld"
+
+# No rpm package is actually created but -dev depends on it, avoid dnf e=
rror
+DEV_PKG_DEPENDENCY:libc-picolibc =3D ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
index a540fb2434..e492dea1b8 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -34,6 +34,7 @@ EXTRA_OECONF +=3D "\
 EXTRA_OECONF:append:libc-baremetal =3D " --without-headers"
 EXTRA_OECONF:remove:libc-baremetal =3D "--enable-threads=3Dposix"
 EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=3Dposix"
+EXTRA_OECONF:remove:libc-picolibc =3D "--enable-threads=3Dposix"
=20
 EXTRA_OECONF_PATHS =3D "\
     --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} =
\
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
index 89b0bebcfb..1fca00f5f0 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D "\
 EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
 EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
 EXTRA_OECONF:append:libc-newlib =3D " --with-newlib --with-target-subdir=
"
+EXTRA_OECONF:append:libc-picolibc =3D " --with-newlib --with-target-subd=
ir"
 EXTRA_OECONF:append:libc-baremetal =3D " --with-target-subdir"
=20
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
@@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D ""
=20
 # Newlib does not support symbol versioning on libsdtcc++
 SYMVERS_CONF:libc-newlib =3D ""
+SYMVERS_CONF:libc-picolibc =3D ""
=20
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET:armv6 =3D "arm"
@@ -47,6 +49,7 @@ RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v3 libgom=
p libatomic ${RUNTIMELIBITM
 "
 # Only build libstdc++ for newlib
 RUNTIMETARGET:libc-newlib =3D "libstdc++-v3"
+RUNTIMETARGET:libc-picolibc =3D "libstdc++-v3"
=20
 # libiberty
 # libgfortran needs separate recipe due to libquadmath dependency
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-d=
evtools/gcc/libgcc-common.inc
index d9084af51a..e3db17d700 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -53,6 +53,11 @@ do_install:append:libc-newlib () {
 		rmdir ${D}${base_libdir}
 	fi
 }
+do_install:append:libc-picolibc () {
+	if [ "${base_libdir}" !=3D "${libdir}" ]; then
+		rmdir ${D}${base_libdir}
+	fi
+}
=20
 # No rpm package is actually created but -dev depends on it, avoid dnf e=
rror
 DEV_PKG_DEPENDENCY:libc-baremetal =3D ""
--=20
2.45.1


