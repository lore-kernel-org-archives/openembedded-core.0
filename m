Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.2579.1585876368008944332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 18:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EKFXhcMN;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id w14so3923881vsf.7
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 18:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1rtSQafwV0gqzifw8SL2FJCdD32GOLRmXwxeadUYrUk=;
        b=EKFXhcMNyeItfcHCnHZegfk4KtejIUt09G9Ai9jpl1MXlMWlQ6P1+BcC0XsR6I7+Qj
         6N4inJNZuowkl+3uzuPS8OoSbEr3YHWVdObSsijNwMLH2FuctcP4IANR+3TIvh7wFdJH
         pjpWqTt4pEiuODC8qSVyTuThEFKI9FyODj4QREHZRA4PjOfoL9l8RENJoyTpILin+BkH
         veu7UPa0lTwGPCnDHmPFb7hfw8GFkQUTsjbqeeLmt+1wmvEdS+hC8HzmbNVknNJjfQVP
         dH0s/qxLX/P1kfwpwNURT+EtBedLgf2UYQ7RCWnjMhdsxwi4C7epqgIKOVX6uferxD5F
         TYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1rtSQafwV0gqzifw8SL2FJCdD32GOLRmXwxeadUYrUk=;
        b=etFpWOgt4cUG01uCdKrG5hMBOhVTE6pT44iBeFqfGjYo7syw1/oqSRV1zS0hOU+UNp
         A8vYMo6De0SUPN/U8ZUOAV0ZopURzcsi0+31uhWpqZff9sLQAF3cp3yG0zJXx1JcBcjr
         Jy5xiG/MZ8l5THBF6/n//sKCwHLG1kaui07gpYPKPeJJ6OqzilI4ymso2+1Sg9dYm84i
         /en8/hpfKpd2jZPavg6Svo/Owt6hSKGG2xJiNzky14jK5s8y6u8IUdK9gF6TcwQT2GAr
         741HAEdt0Uhm68+Uxu3mlnRQvQWiW8imPLcOI4nipTbThTlxiCshJSgb75lxOQJFcq+U
         U/7A==
X-Gm-Message-State: AGi0PuYjmd8dWJlgS0A/20RRT0mLa2jFvju27afYcnhRcxwPTQe4kwVY
	6qlRqGbLr+eeiTECeA0UgCi3e3rMgcgSqKPgwKk=
X-Google-Smtp-Source: APiQypKrYIh+uhKM06Qh9dKPYOXy+VLKu9nE8uhEQYRdOKqCyEyy7q3c8xM2VIKU5WFljqyhPDruuBUH7lTCz8wDGCA=
X-Received: by 2002:a67:c806:: with SMTP id u6mr5092598vsk.222.1585876367145;
 Thu, 02 Apr 2020 18:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200110172938.3060002-1-raj.khem@gmail.com> <20200110172938.3060002-2-raj.khem@gmail.com>
In-Reply-To: <20200110172938.3060002-2-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 2 Apr 2020 18:12:38 -0700
Message-ID: <CAJ86T=V2GqcCs91ruQ8pMekc+PetJMs6-Ps-UAVQ=-zejVTcxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] busybox: Update inittab
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 10, 2020 at 9:29 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Add stdin/stdout/stderr symlinks in case when not using hotplug
> Disable ctrl+alt+del, not used much
> Mount swap if defined
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/files/inittab | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-core/busybox/files/inittab
> index 2bc831c7c6..e8ec2ab68e 100644
> --- a/meta/recipes-core/busybox/files/inittab
> +++ b/meta/recipes-core/busybox/files/inittab
> @@ -8,11 +8,17 @@
>  ::sysinit:/bin/mkdir -p /dev/pts
>  ::sysinit:/bin/mount -t devpts devpts /dev/pts
>  ::sysinit:/bin/mount -a
> -
> +::sysinit:/sbin/swapon -a
> +null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
> +null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
> +null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
> +null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
> +# set hostname
> +null::sysinit:/bin/busybox hostname -F /etc/hostname

Trying to send the output of these commands to /dev/null seems to go
against the fix previously made to inittab to stop doing that?

  https://git.openembedded.org/openembedded-core/commit/?id=82de49b899bca915259ea7ea149f50e1401c2426

>  ::sysinit:/etc/init.d/rcS
>
>  # Stuff to do before rebooting
> -::ctrlaltdel:/sbin/reboot
> +#::ctrlaltdel:/sbin/reboot
>  ::shutdown:/etc/init.d/rcK
>  ::shutdown:/sbin/swapoff -a
>  ::shutdown:/bin/umount -a -r
> @@ -20,5 +26,3 @@
>  # Stuff to do when restarting the init process
>  ::restart:/sbin/init
>
> -# set hostname
> -null::sysinit:/bin/busybox hostname -F /etc/hostname
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
