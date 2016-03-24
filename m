Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 51A1F731AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 20:32:06 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l68so4204112wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=JAsPzNCHglVEGLAZiWkYIjAZs092Dnaiqpd6s5TtBlw=;
	b=C4WCA6+OgHl1W6ttVh3R0wI+tSFXlyODu/NOd/+Nd6JvvjAERx3d0YpjnDRgV/L8V3
	Dtuc50lvNeVo2b2VeGE24OenpQ3uGyHEe06JbccmwMmVtZ+4Lm6d8Pw6IgBGly5tindH
	nxaKJmnHUBjvpm7MruBmWvuJ+th1oLvYP3OFM/obprXp6YjTqzhEFGQrWoEqAC4PHXGl
	goKgolNRwwS3zMEVETIjX4Vw/nwYsT++hVyasn3cMEIwBMHeTCXC997ibjX+9/Kkd131
	JZ1QeNE+JkBOMlAAyvv2dExTPFFa8LQ1y10tEmXk32LEzKS7LUSuoObK6CZBI0JoV0sz
	ooVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=JAsPzNCHglVEGLAZiWkYIjAZs092Dnaiqpd6s5TtBlw=;
	b=PUu0HqeuVNycWRUKebynqlh1U+pYjTSs/jp1dUwYnec6DacSHZqT5O9MAvZC2lYn8Y
	a3bDE3HXk+Um99iOxUQnNsgpor5+FZ4ALeomYOflcIqeD3bKfoM/aQsDGSsgsRHYajxV
	Ggu9GueYkthqaG9KRYnZTZrKw98C8bI+Gprg3+xdOuYHcLK1BMvzGvEVQAnlnFpkUQYj
	PUPZAXwjvUOuH4J7M06WllbqZDJm4K0aGvwONw2cK4QXQFmvDQCmaorJxm97ifY0goUp
	ppisdw7dzR0PXHkSLjjgFwaYDvZ8d0OkaH0lhV6i9NI70WdYE7+eqZUprVHDzza4lwOq
	zR5A==
X-Gm-Message-State: AD7BkJK2FHMyBLhRQmPGtRSsjX6Z3/CF6/zEHb9FkWcELtSc+6//SDtFQV6vQlm3kt7MoMDohXj/sJS/HT+IMg==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr11874474wjc.3.1458851526523; 
	Thu, 24 Mar 2016 13:32:06 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 24 Mar 2016 13:32:06 -0700 (PDT)
In-Reply-To: <1458850608-50481-1-git-send-email-kad@kad.name>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
Date: Thu, 24 Mar 2016 13:32:06 -0700
Message-ID: <CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Alexander D. Kanevskiy" <kad@kad.name>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 24 Mar 2016 20:32:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 1:16 PM, Alexander D. Kanevskiy <kad@kad.name> wrote:
> Existing compress framework for producing various compressed versions
> of images is powerfull enough to be extended for other uses, e.g. to
> convert types of images.
>
> It is possible to use it also to produce image checksums at the time
> of image generation. This commit adds support for all supported
> at the moment coreutils hashing algorithms: md5, sha1, sha224,
> sha256, sha384 and sha512
>
> Usage:
> IMAGE_FSTYPES_append = " hddimg.sha256sum"

I guess a common requirement is for hashes of the compressed images,
not only the uncompressed image.

> Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
> ---
>  meta/classes/image_types.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 22719ad..3e98024 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -259,13 +259,19 @@ IMAGE_TYPES = " \
>      wic wic.gz wic.bz2 wic.lzma \
>  "
>
> -COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
> +COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum"
>  COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>  COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> +COMPRESS_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> +COMPRESS_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> +COMPRESS_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
> +COMPRESS_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
> +COMPRESS_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
> +COMPRESS_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
>  COMPRESS_DEPENDS_lzma = "xz-native"
>  COMPRESS_DEPENDS_gz = ""
>  COMPRESS_DEPENDS_bz2 = "pbzip2-native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

