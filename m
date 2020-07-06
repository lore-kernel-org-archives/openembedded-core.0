Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.61684.1594052998560185141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=By1DJQsn;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id rk21so43259521ejb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7O7kqcoySkWBb+dovQjQIMaQc+Giu1o8uMKJqn/t/I=;
        b=By1DJQsnHg3mj9DFGAS2wi877M0iWSxpiOYBdd+INH6DhK6a+ypbY61ucysRoCyaY3
         0L9Wm4R2wpc20rV/Yal6ymLjRFn8hSgQUE+Gl3OYC150qFYj0cd9v6Po5P8jTbSe/1wz
         00Z/lPbK8RpsSpruIQYMrbOw8xCylgrK4mBa7qh3LMb/EDESsyRYBHklZ/Y6JEdt1m+e
         5HB57EKI2BSFyWV42xmFmg2jX+W0tmO4IbhDZw9asTnsfi9XIjOGesOqhPiVAEDXcZbc
         s3nhtCqrd2rLYQuPPWjUy5BEOQTEuzl7znrxTrlbgH5DsCso37rdbOQp9BKw2++b/L4l
         1u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7O7kqcoySkWBb+dovQjQIMaQc+Giu1o8uMKJqn/t/I=;
        b=XqhIxriiYTJxnB3dhf3WcfarZRpbefoyepARO3YSJtQoT2h+Sk6eHYcfl77cM+iWFE
         rGoLOjbUmz07df7ThEIBWU3HiMj84JVqQPrw1FL8VNq7GaKy+M7lxkCAW34lRqxixbbX
         6w5gGkqMDhDPhsKA6Eno7FTBRmdnOSZLcxxoYcMsKgTfCJrSautuYQFgKSataHSx7wv9
         VTUvrUKR1UPzT6c9Ala+IrKQrMHQ6i/IDiAmhV9t+w0l4ti7EnDFRDc4KAKAAjtWYxs+
         xv4h23FMqRuu/UbXIYV2RnjlxDVpbj7UAxakyphHgziVEjqYPgBUXZ/lWnNDXERibmzZ
         PkbQ==
X-Gm-Message-State: AOAM5300RrPRfHprJ18vT5LGPjIawp3x8V9ZKwszdklqH6luZTTZCvwR
	9uVfwmKQs4kXZybqjwzA99N8HMzltsP1cxpK8gnLshXEgYE=
X-Google-Smtp-Source: ABdhPJwMFKrnmvfopL4UczKUQk64BTK7s2YzCi5yPC5HZF6yPDN0FA46vPp5wKkLD1NHaI+MxWRGNMDrgWDtj/mtaiY=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr43044824ejy.517.1594052996835;
 Mon, 06 Jul 2020 09:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
In-Reply-To: <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 6 Jul 2020 12:29:45 -0400
Message-ID: <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

We have a fixup patch for this one in test right now, so we don't want
this patch, without the follow up.

But this is useful for dunfell, since it was an unexpected behaviour
that needed to be fixed.

Cheers,

Bruce


On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> It is uncommon that a BSP definition and a defconfig are used in
> a single configuration. That being said, it is a valid way to
> organize kernel configuration meta data.
>
> When a defconfig is used, either on the src_uri or from in
> the kernel tree, it is normally expected that it is the baseline,
> with all options applied on top of it.
>
> With this commit, we detect either type of defconfig and ensure
> that it is used first, followed by the fragments in their
> previous order. This allows existing configuration stacks to
> remain the same, while ensuring that a defconfig combined stack
> works as expected.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9caedf)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 5bc627066e..41d8620e67 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -131,7 +131,7 @@ do_kernel_metadata() {
>                         else
>                                 cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
>                         fi
> -                       sccs="${WORKDIR}/defconfig"
> +                       in_tree_defconfig="${WORKDIR}/defconfig"
>                 else
>                         bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
>                 fi
> @@ -153,14 +153,24 @@ do_kernel_metadata() {
>         patches="${@" ".join(find_patches(d,''))}"
>         feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
>
> -       # a quick check to make sure we don't have duplicate defconfigs
> -       # If there's a defconfig in the SRC_URI, did we also have one from
> -       # the KBUILD_DEFCONFIG processing above ?
> -       if [ -n "$sccs" ]; then
> -           # we did have a defconfig from above. remove any that might be in the src_uri
> -           sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> +       # a quick check to make sure we don't have duplicate defconfigs If
> +       # there's a defconfig in the SRC_URI, did we also have one from the
> +       # KBUILD_DEFCONFIG processing above ?
> +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> +       # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> +       if [ -n "$in_tree_defconfig" ]; then
> +               sccs_defconfig=$in_tree_defconfig
> +               if [ -n "$src_uri_defconfig" ]; then
> +                       bbwarn "[NOTE]: defconfig was supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> +               fi
> +       else
> +               # if we didn't have an in-tree one, make our defconfig the one
> +               # from the src_uri. Note: there may not have been one from the
> +               # src_uri, so this can be an empty variable.
> +               sccs_defconfig=$src_uri_defconfig
>         fi
> -       sccs="$sccs $sccs_from_src_uri"
> +       sccs="$sccs_from_src_uri"
>
>         # check for feature directories/repos/branches that were part of the
>         # SRC_URI. If they were supplied, we convert them into include directives
> @@ -187,11 +197,10 @@ do_kernel_metadata() {
>         # expand kernel features into their full path equivalents
>         bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
>         if [ -z "$bsp_definition" ]; then
> -               echo "$sccs" | grep -q defconfig
> -               if [ $? -ne 0 ]; then
> +               if [ -z "$sccs_defconfig" ]; then
>                         bbfatal_log "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
>                 fi
> -
> +       else
>                 # if the bsp definition has "define KMETA_EXTERNAL_BSP t",
>                 # then we need to set a flag that will instruct the next
>                 # steps to use the BSP as both configuration and patches.
> @@ -206,7 +215,7 @@ do_kernel_metadata() {
>         elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
>         if [ -n "${elements}" ]; then
>                 echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
> -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
>                 if [ $? -ne 0 ]; then
>                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>                 fi
> --
> 2.17.1
>
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
