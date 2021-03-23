Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.9766.1616509822778491600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 07:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZzoRi7aw;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ce10so27436573ejb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wpy6U67Vb/0ecuq53v3SkNdMWRdBfPpFHQDnLIcZc7M=;
        b=ZzoRi7awQYucCZ25kFxAeiMY5LpyIF2DBV4bVAstUdyrlKfrEB3YTYU+Wtpd6Y07Xh
         jngsR+XGY8Z+/r/NL4hb4RjSqRKa5knppHefI7jWNN4MlMTT6lq33nB/2wCEB1tsIBiR
         0viWj9kyQ09OOA/mOKsgc8tj1Ei11mCvAjYIntXArnoyhpDQgJcppIVOsCSk2L0gWFEn
         t1EoTA24mhUW1+TvWVZYZanMWotmPkk61hIFKz6PZeLME+atshBkXm5Y4iKinf3YyNVw
         qzJJALJkvst+CZ1P2d/AVIMT1cARSe1t/Nhwf8Iwu0z6+IgaHRpqwuxhRC+HJfZ3Mb83
         cGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wpy6U67Vb/0ecuq53v3SkNdMWRdBfPpFHQDnLIcZc7M=;
        b=OnF4xkODsPYUeeb5NcMkLeo+QQRiTvutIYWIO90nG2ImnC8S+xeKyGByObwvLofekL
         kYT6+GUGfh84FVQT6+j+rdxrQzzfdszM9F8Egb6UTx2qZ259MVdRRag2zOhzhxmlBcHx
         oCbZqH5FgYak6Pd46nJDXTCPKfnITplx93TCK4Irxbmdwg2vPb1lGpNh2ffJUWDJlAZH
         rTiqOBu6Ggs3NthJ/bbljqFzgjabGLLos2Jeg23jJ+4X9TanYXEmAH39tW2aa3KtAjT5
         ImA5bJo/IY3j083t2aic5ArjZg154VgHKFYpZUL5Ix0tvq8MLaSx9zcHarmcdLjNk/DH
         jq6A==
X-Gm-Message-State: AOAM531TrVZtg3BMF4zC8FSTWD4VszoB5fI2dycoc9lj17KQoVnb1NiP
	dy67k7MW3Uvzjeg4awHPfUo61kuF6c+LYO4kLr8=
X-Google-Smtp-Source: ABdhPJx63cX/wUXVeSZGBmW9TiLlKqT+VEnWUbzvmQiuAW1Jz3yvo5Vz7cdUq56E/9W4QTTEQlkvn+wiyo2ZrfzWv4A=
X-Received: by 2002:a17:906:75a:: with SMTP id z26mr5194409ejb.22.1616509821223;
 Tue, 23 Mar 2021 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210323142503.11688-1-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20210323142503.11688-1-tomasz.dziendzielski@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 23 Mar 2021 10:30:09 -0400
Message-ID: <CADkTA4Og-dpJRM8FPQDEUqK2M_vE0W=hCnuNQS1p2Edyqo-A-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: stop converting remote branches to local branches
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Wladislav Wiebe <wladislav.kw@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 10:22 AM Tomasz Dziendzielski
<tomasz.dziendzielski@gmail.com> wrote:
>
> From: Wladislav Wiebe <wladislav.kw@gmail.com>
>
> Introduced poky upstream commit:
> 14df6d53b6 linux-yocto: improve checkout error handling and reporting
>
> Converts all remote branches to local branches.
> Our Linux repo has ~4500 remote branches:
> git branch -a | grep remotes |wc -l  -> 4575
>
> This costs our best workstations ~20 minutes to simply do that conversion
> in do_kernel_checkout which is not needed (at least I do not see any
> benefit after testing with this patch).
>

Unfortunately, this is needed for some workflows on top of linux-yocto.

So this can't go in as-is.

Why you have 4500 remotes is another question of course ;)

We could introduce a variable that when enabled makes the functionality
optional, and would fix your use case.

Bruce

> Signed-off-by: Wladislav Wiebe <wladislav.kw@gmail.com>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 35587dd564..e3bc9938ff 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -363,15 +363,6 @@ do_kernel_checkout() {
>                 git clean -d -f
>         fi
>
> -       # convert any remote branches to local tracking ones
> -       for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
> -               b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
> -               git show-ref --quiet --verify -- "refs/heads/$b"
> -               if [ $? -ne 0 ]; then
> -                       git branch $b $i > /dev/null
> -               fi
> -       done
> -
>         # Create a working tree copy of the kernel by checking out a branch
>         machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>
> --
> 2.31.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
