Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id F37386B102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:52:15 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id y6so5249555lbh.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=xQgvA4vf9dYZez3quoSX4XccvWXcTwiO/Ct+Vl47EBA=;
	b=BUH26kQUGI30DYIOU0K3Y43xXmU7+84o84BJqApssF6jAJPXtTSNL80t3XXdRzf/Z6
	hBrF3RhH24f1HG1gvBPFqr9pjUU22u7yln/qOa7wrf9Ch/q4fxrYKDK6yyvhi6Up/9Ty
	G3PxF7LcWzzYp86UzNsVMhzlJBNZztJ/Hh9lyJ2i1+zytaA4Fjaq+W0gaVJLJSzSXPRb
	6vQBOhSfv9EbZrdnhFkSqZLzLflcRBF0LfUNVrBm8uGsnSVdRp+bO/wHzVrkBjUYw+6E
	ZHRI4OJnJyvmjDKWzX6IsMESmd970uQ7R/DJuQndXT+GYedkVE2Pid3l7mwRu0qa9UVX
	Ci1A==
MIME-Version: 1.0
X-Received: by 10.112.218.68 with SMTP id pe4mr12380692lbc.40.1374504735719;
	Mon, 22 Jul 2013 07:52:15 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Mon, 22 Jul 2013 07:52:15 -0700 (PDT)
In-Reply-To: <1374501746-23540-1-git-send-email-andre.draszik@linaro.org>
References: <CAPaOLoJa1UjGaPqVeSmJavm0rMzNoFE6+KzfDO3ALOjRJeJ3Hg@mail.gmail.com>
	<1374501746-23540-1-git-send-email-andre.draszik@linaro.org>
Date: Mon, 22 Jul 2013 10:52:15 -0400
Message-ID: <CADkTA4MRXOK2P3HwMtt=ntXraJR=se+VyQyP-BKCOW89nA8RFA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?Andr=E9_Draszik?= <andre.draszik@linaro.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: allow to build dtb using support from kernel
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
X-List-Received-Date: Mon, 22 Jul 2013 14:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 10:02 AM, Andr=E9 Draszik
<andre.draszik@linaro.org> wrote:
> Currently, OE is unable to use the linux kernel's built-in
> support to generate a device tree blob (dtb). This is an
> issue for device tree source (dts) files that need to be run
> through CPP (dtsp).

It's not clear to me (from the commit message), why the dtc recipe can't
provide what we need. I don't object to using the in kernel tree dtc, but
all the reasons why there are no other options need to be in the commit
message.

>
> The kernel build system has built-in support for device tree
> source files that /include/ additional files and it also
> supports the source file to be pre-processed using CPP.
>
> This commits lets OE use kbuild if $KERNEL_DEVICETREE points
> to file(s) that are located in arch/${ARCH}/boot/dts/, e.g.
> KERNEL_DEVICETREE =3D "<machine>.dts". In this case, no
> dependency is added on dtc-native, as that is not needed any
> more.
>

What happens with SDK builds ? i.e. if nativsdk versions of the dtc recipe =
are
used, we'll still have the functional gap.

