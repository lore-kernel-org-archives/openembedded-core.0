Return-Path: <freesilicon@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id EF5FD70781
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 14:19:49 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 131so689733ykp.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=LZsfMW9FZb1qMQoRq/Cqop+AZ9tKEVtjze8ASmhjhW0=;
	b=u04by7oNsFqnCtj0VaRfSjvu+RzARY0eUy6+YLK7sYpiVVZVw86tXaVuglmzjM13Dv
	Y8DDxZXEivEoBGrI70pp7IfPAzgHGyg19sjuW8oHGmbrxbQhcvpSqtewjh/H/fdPqHnE
	My2qTRPeK4k2NkojZ5me7ry53b3WK4F5mUJp3xvTZgigLg49DBkIBrB45HSpjZhYSVil
	LNYRHJHEUbrfHym4WFXu/iV2VDSMYWuEUz2gwn7v9aKv/5B1Fnamr6ucFdZv42JED3wT
	UtQjEVovJUqYXuiFPjN+wHmtI/KKf8rhGDzPeGRenY336QIryGd4SDweU2CVpdi3TOqA
	Jnpg==
MIME-Version: 1.0
X-Received: by 10.236.82.147 with SMTP id o19mr7041817yhe.112.1406729990208;
	Wed, 30 Jul 2014 07:19:50 -0700 (PDT)
Received: by 10.170.123.210 with HTTP; Wed, 30 Jul 2014 07:19:49 -0700 (PDT)
In-Reply-To: <1406720953-30774-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1406720953-30774-1-git-send-email-s.mueller-klieser@phytec.de>
Date: Wed, 30 Jul 2014 16:19:49 +0200
Message-ID: <CAKRNOGzRXXuqbxjuizmFgfC6H+agwmkS+c0bP-nAGdpvKpeJNQ@mail.gmail.com>
From: David Vincent <freesilicon@gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 1/1] add support for the barebox bootloader
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
X-List-Received-Date: Wed, 30 Jul 2014 14:19:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

This recipe is more complete than what I've previously submitted and,
I think, is a better base for barebox initial support in OE-Core. Just
like it has already been said, maybe barebox target tools should have
their own recipe. However, I'd be happy to help further developments
on this recipe.

Greetings,
David

2014-07-30 13:49 GMT+02:00 Stefan M=C3=BCller-Klieser <s.mueller-klieser@ph=
ytec.de>:
> Barebox is a bootloader that inherits the best of U-Boot and the Linux
> kernel. The barebox uses kconfig and kbuild mechanisms similar to the
> Linux kernel. This is reflected in the recipe. As soon as this
> functionality gets more abstraction in classes, the barebox recipe can
> be simplified. The recipe supports: kconfig handling, kconfig fragments,
> packages for dev tools and support for the initial program loader
> creation.
>
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  meta/recipes-bsp/barebox/barebox-ipl.inc          |  37 +++++
>  meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb |   4 +
>  meta/recipes-bsp/barebox/barebox.inc              | 161 ++++++++++++++++=
++++++
>  meta/recipes-bsp/barebox/barebox_2014.07.0.bb     |   4 +
>  4 files changed, 206 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox-ipl.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb
>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
>
> diff --git a/meta/recipes-bsp/barebox/barebox-ipl.inc b/meta/recipes-bsp/=
barebox/barebox-ipl.inc
> new file mode 100644
> index 0000000..f388522
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox-ipl.inc
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2014 Stefan Mueller-Klieser <s.mueller-klieser@phytec.de=
> \
> +# PHYTEC Messtechnik GmbH
> +# Recipe released under the GPL-3.0 license
> +
> +require barebox.inc
> +
> +DESCRIPTION =3D "Barebox IPL Inintial Program Loader: some machines need=
 \
