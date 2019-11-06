Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 104C27F822
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 01:26:08 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id y23so8345804vso.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 17:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TWmASQ37+KQ0KsQVZRXutGDmGyC+domtuyc/9LacDmI=;
	b=YQ4uuGOLEgvOzIKSqQMd8FFuMwsorkhAOLhBReTkOBrfdNfHcWehwZSA0QHN86+nJa
	7buP6GC52v2fs3ILKXgI+/s7yoqAdbn7OOy7xdIGjHUoJxwb5rIEHBrXDfzKyFgPOXhI
	jO9OoNcPpba90il9CNd7LgCNxpO6phyddBX7bGcDN5WUrsLVyqgtcoaSp6IcKf7yHP/H
	UxRzOjrPn5t+ntHMbZf9ciM+oV9znZV2Y7s+KDSqGG9SbBqpc9TinsB1SQrpwNdqZBO/
	hl8ReC22d1RXGOc/e1jzL9mO90fno9FtqUN6gn0JNN/K7TI9XKfwBIDg/ZSsw20bcZk+
	zA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TWmASQ37+KQ0KsQVZRXutGDmGyC+domtuyc/9LacDmI=;
	b=J1j+NPnKrL97icO229Q2PjESVrXNGaAR/WgB//sRvJsfXfeMlEHz0nxuYIaa+3UHRQ
	L882kxf30IzxZK3UyAHCU5CYJLyDWzAz7kzIA9nsfFJNEqM8jEyp/SQFwJm3YUBls6hR
	h2d/SFKXNSxDWEcYLsRDfrPLyVlC45+BUbKlcJnMc/5EGu6JpcLGQeC5SVDxbbaapepN
	7gpPJfgyAsp89xrAiRZlnV6nXshuCr5nOyHQIlmhJXas2b16mDcKVNjzzlu3/unnbnIj
	TAGvML7QCIzfKNUIGpc5wwlUaCgFtfpTkqrUql9MpUoCS9J89no8q5CtxI8c5ex0tngg
	gZgA==
X-Gm-Message-State: APjAAAXA4xaIOZQYDcJ2Az5FgITr4RK1nNnZNmlNjhJHJ1EjFJG0KrN/
	6Pa4MM+NtKL6W8vJ12lFLLc8GeGXdRGaYcMCYdI=
X-Google-Smtp-Source: APXvYqy6Q0aqQH83SwGURsjIXWqYUhDYHW0G/3gRLb+f/GX50xofsguc+Y2AN0Gq9NDZdM/QPT4VaOIzZ2FKF7Ls7AU=
X-Received: by 2002:a05:6102:677:: with SMTP id
	z23mr46600vsf.130.1573003569585; 
	Tue, 05 Nov 2019 17:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20191105231253.15448-1-stefan@agner.ch>
In-Reply-To: <20191105231253.15448-1-stefan@agner.ch>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 5 Nov 2019 17:25:58 -0800
Message-ID: <CAJ86T=U5v4cgVpR9x+x=+kwXKg4X6Z4zxeS0ACddxg3xXgk8jg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: add Zstandard conversion support
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
X-List-Received-Date: Wed, 06 Nov 2019 01:26:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 3:13 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Add Zstandard (or just Zstd) compression support. This allows to
> create Zstd compressed tarballs by using tar.zst as IMAGE_FSTYPES.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/classes/image_types.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 2eeffbb366..eeae652e02 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -269,7 +269,7 @@ IMAGE_TYPES = " \
>      hddimg \
>      squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
>      ubi ubifs multiubi \
> -    tar tar.gz tar.bz2 tar.xz tar.lz4 \
> +    tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>      wic wic.gz wic.bz2 wic.lzma \
>      container \
> @@ -282,7 +282,7 @@ IMAGE_TYPES = " \
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?= ""
>
> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> @@ -290,6 +290,7 @@ CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD_zst = "zstd -f -k -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"

Where is ZSTD_COMPRESSION_LEVEL defined?

>  CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
>  CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> @@ -310,6 +311,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
>  CONVERSION_DEPENDS_lz4 = "lz4-native"
>  CONVERSION_DEPENDS_lzo = "lzop-native"
>  CONVERSION_DEPENDS_zip = "zip-native"
> +CONVERSION_DEPENDS_zst = "zstd-native"
>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>  CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

