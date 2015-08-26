Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 26F79734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 20:31:42 +0000 (UTC)
Received: by obkg7 with SMTP id g7so181873744obk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H+bz37qXUNNYt9TnGAwyS89d9qahXBbSG9TFD+xeEY0=;
	b=fBQ34MnVj/Hs+kP/e/cMvTEEKe1hT+29u15lAF+V4Ju7C3BvKeP8L3RI8CbXQ2TSd8
	G38WgCKQ+N9wLrOF9gpPylGQEW+mpFTY7Zm+OCmOXOq+HjYm4gS29ceT/tOyUPXEtY0C
	4yRjz/glvtO430FwNBbv4n0HJq5xaNcn4DF7bPR4e3m53jGLllb+NiKONrwTHRI7RAdU
	u84cjJ1PTjnS2aY+V48LJmB0TSUECIZwCDC5QRhZ+zougtqNATrCAzPmz286pyuyYwIF
	khfhoT0purt5RwuEwoAp3UWny7azIf6veXMfYBJQYOcSEPiYEehWqSPZ7rP9e/rk6uUo
	jTyg==
MIME-Version: 1.0
X-Received: by 10.182.28.165 with SMTP id c5mr300873obh.29.1440621102466; Wed,
	26 Aug 2015 13:31:42 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Wed, 26 Aug 2015 13:31:42 -0700 (PDT)
In-Reply-To: <1440604110-4306-3-git-send-email-nicolas.dechesne@linaro.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-3-git-send-email-nicolas.dechesne@linaro.org>
Date: Wed, 26 Aug 2015 13:31:42 -0700
Message-ID: <CAJ86T=UEPqUz2ACbRpGkOkmxB7Z_U88iPEeoJfpA4Ox+pRbr2Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/2] image_types.bbclass: add support for fastboot image type
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
X-List-Received-Date: Wed, 26 Aug 2015 20:31:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 8:48 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> Fastboot images are images that can be flashed using the fastboot protocol
> implemented in many popular bootloader for SBCs or even real world products
> (such as Android phones and tablets).
>
> This image type was implemented in meta-smartphone, and is being moved in
> oe-core.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/classes/image_types.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 8547574..4c53dc9 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -156,6 +156,19 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
>
>  EXTRA_IMAGECMD = ""
>
> +FASTBOOT_PARTITION_SIZE ?= "16384"
> +
> +IMAGE_CMD_ext4.fastboot () {
> +       if [ ${ROOTFS_SIZE} -lt ${FASTBOOT_PARTITION_SIZE} ]; then
> +               make_ext4fs -l `expr ${FASTBOOT_PARTITION_SIZE} \* 1024` \
> +                       ${EXTRA_IMAGECMD} \
> +                       ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.fastboot \
> +                       ${IMAGE_ROOTFS}
> +       else
> +               bbfatal "Rootfs is too small for partition (Rootfs Actual Size: ${ROOTFS_SIZE}, Partition size: ${FASTBOOT_PARTITION_SIZE})"

Should the error be "Rootfs is too LARGE for partition" ?

> +       fi
> +}
> +
>  inherit siteinfo
>  JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
>  JFFS2_ERASEBLOCK ?= "0x40000"
> @@ -167,6 +180,7 @@ EXTRA_IMAGECMD_ext3 ?= "-i 4096"
>  EXTRA_IMAGECMD_ext4 ?= "-i 4096"
>  EXTRA_IMAGECMD_btrfs ?= ""
>  EXTRA_IMAGECMD_elf ?= ""
> +EXTRA_IMAGECMD_ext4.fastboot ?= "-s -b 4096"
>
>  IMAGE_DEPENDS = ""
>  IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
> @@ -182,6 +196,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  IMAGE_DEPENDS_multiubi = "mtd-utils-native"
> +IMAGE_DEPENDS_ext4.fastboot = "android-tools-native"
>
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>  IMAGE_TYPES = " \
> @@ -201,6 +216,7 @@ IMAGE_TYPES = " \
>      vdi \
>      qcow2 \
>      elf \
> +    ext4.fastboot \
>  "
>
>  COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

