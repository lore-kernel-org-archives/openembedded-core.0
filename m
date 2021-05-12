Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.5602.1620860715833220715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 16:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aXxysyOj;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 76so23939147qkn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yNGvGDWjAwFROU3+ryUc6NPBzcAGH8apu9ivPdeRnrE=;
        b=aXxysyOj41RIKijh4ItT4CuYZ0+lkaJ+UlKpJeJ4cHbiNCRs0jwKVzm6uRCM406w3f
         0+uMKI039aGCFMob89HYaS4vKUgFcTdXozCKqvBPunE6giZItLyUPGp9RQrnpAZIDNeA
         9McyHbmBgzbYSuTds0oe6O1BFskWPG8QuUxkY8fTBK/D3ECfWzUQuVxmfTkErHeJR2LR
         BAyQWTZ4GvQ4am7SXaGLWu9bTVUuU1sH1eYXHOL51umoJBBcPndg5cdPTOvuhYNI+VkV
         YhGVxXrbfPXuRANd0uTLXulEL/58idwrbRBvrqGFw5J2TQZUTnEl4vWfwGrvzWOtGf4N
         5ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yNGvGDWjAwFROU3+ryUc6NPBzcAGH8apu9ivPdeRnrE=;
        b=iGjkek0Dx/M0M3Q7CDu+tHZXQreSro8jJWjovCQvuisUA66y7iYEIR6M3JMQ05/lmI
         XE8VZKO6PJ4nTQMHqixHnyG6Vj8PSZc9dUCjG2e9nLu0k2Bn58GHrMiAKbLavzObIVb5
         94bYPidGHPMczMtCsQpubv9jgPKZo3G3Xb4ZFzVUWCuO39VCGsLTvfK9jyQMkFKxT2+6
         KlOozjvmmsQ6RKQVxfdqujMq5aMXJ3Aidx/IoLYa4skcrCSFAebYNFVoDwKGvp2XY9yh
         Ewsvp3XXKqWYeCGT5JjNUHxYSXBRBgXAHLgsMFqTpTr0zmb7Jc/nhlvCN5NnrZKXUKtc
         koJA==
X-Gm-Message-State: AOAM531bRxnjqY/sWTIBluRt5bKeymS1nA7CMuqzjWQRxHwp+YhDsQLj
	lvioURieSjCfyzsczAtHI4K4jtzQ2hcA0VJzCnA=
X-Google-Smtp-Source: ABdhPJx9MzHmh19buWQ02zZV2MwMdhwdz4BWmSt5KaRCkoyqXF7hn8Z0F4yjlwAfWb8dWpifO8wVAUNNukvqRXLlYWg=
X-Received: by 2002:a05:620a:24b:: with SMTP id q11mr16973382qkn.25.1620860714979;
 Wed, 12 May 2021 16:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 May 2021 16:04:49 -0700
Message-ID: <CAMKF1spC4W1sWy32C_=WwY8SwH2CHPD7YQJym-gUShy2BZaR5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] ovmf: Disable lto to aid reproducibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 12, 2021 at 2:32 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> lto tends to break reproducibility and makes ovmf near impossible to debug
> reproducibility issues in. Disable it and supress the warnings that then
> generates from Werror.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 1fe01146d6b..ef5545bf705 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -102,15 +102,22 @@ fix_toolchain_append_class-native() {
>      # to make ovmf-native reusable across distros.
>      sed -i \
>          -e 's#^\(DEFINE GCC.*DLINK.*FLAGS  *=\)#\1 -fuse-ld=bfd#' \
> +        -e 's#-flto#-fno-lto#g' \
> +        -e 's#-DUSING_LTO##g' \
>          ${S}/BaseTools/Conf/tools_def.template
>  }
>
> +# We disable lto above since the results are not reproducible and make it hard to compare
> +# binary build aretfacts to debug reproducibility problems.
> +# Surprisingly, if you disable lto, you see compiler warnings which are fatal. We therefore
> +# have to hack warnings overrides into GCC_PREFIX_MAP to allow it to build.
> +

could lto piece be turned into a packageconfig,as I think LTO usage
will only grow in coming future
some distros may prefer LTO over reproducibility for performance reasons.

>  # We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
>  # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
>  # tools definitions are built by ovmf-native so we need to pass this in
>  # at target build time when we know the right values.
>  export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
> -export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP}"
> +export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
>
>  GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
>
> --
> 2.30.2
>
>
> 
>
