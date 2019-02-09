Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9604579E63
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 03:27:54 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id e16so3336954vsq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 19:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=edgOzQaYthjGldTRWa0BFnutKIvGMgKAAqJNLg5XDM0=;
	b=bqcK69410imSRXibvuCnYUVgqrglBsdfewFJUs1iuchji5XGovIPpGm270y0z0udZ+
	8fgMl6mYG0OWCoIQbwSx82sBO7/GI8LTqL/h/A6hE2iLeak0WHzclL+oirx5vyRnhsIG
	kwWbIsrje/rV/eTZpm8qKacZG6BYnkQ9cWcY0BFo3e3e74Jc1vICOqxWpI57pVnVgN/A
	PPXy+YBb7Qn93t8YaTDOomCQ8PGEMtfloZAYyxw+ck/YybKHTWmBqk8m/iWK5QGHg1gm
	AxIet8O/hsBJ3XuCOxjj2MXvZAoYYTvivB55bMTjneQQFL5TtBoq6Gy8YtWuulgfazbl
	J5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=edgOzQaYthjGldTRWa0BFnutKIvGMgKAAqJNLg5XDM0=;
	b=N92+fZrzl5jg3ez2T3tAFVnmh+Ndue7g0nTV9GHfiNibkpoebURJ/6qfgBkaMrMpOD
	IFGNl7gRimVbL20El+z2cLUQ9my/SHehsq6vxlkm2YjYFc9uQWFKmBVk7e0+f7xuGTLp
	Kr6qwE74Yh31Fv2WkFMgR8qPjoeB7t1Hr9AmZxxw0RgZljh4rR8DGU+JqgW7Vv9xkBMg
	pB8tFu6iMpWGBvl5sDXSodd/0zc4903YTCXQD8VfZ5QdfOzmG6aS4P4FSGVP+QaF0ejr
	rMy2zOhGZv0AObAaQIbEsGD9lMdF+BWcSbFBfwjdj/ySs/COVWw9St8Z0qlUpHA3xopU
	9OLQ==
X-Gm-Message-State: AHQUAuY6Sz4zm2vYdXGFaDrpTa3SM6v44FrD5DXnHxSNKudRjaPK4ped
	b9T/gNT5mjiU5HMAUu83u4kvqcANmS8TlI4Yr9U=
X-Google-Smtp-Source: AHgI3IYOMTCSRGpM4+0QH237B++6WBzw2vBKUSkHM59hSSa2TlEz/Bfko0yCgmZ8sePn4XZZIDEHeJZbYtkwDFwaOME=
X-Received: by 2002:a67:c202:: with SMTP id i2mr10498854vsj.11.1549682875294; 
	Fri, 08 Feb 2019 19:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20190209012850.17425-1-raj.khem@gmail.com>
In-Reply-To: <20190209012850.17425-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Feb 2019 19:27:43 -0800
Message-ID: <CAJ86T=Ug9meGkuDsg2=meaqB=rephcMCkgiu3Dw3Qd476yrsRw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: Set 70% RAM memory usage limit for xz
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
X-List-Received-Date: Sat, 09 Feb 2019 03:27:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> when building with opkg backend and huge packages e.g. chromium/llvm all
> going in parallel, memory pressure causes xz to catapult with
>
> do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory
>
> since there are many tasks going on in parallel, xz adds to memory pressure
> and it wants it all, put an upper limit for memory xz can use
>
> We add a variable XZ_MAXRAM with 70% of RAM limit and can be customized
> if builders have more memory one can set it like
>
> XZMAX_RAM = "-M 0"

This needs a little more explanation. How does a change to command
used to create .xz images help when running out of memory in
do_package_write_ipk? Doesn't the image get created a lot later?

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/classes/image_types.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 70bd315306..9c8ea0643c 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -57,6 +57,7 @@ def imagetypes_getdepends(d):
>  XZ_COMPRESSION_LEVEL ?= "-3"
>  XZ_INTEGRITY_CHECK ?= "crc32"
>  XZ_THREADS ?= "-T 0"
> +XZ_MAXRAM ?= "-M 70%"
>
>  ZIP_COMPRESSION_LEVEL ?= "-9"
>
> @@ -284,7 +285,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> +CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} ${XZ_MAXRAM} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