> The previous way of handling dts files, i.e. compilation via
> the stand-alone dtc-native, is still supported - it is triggered
> by specifying the full path to the dts file, as before, e.g.
> KERNEL_DEVICETREE =3D "arch/${ARCH}/boot/dts/<machine>.dts"
>
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc | 75 +++++++++++++++++++++++++++=
------
>  1 file changed, 63 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kerne=
l/linux/linux-dtb.inc
> index 7747718..75b8b76 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,28 +1,66 @@
> +inherit kernel-arch
> +
>  # Support for device tree generation
>  FILES_kernel-devicetree =3D "/boot/devicetree*"
>  KERNEL_DEVICETREE_FLAGS ?=3D "-R 8 -p 0x3000"
>
>  python __anonymous () {
> +    from os import path
> +
>      devicetree =3D d.getVar("KERNEL_DEVICETREE", True) or ''
>      if devicetree:
> -        depends =3D d.getVar("DEPENDS", True)
> -        d.setVar("DEPENDS", "%s dtc-native" % depends)
> +        S =3D d.getVar("S", True)
> +        for DTS_FILE in devicetree.split():
> +            DTS_FILE =3D S + "/" + DTS_FILE
> +            if os.path.exists(DTS_FILE):
> +                # full path given, use dtc-native
> +                print "old style KERNEL_DEVICETREE, adding depend on dtc=
-native"
> +                depends =3D d.getVar("DEPENDS", True)
> +                d.setVar("DEPENDS", "%s dtc-native" % depends)
> +            else:
> +                # new style - it's just a file name, under arch/${ARCH}/=
boot/dts
> +                # we don't need dtc-native, as we use the kernel's compi=
ler
> +                print "new style KERNEL_DEVICETREE"

There really needs to be a flag or other option to override this detection.

>          packages =3D d.getVar("PACKAGES", True)
>          d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>  }
>
> -do_install_append() {
> +do_compile_append() {
>         if test -n "${KERNEL_DEVICETREE}"; then
>                 for DTS_FILE in ${KERNEL_DEVICETREE}; do
>                         if [ ! -f ${DTS_FILE} ]; then
> -                               echo "Warning: ${DTS_FILE} is not availab=
le!"
> -                               continue
> +                               if [ ! -f arch/${ARCH}/boot/dts/${DTS_FIL=
E} ]; then
> +                                       echo "Warning: ${DTS_FILE} is not=
 available!"
> +                                       continue
> +                               fi
> +
> +                               # standard build using kbuild
> +                               echo "Info: standard kbuild for device tr=
ee blob"
> +                               DTS_BASE_NAME=3D`basename ${DTS_FILE} | a=
wk -F "." '{print $1}'`
> +
> +                               unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MA=
CHINE
> +                               oe_runmake ${DTS_BASE_NAME}.dtb CC=3D"${K=
ERNEL_CC}" LD=3D"${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>                         fi
> +               done
> +       fi
> +}
> +
> +do_install_append() {
> +       if test -n "${KERNEL_DEVICETREE}"; then
> +               for DTS_FILE in ${KERNEL_DEVICETREE}; do
>                         DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F ".=
" '{print $1}'`
> -                       DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed =
"s/${MACHINE}/${DTS_BASE_NAME}/g"`
>                         DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_N=
AME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o $=
{DTS_BASE_NAME} ${DTS_FILE}
> -                       install -m 0644 ${DTS_BASE_NAME} ${D}/boot/device=
tree-${DTB_SYMLINK_NAME}.dtb
> +                       if [ ! -f ${DTS_FILE} ]; then

Since install comes after compile, it would be better to test on the result=
s of
the compile phase (i.e. is there a dtb already), and keep the checking on t=
he
existence of the DTS in as few places as possible. In particular, since the=
re
should still be an opt-out flag, having as few touches as possible is bette=
r.


> +                               if [ ! -f arch/${ARCH}/boot/dts/${DTS_FIL=
E} ]; then
> +                                       echo "Warning: ${DTS_FILE} is not=
 available!"
> +                                       continue
> +                               fi
> +
> +                               install -m 0644 arch/${ARCH}/boot/${DTS_B=
ASE_NAME}.dtb ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
> +                               continue
> +                       fi
> +                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o $=
{DTS_BASE_NAME}.dtb ${DTS_FILE}
> +                       install -m 0644 ${DTS_BASE_NAME}.dtb ${D}/boot/de=
vicetree-${DTB_SYMLINK_NAME}.dtb
>                 done
>         fi
>  }
> @@ -30,15 +68,28 @@ do_install_append() {
>  do_deploy_append() {
>         if test -n "${KERNEL_DEVICETREE}"; then
>                 for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +                       DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F ".=
" '{print $1}'`
>                         if [ ! -f ${DTS_FILE} ]; then
> -                               echo "Warning: ${DTS_FILE} is not availab=
le!"
> -                               continue
> +                               if [ ! -f arch/${ARCH}/boot/dts/${DTS_FIL=
E} ]; then
> +                                       echo "Warning: ${DTS_FILE} is not=
 available!"
> +                                       continue
> +                               fi
> +
> +                               # standard build using kbuild
> +                               echo "Info: standard kbuild for device tr=
ee blob"
>                         fi
> -                       DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F ".=
" '{print $1}'`
> +
>                         DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed =
"s/${MACHINE}/${DTS_BASE_NAME}/g"`
>                         DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_N=
AME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +
>                         install -d ${DEPLOYDIR}
> -                       install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR=
}/${DTB_NAME}.dtb
> +
> +                       if [ -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then

This should really be testing on the dtb, not the DTS. We could also
have a single install
line, if any testing is done at the top of the routine and a single
variable set to point to
the dtb, wherever it may be.

Cheers,

Bruce

> +                               install -m 0644 ${B}/arch/${ARCH}/boot/${=
DTS_BASE_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
> +                       else
> +                               install -m 0644 ${B}/${DTS_BASE_NAME}.dtb=
 ${DEPLOYDIR}/${DTB_NAME}.dtb
> +                       fi
> +
>                         cd ${DEPLOYDIR}
>                         ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>                         cd -
> --
> 1.8.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

