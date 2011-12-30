Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RgXsy-00079N-U5
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 09:32:22 +0100
Received: by pbcc11 with SMTP id c11so7185690pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2011 00:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=l48peR3aDHa7tjCWm2s+5unq5QX3iNltfi+CZ7ZHgjE=;
	b=c9TxUNAiHIFyBtT/Ouyr6QZI/tH4JywXBwPT+XpuZjInL9RHH/4KJJvQ+t+gSw5/3b
	T4nCGOugxegE6JOPL1vOPDC0Sf3tnPm999cFX7rzjGOZBHlrgkVo4tcPY+1/8EMX9Y7p
	Rr8LAXFqDo5kMUR7QI/0eiBYJbCjw5LEZsF3g=
MIME-Version: 1.0
Received: by 10.68.213.228 with SMTP id nv4mr25883481pbc.52.1325233503470;
	Fri, 30 Dec 2011 00:25:03 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Fri, 30 Dec 2011 00:25:03 -0800 (PST)
In-Reply-To: <4EFBAC18.3040909@intel.com>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com>
Date: Fri, 30 Dec 2011 09:25:03 +0100
Message-ID: <CAAQYJAuj6x3qt+w5TXSesgAaz8i1sqXbWMSTZJOGbQEAqsuFjQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
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
X-List-Received-Date: Fri, 30 Dec 2011 08:32:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2011 at 12:54 AM, Darren Hart <darren.hart@intel.com> wrote=
:
> <I sent this to the yocto list by mistake, forwarding here for comment>
>
> In order for the kernel to accept an initramfs as a rootfs,
> it must have /init - even if it is an empty file. Touch /init
> to ensure it exists for cpio and cpio.gz image types.

Why didn't you add the init to cpio.xz and cpio.lzma?
Any special reason?

>
> When used with initrd and rootfs=3D/dev/ram0, this allows the
> cpio and cpio.gz images to be used as the rootfs.

Sure, and "...If all else fails, rdinit=3D/bin/sh "

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
> =A0meta/classes/image_types.bbclass | =A0 10 ++++++++--
> =A01 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 6893e38..ebff0ba 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -110,8 +110,14 @@ IMAGE_CMD_tar =3D "cd ${IMAGE_ROOTFS} && tar -cvf ${=
DEPLOY_DIR_IMAGE}/${IMAGE_NAME
> =A0IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMA=
GE}/${IMAGE_NAME}.rootfs.tar.gz ."
> =A0IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
> =A0IMAGE_CMD_tar.xz =3D "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
> -IMAGE_CMD_cpio =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${D=
EPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
> -IMAGE_CMD_cpio.gz =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc |=
 gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
> +IMAGE_CMD_cpio () {
> + =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
> + =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_D=
IR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> +}
> +IMAGE_CMD_cpio.gz () {
> + =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
> + =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -=
9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
> +}
> =A0IMAGE_CMD_cpio.xz =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (fi=
nd . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=3D${XZ_INTEG=
RITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMA=
GECMD}"
> =A0IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (=
find . | cpio -o -H newc | xz --format=3Dlzma -c ${XZ_COMPRESSION_LEVEL} --=
check=3D${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpi=
o.lzma) ${EXTRA_IMAGECMD}"
>
> --
> 1.7.6.4
>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Regards

Andrea Adami


