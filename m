Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2A937CB30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:47:25 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z39so19997173qtz.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hHMPSPbCqptyx2+E1VVuoe2HMf57/7QLhfitRLWDIdU=;
	b=COj6+22IHCRYw1Mdn1Ho4+BfGdP/7BGLUVctcKEubeZ1I9i/0r4uryOm4y9f9lBPUp
	OMaTAqnNmDMH0Giv7ev4cgZu7AyVYJ9cGZnx/3UAN/Um+pGfdgZ4v0MFJldTF1kWHRtL
	T0jkDjJOPxeN3uzpt+ddwOjyZkKHpzL90ghAHmnm4gcWPvYaXuDqCXVS/CEKoZn1lMle
	tx2ISmpIx43cASVYNqyxFczR52IA9XCrZYWEzcFoz9dbbIOcDkTextBJZLxZ+HzBFXbF
	AsQMkZdV24LeqlYKw/oNvPCPzRVCbfSqabBFM5bONqEbzbxMNHvO38Ji4rcHKAx1bveA
	o+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hHMPSPbCqptyx2+E1VVuoe2HMf57/7QLhfitRLWDIdU=;
	b=hzeVUcL3tii93I2BWioesTnNxaSitFPi0TzmDAHK9HCqeQL6U9mw7ESTte9HKlhvWt
	l0zAjOiPh+cLbh30yWASODIRYi/g8fKUPblLOrrHXbYJtNxRmFLGecHIAY/LaJyoMUJm
	kyNIqrmxQkU+S6rKVj1PnLF8Wj0/jXPCA3hJrcsT0y+20qemNVPnWpONALhZt4M8ywAV
	tAwHWzEYj/P8yEbLJ6LvQXTrx6jcoeZJv6WFWMWoXtvpwtEmPUZg8Tg5/nDKzNUdrKx2
	rAyAkvtjlwZMcbxW4rvK29G5QoAikr8bBBltB+5tZE/axtV7rwfWP4mzqN/YosCI+D5/
	10Ng==
X-Gm-Message-State: APjAAAVwy6NXXguHGMsIETm31WX3LX33DqUuKZPEKn43MsOuXV5z3DPr
	rvFdYgDCMwR75kxZmWeQRG0dRq7TeCAokSX5GDY=
X-Google-Smtp-Source: APXvYqy4IMBIWaxqJjXtFTZ7wmI2oqGbrxME9ojsB2hBW1B2sfXDuunUL8Hzt5LE7nj+uogKBUz7QFRPSq1/KwXjQio=
X-Received: by 2002:a0c:94cf:: with SMTP id k15mr2670137qvk.55.1551286046520; 
	Wed, 27 Feb 2019 08:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20190227134939.51320-1-alex.kanavin@gmail.com>
In-Reply-To: <20190227134939.51320-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 08:47:00 -0800
Message-ID: <CAMKF1sqJbSX-4hPaYDC9o3QDdqaG2zc7-8VG05eO8mSmV_18+g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] qemu: split the native version into usermode and system parts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2019 16:47:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 5:50 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The rationale is to streamline the overall build.
>
> The system parts are only needed to run target images, and so can be
> built towards the end of the build process. At the same time, the
> system parts need gtk+-native and mesa-native which add significantly
> to the build time.
>
> On the other hand, the usermode parts have almost no dependencies
> and can be built quickly. They are needed at recipes build time to
> run target binaries, and so are required quite early in the typical
> build process.
>

