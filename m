Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web10.1989.1592463554865784478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 23:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uxIWB9So;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id j19so4725107ilk.9
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhOCmFZRkyFHbFWK/AqdkXA0/aF06yHps17clYqbGhI=;
        b=uxIWB9SoH10YD3FwHGYwC21+5tWN1YBDiLGYqhVRQMIGgzKZ8QP8b1e+LRCksDh6Eg
         xD9VuMIooPp9B9cr6CzKK/Nk4rtiHdsUVH1lrXo6DBAsEOJHIqI4ZOP1G2E57/xyQMwm
         fQ2uJ02KIg3KDdtCL0iy5LvD4QnAXyWWEz3s3S1FCboAc+m0FNLEc7ikyOr8KfhM9xq3
         9vVVt+f22l67AmaDNNWb4V6zk0yKgE4eQGHkGxJJOIKkX40/JNkHWTyIxF3kMObxmGon
         g45GDT8Ok6zrxMbyMTp3mkUJvP/NZ7ZXACDGiZS4SUtvRCOcJ9AcLlIJsVKukCYbdtJN
         YGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhOCmFZRkyFHbFWK/AqdkXA0/aF06yHps17clYqbGhI=;
        b=WVSXvtjdN5/9iaSZHr51YmrErnunEQqinc9y1EetPeX934TJ10UZb8GfJmOvbNXtLW
         3C5M55FJXGMk3E976/ofIEbKK8dsIdx2/p63jXsRDYvUMqbOxx9JPMUVbg+dCEZkRdmv
         MTlwaaIzXDW9AEQbm+MI4qv4HVtaEggpl3M6Yaap7lj78Sb1gtBUknK/x69+G3VGPHBA
         YWB9wfus7vomYYGkshg/mNomTiajn/PzPyFVp9NNynR+4OXvaaLeZpyoB20ZJNAXQ79m
         0MKH/abS12bSuXY/HKVW2YSANcIXoXLg/TMDCS+IpxhU7jd11wMUJ73XLQQdPOhYHO+R
         vwBQ==
X-Gm-Message-State: AOAM533eGoBeElj0hr4DEqiZFBERvl542hS9jZuiCApDhRIpCPsl50Sn
	yiGS4Lv1lsmXvtWmOLqqj3ub+viFlSipyyMUazbufFxX
X-Google-Smtp-Source: ABdhPJxftA1Zag6GTNOXoRW9RwGSsrlxEOGwuhk6BhGNzhuJy8rjAkeKNyDOtTOy0aJ0PraMi8y6dgw3qS4FBwPTgGo=
X-Received: by 2002:a92:d647:: with SMTP id x7mr2775094ilp.267.1592463554183;
 Wed, 17 Jun 2020 23:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200618011427.1861691-1-changqing.li@windriver.com>
In-Reply-To: <20200618011427.1861691-1-changqing.li@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 18 Jun 2020 08:59:03 +0200
Message-ID: <CALbNGRQ4pPwYZ1NF2vFPJ_OsNY-yb4bXb_Ey8a22rT5Os2hq5w@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] mime.bbclass: fix post install scriptlet error
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 3:16 AM Changqing Li <changqing.li@windriver.com> wrote:
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
>  meta/classes/mime.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> index c9072adf3b..728fba1d94 100644
> --- a/meta/classes/mime.bbclass
> +++ b/meta/classes/mime.bbclass
> @@ -24,7 +24,13 @@ if [ "x$D" != "x" ]; then
>                 mimedir=${MIMEDIR}
>  else
>         echo "Updating MIME database... this may take a while."
> -       update-mime-database $D${MIMEDIR}
> +       if [ ! -d $D${MIMEDIR}/packages ]; then
> +               mkdir $D${MIMEDIR}/packages
^ Add '-p' otherwise an error is created for path already existing
> +               update-mime-database $D${MIMEDIR}
> +               rmdir $D${MIMEDIR}/packages
^ Similar: add '--ignore-fail-on-non-empty' otherwise all 'non-last'
is going to create an error
> +       else
> +               update-mime-database $D${MIMEDIR}
> +       fi
>  fi
>  }
>
And maybe a short comment would be helpful to understand why the
mkdir/rmdir-dance is done (otherwise somebody else could be tempted to
remove it later :)

Andreas
