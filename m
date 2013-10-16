Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 020546D126
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 21:51:53 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so1163947lbd.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GUR4fNp2z1coVdImOyALdU32PYKcaxiBAhugavbGTVE=;
	b=a0R2JzeY1/dNH56f28s22DxjZ7XjvVdTRZT1oJ6Q0NAkrRg9UMU9hGoNugvFgbMIuL
	5paYaHzmIHydI0ZHm/S6pIrltk3SZ2jVcEh/Mp6FOoXnlhESnf9rKRL8OlWTEGpyWFbd
	92/bajmimL19+yQ3/bXNeogwB8bdTPaQyPm14SE9frn6bl6PEwW/RXDcUT8JroytGNOx
	Zl3U0VuT8c60fVockv+tLXTwCaDkVa853+G3Na5I8vx1RVfkavmAloBex0+HOKzDHcbx
	xWnr2AmLfC8eOapIZITxvbbSMaZrLtqP8EEA7C4a1qTO0wLnWGenzy+EGZ2M3avO14t5
	/YyA==
MIME-Version: 1.0
X-Received: by 10.112.168.3 with SMTP id zs3mr4503415lbb.2.1381960314476; Wed,
	16 Oct 2013 14:51:54 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Wed, 16 Oct 2013 14:51:54 -0700 (PDT)
In-Reply-To: <1381954581-19306-1-git-send-email-andrea.adami@gmail.com>
References: <1381954581-19306-1-git-send-email-andrea.adami@gmail.com>
Date: Wed, 16 Oct 2013 23:51:54 +0200
Message-ID: <CAAQYJAuJzyJ_JkvE_Nhtyt=4=QbnyoEe2QCk3ztwrq8j-TeW+Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types.bbclass: allow JFFS2 image with cleanmarkers
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
X-List-Received-Date: Wed, 16 Oct 2013 21:51:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 16, 2013 at 10:16 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
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
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 9ead059..2a1acfa 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -140,9 +140,9 @@ XZ_COMPRESSION_LEVEL ?= "-e -6"
>  XZ_INTEGRITY_CHECK ?= "crc32"
>  XZ_THREADS ?= "-T 0"
>
> -IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
>  IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> -       -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IMAGECMD}"
> +       -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
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

Well, this patch still works in the default case but has one flaw with
regard to jffs2 summary images with specific padding size:
it never uses the JFFS_PADSIZE size because EXTRA_IMAGECMD_sum.jffs2
is the final value.

At the moment I'm tempted to remove the experimental sum.jffs2 support :/

Thanks for suggestions

Andrea

