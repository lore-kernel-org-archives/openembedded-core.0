Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4484B70943
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 16:53:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2014 09:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,765,1400050800"; d="scan'208";a="577780302"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.249])
	([10.255.12.249])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2014 09:53:36 -0700
Message-ID: <53D92310.9090308@linux.intel.com>
Date: Wed, 30 Jul 2014 09:53:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: =?UTF-8?B?U3RlZmFuIE3DvGxsZXItS2xpZXNlcg==?=
	<s.mueller-klieser@phytec.de>, openembedded-core@lists.openembedded.org
References: <1406720953-30774-1-git-send-email-s.mueller-klieser@phytec.de>
In-Reply-To: <1406720953-30774-1-git-send-email-s.mueller-klieser@phytec.de>
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
X-List-Received-Date: Wed, 30 Jul 2014 16:53:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/30/2014 04:49 AM, Stefan Müller-Klieser wrote:
> Barebox is a bootloader that inherits the best of U-Boot and the Linux
> kernel. The barebox uses kconfig and kbuild mechanisms similar to the
> Linux kernel. This is reflected in the recipe. As soon as this
> functionality gets more abstraction in classes, the barebox recipe can
> be simplified. The recipe supports: kconfig handling, kconfig fragments,
> packages for dev tools and support for the initial program loader
> creation.
>
> Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
> ---
>   meta/recipes-bsp/barebox/barebox-ipl.inc          |  37 +++++
>   meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb |   4 +
>   meta/recipes-bsp/barebox/barebox.inc              | 161 ++++++++++++++++++++++
>   meta/recipes-bsp/barebox/barebox_2014.07.0.bb     |   4 +
>   4 files changed, 206 insertions(+)
>   create mode 100644 meta/recipes-bsp/barebox/barebox-ipl.inc
>   create mode 100644 meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb
>   create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>   create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
>
> diff --git a/meta/recipes-bsp/barebox/barebox-ipl.inc b/meta/recipes-bsp/barebox/barebox-ipl.inc
> new file mode 100644
> index 0000000..f388522
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox-ipl.inc
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2014 Stefan Mueller-Klieser <s.mueller-klieser@phytec.de> \
> +# PHYTEC Messtechnik GmbH
> +# Recipe released under the GPL-3.0 license
> +
Before I review this much further, I have to ask why are you licensing 
the recipe meta-data as GPL-3.0?  All the rest of the meta-data is MIT. 
  I also note that barebox itself is GPL-2.0.

Thanks
	Sau!

