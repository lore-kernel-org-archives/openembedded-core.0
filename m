Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FB1C25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 20:06:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13560.1716753989089013941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 13:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ocDT5kKz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57630FF803;
	Sun, 26 May 2024 20:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716753986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivfAUbPob7HmMOI9unFF7pr7YvXuUEy3ai9nOY85s4I=;
	b=ocDT5kKzi6SPbjC+OWwRoWrJxKqepC3qRk74VsuMwDVe3r+/IQ6/rrPtXxB3yMwiFcnriF
	qz3heMp/JTHdKqQZ9lT9UF0cZqG/l6F87IxA8GCSZbaFX9YsyUXrRr9tqL0uDCquSEzPE3
	utu6cTyLwQkzbaFi0Z0W3dAOAVgdx+vfXwf2jXqKNB6g63NAePxVA+wtzOvfSnGUjLNuDL
	PIkxgMozDTJeV/Xi64fMEJGpzYoWEu9bwoN1w5lIXLXtoKE+C7Tc88yZmT7ezmcX5Ttk3w
	HrKPQo4GMoRweG0vgLSB23oV6SMsSeHRw8fO73T/WZC98BQ0ggQ988cpO/T89g==
Date: Sun, 26 May 2024 22:06:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Message-ID: <202405262006264e2aa991@mail.local>
References: <20240522203306.2241962-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522203306.2241962-1-alejandro@enedino.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 20:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199886

Please always resend the whole series, I'm not cherry-picking patches
once they have been dropped.

