Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71CE27F817
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:49:45 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k1so27115013ioj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Czf6F6Jwjx1XTcISVqFgZVA2lVbYfpdjvan0gfwQ8I=;
	b=ezD/rRUXeiLMfXRILNrZuvo5HOWOSH73SB62jeKxwZWtC+jpSKsBc95dga0EsJqSiR
	ww4FydoGvSd5eolx4RNPirBnH4Cpev65iOimJ95N4AMeywElPHqQGrcjSNQneCWpZ1BS
	k6Rojz4QmRgm4gK9FFstAoGiQ33NF4+z57xfWmaS+UzBzkfnQWhdnXFVMfwmxzBBp1lI
	ZxC8G346YGnB4ge+2keyLeqYEgFcTE45nFx5Wc2k8kGzyMCswWhmpFHBfn2+eExb9ukx
	llMtgbpFEer5LoGy6u9sq+wgYc99PHBsIR54aJMMnAKypxqEJ6mwqEOAbU9unhzY+XF+
	v2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Czf6F6Jwjx1XTcISVqFgZVA2lVbYfpdjvan0gfwQ8I=;
	b=jNFfyKHJBwASMk3rS+C89QIP9fHmhGH5fdSp9jF9yXn79LZwQoBPkjFpPFE41cNqPg
	6QI1p4GbS5hphjvf/+IGvpZuOGxZhFlPKxQVaj7yybYarORFQe7vG8OlaFPpzgTmIIp3
	/ib4WoAS+ixyP0P38NPTS0qkjDIBCYc3WOM4Sh3EQHYsd4pwu+fF9p/sVNM0cX8GDGCT
	yyicaGw+GMn2QvCSQ+UcXTlg6VNrlZRo9v+0KO0nXP9SYnFt+PcjBnyetK1oT0uGrzqz
	xJXjwP01T68TUUIv6nrCkcJhIX7Si6hCz1uMgmFp3VVWsL7EZru3QDvTssfUCNk7mykM
	js/w==
X-Gm-Message-State: APjAAAXgXP/Hb9zvC0wsxfJ7DvSz+j0MA37VGGIeNba+d2MaS9RL5E3a
	wIYplcRjet6r6yy9fwtX0j9XXn7vWgwTOa6QMgg=
X-Google-Smtp-Source: APXvYqyqW9YPCcWzj40rKfFOSIVV67p3szc6qUf3mqGN3nSh7fQU/COQ2Y/SvHefv6+kuXjYNNb4lUidI0ifXpY7skI=
X-Received: by 2002:a6b:3a88:: with SMTP id h130mr1466035ioa.217.1574246986641;
	Wed, 20 Nov 2019 02:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20191120091258.30350-1-stefan@agner.ch>
	<20191120091258.30350-2-stefan@agner.ch>
In-Reply-To: <20191120091258.30350-2-stefan@agner.ch>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 20 Nov 2019 10:49:35 +0000
Message-ID: <CAO5Uq5QxwF+GQgFNndMZEWor3i08So4v2rO3JjXq4erg=TDLLw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] image_types: add Zstandard conversion support
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
X-List-Received-Date: Wed, 20 Nov 2019 10:49:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 9:13 AM Stefan Agner <stefan@agner.ch> wrote:
>
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

Add -T0 so we default to parallel?

-- 
Alex Kiernan

