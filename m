Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79A0A7F555
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:01:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f3so1262511wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 00:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=oJVvgyzLniQKuSGoEGbLlKbPSVvNlm5DMcI0m6nMJ/w=;
	b=Xpm044NhVmlF97BBHKLEQIVCegfvva55MZx3wrqnX+fBrGZ4QAzFBBZh0b3WjXNCJs
	cLBpNrwbZkOjn/AsIZlpbu4riHV9sxawbss/+EJmGztTw6ifUh7UYa981XVDaOS9H9gu
	yH8WTZuT3OYR6Wl2ecdQVTUWzWhvxrRMSfbUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oJVvgyzLniQKuSGoEGbLlKbPSVvNlm5DMcI0m6nMJ/w=;
	b=rMQw0T4oncQ0wEUwwx1UQ8Uv4yNsICBDKd3qRM/LhghrmdAIfgdPxK2Tosy+CudeHA
	iZp78soVLoM8un+HVFqOYAkTXN7tnVsJitYmEe5TxH2ISx3hsf33GG9MKOzshezCpsxN
	bsT/yU9eEMijjP5YA6Y/ns9I6ivUQB0Ara9DEfE+jdCA/VnaieRAJ0nEtbKLuI7OhJ0M
	dl/rbohxAdjlmxQVpeclKxpl1dlMFE8fhhEe+4lpHjDOw2LwzF98ywB23frCd/vYw7cw
	ClvDTkenB71p9XR0uOre/HCI7keGBbsuiV6rTHfdmErdZAQy2wsn0usGEVt9cV1CVL1m
	VDig==
X-Gm-Message-State: APjAAAUBMdKb2lo4scQ6HOrCuQ3dyXAU1knkDok6TJAuyPFpK0VAKkoO
	AI8/DuP5LfTYbElBuv/QARoZwA==
X-Google-Smtp-Source: APXvYqzoL2q1oPq8qsggPsTuYJQijvP0qItIJo1W2Q/iqSq9She/hI2/OpWj+pIs5eqbSwALPC+qkA==
X-Received: by 2002:a1c:4946:: with SMTP id w67mr1603250wma.16.1573113668037; 
	Thu, 07 Nov 2019 00:01:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id j6sm1406393wrr.34.2019.11.07.00.01.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 00:01:07 -0800 (PST)
Message-ID: <ae023dca562212e71e4d9c6279a439936514be4f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Nov 2019 08:01:05 +0000
In-Reply-To: <20191106134305.12109-1-stefan@agner.ch>
References: <20191106134305.12109-1-stefan@agner.ch>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2] image_types: add Zstandard conversion support
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
X-List-Received-Date: Thu, 07 Nov 2019 08:01:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-06 at 13:43 +0000, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Add Zstandard (or just Zstd) compression support. This allows to
> create Zstd compressed tarballs by using tar.zst as IMAGE_FSTYPES.
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/classes/image_types.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 2eeffbb366..d29b9c5787 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -59,6 +59,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>  
>  ZIP_COMPRESSION_LEVEL ?= "-9"
>  
> +ZSTD_COMPRESSION_LEVEL ?= "-3"
> +
>  JFFS2_SUM_EXTRA_ARGS ?= ""
>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
>  
> @@ -269,7 +271,7 @@ IMAGE_TYPES = " \
>      hddimg \
>      squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
>      ubi ubifs multiubi \
> -    tar tar.gz tar.bz2 tar.xz tar.lz4 \
> +    tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>      wic wic.gz wic.bz2 wic.lzma \
>      container \
> @@ -282,7 +284,7 @@ IMAGE_TYPES = " \
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?= ""
>  
> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> @@ -290,6 +292,7 @@ CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD_zst = "zstd -f -k -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
>  CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
>  CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> @@ -310,6 +313,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
>  CONVERSION_DEPENDS_lz4 = "lz4-native"
>  CONVERSION_DEPENDS_lzo = "lzop-native"
>  CONVERSION_DEPENDS_zip = "zip-native"
> +CONVERSION_DEPENDS_zst = "zstd-native"
>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>  CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"

I was ok with this despite not having zstd-native in OE-Core however
our automated testing is cleverer than I remembered:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/467

so we may need to skip this option in the test...

(oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes should
reproduce)

Cheers,

Richard