On 22/05/2024 14:33:06-0600, Alejandro Hernandez Samaniego wrote:
> Enables usage of TCLIBC=picolibc extending OE functionality to build and use
> picolibc based toolchains to build baremetal applications.
> 
> Picolibc is a set of standard C libraries, both libc and libm, designed for
> smaller embedded systems with limited ROM and RAM. Picolibc includes code
> from Newlib and AVR Libc, but adresses some of newlibs concerns, it retains
> newlibs directory structure, math, string and locale implementations, but
> removed the GPL bits used to build the library, swiches old C style code for
> C18 and replaces autotools with meson.
> 
> This patch adds a picolibc recipe for the C library, a picolibc-helloworld
> recipe that contains an example application and a testcase that builds it.
> 
> Picolibc can be built for ARM and RISCV architectures, its been tested both
> for 32 and 64 bits, the provided example recipe produces the following output:
> 
> hello, world
> 
> Runqemu does not automatically show any output since it hides QEMU stderr which
> is where the QEMU monitors output is directed to when using semihosting, but,
> manually running the same QEMU command does work properly.
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  meta/classes-recipe/baremetal-image.bbclass   |   4 +-
>  meta/classes-recipe/cross-canadian.bbclass    |   2 +-
>  meta/conf/distro/include/maintainers.inc      |   2 +
>  meta/conf/distro/include/tclibc-picolibc.inc  |  40 ++++++
>  meta/conf/documentation.conf                  |   2 +-
>  .../conf/machine/include/riscv/arch-riscv.inc |   1 +
>  meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
>  meta/lib/oeqa/selftest/cases/picolibc.py      |  18 +++
>  .../picolibc/picolibc-helloworld_git.bb       |  40 ++++++
>  meta/recipes-core/picolibc/picolibc.inc       |  21 ++++
>  .../avoid_polluting_cross_directories.patch   | 119 ++++++++++++++++++
>  .../picolibc/no-early-compiler-checks.cross   |   6 +
>  meta/recipes-core/picolibc/picolibc_git.bb    |  35 ++++++
>  meta/recipes-devtools/gcc/gcc-cross.inc       |   1 +
>  meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +
>  meta/recipes-devtools/gcc/libgcc-common.inc   |   5 +
>  16 files changed, 296 insertions(+), 5 deletions(-)
>  create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc
>  create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py
>  create mode 100644 meta/recipes-core/picolibc/picolibc-helloworld_git.bb
>  create mode 100644 meta/recipes-core/picolibc/picolibc.inc
>  create mode 100644 meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
>  create mode 100644 meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
>  create mode 100644 meta/recipes-core/picolibc/picolibc_git.bb
> 
> diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
> index 4e7d413626..27f2d2d10a 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -16,8 +16,8 @@
>  # See meta-skeleton for a working example.
>  
>  
> -# Toolchain should be baremetal or newlib based.
> -# TCLIBC="baremetal" or TCLIBC="newlib"
> +# Toolchain should be baremetal or newlib/picolibc based.
> +# TCLIBC="baremetal" or TCLIBC="newlib" or TCLIBC="picolibc"
>  COMPATIBLE_HOST:libc-musl:class-target = "null"
>  COMPATIBLE_HOST:libc-glibc:class-target = "null"
>  
> diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
> index 1670217d69..059d9aa95f 100644
> --- a/meta/classes-recipe/cross-canadian.bbclass
> +++ b/meta/classes-recipe/cross-canadian.bbclass
> @@ -36,7 +36,7 @@ python () {
>      if d.getVar("MODIFYTOS") != "1":
>          return
>  
> -    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
> +    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', 'picolibc' ]:
>          return
>  
>      tos = d.getVar("TARGET_OS")
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 014cf32e40..bb75d147fe 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -579,6 +579,8 @@ RECIPE_MAINTAINER:pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-perlcross = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER:pn-picolibc = "Alejandro Hernandez <alejandro@enedino.org>"
> +RECIPE_MAINTAINER:pn-picolibc-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
>  RECIPE_MAINTAINER:pn-piglit = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-pinentry = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/distro/include/tclibc-picolibc.inc
> new file mode 100644
> index 0000000000..203765dfcb
> --- /dev/null
> +++ b/meta/conf/distro/include/tclibc-picolibc.inc
> @@ -0,0 +1,40 @@
> +#
> +# Picolibc configuration
> +#
> +
> +LIBCEXTENSION = "-picolibc"
> +LIBCOVERRIDE = ":libc-picolibc"
> +
> +PREFERRED_PROVIDER_virtual/libc ?= "picolibc"
> +PREFERRED_PROVIDER_virtual/libiconv ?= "picolibc"
> +PREFERRED_PROVIDER_virtual/libintl ?= "picolibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> +
> +DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
> +
> +IMAGE_LINGUAS = ""
> +
> +LIBC_DEPENDENCIES = " \
> +    picolibc-dbg \
> +    picolibc-dev \
> +    libgcc-dev \
> +    libgcc-dbg \
> +    libstdc++-dev  \
> +    libstdc++-staticdev \
> +"
> +
> +ASSUME_PROVIDED += "virtual/crypt"
> +
> +TARGET_OS = "elf"
> +TARGET_OS:arm = "eabi"
> +
> +TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE} nativesdk-qemu nativesdk-sdk-provides-dummy"
> +TOOLCHAIN_TARGET_TASK ?= "${LIBC_DEPENDENCIES}"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove = "zlib ncurses"
> +
> +# RISCV linker doesnt support PIE
> +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 = "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 = "${SECURITY_NOPIE_CFLAGS}"
> +
> +
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index b0591881ba..ad89142934 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -421,7 +421,7 @@ TARGET_FPU[doc] = "Specifies the method for handling FPU code. For FPU-less targ
>  TARGET_OS[doc] = "Specifies the target's operating system."
>  TARGET_PREFIX[doc] = "The prefix for the cross-compile toolchain (e.g. arm-linux-)."
>  TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
> -TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc', 'musl' or 'newlib'."
> +TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc', 'musl', 'newlib', or 'picolibc'."
>  TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
>  TESTIMAGE_AUTO[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images each time an image is built."
>  TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> index 230a266563..b34064e78f 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -11,5 +11,6 @@ TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -marc
>  
>  # Fix: ld: unrecognized option '--hash-style=sysv'
>  LINKER_HASH_STYLE:libc-newlib = ""
> +LINKER_HASH_STYLE:libc-picolibc = ""
>  # Fix: ld: unrecognized option '--hash-style=gnu'
>  LINKER_HASH_STYLE:libc-baremetal = ""
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
> index ad952c004b..043953757f 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -55,7 +55,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
>              return False
>  
>          def is_maintainer_exception(entry):
> -            exceptions = ["musl", "newlib", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
> +            exceptions = ["musl", "newlib", "picolibc", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
>                            "cve-update-nvd2-native",]
>              for i in exceptions:
>                   if i in entry:
> diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py b/meta/lib/oeqa/selftest/cases/picolibc.py
> new file mode 100644
> index 0000000000..e40b4fc3d3
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/picolibc.py
> @@ -0,0 +1,18 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, get_bb_var
> +
> +class PicolibcTest(OESelftestTestCase):
> +
> +    def test_picolibc(self):
> +        compatible_machines = ['qemuarm', 'qemuarm64', 'qemuriscv32', 'qemuriscv64']
> +        machine = get_bb_var('MACHINE')
> +        if machine not in compatible_machines:
> +            self.skipTest('This test only works with machines : %s' % ' '.join(compatible_machines))
> +        self.write_config('TCLIBC = "picolibc"')
> +        bitbake("picolibc-helloworld")
> diff --git a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> new file mode 100644
> index 0000000000..573a571c24
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> @@ -0,0 +1,40 @@
> +require picolibc.inc
> +
> +# baremetal-image overrides
> +BAREMETAL_BINNAME ?= "hello_picolibc_${MACHINE}"
> +IMAGE_LINK_NAME ?= "baremetal-picolibc-image-${MACHINE}"
> +IMAGE_NAME_SUFFIX ?= ""
> +QB_DEFAULT_KERNEL ?= "${IMAGE_LINK_NAME}.elf"
> +
> +inherit baremetal-image
> +
> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> +
> +# Use semihosting to test via QEMU
> +QB_OPT_APPEND:append = " -semihosting-config enable=on"
> +
> +# picolibc comes with a set of linker scripts, set the file
> +# according to the architecture being built.
> +PICOLIBC_LINKERSCRIPT:qemuarm64 = "aarch64.ld"
> +PICOLIBC_LINKERSCRIPT:qemuarm = "arm.ld"
> +PICOLIBC_LINKERSCRIPT:qemuriscv32 = "riscv.ld"
> +PICOLIBC_LINKERSCRIPT:qemuriscv64 = "riscv.ld"
> +
> +# Simple compile function that manually exemplifies usage; as noted,
> +# use a custom linker script, the GCC specs provided by picolibc
> +# and semihost to be able to test via QEMU's monitor
> +do_compile(){
> +    ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${S}/hello-world/${PICOLIBC_LINKERSCRIPT} -specs=picolibc.specs --oslib=semihost -o ${BAREMETAL_BINNAME}.elf ${S}/hello-world/hello-world.c
> +    ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMETAL_BINNAME}.bin
> +}
> +
> +do_install(){
> +    install -d ${D}/${base_libdir}/firmware
> +    install -m 755 ${B}/${BAREMETAL_BINNAME}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> +    install -m 755 ${B}/${BAREMETAL_BINNAME}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> +}
> +
> +FILES:${PN} += " \
> +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
> +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
> +"
> diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
> new file mode 100644
> index 0000000000..3b380fe7af
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc.inc
> @@ -0,0 +1,21 @@
> +SUMMARY = "C Libraries for Smaller Embedded Systems"
> +HOMEPAGE = "https://keithp.com/picolibc"
> +DESCRIPTION = "Picolibc is a set of standard C libraries, both libc and libm, designed for smaller embedded systems with limited ROM and RAM. Picolibc includes code from Newlib and AVR Libc."
> +SECTION = "libs"
> +
> +# Newlib based code but GPL related bits removed, test/printf-tests.c and test/testcases.c
> +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of the artifacts.
> +LICENSE = "BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM = " \
> +		file://COPYING.GPL2;md5=59530bdf33659b29e73d4adb9f9f6552 \
> +		file://COPYING.NEWLIB;md5=08ae03456feb75b81cfdb359e0f1ef85 \
> +		file://COPYING.picolibc;md5=e50fa9458a40929689861ed472d46bc7 \
> +		"
> +
> +BASEVER = "1.8.6"
> +PV = "${BASEVER}+git"
> +SRC_URI = "git://github.com/picolibc/picolibc.git;protocol=https;branch=main"
> +SRCREV="764ef4e401a8f4c6a86ab723533841f072885a5b"
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
> new file mode 100644
> index 0000000000..da6460c95c
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
> @@ -0,0 +1,119 @@
> +Upstream-Status: Pending
> +
> +Picolibc uses its own specs file: picolibc.specs to facilitate compilation, this
> +needs to be passed down to GCC via the -specs argument.
> +
> +Using this specs file overrides some of the default options our toolchain was
> +built with, in this case, they modify the include_dir and lib_dir paths used for
> +compilation, their intention was to add support for -picolibc-prefix and
> +-picolibc-buildtype arguments via the C preprocessor.
> +
> +-isystem %{-picolibc-prefix=*:%*/include/; -picolibc-buildtype=*:/usr/include/%*; :/usr/include} %(picolibc_cpp)
> +
> +This had the unwanted effect of defaulting to /usr/include for include_dir if
> +those arguments are not being passed, this works fine for their flow but for us
> +it pollutes the include directories with paths from the host. The same effect is
> +applicable for lib_dir and for the c runtime file.
> +
> +Our toolchain relies on --sysroot to avoid using any paths from the host, here we
> +manually add support for a third possible argument: -sysroot , if this is passed
> +then the paths used by the compiler will be relative to the path passed by the
> +--sysroot= cmdline argument, setting back the behavior that we intended in the
> +first place.
> +
> +
> +Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> +
> +Index: git/meson.build
> +===================================================================
> +--- git.orig/meson.build
> ++++ git/meson.build
> +@@ -622,12 +622,13 @@ else
> + #
> + picolibc_prefix_format = '-picolibc-prefix=*:@0@'
> + picolibc_buildtype_format = '-picolibc-buildtype=*:@0@'
> ++sysroot_format = '-sysroot=*:@0@'
> + gen_format = '@0@'
> + 
> + #
> + # How to glue the three options together
> + #
> +-specs_option_format = '%{@0@; @1@; :@2@}'
> ++specs_option_format = '%{@0@; @1@; @2@; :@3@}'
> + 
> + #
> + # Build the -isystem value
> +@@ -639,10 +640,13 @@ isystem_prefix = picolibc_prefix_format.
> + buildtype_include_dir = specs_prefix_format.format(get_option('includedir') / '%*')
> + isystem_buildtype = picolibc_buildtype_format.format(buildtype_include_dir)
> + 
> ++sysroot_include_dir = '%*'
> ++isystem_sysroot = sysroot_format.format(sysroot_include_dir)
> ++
> + gen_include_dir = specs_prefix_format.format(get_option('includedir'))
> + isystem_gen = gen_format.format(gen_include_dir)
> + 
> +-specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_gen)
> ++specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_sysroot, isystem_gen)
> + 
> + #
> + # Build the non-multilib -L value
> +@@ -654,10 +658,13 @@ lib_prefix = picolibc_prefix_format.form
> + buildtype_lib_dir = specs_prefix_format.format(get_option('libdir') / '%*')
> + lib_buildtype = picolibc_buildtype_format.format(buildtype_lib_dir)
> + 
> ++sysroot_lib_dir = '%*'
> ++lib_sysroot = sysroot_format.format(sysroot_lib_dir)
> ++
> + gen_lib_dir = specs_prefix_format.format(get_option('libdir'))
> + lib_gen = gen_format.format(gen_lib_dir)
> + 
> +-specs_libpath = '-L' + specs_option_format.format(lib_prefix, lib_buildtype, lib_gen)
> ++specs_libpath = '-L' + specs_option_format.format(lib_prefix, lib_buildtype, lib_sysroot, lib_gen)
> + 
> + #
> + # Build the non-multilib *startfile options
> +@@ -669,6 +676,9 @@ crt0_prefix = picolibc_prefix_format.for
> + buildtype_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*' / crt0_expr)
> + crt0_buildtype = picolibc_buildtype_format.format(buildtype_crt0_path)
> + 
> ++sysroot_crt0_path = '%*' + '/' + get_option('libdir') + '/' + '%*' + '/' + crt0_expr
> ++crt0_sysroot = picolibc_buildtype_format.format(sysroot_crt0_path)
> ++
> + gen_crt0_path = specs_prefix_format.format(get_option('libdir') / crt0_expr)
> + crt0_gen = gen_format.format(gen_crt0_path)
> + 
> +@@ -686,10 +696,13 @@ if enable_multilib
> +   buildtype_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%*/%M')
> +   multilib_buildtype = picolibc_buildtype_format.format(buildtype_multilib_dir)
> + 
> ++  sysroot_multilib_dir = '%*' + '/' + get_option('libdir') + '/' + '%*/%M'
> ++  multilib_sysroot = sysroot_format.format(sysroot_multilib_dir)
> ++  
> +   gen_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%M')
> +   multilib_gen = gen_format.format(gen_multilib_dir)
> + 
> +-  specs_multilibpath = '-L' + specs_option_format.format(multilib_prefix, multilib_buildtype, multilib_gen)
> ++  specs_multilibpath = '-L' + specs_option_format.format(multilib_prefix, multilib_buildtype, multilib_sysroot, multilib_gen)
> + 
> +   #
> +   # Prepend the multilib -L option to the non-multilib option
> +@@ -705,6 +718,9 @@ if enable_multilib
> +   buildtype_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_expr)
> +   crt0_buildtype = picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
> + 
> ++  sysroot_multilib_crt0_path = '%*' + prefix + '/' + get_option('libdir') + '/' + '/%M' + '/' + crt0_expr
> ++  crt0_sysroot = sysroot_format.format(sysroot_multilib_crt0_path)
> ++  
> +   gen_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
> +   crt0_gen = gen_format.format(gen_multilib_crt0_path)
> + endif
> +@@ -714,7 +730,7 @@ endif
> + # above. As there's only one value, it's either the
> + # multilib path or the non-multilib path
> + #
> +-specs_startfile = specs_option_format.format(crt0_prefix, crt0_buildtype, crt0_gen)
> ++specs_startfile = specs_option_format.format(crt0_prefix, crt0_buildtype, crt0_sysroot, crt0_gen)
> + endif
> + 
> + specs_data = configuration_data()
> diff --git a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> new file mode 100644
> index 0000000000..87bfbad3c5
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> @@ -0,0 +1,6 @@
> +# We need to explicitly bypass mesons sanity check to avoid early compiler errors
> +# otherwise meson will try to compile AND run test applications:
> +# ../git/meson.build:35:0: ERROR: Executables created by c compiler are not runnable...
> +
> +[properties]
> +skip_sanity_check=true
> \ No newline at end of file
> diff --git a/meta/recipes-core/picolibc/picolibc_git.bb b/meta/recipes-core/picolibc/picolibc_git.bb
> new file mode 100644
> index 0000000000..a17abbc534
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc_git.bb
> @@ -0,0 +1,35 @@
> +require picolibc.inc
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc"
> +
> +PROVIDES += "virtual/libc virtual/libiconv virtual/libintl"
> +
> +COMPATIBLE_HOST:libc-musl:class-target = "null"
> +COMPATIBLE_HOST:libc-glibc:class-target = "null"
> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> +
> +SRC_URI:append = " file://avoid_polluting_cross_directories.patch"
> +SRC_URI:append = " file://no-early-compiler-checks.cross"
> +
> +# This is being added by picolibc meson files as well to avoid
> +# early compiler tests from failing, cant remember why I added it
> +# to the newlib recipe but I would assume it was for the same reason
> +TARGET_CC_ARCH:append = " -nostdlib"
> +
> +# When using RISCV64 use medany for both C library and application recipes
> +TARGET_CFLAGS:append:qemuriscv64 = " -mcmodel=medany"
> +
> +inherit meson
> +
> +MESON_CROSS_FILE:append = " --cross-file=${WORKDIR}/no-early-compiler-checks.cross"
> +
> +PACKAGECONFIG ??= " specsdir"
> +# Install GCC specs on libdir
> +PACKAGECONFIG[specsdir] = "-Dspecsdir=${libdir},-Dspecsdir=none"
> +
> +
> +FILES:${PN}-dev:append = " ${libdir}/*.specs ${libdir}/*.ld"
> +
> +# No rpm package is actually created but -dev depends on it, avoid dnf error
> +DEV_PKG_DEPENDENCY:libc-picolibc = ""
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index a540fb2434..e492dea1b8 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -34,6 +34,7 @@ EXTRA_OECONF += "\
>  EXTRA_OECONF:append:libc-baremetal = " --without-headers"
>  EXTRA_OECONF:remove:libc-baremetal = "--enable-threads=posix"
>  EXTRA_OECONF:remove:libc-newlib = "--enable-threads=posix"
> +EXTRA_OECONF:remove:libc-picolibc = "--enable-threads=posix"
>  
>  EXTRA_OECONF_PATHS = "\
>      --with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index dbc9141000..7885eb40dd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS = "\
>  EXTRA_OECONF:append:linuxstdbase = " --enable-clocale=gnu"
>  EXTRA_OECONF:append = " --cache-file=${B}/config.cache"
>  EXTRA_OECONF:append:libc-newlib = " --with-newlib --with-target-subdir"
> +EXTRA_OECONF:append:libc-picolibc = " --with-newlib --with-target-subdir"
>  EXTRA_OECONF:append:libc-baremetal = " --with-target-subdir"
>  
>  # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?= ""
>  
>  # Newlib does not support symbol versioning on libsdtcc++
>  SYMVERS_CONF:libc-newlib = ""
> +SYMVERS_CONF:libc-picolibc = ""
>  
>  # Building with thumb enabled on armv6t fails
>  ARM_INSTRUCTION_SET:armv6 = "arm"
> @@ -47,6 +49,7 @@ RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM
>  "
>  # Only build libstdc++ for newlib
>  RUNTIMETARGET:libc-newlib = "libstdc++-v3"
> +RUNTIMETARGET:libc-picolibc = "libstdc++-v3"
>  
>  # libiberty
>  # libgfortran needs separate recipe due to libquadmath dependency
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
> index d9084af51a..e3db17d700 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {
>  		rmdir ${D}${base_libdir}
>  	fi
>  }
> +do_install:append:libc-picolibc () {
> +	if [ "${base_libdir}" != "${libdir}" ]; then
> +		rmdir ${D}${base_libdir}
> +	fi
> +}
>  
>  # No rpm package is actually created but -dev depends on it, avoid dnf error
>  DEV_PKG_DEPENDENCY:libc-baremetal = ""
> -- 
> 2.45.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199768): https://lists.openembedded.org/g/openembedded-core/message/199768
> Mute This Topic: https://lists.openembedded.org/mt/106250650/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