> +               a pre-bootloader. This one gets build by the barebox."
> +PROVIDES =3D "barebox-ipl"
> +S =3D "${WORKDIR}/barebox-${PV}"
> +
> +# Pre Bootloader
> +BAREBOX_IPL_BIN ?=3D "barebox.bin"
> +BAREBOX_IPL_BIN_DEPLOY ?=3D "IPL-${MACHINE}-${PV}-${PR}.bin"
> +BAREBOX_IPL_BIN_SYMLINK ?=3D "IPL"
> +BAREBOX_IPL_DEFAULT_DEFCONFIG ?=3D "am335x_mlo_defconfig"
> +
> +do_default_defconfig () {
> +       bbnote "generating .config for target ${BAREBOX_IPL_DEFAULT_DEFCO=
NFIG}"
> +       unset CFLAGS LDFLAGS
> +       oe_runmake ${BAREBOX_IPL_DEFAULT_DEFCONFIG}
> +}
> +
> +do_install () {
> +       bbnote "Installing barebox-ipl image on target rootfs"
> +       install -d ${D}${base_bootdir}
> +       install ${S}/${BAREBOX_IPL_BIN} ${D}${base_bootdir}/${BAREBOX_IPL=
_BIN_DEPLOY}
> +       ln -sf ${BAREBOX_IPL_BIN_DEPLOY} ${D}${base_bootdir}/${BAREBOX_IP=
L_BIN_SYMLINK}
> +}
> +FILES_${PN} =3D ""
> +FILES_${PN} =3D "${base_bootdir}"
> +
> +do_deploy () {
> +       bbnote "Deploying barebox ipl"
> +       install ${S}/${BAREBOX_IPL_BIN} ${DEPLOYDIR}/${BAREBOX_IPL_BIN_DE=
PLOY}
> +       ln -sf ${BAREBOX_IPL_BIN_DEPLOY} ${DEPLOYDIR}/${BAREBOX_IPL_BIN_S=
YMLINK}
> +}
> diff --git a/meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb b/meta/rec=
ipes-bsp/barebox/barebox-ipl_2014.07.0.bb
> new file mode 100644
> index 0000000..372828a
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb
> @@ -0,0 +1,4 @@
> +require barebox-ipl.inc
> +
> +SRC_URI[md5sum] =3D "f3a93950777916d4b1c2cd366aec8d91"
> +SRC_URI[sha256sum] =3D "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f=
3b621636876285f2"
> diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/bare=
box/barebox.inc
> new file mode 100644
> index 0000000..b7885df
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox.inc
> @@ -0,0 +1,161 @@
> +# Copyright (C) 2014 Stefan Mueller-Klieser <s.mueller-klieser@phytec.de=
>
> +# PHYTEC Messtechnik GmbH
> +# Recipe released under the GPL-3.0 license
> +#
> +# TODO: see if there is some development towards moving all kconfig
> +#       funcionality into the kconfig-frontends package and adjust
> +#       the recipe accordingly.
> +#
> +
> +SUMMARY =3D "The Barebox Bootloader"
> +DESCRIPTION =3D "Barebox (formerly known as u-boot-v2) is a bootloader t=
hat \
> +               inherits the best of U-Boot and the Linux kernel: The siz=
e and \
> +              look-and-feel of u-boot, with driver model and lots of des=
ign \
> +              concepts from the kernel. \
> +              The bb recipe adds config fragment support and kconfig \
> +              command handling using the yocto kern-tools-native."
> +HOMEPAGE =3D "http://www.barebox.org"
> +SECTION =3D "bootloaders"
> +PROVIDES =3D "virtual/bootloader barebox"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D057bf9e50e1ca857d0eb97bfe4ba8=
e5d"
> +SRC_URI =3D "http://barebox.org/download/barebox-${PV}.tar.bz2"
> +
> +inherit kernel-arch cml1 deploy
> +DEPENDS +=3D "kern-tools-native"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +# verbose build 0/1
> +VERBOSE_BUILD ?=3D "0"
> +EXTRA_OEMAKE =3D 'V=3D${VERBOSE_BUILD} CROSS_COMPILE=3D${TARGET_PREFIX} =
CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> +# target rootfs boot directory
> +base_bootdir =3D "/boot"
> +
> +# these variables need to be assigned in the machine.conf
> +# name of the image created by barebox Makefile
> +BAREBOX_BIN ?=3D "barebox.bin"
> +# filename of file to be deployed by this recipe
> +BAREBOX_BIN_DEPLOY ?=3D "barebox-${MACHINE}-${PV}-${PR}.bin"
> +BAREBOX_BIN_SYMLINK ?=3D "barebox.bin"
> +BAREBOX_DEFAULT_DEFCONFIG ?=3D ""
> +# barebox environment
> +BAREBOX_ENV ?=3D "defaultenv/barebox_default_env"
> +BAREBOX_ENV_DEPLOY ?=3D "bareboxenv-${MACHINE}-${PV}-${PR}"
> +BAREBOX_ENV_SYMLINK ?=3D "barebox.env"
> +
> +# returns .scc and .cfg filenames from SRC_URI
> +def find_sccs(d):
> +    sources=3Dsrc_patches(d, True)
> +    sources_list=3D[]
> +    for s in sources:
> +        base, ext =3D os.path.splitext(os.path.basename(s))
> +        if ext and ext in [".scc", ".cfg"]:
> +            sources_list.append(s)
> +    return sources_list
> +
> +# uses kern-tools-native to merge the config fragments
> +python do_prepare_configure() {
> +    import shutil, subprocess
> +    workdir =3D d.getVar('WORKDIR', True)
> +    S =3D d.getVar('S', True)
> +    defconfig =3D os.path.join(workdir , 'defconfig')
> +    if not os.path.isfile(defconfig):
> +        bb.note("No defconfig file provided for the barebox recipe")
> +        config =3D os.path.join(S, '.config')
> +        if not os.path.isfile(config):
> +            bb.note("barebox is not configured")
> +            bb.build.exec_func("do_default_defconfig",d)
> +        bb.build.exec_func("do_savedefconfig",d)
> +        defconfig =3D os.path.join(workdir , 'defconfig.temp')
> +    os.chdir(workdir)
> +    fragments =3D find_sccs(d)
> +    if not fragments:
> +        bb.note("no config fragments will be merged")
> +    else:
> +        bb.note("combining kconfig fragments into .config for barebox")
> +        cmd =3D 'merge_config.sh -m -O %s %s %s' % (S, defconfig, ' '.jo=
in(map(str,fragments)))
> +        subprocess.call(cmd, shell=3DTrue)
> +    localversion =3D "-${DISTRO}-${DISTRO_VERSION}"
> +    bb.note("Setting LOCALVERSION in .config to %s" % localversion)
> +    bareboxconfig =3D os.path.join(S, '.config')
> +    cmd =3D 'kconfig-tweak --file %s --set-str LOCALVERSION %s' % (bareb=
oxconfig, localversion)
> +    subprocess.call(cmd,shell=3DTrue)
> +}
> +do_configure[prefuncs] +=3D "do_prepare_configure"
> +
> +do_default_defconfig () {
> +       bbnote "generating .config for target ${BAREBOX_DEFAULT_DEFCONFIG=
}"
> +       unset CFLAGS LDFLAGS
> +       oe_runmake ${BAREBOX_DEFAULT_DEFCONFIG}
> +}
> +
> +do_savedefconfig() {
> +       bbplain "saving defconfig to ${WORKDIR}/defconfig.temp"
> +       oe_runmake savedefconfig
> +       install -m 644 ${S}/defconfig ${WORKDIR}/defconfig.temp
> +}
> +addtask savedefconfig after do_configure
> +
> +do_compile () {
> +       unset CFLAGS LDFLAGS
> +       oe_runmake all
> +}
> +
> +do_install () {
> +       bbnote "Installing barebox image on target rootfs"
> +       install -d ${D}${base_bootdir}
> +       install ${S}/${BAREBOX_BIN} ${D}${base_bootdir}/${BAREBOX_BIN_DEP=
LOY}
> +       ln -sf ${BAREBOX_BIN_DEPLOY} ${D}${base_bootdir}/${BAREBOX_BIN_SY=
MLINK}
> +
> +       if [ -e ${S}/${BAREBOX_ENV} ] ; then
> +               bbnote "Installing barebox-env on target rootfs"
> +               install ${S}/${BAREBOX_ENV} ${D}${base_bootdir}/${BAREBOX=
_ENV_DEPLOY}
> +               ln -sf ${BAREBOX_ENV_DEPLOY} ${D}${base_bootdir}/${BAREBO=
X_ENV_SYMLINK}
> +       fi
> +
> +       if [ -e ${S}/scripts/bareboxenv-target ] ; then
> +               bbnote "Installing target env tool"
> +               install -d ${D}${base_sbindir}
> +               install -m 744 ${S}/scripts/bareboxenv-target ${D}${base_=
sbindir}/bareboxenv
> +       fi
> +
> +       if [ -e ${S}/scripts/bareboxcrc32-target ] ; then
> +               bbnote "Installing target crc32 tool"
> +               install -d ${D}${base_sbindir}
> +               install -m 744 ${S}/scripts/bareboxcrc32-target ${D}${bas=
e_sbindir}/bareboxcrc32
> +       fi
> +
> +       if [ -e ${S}/scripts/kernel-install-target ] ; then
> +               bbnote "Installing target kernel-install tool"
> +               install -d ${D}${base_sbindir}
> +               install -m 744 ${S}/scripts/kernel-install-target ${D}${b=
ase_sbindir}/barebox-kernel-install
> +       fi
> +}
> +FILES_${PN} =3D ""
> +FILES_${PN} +=3D "${base_bootdir}"
> +FILES_${PN}-dev =3D ""
> +RDEPENDS_${PN}-dev =3D ""
> +FILES_${PN}-dev +=3D "${base_sbindir}"
> +
> +
> +do_deploy () {
> +       bbnote "Deploying barebox"
> +       install -d ${DEPLOYDIR}
> +       install ${S}/${BAREBOX_BIN} ${DEPLOYDIR}/${BAREBOX_BIN_DEPLOY}
> +       cd ${DEPLOYDIR}
> +       rm -f ${BAREBOX_BIN_SYMLINK}
> +       ln -sf ${BAREBOX_BIN_DEPLOY} ${BAREBOX_BIN_SYMLINK}
> +
> +       if [ -e ${S}/${BAREBOX_ENV} ] ; then
> +               bbnote "Deploying barebox env"
> +               install ${S}/${BAREBOX_ENV} ${DEPLOYDIR}/${BAREBOX_ENV_DE=
PLOY}
> +               cd ${DEPLOYDIR}
> +               rm -f ${BAERBOX_ENV_SYMLINK}
> +               ln -sf ${BAREBOX_ENV_DEPLOY} ${BAREBOX_ENV_SYMLINK}
> +       fi
> +
> +       bbnote "Installing host barebox toolset"
> +       install -d ${STAGING_BINDIR_NATIVE}
> +       cd ${S}
> +       install -m 755 scripts/bareboxenv ${STAGING_BINDIR_NATIVE}/
> +}
> +addtask deploy before do_build after do_compile
> diff --git a/meta/recipes-bsp/barebox/barebox_2014.07.0.bb b/meta/recipes=
-bsp/barebox/barebox_2014.07.0.bb
> new file mode 100644
> index 0000000..a311ca9
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox_2014.07.0.bb
> @@ -0,0 +1,4 @@
> +require barebox.inc
> +
> +SRC_URI[md5sum] =3D "f3a93950777916d4b1c2cd366aec8d91"
> +SRC_URI[sha256sum] =3D "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f=
3b621636876285f2"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

