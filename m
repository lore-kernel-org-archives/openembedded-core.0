Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjK4O-0003n9-Jq
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 01:23:36 +0100
Received: by dake40 with SMTP id e40so1029131dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 16:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cIFKv2LWkY/soZVYWaDEc5rHFHnh0a3MZ+P/4iiTnIU=;
	b=l053vRYOg1WnAn2Kc4Ks8OmYH77v6DubRATf5xNFvomMQ3+I0KwJCHHUBasTMRxZF0
	W1liDSd3o87PaZY3H82ORTRFMs5i/o5nWE5ZYZWVVsTCTiG0FCNDdNQr6BiyMbjTqph5
	7HR1d2DpdF/Z0hHH2i/ZmE3a6DdFD5PEyBhCI=
MIME-Version: 1.0
Received: by 10.68.189.163 with SMTP id gj3mr19045034pbc.86.1325895368751;
	Fri, 06 Jan 2012 16:16:08 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Fri, 6 Jan 2012 16:16:08 -0800 (PST)
In-Reply-To: <1325895236-22987-1-git-send-email-andrea.adami@gmail.com>
References: <1325895236-22987-1-git-send-email-andrea.adami@gmail.com>
Date: Sat, 7 Jan 2012 01:16:08 +0100
Message-ID: <CAAQYJAv3vbpTQFtLoKq9vZKcZn8mQZgvAct6UOMaBoNypFSg9w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kexec-tools: split packaging of kexec and kdump
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
X-List-Received-Date: Sat, 07 Jan 2012 00:23:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 7, 2012 at 1:13 AM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> * from meta-oe (originally from org.openembedded.dev)
> * There are no reasons to install kdump when only kexec is needed.
> *
> * In oe-core/meta there are no references to kexec-tools so
> * the recipes inn external layers rdepending on kexec-tools should be
> * fixed and rdepend on kexec and/or kdump.
> *
> * Bump PR.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0meta/classes/image_types.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
4 ++--
> =A0meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb | =A0 =A07 ++++++-
> =A02 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 3010549..2df424c 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -111,11 +111,11 @@ IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS} && tar -zc=
vf ${DEPLOY_DIR_IMAGE}/${IMAGE_
> =A0IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
> =A0IMAGE_CMD_tar.xz =3D "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
> =A0IMAGE_CMD_cpio () {
> - =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
> + =A0 =A0 =A0 touch -h ${IMAGE_ROOTFS}/init
> =A0 =A0 =A0 =A0cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_=
DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> =A0}
> =A0IMAGE_CMD_cpio.gz () {
> - =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
> + =A0 =A0 =A0 touch -h ${IMAGE_ROOTFS}/init
> =A0 =A0 =A0 =A0cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c =
-9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
> =A0}
> =A0IMAGE_CMD_cpio.xz =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (fi=
nd . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=3D${XZ_INTEG=
RITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMA=
GECMD}"
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb b/meta/recipe=
s-kernel/kexec/kexec-tools_2.0.2.bb
> index caed816..8d2e606 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
> @@ -2,8 +2,13 @@ require kexec-tools.inc
> =A0export LDFLAGS =3D "-L${STAGING_LIBDIR}"
> =A0EXTRA_OECONF =3D " --with-zlib=3Dyes"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI +=3D " file://fix_for_compiling_with_gcc-4.6.0.patch"
> =A0SRC_URI[md5sum] =3D "bc401cf3262b25ff7c9a51fc76c8ab91"
> =A0SRC_URI[sha256sum] =3D "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c354=
3ce6aaf8287a0b4188"
> +
> +PACKAGES =3D+ "kexec kdump"
> +
> +FILES_kexec =3D "${sbindir}/kexec"
> +FILES_kdump =3D "${sbindir}/kdump"
> --
> 1.7.3.4
>

Sorry, this patch contains unwanted changes to image_types.bbclass.
Please ignore, will resend.

Andrea


