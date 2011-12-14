Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RawM1-0004GY-67
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 22:27:09 +0100
Received: by eekb15 with SMTP id b15so1154456eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 13:20:12 -0800 (PST)
Received: by 10.213.27.6 with SMTP id g6mr420415ebc.137.1323897611712;
	Wed, 14 Dec 2011 13:20:11 -0800 (PST)
Received: from [10.87.18.72] ([80.187.151.123])
	by mx.google.com with ESMTPS id x12sm14974866eef.9.2011.12.14.13.20.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 13:20:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 14 Dec 2011 21:20:10 +0000
In-Reply-To: <1323793193-31090-2-git-send-email-dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-2-git-send-email-dbaryshkov@gmail.com>
Message-Id: <CD461DDE-5A9A-4194-9043-A692EB22A9E8@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/9] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Wed, 14 Dec 2011 21:27:09 -0000
X-Groupsio-MsgNum: 14211
Content-Type: multipart/signed;
	boundary="Apple-Mail=_41C1F1F5-8BE7-4E03-899E-FD76F70121B8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_41C1F1F5-8BE7-4E03-899E-FD76F70121B8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 13 dec. 2011, om 16:19 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
> separate task from do_deploy. This way the do_install task can also
> benefit from generated uImage.
>=20
> The only major feature of oe-core's version (not to recreate uImage
> if it exists) is retained in this patch

The whole point of the OE uImage handling is that in general we know =
better than the kernel and can apply fixups if needed (turning on/off =
compression, etc)

> . On the contra, as this version
> was merged from meta-oe/org.oe.dev, new function has another feature:
> it permits overriding the u-boot entrypoint via u-boot symbol.

Not if uimage exists, see above

>=20
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> meta/classes/kernel.bbclass |   40 =
++++++++++++++++++++++++----------------
> 1 files changed, 24 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a75c199..db00d2d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -485,6 +485,30 @@ do_sizecheck() {
>=20
> addtask sizecheck before do_install after do_compile
>=20
> +do_uboot_mkimage() {
> +    if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" -a \
> +            ! -e arch/${ARCH}/boot/uImage ; then
> +        ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> +        if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +            ENTRYPOINT=3D`${HOST_PREFIX}nm ${S}/vmlinux | \
> +                   awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print $1}'`
> +        fi
> +        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +            ${OBJCOPY} -O binary -R .note -R .comment -S =
arch/${ARCH}/boot/compressed/vmlinux linux.bin
> +            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none =
-a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n =
"${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> +            rm -f linux.bin
> +        else
> +            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux =
linux.bin
> +            rm -f linux.bin.gz
> +            gzip -9 linux.bin
> +            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip =
-a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n =
"${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz =
arch/${ARCH}/boot/uImage
> +            rm -f linux.bin.gz
> +        fi
> +    fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> +
> KERNEL_IMAGE_BASE_NAME ?=3D =
"${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> # Don't include the DATETIME variable in the sstate package signatures
> KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> @@ -496,22 +520,6 @@ kernel_do_deploy() {
> 		tar -cvzf =
${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> 	fi
>=20
> -	if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then=20
> -		if test -e arch/${ARCH}/boot/uImage ; then
> -			cp arch/${ARCH}/boot/uImage =
${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> -			${OBJCOPY} -O binary -R .note -R .comment -S =
arch/${ARCH}/boot/compressed/vmlinux linux.bin
> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C =
none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n =
"${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin =
${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -			rm -f linux.bin
> -		else
> -			${OBJCOPY} -O binary -R .note -R .comment -S =
vmlinux linux.bin
> -			rm -f linux.bin.gz
> -			gzip -9 linux.bin
> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C =
gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n =
"${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz =
${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -			rm -f linux.bin.gz
> -		fi
> -	fi
> -
> 	cd ${DEPLOYDIR}
> 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin =
${KERNEL_IMAGE_SYMLINK_NAME}.bin
> --=20
> 1.7.7.3
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_41C1F1F5-8BE7-4E03-899E-FD76F70121B8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7pEwwACgkQMkyGM64RGpFJvgCfdFodbKKH+COgv3SiCA8yUHl/
11oAn2dQMsQ5DEOgLDYovN1YYfzQxWE7
=XpYM
-----END PGP SIGNATURE-----

--Apple-Mail=_41C1F1F5-8BE7-4E03-899E-FD76F70121B8--
