Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.1930.1585246144087284673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D4Hq/Hck;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id x16so6259751ilp.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vwbz0EIpuiUbxOZkKhEuGef7D6W0t/Hs6vjLIy1b4gI=;
        b=D4Hq/HckNinRMCD0Vs5tr9bDgiOzU5wnOwJEffUiBvgZudfEiNS/2ZwlAB3Te6T3lI
         taJiVbQmKWT30TEmw1yEjV5d5GPbgSCqXc2YVLdeEmKhlM2ROaXZC4rahcM8s5+HXMSN
         h+A8MY19MthOw7mpNcRtKKtUOwHFStcuLvUAxsKZTvk6bQQ3fxiOB6BvmNHG6jhagt17
         ng2fHW3Ejjio73iBNTYf1XXVvXk77sm+D+i+A+Ax1fkx4A242Z1oUxXrylnWQVJR8V0K
         k2k5cADH36fXEYubvKdneMhC9rTGGvFwdwObpG9NiZAr9MySDybV38JjpBIsuQtahUoZ
         zy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vwbz0EIpuiUbxOZkKhEuGef7D6W0t/Hs6vjLIy1b4gI=;
        b=D9Ex/Vv8CbrXxziIduGndnGGUW00HXpGHCKgpj9F/QYJNQGg0BGpd3TdxftSwGRPWE
         KHy5MpyiyBtlCi4Vp3PiYuHsULu4vZLFIuHKd1to94UHpKTp0aoBDyrpPGiNYgfQjtxu
         goy4T8Yq7CP33N+k0UUA6cprrEA/5bycSuLbDFKDZqu4FRAqlGXoMOu1wnjEKtv7B7Y6
         Z1QHDW2lVvVh+LXSkldFSW3S2bzaG4yMpipgYO0Um1akKfa3L3xCrVcla1MdTsnt3ja1
         MkRvJI2hFKTDZYBMcGQIanZmyZyvEgQO4WJN4VLW1zEPYEldeGJH6VTypXSgUu0OeQjg
         OdSw==
X-Gm-Message-State: ANhLgQ1iV665pScZy2vxFkqH2o/YbfjMNe4draq459gssYxpvXxlrynR
	HXrGXpvVzv5sm8E0BPaZbYaZOAl5YAyp8tu8rD616cgA
X-Google-Smtp-Source: ADFU+vt0FgubdLsq7MgDyykx5tu2bhneXFLD/NhKg+CmFd0AeroRVpKczJfWHL2SXttXuxODf+9JlobqyUEjKU+F/UA=
X-Received: by 2002:a92:ce06:: with SMTP id b6mr10749504ilo.102.1585246143425;
 Thu, 26 Mar 2020 11:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com> <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com> <20200326173258.GA31846@localhost>
In-Reply-To: <20200326173258.GA31846@localhost>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 26 Mar 2020 18:08:52 +0000
Message-ID: <CAO5Uq5R-zAdk06WRwKY3e_4ycNCHcy7oNGbWf8DOfLTY-SHLSw@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 5:33 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 26, 2020 at 03:54:55PM +0000, Alex Kiernan wrote:
> > On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> > > > Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> > > > then disables all sysvinit handling in systemd if it isn't present.
> > > >
> > > > Consolidate sysvinit handling so that when it's disabled we exclude all
> > > > sysvinit features.
> > > >...
> > >
> > > What exactly are "sysvinit handling" and "sysvinit features"?
> > >
> > > It seems to disable systemd-sysv-generator, and this is wrong.
> >
> > Like this it sets HAVE_SYSV_COMPAT which does disable
> > systemd-sysv-generator, but if sysvinit is disabled completely in the
> > distro, I'm missing why that's a bad thing?
> >
> > Or have I misunderstood what sysvinit in DISTRO_FEATURES is meant to
> > mean?
>
> sysvinit in DISTRO_FEATURES means that sysvinit is supported as init system.
>
> > I'd taken in that sysvinit not present in DISTRO_FEATURES meant
> > that packages should install systemd units, not rely on init scripts.
>
> Packages that do provide both are not the relevant ones.
>
> For packages that can provide both, if the init script gets installed
> it is ignored by systemd when there is also a systemd unit.
>
> systemd-sysv-generator provides support for packages that do not
> (yet) provide a systemd unit, only an init script.
>
> Disabling this could save a few bytes on a small system when no
> installed package needs it, but this is not in any way related
> to sysvinit in DISTRO_FEATURES.
>

That's the piece of context I'm missing then... so whilst adding
sysvinit as a PACKAGECONFIG is valid, it shouldn't be linked to
DISTRO_FEATURES?

-- 
Alex Kiernan
