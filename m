Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4237B701BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:58:54 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id B358CD4809A;
	Mon, 28 Jul 2014 13:58:53 +0200 (CEST)
Date: Mon, 28 Jul 2014 13:58:53 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: David Vincent <freesilicon@gmail.com>
Message-ID: <20140728135853.35af7ee0@e6520eb>
In-Reply-To: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 11:58:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi David,

Le Mon, 28 Jul 2014 11:55:04 +0200,
David Vincent <freesilicon@gmail.com> a =E9crit :

>=20
> barebox (formerly known as u-boot-v2) is a bootloader that inherits the
> best of U-Boot and the Linux kernel. This commit adds the possibility to
> use it as a virtual/bootloader instead of U-Boot.
>=20
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  meta/recipes-bsp/barebox/barebox.inc          |   73 +++++++++++++++++++=
++++++
>  meta/recipes-bsp/barebox/barebox_2014.07.0.bb |   15 +++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
>=20
> diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/bare=
box/barebox.inc
> new file mode 100644
> index 0000000..68aeb68
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/barebox.inc
> @@ -0,0 +1,73 @@
> +SUMMARY =3D "The Barebox Bootloader"
> +DESCRIPTION =3D "Barebox (formerly known as u-boot-v2) is a bootloader t=
hat inherits the best of U-Boot and the Linux kernel: The size and look-and=
-feel of u-boot, with driver model and lots of design concepts from the ker=
nel."
> +HOMEPAGE =3D "http://www.barebox.org"
> +SECTION =3D "bootloaders"
> +PROVIDES =3D "virtual/bootloader"
> +
> +inherit cml1 deploy kernel-arch
> +
> +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX=
}gcc ${TOOLCHAIN_OPTIONS}"'
> +
> +BAREBOX_BINARY ?=3D "barebox.bin"
> +BAREBOX_IMAGE ?=3D "barebox-${MACHINE}-${PV}-${PR}.bin"
> +BAREBOX_SYMLINK ?=3D "barebox-${MACHINE}.bin"
> +
> +do_configure () {
> +	# Copy defconfig to .config if .config does not exist. This allows
> +	# recipes to manage the .config themselves in do_configure_prepend().
> +	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
> +		cp "${WORKDIR}/defconfig" "${B}/.config"
> +	fi
> +
> +	# Use board default defconfig if .config does not exist. This allows
> +	# recipes to manage the .config themselves in do_configure_prepend().
> +	if [ ! -f "${B}/.config" ]; then
> +		oe_runmake_call ${BAREBOX_TARGET}
> +	fi
> +
> +	cml1_do_configure
> +}
> +
> +do_compile () {
> +	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold=
', '', d)}" =3D "ld-is-gold" ] ; then
> +		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/Makefile
> +	fi
> +
I had to add that a few year ago : is that still needed ?

> +	unset CFLAGS CPPFLAGS LDFLAGS
> +	oe_runmake
> +}
> +
> +do_install () {
> +	install -d ${D}/boot
> +	install ${S}/barebox-flash-image ${D}/boot/${BAREBOX_IMAGE}
> +	ln -sf ${BAREBOX_IMAGE} ${D}/boot/${BAREBOX_BINARY}
> +
> +	# Install target tools if available
> +	install -d ${D}${sbindir}
> +
> +	if [ -e ${WORKDIR}/scripts/bareboxenv-target ]; then
> +		install -m 0755 ${WORKDIR}/scripts/bareboxenv-target ${D}${sbindir}/ba=
reboxenv
> +	fi
> +
> +	if [ -e ${WORKDIR}/scripts/bareboxcrc32-target ]; then
> +		install -m 0755 ${WORKDIR}/scripts/bareboxcrc32-target ${D}${sbindir}/=
bareboxcrc32
> +	fi
> +
> +	if [ -e ${WORKDIR}/scripts/kernel-install-target ]; then
> +		install -m 0755 ${WORKDIR}/scripts/kernel-install-target ${D}${sbindir=
}/kernel-install
> +	fi
> +}
> +
> +FILES_${PN} =3D "/boot ${sbindir}"

Why not splitting the tools in their own package so that we can have
the tools on the target without having the binary in /boot ?

> +
> +do_deploy () {
> +	install -d ${DEPLOYDIR}
> +	install ${S}/barebox-flash-image ${DEPLOYDIR}/${BAREBOX_IMAGE}
> +
Why don't you use $BAREBOX_BINARY instead of hardcoding
barebox-flash-image which won't work on old versions of barebox where
barebox's binary is named barebox.bin ?

Best regards,
Eric

