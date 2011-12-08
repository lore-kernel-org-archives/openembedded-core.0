Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RYfWg-0004cu-7m
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:04:46 +0100
Received: by qcqw6 with SMTP id w6so1305969qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=C5hV2xxb4xdk0fEL38ma3Sn10M+IEpCPRNXjdqbxGEU=;
	b=kCDH7kYbFW3ZRXMQcPd6zUxkmxI463GiPOF//NI2bGYrt7OfsROsfiVuulIzPLeXWF
	jKieUK7wGkA6PAucx4V3Yo3/jGruen5A6E3UiU9ypmlx0/WoPZwAY635vC55TjI9nx5i
	CxddPVD/2ChKOYBKXC7/MIX2k0LajinA8lANQ=
MIME-Version: 1.0
Received: by 10.229.85.193 with SMTP id p1mr884877qcl.152.1323356272763; Thu,
	08 Dec 2011 06:57:52 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 8 Dec 2011 06:57:52 -0800 (PST)
In-Reply-To: <68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
Date: Thu, 8 Dec 2011 07:57:52 -0700
Message-ID: <CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
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
X-List-Received-Date: Thu, 08 Dec 2011 15:04:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> * Building the jffs2 filesystem to include summary information speeds up
> * the mount process considerably at the cost of increased size.
> * The rate of speedup is generally higher on NAND chips and on the chips
> * where the erase block size is large.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Acked-by: Tom Rini <tom.rini@gmail.com>

> ---
> =A0meta/classes/image_types.bbclass | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 29b6380..bd4b7bc 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?=3D "-e -9"
> =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
>
> =A0IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --=
output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_I=
MAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> + =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXT=
RA_IMAGECMD}"
>
> =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>
> @@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?=3D ""
>
> =A0IMAGE_DEPENDS =3D ""
> =A0IMAGE_DEPENDS_jffs2 =3D "mtd-utils-native"
> +IMAGE_DEPENDS_sum.jffs2 =3D "mtd-utils-native"
> =A0IMAGE_DEPENDS_cramfs =3D "cramfs-native"
> =A0IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
> =A0IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
> @@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
> =A0IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
>
> =A0# This variable is available to request which values are suitable for =
IMAGE_FSTYPES
> -IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lz=
ma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz c=
pio.xz cpio.lzma"
> +IMAGE_TYPES =3D "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.=
gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio=
 cpio.gz cpio.xz cpio.lzma"
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


