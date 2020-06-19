Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.3297.1592560414872225130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 02:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eoxzdF4W;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id q8so10560447iow.7
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpV20r8HxHehmOc4rpuP8QdgORe5OkMMrFYeNsE3e+c=;
        b=eoxzdF4WybqDbj/rGwVzGWz2/AC+oyz/8uXNsotw5aOM0l0Iq+Gbf+agQ0kqeKPexh
         uI2hIeIa5G+pdrwEolxLJhiYRR6zmlodiOlEBzz4/3h5VEYnnsX0NvAAxzkInZ5h6Py4
         odnU9cBLg7aEKoL5mYN1HuPmRh9PoIkreicDiKWxFCu7lHevkUJK2fc4l6GcYTzhnYjt
         Xx/aFOHdD9g+P5/Z4+KAr6iD1k3or/WQ+yxb5OpvUh686RGDZ/eiSZVNhm2ep1+bGmr3
         zmhl8YJh+heaiUgOpAKxIEsTv64S+YgEw1sAwwHO1rMQQZSGu81a1XRLs9WowcRzzQ+V
         Z40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpV20r8HxHehmOc4rpuP8QdgORe5OkMMrFYeNsE3e+c=;
        b=SYvMTiyK9fCESPgeZEuNxvAwiKO1M/glxmDfz0EEa8yVHdIqCzkHeadg0Rfsbbanq0
         mK2kYRR4z9sR2E17yY77OudiiYi8YO+cQN56/2V1SZQS0WtwYxTEOkNuNw5ulgu6+uvs
         RyS658baGtH7v2XT9pbjoCOvTBubqvya/4JMS7OJVmxhdwIJLBKXy2LXG6x0L5ShY7HG
         yXhnBr/ZjQgua1g728khQwMoYWMSgamCpiGQda/DvbmV2pfMB7sv84FGvVSc8p6XCDJm
         JH/ffg++TOdJRbpyZ1MOmSY4seCKFou7Ag8yb5ZoLmXrnx3u7cnS2fYKmom81msl0zi/
         voZg==
X-Gm-Message-State: AOAM533NTT7SigxDQqWcEYAnhaKRBdTIoCKRFxXv8hChIcEqQy6czUg1
	bolK4Qs4u8TYOjj+oeqIGAKrfILI93XN19BHKWk=
X-Google-Smtp-Source: ABdhPJx+hYaZr+zCreRdSwVkejXFs61mMVS6siJMoCSSSIbIMLZdPder2FWhZiA74WiG9I6F9mt5gwPrkdtF8pLeyA8=
X-Received: by 2002:a6b:5a07:: with SMTP id o7mr3385363iob.67.1592560414219;
 Fri, 19 Jun 2020 02:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200619091112.3696178-1-changqing.li@windriver.com>
In-Reply-To: <20200619091112.3696178-1-changqing.li@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 19 Jun 2020 11:53:23 +0200
Message-ID: <CALbNGRSXHuzcqJcyXXhU9akcwq=1UFaVXeBm=PpXOqU+_asiqw@mail.gmail.com>
Subject: Re: [OE-core] [V3][PATCH] mime.bbclass: fix post install scriptlet error
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 19, 2020 at 11:13 AM Changqing Li
<changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix error during post uninstall:
> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
> + '[' 0 = 0 ']'
> + set -e
> + '[' x '!=' x ']'
> + echo 'Updating MIME database... this may take a while.'
> Updating MIME database... this may take a while.
> + update-mime-database /usr/share/mime
> Directory '/usr/share/mime/packages' does not exist!
> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
> warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1
>
> when run post uninstall scriptlet, /usr/share/mime/packages has been
> removed during unintall, while update-mime-database will check xml under
> /usr/share/mime/packages.
>
> workaround by create this dir before update, then remove it
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes/mime.bbclass | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> index c9072adf3b..bb99bc35cb 100644
> --- a/meta/classes/mime.bbclass
> +++ b/meta/classes/mime.bbclass
> @@ -24,7 +24,18 @@ if [ "x$D" != "x" ]; then
>                 mimedir=${MIMEDIR}
>  else
>         echo "Updating MIME database... this may take a while."
> -       update-mime-database $D${MIMEDIR}
> +       # $D${MIMEDIR}/packages belong to package shared-mime-info-data,
> +       # packages like libfm-mime depend on shared-mime-info-data.
> +       # after shared-mime-info-data uninstalled, $D${MIMEDIR}/packages
> +       # is removed, but update-mime-database need this dir to update
> +       # database, workaround to create one and remove it later
> +       if [ ! -d $D${MIMEDIR}/packages ]; then
> +               mkdir -p $D${MIMEDIR}/packages
> +               update-mime-database $D${MIMEDIR}
> +               rmdir --ignore-fail-on-non-empty $D${MIMEDIR}/packages
> +       else
> +               update-mime-database $D${MIMEDIR}
> +fi
>  fi
>  }
>
> --
> 2.17.1
>
Looks good to me now

Andreas
