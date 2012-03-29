Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SDF0c-0000Yn-1o
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 15:03:22 +0200
Received: by wibhj13 with SMTP id hj13so28373wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9d2JH3DKooctpNNNfYzr+lEoFLAJ0X+q+CMDxDZxD78=;
	b=T18wf+mHIQqXZw9LlOj8UG8EWBOvyeCeA9fpK2nQiTgdmYx0/v350C/MfRsxbrpC9k
	L+2dYmPZRDp5bMmgwgpz3ni5XSYqbNESUnPt4uCa6xJpnWVeAAb2yRBxwfVFieIR3k6z
	jQJhIAe+SVB9vXNcraHklMmF0yz3d0pj2wHQfcNagB53EgBhfONFFXMKdNpcW0q3tq5w
	AM+BEkkOJDq0P8RjdN8fZahrEPIOe5t8zAjPcZH5z8W/Z5cRwpRLSRhmsyfJ3qMvHYPN
	hcBCdu6E3/vhitZa0MrYILI+ZqhypJ2s+v9pS8UVSL8dlkIJCSI4KXuMS/hNsENNCLz8
	bflA==
MIME-Version: 1.0
Received: by 10.180.102.101 with SMTP id fn5mr5442439wib.6.1333025658805; Thu,
	29 Mar 2012 05:54:18 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Thu, 29 Mar 2012 05:54:18 -0700 (PDT)
In-Reply-To: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
	<4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
Date: Thu, 29 Mar 2012 08:54:18 -0400
Message-ID: <CADkTA4PEFLGw5CaNs5P8_oT1J_5veW=LrUj+WimW8aTz907ahw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: merge uboot_mkimage improvements from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 13:03:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 39 +++++++++++++++++++++++----------=
------
> =A01 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..8cd5fc7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -502,32 +502,39 @@ do_sizecheck() {
>
> =A0addtask sizecheck before do_install after do_compile
>
> -KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-=
${DATETIME}"
> -# Don't include the DATETIME variable in the sstate package signatures
> -KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> -KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> -
> -kernel_do_deploy() {
> - =A0 =A0 =A0 install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAG=
E_BASE_NAME}.bin
> - =A0 =A0 =A0 if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VER=
SION}-${PR}-${MACHINE}.tgz -C ${D} lib
> - =A0 =A0 =A0 fi
> -
> +do_uboot_mkimage() {
> =A0 =A0 =A0 =A0if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -e arch/${ARCH}/boot/uImage ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp arch/${ARCH}/boot/uImage=
 ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin

We continually try and remove this, but it is a valid use case where some
people do want the kernel's uImage to be used and not regenerate it outside
of the kernel build process.

The last time this was discussed, it concluded that rather than making this
a simple test, we should do it via a flag .. and I'm still of the
opinion that would
be the right approach here. There's no reason to break either use case.

Cheers,

Bruce

> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif test -e arch/${ARCH}/boot/compressed/v=
mlinux ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -n "${UBOOT_ENTRYSYMBOL}"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ENTRYPOINT=3D`${HOST_PREFIX=
}nm ${S}/vmlinux | \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 awk '$3=3D=
=3D"${UBOOT_ENTRYSYMBOL}" {print $1}'`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -e arch/${ARCH}/boot/compressed/vml=
inux ; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${OBJCOPY} -O binary -R .n=
ote -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uboot-mkimage -A ${ARCH} -O=
 linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "=
${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_B=
ASE_NAME}.bin
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uboot-mkimage -A ${UBOOT_AR=
CH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "$=
{DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -f linux.bin
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${OBJCOPY} -O binary -R .n=
ote -R .comment -S vmlinux linux.bin
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -f linux.bin.gz
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gzip -9 linux.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uboot-mkimage -A ${ARCH} -O=
 linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "=
${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAG=
E_BASE_NAME}.bin
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uboot-mkimage -A ${UBOOT_AR=
CH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "$=
{DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -f linux.bin.gz
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> +
> +KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-=
${DATETIME}"
> +# Don't include the DATETIME variable in the sstate package signatures
> +KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> +KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> +
> +kernel_do_deploy() {
> + =A0 =A0 =A0 install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAG=
E_BASE_NAME}.bin
> + =A0 =A0 =A0 if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VER=
SION}-${PR}-${MACHINE}.tgz -C ${D} lib
> + =A0 =A0 =A0 fi
>
> =A0 =A0 =A0 =A0cd ${DEPLOYDIR}
> =A0 =A0 =A0 =A0rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> --
> 1.7.8.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


