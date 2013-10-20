Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 24AA66D169
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 10:37:11 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id el20so1848445lab.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 03:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IlGh0mAuv2z0eaBtq+4HoTBsR8AJt3Pdrzi29G0QqrA=;
	b=HlfxGase+XVZI6GQ2+wdTmSHGM6PA5naYY/OYUidWAzEuC0IGfgsJY7fAVPoHjxHS2
	A7Itgj/5GJ36dZCzk8voFgnjxCjpLiouMOLGq5YQJocUiC5kT5FrYeo4k57OMqI5I6Qv
	fg8+l3FPJnu+zQ6YuEpxud/0kOlPGZyAeLFzwhB28tjc/HsO0k6vC1GM9LyjiHrKaPj1
	YPZFI0Y9mGCAgCMQl5FdxpM5deAmNFAI2gqND4YXP70RZhJkHqppjm/qoSX9agGKcfOI
	dFFLhXtaLWDmDoqpKbFUKlRR7JuSMnStrjwjRO1fMOqH4eVYkA2ulIE8ri5D9Pm+hWgh
	cT/Q==
MIME-Version: 1.0
X-Received: by 10.152.6.169 with SMTP id c9mr838683laa.28.1382265432737; Sun,
	20 Oct 2013 03:37:12 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Sun, 20 Oct 2013 03:37:12 -0700 (PDT)
In-Reply-To: <1381964601-28226-1-git-send-email-andrea.adami@gmail.com>
References: <1381964601-28226-1-git-send-email-andrea.adami@gmail.com>
Date: Sun, 20 Oct 2013 12:37:12 +0200
Message-ID: <CAAQYJAtJucV9JqbGnDiCiEuytnqX7OVQJvwXbX=t89A=fy07Ug@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] image_types.bbclass: allow JFFS2 image with cleanmarkers
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
X-List-Received-Date: Sun, 20 Oct 2013 10:37:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've tested the patch in all possible JFFS2 combinations and there is
still a little bug.
The --pad options must be

--pad=0x0FFFF

- p 0x0FFF

I'll resend a final version splitting the changes for a better review.

Cheers

Andrea


On Thu, Oct 17, 2013 at 1:03 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> The creation of JFFS2 images was hardcoding the
> --no-cleanmarkers option (-n) after those two commits:
>
> 70a276509f0f006fcc269296afc3dcc88d2825e1
> 7c803cea58737ea0abc62cd21c3813d955f07224
>
> The documentation explains that the -n option is
> intended for flash NAND only: devices with NOR flash
> need the cleanmarkers and should not make use of this option.
>
> To add more flexibility, parametrize the padding size
> as well, creating JFFS2_PADSIZE.
>
> Finally, add EXTRA_IMAGE_CMD_jffs2 in explicit form:
> sumtool has slightly different options:
>
>  -l  --littleendian
>  -p, --pad
>
> To give an idea about size differences:
>
> core-image-base-xxx.rootfs.jffs2     | 16496K
> core-image-base-xxx.rootfs.sum.jffs2 | 22816K
>
> core-image-minimal-xxx.rootfs.jffs2     | 6160384
> core-image-minimal-xxx.rootfs.sum.jffs2 | 9879552
>
> Patch v.2 fixes generation of sum.jffs2 using JFFS2_PADSIZE
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 9ead059..0def6d7 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -140,9 +140,9 @@ XZ_COMPRESSION_LEVEL ?= "-e -6"
>  XZ_INTEGRITY_CHECK ?= "crc32"
>  XZ_THREADS ?= "-T 0"
>
> -IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> -       -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
> +       && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>
>  IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>
> @@ -209,9 +209,12 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
>  EXTRA_IMAGECMD = ""
>
>  inherit siteinfo
> -JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-endian', '--big-endian', d)}"
> +JFFS2_PADSIZE ?= ""
> +JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
>  JFFS2_ERASEBLOCK ?= "0x40000"
> -EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
> +JFFS2_NOCLEANMARKERS ?= "--no-cleanmarkers"
> +EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_PADSIZE} ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
> +EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
>
>  # Change these if you want default mkfs behavior (i.e. create minimal inode number)
>  EXTRA_IMAGECMD_ext2 ?= "-i 8192"
> --
> 1.8.1.5
>

