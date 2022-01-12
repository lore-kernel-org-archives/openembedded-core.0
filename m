Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD7FC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:30:20 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.23724.1641997819590413871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EsS43ybL;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a18so10716636edj.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ir2P+rO5rN+s8ujbe244j6XqgszdVouYC18tl4Dsw78=;
        b=EsS43ybLhOVdjKC5lOSuiaI+fHtyBVhoxnFa0Pd4uTBPe18WRDTTtNVqIVhPBT1arI
         UyI8Si3LzEI4fZ5sC1XmEuI1DE5FhtPoF49b0zAeMtopiPYsfg3+9T/qLN5+Y1cNxYuW
         M4DZU9eax7Hcmg010C1xXFfIbtZnQbyhGA25FomUKg4JQoctIqyjuigkAG6I+c+erUIK
         WzXOP3CHE9boBk6iaOIIKB8KIk3yn9cO3xwsu9Hq6M+acVMba2Bx99eA/lrrkg/S+Iyl
         4/nYzkVXNnXsiya7jA09QlrIRm1LC8jgeVIstVa/NL3CGkpbPcJfUqvR/QiKoHDCrhqv
         qaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ir2P+rO5rN+s8ujbe244j6XqgszdVouYC18tl4Dsw78=;
        b=pYGXpMZxYeY3+3qs0wNRLabgwX3iLPZNx4X84FCqHYqAdLk4jOuN/fLJndHJ0AM7p5
         MK7fvXQI6xQURRExFIBvRC5jquP1kYO+YuYn4NFb9hyEQ27QErDQT1r/hucSWHWM7bfY
         z9yrCHTR4v1p5oHPZSHtncL3HJN2sJk4FMvGsjZ2EE2OtPQKuYEP/qV2brGu5wB/9Np7
         4uybUUpkntyXXvViILaMyr3xJ0YTqANcEWwwYQuVRcnMpMvIOG7M/+1FeySN/pUVZpwB
         sxNjCLZ6DxnjXsIT6BYqsQstS8ESNlScIAEAex3OdP8BUxXNoNtk7O1VhWqCtBabFZMq
         +VXg==
X-Gm-Message-State: AOAM5329V3O17rTdqTk60lSyt5Y1hHAGPHwz+A88UgkNt4gSX0gMojvr
	iRiLgLmZm5a6IHDmR7TD5djdyzmTbpaDj7N73JU=
X-Google-Smtp-Source: 
 ABdhPJzYZl7kJX/R0WT76UqU1nyPialxuKqvd3ZO6VaPudw4XEdRWetIgp5qIf9XxS/RxUr9sWEMxZJlpjsHpVJqT7w=
X-Received: by 2002:a17:907:b13:: with SMTP id
 h19mr7647048ejl.391.1641997817743;
 Wed, 12 Jan 2022 06:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20220111235840.81471-1-saul.wold@windriver.com>
 <20220111235840.81471-4-saul.wold@windriver.com>
In-Reply-To: <20220111235840.81471-4-saul.wold@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Jan 2022 09:30:06 -0500
Message-ID: 
 <CADkTA4N7koctbLfOXDdTqXTPJt6_SUr+u1evLgCFgijCFk8dag@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] kernel.bbclass: use common strip()
To: Saul Wold <saul.wold@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 14:30:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160482

On Tue, Jan 11, 2022 at 6:59 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> Re-use the runstrip() code from oe.packaging, for the kernel
> stripping process. Since runstrip() is python the kernel do_strip()
> need to be converted to Python also. The stripped kernel image
> will be used for deployment in do_deploy(). This will allow the
> package.bbclass to split an unstripped kernel binary for the debug
> information and extended packagedata. The extended package data is
> used by create-spdx.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 44 ++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 7685c6921fa..b2f9e3c8071 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -700,30 +700,19 @@ do_kernel_link_images() {
>  }
>  addtask kernel_link_images after do_compile before do_strip
>
> -do_strip() {
> -       if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> -               if ! (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux"); then
> -                       bbwarn "image type(s) will not be stripped (not supported): ${KERNEL_IMAGETYPES}"
> -                       return
> -               fi
> -
> -               cd ${B}
> -               headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT_DIR}/vmlinux | \
> -                         grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
> -                         sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
> -                         gawk '{print $1}'`
> -
> -               for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
> -                       if ! (echo "$headers" | grep -q "^$str$"); then
> -                               bbwarn "Section not found: $str";
> -                       fi

We are losing this warning in the relocated / common routine. It looks
like something we could continue to detect and warn on, no ?

> -
> -                       "$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT_DIR}/vmlinux
> -               }; done
> -
> -               bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
> -                       "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
> -       fi;
> +python do_strip() {
> +    import shutil
> +
> +    strip = d.getVar('STRIP')
> +    extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
> +    kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
> +
> +    if (extra_sections is not None and kernel_image.find('boot/vmlinux') != -1):

Minor 'nit .. I'd probably just write that as: if extra_sections
(versus the is not None) .. but maybe you have it that way due to that
check not working.

> +        kernel_image_stripped = kernel_image + ".stripped"
> +        shutil.copy2(kernel_image, kernel_image_stripped)
> +        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
> +        bb.note ("KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
> +            extra_sections)

In theory, we could move the debug log to the common routine when it
detects the extra section argument

>  }
>  do_strip[dirs] = "${B}"
>
> @@ -768,7 +757,12 @@ kernel_do_deploy() {
>
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 baseName=$imageType-${KERNEL_IMAGE_NAME}
> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
> +
> +               if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
> +               else
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
> +               fi

Is there a scenario when the ".stripped" image isn't available ?
Wouldn't that already be an error, and so the deploy should just be an
error, versus copying the non-stripped one ?

Bruce

>                 if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
>                         ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
>                 fi
> --
> 2.31.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

