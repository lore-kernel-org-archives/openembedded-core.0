Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Qudqh-0004X7-Ad
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:11:59 +0200
Received: by gxk3 with SMTP id 3so2537792gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TouKGDV5ZEd/IwVG6IcJzdcxUhCGTAbauaA05ZqSu/o=;
	b=YYVzY9OnSgMSexhfPU5WW+AwDeLH+VgxX9d54P6RTYsl6E+Lg9XJ+m72dPsBU/QwYJ
	wkZgeX7bI1Xl1HZ0EXf+Udk4iwO+vzgxUAFw7YvbQAGB36HAChoxz2qxL9ji6ZZ++Aee
	rhwnnYeM7yxUdpnz024zN1SzhihcXCOW9uGtU=
MIME-Version: 1.0
Received: by 10.101.179.21 with SMTP id g21mr126309anp.54.1313816836171; Fri,
	19 Aug 2011 22:07:16 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Fri, 19 Aug 2011 22:07:16 -0700 (PDT)
In-Reply-To: <fe4a8f56697a9915ca59d0dd4bc3f06a4072d7dc.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<fe4a8f56697a9915ca59d0dd4bc3f06a4072d7dc.1313816148.git.otavio@ossystems.com.br>
Date: Sat, 20 Aug 2011 01:07:16 -0400
Message-ID: <CADkTA4PBJLxUQx3PAkuzBxo+hp3B_=hPkx0rZ2_GuUvjQgDbMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] kernel.bbclass: move uboot image generation to a specific class
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
X-List-Received-Date: Sat, 20 Aug 2011 05:11:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2011 at 12:58 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =A0meta/classes/kernel.bbclass | =A0 39 +++++++++++++++++++++++----------=
------
> =A01 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ff3fa46..8a56b85 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -470,6 +470,29 @@ do_sizecheck() {
>
> =A0addtask sizecheck before do_install after do_compile
>
> +do_uboot_mkimage() {
> + =A0 =A0if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
> + =A0 =A0 =A0 =A0ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> + =A0 =A0 =A0 =A0if test -n "${UBOOT_ENTRYSYMBOL}"; then
> + =A0 =A0 =A0 =A0 =A0 =A0ENTRYPOINT=3D`${HOST_PREFIX}nm ${S}/vmlinux | \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}"=
 {print $1}'`
> + =A0 =A0 =A0 =A0fi

These aren't equivalent. We should maintain what is already in kernel.bbcla=
ss
and just move it over. If there already a uImage in the build tree, there's=
 no
need to run all the objcopy "mess" below. I found that it created useless b=
inary
blobs forme in the past.

Bruce

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
> @@ -481,22 +504,6 @@ kernel_do_deploy() {
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
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


