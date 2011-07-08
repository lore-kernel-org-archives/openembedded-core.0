Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Qeye6-0003TG-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 02:10:14 +0200
Received: by pvf24 with SMTP id 24so849758pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=F1jSumebhCvMZ1nhasu3EQWQywtmkkTNScleO7hz96k=;
	b=AEvn2TApMk1SHqdmsJFRMchlZuqlGU79OvIziIRGiGbOco6WNzFQV3KbbqzG5T8wXa
	VE40NWop6ODVdQ10Wbszmv0vbxBBjz6nlvKjvBWnTk/PTDjHL82kOOe9nxZpZf8b4d1t
	M76uQAkPINp8xrePB5+3jTzpeQrBbPYJnkeag=
MIME-Version: 1.0
Received: by 10.68.33.225 with SMTP id u1mr1950147pbi.199.1310083247482; Thu,
	07 Jul 2011 17:00:47 -0700 (PDT)
Received: by 10.142.239.3 with HTTP; Thu, 7 Jul 2011 17:00:47 -0700 (PDT)
In-Reply-To: <54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
Date: Fri, 8 Jul 2011 02:00:47 +0200
Message-ID: <CAAQYJAuSgb=pK1ZgpEtymW7skVbcBejqy4DY6-em8-GD2Uridw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Fri, 08 Jul 2011 00:10:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ehm,
some cruft slipped in :/

On Fri, Jul 8, 2011 at 1:11 AM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> * from org.openembedded.dev (oe-classic)
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 22 ++++++++++++++++++++++
> =A01 files changed, 22 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 943252a..03b321d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -14,8 +14,20 @@ python __anonymous () {
> =A0 =A0 =A0 =A0depends =3D bb.data.getVar("DEPENDS", d, 1)
> =A0 =A0 =A0 =A0depends =3D "%s u-boot-mkimage-native" % depends
> =A0 =A0 =A0 =A0bb.data.setVar("DEPENDS", depends, d)
> +
> + =A0 =A0image =3D bb.data.getVar('INITRAMFS_IMAGE', d, True)
> + =A0 =A0if image !=3D '' and image is not None:
> + =A0 =A0 =A0 =A0bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_=
rootfs', d)
> +


> + =A0 =A0machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, Tru=
e)
> +
> + =A0 =A0if machine_kernel_pr:
> + =A0 =A0 =A0 =A0bb.data.setVar('PR', machine_kernel_pr, d)

Those bits are extraneous and copied and pasted by mistake.



> =A0}
>
> +INITRAMFS_IMAGE ?=3D ""
> +INITRAMFS_TASK ?=3D ""
> +
> =A0inherit kernel-arch deploy
>
> =A0PACKAGES_DYNAMIC +=3D "kernel-module-*"
> @@ -179,8 +191,18 @@ kernel_do_configure() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cp "${WORKDIR}/defconfig" "${S}/.config"
> =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> +
> + =A0 =A0 =A0 if [ ! -z "${INITRAMFS_IMAGE}" ]; then

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for img in cpio.gz cpio.lzo cpio.lzma; do

We'll have to add cpio.xz as bonus too, being there is support for it
in image_types.bbclass


> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IM=
AGE}-${MACHINE}.$img"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp "${DEPLOY_DIR_IMAGE}/${I=
NITRAMFS_IMAGE}-${MACHINE}.$i
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> + =A0 =A0 =A0 fi
> =A0}
>
> +kernel_do_configure[depends] +=3D "${INITRAMFS_TASK}"
> +
> =A0do_menuconfig() {
> =A0 =A0 =A0 =A0 export DISPLAY=3D'${DISPLAY}'
> =A0 =A0 =A0 =A0 export DBUS_SESSION_BUS_ADDRESS=3D'${DBUS_SESSION_BUS_ADD=
RESS}'
> --
> 1.7.3.4
>
>

If you mind, I'll resend a corrected V2 of the patch

Regards

Andrea


