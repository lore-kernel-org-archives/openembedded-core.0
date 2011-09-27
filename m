Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1R8Xxb-000638-9A
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:44:35 +0200
Received: by wyh5 with SMTP id 5so7631858wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=2TRzEPfLDAZIb6T5CSTG9HG7ylYO7GVlLME17Z7fMdE=;
	b=xJ/mbhSKMXFb3AEQUr0Ig2z0/RCOUblX/eKy3ED5wNrKMU53m/H1tYXO/Ta+THPqxG
	nccph7l0Vhuue+GsOXJXzvU9aQ1NO764kgpRGva1Ln/vFA69EO5cy87odDjL7S7BLWBc
	Ic9jTUEu1B68p7ydnbh+vWCDdoaCDobTuzXYE=
MIME-Version: 1.0
Received: by 10.227.38.66 with SMTP id a2mr7663471wbe.81.1317130749756; Tue,
	27 Sep 2011 06:39:09 -0700 (PDT)
Received: by 10.180.87.197 with HTTP; Tue, 27 Sep 2011 06:39:09 -0700 (PDT)
In-Reply-To: <1316297897-698-3-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-3-git-send-email-dbaryshkov@gmail.com>
Date: Tue, 27 Sep 2011 09:39:09 -0400
Message-ID: <CADkTA4NRwK2d+pP8Zwdda-Z0SDD_P-O=YiY8Uhr8_D5gDRJweA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Tue, 27 Sep 2011 13:44:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
> separate task from do_deploy. The only major feature of oe-core's
> version (not to recreate uImage if it exists) is retained in this patch.

I'm getting around to commenting on this patch series, sorry for the
slow replies.
Things have been a bit busy.

This seems reasonable to me, but I was wondering if we could document in th=
e
commit header why this is a good thing ? Not everyone is familiar with oe-d=
ev
or the history behind these changes. Having to cross reference to another
repository for the high level reasoning behind a change is not really
ideal, and
tossing something into the commit that explains things a bit is minimal up
front effort.

What I mean is "sync'ing oe-core to oe-dev" isn't the reason I'd like
to see. Are
the advantages that breaking this out into a separate task that it allows f=
iner
grained scheduling by bitbake ? flexibility to be done at different times, =
etc ?

But the change does seem reasonable to me, I'm just looking to capture some
of the technical advantages in the commit messages.

Cheers,

Bruce

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
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