this is really good patch for non-qemu machines.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/no-static-libs.inc   |  1 +
>  .../qemu/qemu-helper-native_1.0.bb            |  4 +-
>  meta/recipes-devtools/qemu/qemu-native.inc    | 17 ++++
>  .../qemu/qemu-native_3.1.0.bb                 |  9 ++
>  .../qemu/qemu-system-native_3.1.0.bb          | 23 +++++
>  meta/recipes-devtools/qemu/qemu-targets.inc   |  6 ++
>  meta/recipes-devtools/qemu/qemu.inc           | 97 ++++++++++++-------
>  meta/recipes-devtools/qemu/qemu_3.1.0.bb      | 68 +++----------
>  8 files changed, 134 insertions(+), 91 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu-native.inc
>  create mode 100644 meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
>  create mode 100644 meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> index cdc53916d07..712d858dc0d 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -4,6 +4,7 @@ DISABLE_STATIC ?= " --disable-static"
>  DISABLE_STATIC_pn-qemu = ""
>  DISABLE_STATIC_pn-qemu-native = ""
>  DISABLE_STATIC_pn-nativesdk-qemu = ""
> +DISABLE_STATIC_pn-qemu-system-native = ""
>  # pciutils fails build
>  DISABLE_STATIC_pn-pciutils = ""
>  # libcap aborts on unrecognised option
> diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> index d86b1551762..d9d9da0fade 100644
> --- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Helper utilities needed by the runqemu script"
>  LICENSE = "GPLv2"
> -RDEPENDS_${PN} = "qemu-native"
> +RDEPENDS_${PN} = "qemu-system-native"
>  PR = "r1"
>
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
> @@ -20,5 +20,5 @@ do_install() {
>         install tunctl ${D}${bindir}/
>  }
>
> -DEPENDS += "qemu-native"
> +DEPENDS += "qemu-system-native"
>  addtask addto_recipe_sysroot after do_populate_sysroot before do_build
> diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
> new file mode 100644
> index 00000000000..4373ad9e63a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-native.inc
> @@ -0,0 +1,17 @@
> +inherit native
> +
> +require qemu.inc
> +
> +SRC_URI_append = " \
> +            file://0012-fix-libcap-header-issue-on-some-distro.patch \
> +            file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
> +            "
> +EXTRA_OECONF_append = " --python=python2.7"
> +
> +EXTRA_OEMAKE_append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
> +
> +LDFLAGS_append = " -fuse-ld=bfd"
> +
> +do_install_append() {
> +     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
> +}
> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> new file mode 100644
> index 00000000000..c8acff8e196
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> @@ -0,0 +1,9 @@
> +BPN = "qemu"
> +
> +DEPENDS = "glib-2.0-native zlib-native"
> +
> +require qemu-native.inc
> +
> +EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-blobs --disable-guest-agent"
> +
> +PACKAGECONFIG ??= ""
> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
> new file mode 100644
> index 00000000000..95369d7f6a2
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
> @@ -0,0 +1,23 @@
> +BPN = "qemu"
> +
> +require qemu-native.inc
> +
> +# As some of the files installed by qemu-native and qemu-system-native
> +# are the same, we depend on qemu-native to get the full installation set
> +# and avoid file clashes
> +DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native"
> +
> +EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
> +
> +PACKAGECONFIG ??= "fdt alsa kvm virglrenderer glx"
> +
> +# Handle distros such as CentOS 5 32-bit that do not have kvm support
> +PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
> +
> +do_install_append() {
> +    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
> +
> +    # The following is also installed by qemu-native
> +    rm -f ${D}${datadir}/qemu/trace-events-all
> +    rm -rf ${D}${datadir}/qemu/keymaps
> +}
> diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
> index a7d7b5f7084..550d6f0ab1e 100644
> --- a/meta/recipes-devtools/qemu/qemu-targets.inc
> +++ b/meta/recipes-devtools/qemu/qemu-targets.inc
> @@ -20,3 +20,9 @@ def get_qemu_target_list(d):
>      if 'linux' not in tos:
>          return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
>      return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
> +
> +def get_qemu_usermode_target_list(d):
> +    return ",".join(filter(lambda i: "-linux-user" in i, get_qemu_target_list(d).split(',')))
> +
> +def get_qemu_system_target_list(d):
> +    return ",".join(filter(lambda i: "-linux-user" not in i, get_qemu_target_list(d).split(',')))
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 9a989f00b0b..a9d28bf5a38 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,12 +1,59 @@
>  SUMMARY = "Fast open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
> -DEPENDS = "glib-2.0 zlib pixman"
> -RDEPENDS_${PN}_class-target += "bash"
> +
> +RDEPENDS_${PN}-ptest = "bash make"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> +                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
> +
> +SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
> +           file://powerpc_rom.bin \
> +           file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
> +           file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
> +           file://0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch \
> +           file://run-ptest \
> +           file://0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
> +           file://0005-qemu-disable-Valgrind.patch \
> +           file://0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch \
> +           file://0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch \
> +           file://0008-chardev-connect-socket-to-a-spawned-command.patch \
> +           file://0009-apic-fixup-fallthrough-to-PIC.patch \
> +           file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
> +           file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
> +           file://0001-Add-a-missing-X11-include.patch \
> +           file://0001-egl-headless-add-egl_create_context.patch \
> +           "
> +UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +SRC_URI[md5sum] = "fb687ce0b02d3bf4327e36d3b99427a8"
> +SRC_URI[sha256sum] = "6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc"
> +
> +COMPATIBLE_HOST_mipsarchn32 = "null"
> +COMPATIBLE_HOST_mipsarchn64 = "null"
> +
> +do_install_append() {
> +    # Prevent QA warnings about installed ${localstatedir}/run
> +    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
> +}
> +
> +do_compile_ptest() {
> +       make buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +       cp -rL ${B}/tests ${D}${PTEST_PATH}
> +       find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
> +
> +       cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
> +       # Don't check the file genreated by configure
> +       sed -i -e '/wildcard config-host.mak/d' \
> +              -e '$ {/endif/d}' ${D}${PTEST_PATH}/tests/Makefile.include
> +}
> +
>
>  require qemu-targets.inc
> -inherit pkgconfig bluetooth
> -BBCLASSEXTEND = "native nativesdk"
> +inherit pkgconfig bluetooth ptest
>
>  # QEMU_TARGETS is overridable variable
>  QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc riscv32 riscv64 sh4 x86_64"
> @@ -25,15 +72,9 @@ EXTRA_OECONF = " \
>      --with-confsuffix=/${BPN} \
>      --disable-strip \
>      --disable-werror \
> -    --target-list=${@get_qemu_target_list(d)} \
>      --extra-cflags='${CFLAGS}' \
>      ${PACKAGECONFIG_CONFARGS} \
>      "
> -EXTRA_OECONF_append_class-native = " --python=python2.7"
> -
> -EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
> -
> -LDFLAGS_append_class-native = " -fuse-ld=bfd"
>
>  export LIBTOOL="${HOST_SYS}-libtool"
>
> @@ -48,25 +89,6 @@ do_install () {
>         oe_runmake 'DESTDIR=${D}' install
>  }
>
> -make_qemu_wrapper() {
> -        gdk_pixbuf_module_file=`pkg-config --variable=gdk_pixbuf_cache_file gdk-pixbuf-2.0`
> -
> -        for tool in `ls ${D}${bindir}/qemu-system-*`; do
> -                create_wrapper $tool \
> -                        GDK_PIXBUF_MODULE_FILE=$gdk_pixbuf_module_file \
> -                        FONTCONFIG_PATH=/etc/fonts \
> -                        GTK_THEME=Adwaita
> -        done
> -}
> -
> -do_install_append_class-native() {
> -     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
> -}
> -
> -do_install_append_class-nativesdk() {
> -     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
> -}
> -
>  # The following fragment will create a wrapper for qemu-mips user emulation
>  # binary in order to work around a segmentation fault issue. Basically, by
>  # default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
> @@ -81,15 +103,16 @@ do_install_append() {
>  }
>  # END of qemu-mips workaround
>
> -PACKAGECONFIG ??= " \
> -    fdt gtk+ kvm \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> -"
> -PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> -PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
> +make_qemu_wrapper() {
> +        gdk_pixbuf_module_file=`pkg-config --variable=gdk_pixbuf_cache_file gdk-pixbuf-2.0`
>
> -# Handle distros such as CentOS 5 32-bit that do not have kvm support
> -PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
> +        for tool in `ls ${D}${bindir}/qemu-system-*`; do
> +                create_wrapper $tool \
> +                        GDK_PIXBUF_MODULE_FILE=$gdk_pixbuf_module_file \
> +                        FONTCONFIG_PATH=/etc/fonts \
> +                        GTK_THEME=Adwaita
> +        done
> +}
>
>  # Disable kvm/virgl/mesa on targets that do not support it
>  PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
> diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
> index ea4277eddea..1f30729588c 100644
> --- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
> @@ -1,58 +1,22 @@
> +BBCLASSEXTEND = "nativesdk"
> +
>  require qemu.inc
>
> -inherit ptest
> -
> -RDEPENDS_${PN}-ptest = "bash make"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> -                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
> -
> -SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
> -           file://powerpc_rom.bin \
> -           file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
> -           file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
> -           file://0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch \
> -           file://run-ptest \
> -           file://0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
> -           file://0005-qemu-disable-Valgrind.patch \
> -           file://0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch \
> -           file://0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch \
> -           file://0008-chardev-connect-socket-to-a-spawned-command.patch \
> -           file://0009-apic-fixup-fallthrough-to-PIC.patch \
> -           file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
> -           file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
> -           file://0001-Add-a-missing-X11-include.patch \
> -           file://0001-egl-headless-add-egl_create_context.patch \
> -           "
> -UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> -
> -SRC_URI_append_class-native = " \
> -            file://0012-fix-libcap-header-issue-on-some-distro.patch \
> -            file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
> -            "
> -
> -SRC_URI[md5sum] = "fb687ce0b02d3bf4327e36d3b99427a8"
> -SRC_URI[sha256sum] = "6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc"
> -
> -COMPATIBLE_HOST_mipsarchn32 = "null"
> -COMPATIBLE_HOST_mipsarchn64 = "null"
> -
> -do_install_append() {
> -    # Prevent QA warnings about installed ${localstatedir}/run
> -    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
> -    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
> -}
> +DEPENDS = "glib-2.0 zlib pixman"
>
> -do_compile_ptest() {
> -       make buildtest-TESTS
> -}
> +RDEPENDS_${PN}_class-target += "bash"
>
> -do_install_ptest() {
> -       cp -rL ${B}/tests ${D}${PTEST_PATH}
> -       find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
> +EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
> +EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
>
> -       cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
> -       # Don't check the file genreated by configure
> -       sed -i -e '/wildcard config-host.mak/d' \
> -              -e '$ {/endif/d}' ${D}${PTEST_PATH}/tests/Makefile.include
> +do_install_append_class-nativesdk() {
> +     ${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'make_qemu_wrapper', '', d)}
>  }
> +
> +PACKAGECONFIG ??= " \
> +    fdt gtk+ kvm \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> +"
> +PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
> +
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

