Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RYfYa-0004gy-Tg
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:06:45 +0100
Received: by qabg14 with SMTP id g14so1607557qab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=K6EZZHLcquY5E9WwgwgiCJHb1nOAMB3JC8a6z76Xthk=;
	b=akrSD7UhOtdCde6D+tVf+LNkNF1SISYfpTDa424Ihjc6bOCSmhdtBe02KOMfQWiKto
	JScB5KTBIa7sgz8+RseWqZUzTtGuD5UH+vB8B9A1ew98ey1k/E0nlXLGXmJlm2dZgVrx
	nz3n6lmLImV0RIwadqnJL9lgBLIVBfhPjxBr4=
MIME-Version: 1.0
Received: by 10.224.189.78 with SMTP id dd14mr3209598qab.31.1323356394997;
	Thu, 08 Dec 2011 06:59:54 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 8 Dec 2011 06:59:54 -0800 (PST)
In-Reply-To: <3448040a06507769d6e62cc2ccf3bdc6a2dfeb43.1323212403.git.andrea.adami@gmail.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<3448040a06507769d6e62cc2ccf3bdc6a2dfeb43.1323212403.git.andrea.adami@gmail.com>
Date: Thu, 8 Dec 2011 07:59:54 -0700
Message-ID: <CA+M6bXkeMxeUoTpv_ZzPKn5wgSJESKf2UZET3q5H2MYWLc4bPQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] image_types.bbclass: disable cleanmarkers for jffs2 images
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
X-List-Received-Date: Thu, 08 Dec 2011 15:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> * Add '-n' to suppress cleanmarker nodes since jffs2
> * is usually used for NAND flash and the cleanmarkers are created in
> * the OOB area by flash_eraseall -j
> *
> * From man pages: -n, --no-cleanmarkers
> * Do not write cleanmarker nodes to the beginning of each erase block.
> * This option can be useful for creating JFFS2 images for use on NAND fla=
sh,
> * and for creating images which are to be used on a variety of hardware w=
ith differing eraseblock sizes.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Acked-by: Tom Rini <tom.rini@gmail.com>

> ---
> =A0meta/classes/image_types.bbclass | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index bd4b7bc..489fbe1 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -34,9 +34,9 @@ runimagecmd () {
> =A0XZ_COMPRESSION_LEVEL ?=3D "-e -9"
> =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
>
> -IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --ou=
tput=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --ou=
tput=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
> =A0IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> - =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXT=
RA_IMAGECMD}"
> + =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${=
EXTRA_IMAGECMD}"
>
> =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Tom


