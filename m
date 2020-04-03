Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.2780.1585877821084889120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 18:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IslnZqeu;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id x16so5221819qts.11
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 18:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Wgm5n53T/Ki151jX4iVC0zgh+JovUGPKaRmpNtuxCE=;
        b=IslnZqeu4Uq0oHhBpSgo6jWyHrwL7tmfDgs+SlFihezfKdgCGOrmtPgV8H/+reABUU
         2urolVJMMraEICZxAwKK9sOsgiOwXybqJ2tWSL/vFhnEkvAhgf0Vb3ETKWKUe6GhrM3n
         m4Tfr5sOgE7F0jnJTTyvzcysIz6rbAJRcy/ZJhlWWUBXEDd36Jcs2kQ/mrd0wuIuFK33
         1dGlbUutKbSKkFpOv5/7qpg0ccFf5FN7+gCu/gbMNGDbQGqwNGg/9nmaQ/pyKkk8p7hT
         IWH0b+bi/ssvJdYCDuDD/UZqqeApbXdyTQcDn781IF861zfDF51fgiQtqjcpJRHSU+pM
         D6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Wgm5n53T/Ki151jX4iVC0zgh+JovUGPKaRmpNtuxCE=;
        b=rFGvUv4H+oYBNGBQXa6IyHDBI/of/NRxkSQabWEhE1skJSRzwZsWvNAu8JNU9ns7cO
         eMRbxe0GuBEKgK1zDRxPwqA/T4SvOYEhOq0teIKDoRSQkzSpz6/NulpCbldaLXHUg1Li
         2L+ra8YPyub/jF1NTrb9lyrEwRJ+yqQ+OVuePh7j+ULnAimZodJF736yK7ZK6fM1E9VJ
         p3Hb2+6gorw6r1fctx/owaNz08kjCqP9VWqkEhqLHA7ng2nVCSgLF/18UtersC/ZikRr
         uyuTNsHdmbiJMUacoDKaBdTvbnGD0HMHuvm6jot2XZUPF3HIUvUgfBk66LVwghKAxXsG
         zHXw==
X-Gm-Message-State: AGi0Pub8ajLp/e+S1TgPmLN4NahqZAyR5t8KLKdPN/B7crTjxkIyfMYB
	j9vG/4iQb3iZTwCI0JsD7WnO6aRKrmw1BlE/YEU=
X-Google-Smtp-Source: APiQypIdi/ZUd8cpkAsmLj9J5lamI1X3lp098nhrvmIualRKUZVkowXFaobCsQdTkgfQ9ceIiCCbwhbmcVGulf/dCqs=
X-Received: by 2002:ac8:3003:: with SMTP id f3mr5832827qte.293.1585877820046;
 Thu, 02 Apr 2020 18:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200110172938.3060002-1-raj.khem@gmail.com> <20200110172938.3060002-2-raj.khem@gmail.com>
 <CAJ86T=V2GqcCs91ruQ8pMekc+PetJMs6-Ps-UAVQ=-zejVTcxA@mail.gmail.com>
In-Reply-To: <CAJ86T=V2GqcCs91ruQ8pMekc+PetJMs6-Ps-UAVQ=-zejVTcxA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 2 Apr 2020 18:36:33 -0700
Message-ID: <CAMKF1sr+Fgc4kokVPBcmK2kQwdDmepX_vUP++7VDgpgfT1e-_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] busybox: Update inittab
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 2, 2020 at 6:12 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Jan 10, 2020 at 9:29 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Add stdin/stdout/stderr symlinks in case when not using hotplug
> > Disable ctrl+alt+del, not used much
> > Mount swap if defined
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/busybox/files/inittab | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-core/busybox/files/inittab
> > index 2bc831c7c6..e8ec2ab68e 100644
> > --- a/meta/recipes-core/busybox/files/inittab
> > +++ b/meta/recipes-core/busybox/files/inittab
> > @@ -8,11 +8,17 @@
> >  ::sysinit:/bin/mkdir -p /dev/pts
> >  ::sysinit:/bin/mount -t devpts devpts /dev/pts
> >  ::sysinit:/bin/mount -a
> > -
> > +::sysinit:/sbin/swapon -a
> > +null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
> > +null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
> > +null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
> > +null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
> > +# set hostname
> > +null::sysinit:/bin/busybox hostname -F /etc/hostname
>
> Trying to send the output of these commands to /dev/null seems to go
> against the fix previously made to inittab to stop doing that?
>
>   https://git.openembedded.org/openembedded-core/commit/?id=82de49b899bca915259ea7ea149f50e1401c2426
>

It was to avoid additional messages on stdout, so remove null there
should be ok if it fixes initramfs please send a patch


> >  ::sysinit:/etc/init.d/rcS
> >
> >  # Stuff to do before rebooting
> > -::ctrlaltdel:/sbin/reboot
> > +#::ctrlaltdel:/sbin/reboot
> >  ::shutdown:/etc/init.d/rcK
> >  ::shutdown:/sbin/swapoff -a
> >  ::shutdown:/bin/umount -a -r
> > @@ -20,5 +26,3 @@
> >  # Stuff to do when restarting the init process
> >  ::restart:/sbin/init
> >
> > -# set hostname
> > -null::sysinit:/bin/busybox hostname -F /etc/hostname
> > --
> > 2.24.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
