Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R53P9-0002nz-Du
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:30:35 +0200
Received: by bke11 with SMTP id 11so13888945bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ljxPAO5sfoGBpv9g9EZCWf8Zv1/YzlkVhFIMxq9eMDc=;
	b=wozSdQBJKvdZhL5zBDxdW1u/bQz0CPgldLO7OK4fEtFOqs1ZXbXdJ+eVXV6AFIyH3E
	w15BdFQ+bRTQ9AfAhAya/FdED8ig3Oa9NNEAq9+p7wfWkVuQDLb7pOyUPmQI1xcb03zj
	itUFMkxw733StIKcVIB+oUK/8qq/23fqvu1i8=
MIME-Version: 1.0
Received: by 10.204.138.219 with SMTP id b27mr626820bku.218.1316298321282;
	Sat, 17 Sep 2011 15:25:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 17 Sep 2011 15:25:21 -0700 (PDT)
In-Reply-To: <1316297897-698-3-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-3-git-send-email-dbaryshkov@gmail.com>
Date: Sat, 17 Sep 2011 19:25:21 -0300
X-Google-Sender-Auth: p6qTfV0tLdHh6jBTM9YxzLQVbkw
Message-ID: <CAP9ODKpqLWUaGU=QyRNcshtJkjtEUFoLv9nGuU2QGfu7pyWtZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 3/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Sat, 17 Sep 2011 22:30:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This was nack'ed but I don't remember why; Richard?

On Sat, Sep 17, 2011 at 19:18, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
> separate task from do_deploy. The only major feature of oe-core's
> version (not to recreate uImage if it exists) is retained in this patch.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 40 ++++++++++++++++++++++++---------=
-------
> =A01 files changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b44e3b5..6ff4018 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -486,6 +486,30 @@ do_sizecheck() {
>
> =A0addtask sizecheck before do_install after do_compile
>
> +do_uboot_mkimage() {
> + =A0 =A0if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" -a \
> + =A0 =A0 =A0 =A0 =A0 =A0! -e arch/${ARCH}/boot/uImage ; then
> + =A0 =A0 =A0 =A0ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> + =A0 =A0 =A0 =A0if test -n "${UBOOT_ENTRYSYMBOL}"; then
> + =A0 =A0 =A0 =A0 =A0 =A0ENTRYPOINT=3D`${HOST_PREFIX}nm ${S}/vmlinux | \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}"=
 {print $1}'`
> + =A0 =A0 =A0 =A0fi
> + =A0 =A0 =A0 =A0if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> + =A0 =A0 =A0 =A0 =A0 =A0${OBJCOPY} -O binary -R .note -R .comment -S arc=
h/${ARCH}/boot/compressed/vmlinux linux.bin
> + =A0 =A0 =A0 =A0 =A0 =A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kerne=
l -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/$=
{MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> + =A0 =A0 =A0 =A0 =A0 =A0rm -f linux.bin
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 =A0${OBJCOPY} -O binary -R .note -R .comment -S vml=
inux linux.bin
> + =A0 =A0 =A0 =A0 =A0 =A0rm -f linux.bin.gz
> + =A0 =A0 =A0 =A0 =A0 =A0gzip -9 linux.bin
> + =A0 =A0 =A0 =A0 =A0 =A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kerne=
l -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/$=
{MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
> + =A0 =A0 =A0 =A0 =A0 =A0rm -f linux.bin.gz
> + =A0 =A0 =A0 =A0fi
> + =A0 =A0fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> +
> =A0KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE=
}-${DATETIME}"
> =A0# Don't include the DATETIME variable in the sstate package signatures
> =A0KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> @@ -497,22 +521,6 @@ kernel_do_deploy() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VE=
RSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> =A0 =A0 =A0 =A0fi
>
> - =A0 =A0 =A0 if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -e arch/${ARCH}/boot/uImage ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp arch/${ARCH}/boot/uImage=
 ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif test -e arch/${ARCH}/boot/compressed/v=
mlinux ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${OBJCOPY} -O binary -R .no=
te -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uboot-mkimage -A ${ARCH} -O=
 linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "=
${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_B=
ASE_NAME}.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -f linux.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${OBJCOPY} -O binary -R .no=
te -R .comment -S vmlinux linux.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -f linux.bin.gz
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gzip -9 linux.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uboot-mkimage -A ${ARCH} -O=
 linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "=
${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAG=
E_BASE_NAME}.bin
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -f linux.bin.gz
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> - =A0 =A0 =A0 fi
> -
> =A0 =A0 =A0 =A0cd ${DEPLOYDIR}
> =A0 =A0 =A0 =A0rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> =A0 =A0 =A0 =A0ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLIN=
K_NAME}.bin
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


