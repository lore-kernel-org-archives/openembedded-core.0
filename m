Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.40362.1585238107314266062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 08:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ubVz+Vdy;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id k29so5819673ilg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C0ymUQT+1G/ivhckmsO0HCqdiTMRWv4sh1cm3sAP3TM=;
        b=ubVz+VdyYC5bqhhexDbHNQkoho6dovx9ItoanMShN01Z+c0L/E0DBA9DbpvDj3t+aQ
         V9MeIBI+ujV4F/HL22YQIwLvmDw+m6bMZG46vVvBC9MvLocfkAA75Y97eUipOH71G+Y0
         onO4SGr9Mhd16qqJPlb0jZQqHv347v3MLP2a0CoRAumabTaJO7GQJsErYMZqd2FkJHwQ
         9G5Qdeq6Oc85BYfBGfm3U1BWI5N4Pts2Yqr0RgbGgHVCPFDGWqm/IbYRMu6IUpJllkHX
         XJHv4BamHPc7YhkIm3STY/5QcK9BU1yR+g6lDVZsrGPaerqBMtcD6XMA6dO3RiIvVQmO
         JyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0ymUQT+1G/ivhckmsO0HCqdiTMRWv4sh1cm3sAP3TM=;
        b=URZLRH657ZXj6WcCHOVFwW1SfyTRB5o8p1MCcrssvZJ1le36W2/Yk1omhfXZNEBS80
         RJZOD9nmu2JUpjh2+yLJQ0Veamah3wDPiisc8r0Yvgb0Mg+/d5rXw/yzKrZ7S0YRgybP
         dmX29wYlPXq7BoGHvNnDmp6+yo6FmYC1kUr5+EJi9TkKUKCCwqedaJNo5REnW6nRZhcS
         1XfmKOjj81dLSJ1MwxIQ2TvrB8K7H67MLNTxleBf4nwl9vWkycuJnDR1GpJx72xr/VCp
         1c+Eldk+JVK//vaMcAD/rFP6nfHC/wT9KcWtclgsfd/25EswH1q3dAl45ta23Ou8+RJG
         N6NA==
X-Gm-Message-State: ANhLgQ14nlY+Ap+tiB0sQMnqaqcYoXtJgAtq7UXW/EmO+DIsArVK+4fd
	Nl7iFb/drmX48wUAEeNLkqCeDwT+NuSrJ6Oj5qM9zxwk
X-Google-Smtp-Source: ADFU+vuKRq+MY7fMTFfab5RQ2Q3FPptOVHqosSnJbQYPzDTTRKK9Aj5gOdmlN1EH6qSg6zw1AqXdAX/t6tIUI2g0+MU=
X-Received: by 2002:a05:6e02:790:: with SMTP id q16mr2309723ils.295.1585238106620;
 Thu, 26 Mar 2020 08:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com> <20200326145614.GA26693@localhost>
In-Reply-To: <20200326145614.GA26693@localhost>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 26 Mar 2020 15:54:55 +0000
Message-ID: <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> > Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> > then disables all sysvinit handling in systemd if it isn't present.
> >
> > Consolidate sysvinit handling so that when it's disabled we exclude all
> > sysvinit features.
> >...
>
> What exactly are "sysvinit handling" and "sysvinit features"?
>
> It seems to disable systemd-sysv-generator, and this is wrong.
>

Like this it sets HAVE_SYSV_COMPAT which does disable
systemd-sysv-generator, but if sysvinit is disabled completely in the
distro, I'm missing why that's a bad thing?

Or have I misunderstood what sysvinit in DISTRO_FEATURES is meant to
mean? I'd taken in that sysvinit not present in DISTRO_FEATURES meant
that packages should install systemd units, not rely on init scripts.

-- 
Alex Kiernan
