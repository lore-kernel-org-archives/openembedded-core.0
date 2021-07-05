Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.10884.1625493162176009363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 06:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OF1rLPS5;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id l2so4374908edt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmOL1DidXjtP/XlOJFZ5/nEJm9d3x0ncT2h9ePqVhjw=;
        b=OF1rLPS5PbrNAsFvCRmsqscujyTWLrxJF5vEvCkQPJeDwvEH6EgYSI8UfvCJg1PTjK
         stGqZ4yUH6XvCwYvLGC1l1Ykm+U5Oh9BF5kP/6uLTdzfcgi0xb6FlD/GMJheJLsImE4g
         2ZhGjvxU7hQT+SUn/e2iIxgRR51O9TLtCt2crjp39YJS4gYIsPD5eOiRelFHhkDP0O/j
         zHGSaztuOLMsfBkE2FgKmH/HaPxGKdXwg1cTCgZjQUNFc6rRu0RyY+3aStbcTVJoIZZ1
         oHNaA9Ig3LdaO3fpo7+93M9IZq/6dW+1sdrFa7H3jQO+v5965Nw03ik5Eve6SdO2JnRF
         ZLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmOL1DidXjtP/XlOJFZ5/nEJm9d3x0ncT2h9ePqVhjw=;
        b=VHdYUSLcO31ypCNsfNEJnu48D8hTYrn/e958h+dJRy63TOjbQI+s50lU/eKfTxpm+r
         lJ9SclOFFOHlRnOboWOIsS38qZ1jLgR2M5rXvATggZzQtBmHVLWXX09b2cHaJi5bBt+r
         kGx6tZH4oRLMIAjd9lx2/5P/+n0lieH0CiPeD2Zpy1j20zggpUGa/idhZ24cW+lyENcu
         D94Idv8TD8uD3WlE7qWR3nr+Fh4w369ZNUKwoP+nLRtlu1m+LbWpAMQwlCzgrqMzdr2b
         bQZGrQTkzaPmOKXmjHf4IldSj2FiFh7T37fhBYoVPQjiKWPHmb2HL75pHLEv1EMqTgie
         ifYg==
X-Gm-Message-State: AOAM531ppYa+DkNitkDZ/Vzx0+IPjkoLaq59sPGRLyU2M0Ozyp8qkBHw
	yQAp3Ti2tuPL43VooJQ5sA77/Z73g2ehnlNnIe8=
X-Google-Smtp-Source: ABdhPJwZVZvjTWfim9RVlFAYpUAJ0CgI+aEtPuzFrD9ZcoxCSk80dO7s8wQLX1e1+dw5B/rd37LtZOCH/ldo8YrGl4Q=
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr16867449edu.352.1625493160524;
 Mon, 05 Jul 2021 06:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623876372.git.bruce.ashfield@gmail.com> <3b93416cddd4db742f8bd957614b11ce9b796e51.1623876372.git.bruce.ashfield@gmail.com>
In-Reply-To: <3b93416cddd4db742f8bd957614b11ce9b796e51.1623876372.git.bruce.ashfield@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 5 Jul 2021 09:52:29 -0400
Message-ID: <CADkTA4Pzsfk+1-D8daFnzmmuqa+7Rj0wDUBY1DDA7uEWzr+x3A@mail.gmail.com>
Subject: Re: [PATCH 1/6] linux-yocto-dev: base AUTOREV on specified version
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,

Could you queue this patch for cherry-picking into your next hardknott update ?

It is now in master, and I designed it to help folks out using our
-stable releases so linux-yocto-dev will stay on the version that was
available in the release timeframe.

Bruce

On Wed, Jun 16, 2021 at 4:48 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> linux-yocto-dev tracks the latest mainline kernel, and uses
> standard/* for that support.
>
> Archived -dev versions are under v<kernel version>/standard/base.
>
> This policy works, except that a released branch will still follow
> the new kernel versions, causing potential breakage with newer
> kernels than are supported in that release.
>
> Rather than lock the SRCREVs and update branches in old releases,
> we can preserve the AUTOREV nature of -dev, and allow them to
> switch automatically to the archived branch based on the LINUX_VERSION
> in the -dev recipe (which is unchanged in the release branch).
>
> This is consistent with the other branch switching done for the
> kernels and with the -dev workflow.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index ba139dd7f8..0df61cdef0 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -631,7 +631,31 @@ do_validate_branches() {
>         # if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
>         # check and we can exit early
>         if [ "${machine_srcrev}" = "AUTOINC" ]; then
> +           linux_yocto_dev='${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "1", "", d)}'
> +           if [ -n "$linux_yocto_dev" ]; then
> +               git checkout -q -f ${machine_branch}
> +               ver=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
> +               patchlevel=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
> +               sublevel=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
> +               kver="$ver.$patchlevel"
> +               bbnote "dev kernel: performing version -> branch -> SRCREV validation"
> +               bbnote "dev kernel: recipe version ${LINUX_VERSION}, src version: $kver"
> +               echo "${LINUX_VERSION}" | grep -q $kver
> +               if [ $? -ne 0 ]; then
> +                   version="$(echo ${LINUX_VERSION} | sed 's/\+.*$//g')"
> +                   versioned_branch="v$version/$machine_branch"
> +
> +                   machine_branch=$versioned_branch
> +                   force_srcrev="$(git rev-parse $machine_branch 2> /dev/null)"
> +                   if [ $? -ne 0 ]; then
> +                       bbfatal "kernel version mismatch detected, and no valid branch $machine_branch detected"
> +                   fi
> +
> +                   bbnote "dev kernel: adjusting branch to $machine_branch, srcrev to: $force_srcrev"
> +               fi
> +           else
>                 bbnote "SRCREV validation is not required for AUTOREV"
> +           fi
>         elif [ "${machine_srcrev}" = "" ]; then
>                 if [ "${SRCREV}" != "AUTOINC" ] && [ "${SRCREV}" != "INVALID" ]; then
>                        # SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
