Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.2647.1592466633126853294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 00:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WgR8PvX9;
 spf=pass (domain: konsulko.com, ip: 209.85.167.193, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f193.google.com with SMTP id a21so4252082oic.8
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zg3IhbYTvOCFfzCNo56+eNneXDD/uDUx0eSSsrtCcZw=;
        b=WgR8PvX99OwmMJqL77S0RInVeijp7PuK4C+p7FPRtsh8YYvPrj5oUYfyEKuR0MWB/I
         zswvWS+7kh0p/dVGPE7LQJJAN5pG1VETqZl1FbOxmdNp3TylRUXI+VOW9SMJot2HVTuT
         CBrw3/OydBTe4kUHcX3KK6DuppLJ0xdefVsUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zg3IhbYTvOCFfzCNo56+eNneXDD/uDUx0eSSsrtCcZw=;
        b=U8xbo0I9SlNzzv5K2g8v0m+K3I81aMef5hPZPoHV5qKJWeqbFU29i3qYlRmmfROXZ0
         IyNSc26Azj924mVx51aeSFWxY05XFp9zgwJk0NJLjXwAgrQW9LOzlBgA21lWzZ+zsOo9
         eIGpOAdh1a4rZU0Ha0Cl5a5Z8HAnowwZHU9SUROg+/J9SrAEoJfFwVZwWX1B2KiY0Sde
         eujkCngtISNBLVTnIi2PZA90FAV9AdlZpkYY5BjiqVjocSH8ywYMVo2On9of0B75kOwk
         7Mo+jPNHb0gB3Ecq2CteXG4UGnSeJGshhZWANgM1Y+RFvtVRITkOaTulXj1rr2cub3vm
         sLaw==
X-Gm-Message-State: AOAM5314PYaRmn+VTEhNRjmnpvsSTan+kF/gKBr6h9JAJ5bPbJ6NV0PS
	zXGVeauaVIsMQ6dTja48J2FeWx9L7nKYQDzPKe8S5w==
X-Google-Smtp-Source: ABdhPJwB9FDpGG9oMvLAbXKpUwZzEk3YybR9QXgkilxrO1KRtsgCLYcjsb08g9n4s1dGYyo8KcKTMFmuobGwP1NJkUY=
X-Received: by 2002:a05:6808:a97:: with SMTP id q23mr1842441oij.6.1592466632399;
 Thu, 18 Jun 2020 00:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200617204739.22441-1-awais_belal@mentor.com>
In-Reply-To: <20200617204739.22441-1-awais_belal@mentor.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 18 Jun 2020 08:50:21 +0100
Message-ID: <CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for environment-setup beforehand
To: Awais Belal <Awais_Belal@mentor.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2020 at 21:48, Awais Belal <Awais_Belal@mentor.com> wrote:
>
> The script runs a 'cat' on the script and if it isn't present in the
> sdk the cat command waits on the std input and hence the installation
> process simply sits there.

That sort of error would typically be caused by the variable being
unset rather than the variable being set to the path of a nonexistent
file. I don't know much about the context this script runs in though
so I may be missing something obvious.

>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/files/toolchain-shar-relocate.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index e3c10018ef..02a05664c6 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -3,6 +3,12 @@ if ! xargs --version > /dev/null 2>&1; then
>         exit 1
>  fi
>
> +# check if we have a valid env-setup script
> +if [ ! -f "$env_setup_script" ]; then
> +       echo "Main environment-setup file not found. Abort!"
> +       exit 1
> +fi
> +
>  # fix dynamic loader paths in all ELF SDK binaries
>  native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
>  dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
> --
> 2.17.1



-- 
Paul Barker
Konsulko Group