> +require barebox.inc
> +
> +DESCRIPTION = "Barebox IPL Inintial Program Loader: some machines need \
> +               a pre-bootloader. This one gets build by the barebox."
> +PROVIDES = "barebox-ipl"
> +S = "${WORKDIR}/barebox-${PV}"
> +
> +# Pre Bootloader
> +BAREBOX_IPL_BIN ?= "barebox.bin"
> +BAREBOX_IPL_BIN_DEPLOY ?= "IPL-${MACHINE}-${PV}-${PR}.bin"
> +BAREBOX_IPL_BIN_SYMLINK ?= "IPL"
> +BAREBOX_IPL_DEFAULT_DEFCONFIG ?= "am335x_mlo_defconfig"
> +
> +do_default_defconfig () {
> +	bbnote "generating .config for target ${BAREBOX_IPL_DEFAULT_DEFCONFIG}"
> +	unset CFLAGS LDFLAGS
> +	oe_runmake ${BAREBOX_IPL_DEFAULT_DEFCONFIG}
> +}
> +
> +do_install () {
> +	bbnote "Installing barebox-ipl image on target rootfs"
> +	install -d ${D}${base_bootdir}
> +	install ${S}/${BAREBOX_IPL_BIN} ${D}${base_bootdir}/${BAREBOX_IPL_BIN_DEPLOY}
> +	ln -sf ${BAREBOX_IPL_BIN_DEPLOY} ${D}${base_bootdir}/${BAREBOX_IPL_BIN_SYMLINK}
> +}
> +FILES_${PN} = ""
> +FILES_${PN} = "${base_bootdir}"
> +
> +do_deploy () {
> +	bbnote "Deploying barebox ipl"
> +	install ${S}/${BAREBOX_IPL_BIN} ${DEPLOYDIR}/${BAREBOX_IPL_BIN_DEPLOY}
> +	ln -sf ${BAREBOX_IPL_BIN_DEPLOY} ${DEPLOYDIR}/${BAREBOX_IPL_BIN_SYMLINK}
> +}
> diff --git a/meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb b/meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb
> new file mode 100644
> index 0000000..372828a
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb
> @@ -0,0 +1,4 @@
> +require barebox-ipl.inc
> +
> +SRC_URI[md5sum] = "f3a93950777916d4b1c2cd366aec8d91"
> +SRC_URI[sha256sum] = "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f3b621636876285f2"
> diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
> new file mode 100644
> index 0000000..b7885df
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox.inc
> @@ -0,0 +1,161 @@
> +# Copyright (C) 2014 Stefan Mueller-Klieser <s.mueller-klieser@phytec.de>
> +# PHYTEC Messtechnik GmbH
> +# Recipe released under the GPL-3.0 license
> +#
> +# TODO: see if there is some development towards moving all kconfig
> +#       funcionality into the kconfig-frontends package and adjust
> +#       the recipe accordingly.
> +#
> +
> +SUMMARY = "The Barebox Bootloader"
> +DESCRIPTION = "Barebox (formerly known as u-boot-v2) is a bootloader that \
> +               inherits the best of U-Boot and the Linux kernel: The size and \
> +	       look-and-feel of u-boot, with driver model and lots of design \
> +	       concepts from the kernel. \
> +	       The bb recipe adds config fragment support and kconfig \
> +	       command handling using the yocto kern-tools-native."
> +HOMEPAGE = "http://www.barebox.org"
> +SECTION = "bootloaders"
> +PROVIDES = "virtual/bootloader barebox"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=057bf9e50e1ca857d0eb97bfe4ba8e5d"
> +SRC_URI = "http://barebox.org/download/barebox-${PV}.tar.bz2"
> +
> +inherit kernel-arch cml1 deploy
> +DEPENDS += "kern-tools-native"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +# verbose build 0/1
> +VERBOSE_BUILD ?= "0"
> +EXTRA_OEMAKE = 'V=${VERBOSE_BUILD} CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> +# target rootfs boot directory
> +base_bootdir = "/boot"
> +
> +# these variables need to be assigned in the machine.conf
> +# name of the image created by barebox Makefile
> +BAREBOX_BIN ?= "barebox.bin"
> +# filename of file to be deployed by this recipe
> +BAREBOX_BIN_DEPLOY ?= "barebox-${MACHINE}-${PV}-${PR}.bin"
> +BAREBOX_BIN_SYMLINK ?= "barebox.bin"
> +BAREBOX_DEFAULT_DEFCONFIG ?= ""
> +# barebox environment
> +BAREBOX_ENV ?= "defaultenv/barebox_default_env"
> +BAREBOX_ENV_DEPLOY ?= "bareboxenv-${MACHINE}-${PV}-${PR}"
> +BAREBOX_ENV_SYMLINK ?= "barebox.env"
> +
> +# returns .scc and .cfg filenames from SRC_URI
> +def find_sccs(d):
> +    sources=src_patches(d, True)
> +    sources_list=[]
> +    for s in sources:
> +        base, ext = os.path.splitext(os.path.basename(s))
> +        if ext and ext in [".scc", ".cfg"]:
> +            sources_list.append(s)
> +    return sources_list
> +
> +# uses kern-tools-native to merge the config fragments
> +python do_prepare_configure() {
> +    import shutil, subprocess
> +    workdir = d.getVar('WORKDIR', True)
> +    S = d.getVar('S', True)
> +    defconfig = os.path.join(workdir , 'defconfig')
> +    if not os.path.isfile(defconfig):
> +        bb.note("No defconfig file provided for the barebox recipe")
> +        config = os.path.join(S, '.config')
> +        if not os.path.isfile(config):
> +            bb.note("barebox is not configured")
> +            bb.build.exec_func("do_default_defconfig",d)
> +        bb.build.exec_func("do_savedefconfig",d)
> +        defconfig = os.path.join(workdir , 'defconfig.temp')
> +    os.chdir(workdir)
> +    fragments = find_sccs(d)
> +    if not fragments:
> +        bb.note("no config fragments will be merged")
> +    else:
> +        bb.note("combining kconfig fragments into .config for barebox")
> +        cmd = 'merge_config.sh -m -O %s %s %s' % (S, defconfig, ' '.join(map(str,fragments)))
> +        subprocess.call(cmd, shell=True)
> +    localversion = "-${DISTRO}-${DISTRO_VERSION}"
> +    bb.note("Setting LOCALVERSION in .config to %s" % localversion)
> +    bareboxconfig = os.path.join(S, '.config')
> +    cmd = 'kconfig-tweak --file %s --set-str LOCALVERSION %s' % (bareboxconfig, localversion)
> +    subprocess.call(cmd,shell=True)
> +}
> +do_configure[prefuncs] += "do_prepare_configure"
> +
> +do_default_defconfig () {
> +	bbnote "generating .config for target ${BAREBOX_DEFAULT_DEFCONFIG}"
> +	unset CFLAGS LDFLAGS
> +	oe_runmake ${BAREBOX_DEFAULT_DEFCONFIG}
> +}
> +
> +do_savedefconfig() {
> +	bbplain "saving defconfig to ${WORKDIR}/defconfig.temp"
> +	oe_runmake savedefconfig
> +	install -m 644 ${S}/defconfig ${WORKDIR}/defconfig.temp
> +}
> +addtask savedefconfig after do_configure
> +
> +do_compile () {
> +	unset CFLAGS LDFLAGS
> +	oe_runmake all
> +}
> +
> +do_install () {
> +	bbnote "Installing barebox image on target rootfs"
> +	install -d ${D}${base_bootdir}
> +	install ${S}/${BAREBOX_BIN} ${D}${base_bootdir}/${BAREBOX_BIN_DEPLOY}
> +	ln -sf ${BAREBOX_BIN_DEPLOY} ${D}${base_bootdir}/${BAREBOX_BIN_SYMLINK}
> +
> +	if [ -e ${S}/${BAREBOX_ENV} ] ; then
> +		bbnote "Installing barebox-env on target rootfs"
> +		install ${S}/${BAREBOX_ENV} ${D}${base_bootdir}/${BAREBOX_ENV_DEPLOY}
> +		ln -sf ${BAREBOX_ENV_DEPLOY} ${D}${base_bootdir}/${BAREBOX_ENV_SYMLINK}
> +	fi
> +
> +	if [ -e ${S}/scripts/bareboxenv-target ] ; then
> +		bbnote "Installing target env tool"
> +		install -d ${D}${base_sbindir}
> +		install -m 744 ${S}/scripts/bareboxenv-target ${D}${base_sbindir}/bareboxenv
> +	fi
> +
> +	if [ -e ${S}/scripts/bareboxcrc32-target ] ; then
> +		bbnote "Installing target crc32 tool"
> +		install -d ${D}${base_sbindir}
> +		install -m 744 ${S}/scripts/bareboxcrc32-target ${D}${base_sbindir}/bareboxcrc32
> +	fi
> +
> +	if [ -e ${S}/scripts/kernel-install-target ] ; then
> +		bbnote "Installing target kernel-install tool"
> +		install -d ${D}${base_sbindir}
> +		install -m 744 ${S}/scripts/kernel-install-target ${D}${base_sbindir}/barebox-kernel-install
> +	fi
> +}
> +FILES_${PN} = ""
> +FILES_${PN} += "${base_bootdir}"
> +FILES_${PN}-dev = ""
> +RDEPENDS_${PN}-dev = ""
> +FILES_${PN}-dev += "${base_sbindir}"
> +
> +
> +do_deploy () {
> +	bbnote "Deploying barebox"
> +	install -d ${DEPLOYDIR}
> +	install ${S}/${BAREBOX_BIN} ${DEPLOYDIR}/${BAREBOX_BIN_DEPLOY}
> +	cd ${DEPLOYDIR}
> +	rm -f ${BAREBOX_BIN_SYMLINK}
> +	ln -sf ${BAREBOX_BIN_DEPLOY} ${BAREBOX_BIN_SYMLINK}
> +
> +	if [ -e ${S}/${BAREBOX_ENV} ] ; then
> +		bbnote "Deploying barebox env"
> +		install ${S}/${BAREBOX_ENV} ${DEPLOYDIR}/${BAREBOX_ENV_DEPLOY}
> +		cd ${DEPLOYDIR}
> +		rm -f ${BAERBOX_ENV_SYMLINK}
> +		ln -sf ${BAREBOX_ENV_DEPLOY} ${BAREBOX_ENV_SYMLINK}
> +	fi
> +
> +	bbnote "Installing host barebox toolset"
> +	install -d ${STAGING_BINDIR_NATIVE}
> +	cd ${S}
> +	install -m 755 scripts/bareboxenv ${STAGING_BINDIR_NATIVE}/
> +}
> +addtask deploy before do_build after do_compile
> diff --git a/meta/recipes-bsp/barebox/barebox_2014.07.0.bb b/meta/recipes-bsp/barebox/barebox_2014.07.0.bb
> new file mode 100644
> index 0000000..a311ca9
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox_2014.07.0.bb
> @@ -0,0 +1,4 @@
> +require barebox.inc
> +
> +SRC_URI[md5sum] = "f3a93950777916d4b1c2cd366aec8d91"
> +SRC_URI[sha256sum] = "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f3b621636876285f2"
>

