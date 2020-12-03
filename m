Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web08.2621.1606954787964802460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 16:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=j8hdYXnw;
 spf=pass (domain: nathanrossi.com, ip: 209.85.167.196, mailfrom: nathan@nathanrossi.com)
Received: by mail-oi1-f196.google.com with SMTP id t143so340821oif.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 16:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tT81plCcwqkIbv8yyQdYv5cJ2RUF/zgdswLVnLsGsDk=;
        b=j8hdYXnwbA3vYIMkqRigFYiBSqKh5hXr1yxyzhp14OGib3xbhFCP4dUEuzHFG4ztRU
         /JlY/b7JYQJ7HYhpssrza9A0bd8PW13cFFTZDqNSWWENV3S2CFeUX0pkZOHl91U2x09p
         KU5Ik026b6xXg8Gyd0bBjd8LirA8/0QAMfN6rDF2D/xS0Lf+0FuXGO/L32vW0VYNrt/M
         VojLFNSLsXtBNWcfAYSJds+Y/0C2awZBCMdsrG3SzurFL7wJ4ywOCSxPRW5873b8sXJb
         SRa4FrUoUp9zPIKE/cAfgyOJgUcsdZ4XJadlmpvPdoo0WqfCxBkzFl3tDwGdLCpb55JJ
         sV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tT81plCcwqkIbv8yyQdYv5cJ2RUF/zgdswLVnLsGsDk=;
        b=ocuxhQ2ASaHM9fD/cNmlccSpIUq5IKSsKsu++0wywVjXgKLKjcbKOEGHcTGHmN5rp5
         xv77MBPJ1gvQyzhlg0Z8zZqb5AL6iFjSmAV/n/ZCQ5ZrG5guVXGo7oQxRbGeHlczx/wY
         QGm28gZtW7upnMZYctiiXxcPIfA2lxjYzCl3Wp8GEiQ8Je63s9QE8F13ofl9y+pYaiVi
         SE/1SHK9LnVtuLg/DIZbcxcD5vEfRzrVxqA9TaKLP3rpu2UBsFVszyY6yWIl+rW3g4Hx
         tQMEqOO0pQ9Ai+Nc57a8/MHabpPGCgXhMK1fibHAe/X/9OwWRuzya2yTYbinjqzMtSJj
         VQKA==
X-Gm-Message-State: AOAM533NHM88orPVMZkpsPO36NHDvaZqNtOqGNthwmRn9NPWCXphkguY
	pXYNiHaB0B4hH1+0x2KTln1zorbsXs+qZ5DQ+K6jEQ==
X-Google-Smtp-Source: ABdhPJzl8Q4Nh4oQ21lcqwmED45VoaZ4J7dQVH9+BXI1xuzZ8gDQyO/ZCx/2Xn5V6WlHnZqMFfLqy8aRwC7kuKGb2y4=
X-Received: by 2002:aca:6106:: with SMTP id v6mr269717oib.158.1606954787310;
 Wed, 02 Dec 2020 16:19:47 -0800 (PST)
MIME-Version: 1.0
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
In-Reply-To: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Thu, 3 Dec 2020 10:19:35 +1000
Message-ID: <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
Subject: Re: commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
To: Scott Branden <scott.branden@broadcom.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Dec 2020 at 05:17, Scott Branden <scott.branden@broadcom.com> wrote:
>
> Hi Nathan,
>
> Your commit:
> "cml1.bbclass: Handle ncurses-native being available via pkg-config"
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
>
> breaks bitbake menuconfig when using the upstream kernel.

Interesting. The purpose of the commit was to actually fix that exact
use case since previously the mainline kernel menuconfig was relying
on hardcoded paths to the host ncurses libraries.

Would you be able to provide the error messages you are getting (and
anything else that can help to reproduce the failure), because I am
not able to reproduce any failures with a mainline kernel, linux-yocto
(with and without the below mention patch) or with other projects that
are using cml1 (e.g. u-boot).

>
> It only works with the linux-yocto kernel due to this workaround which is not upstream.
> If you revert this commit in linux-yocto menuconfig will not work in linux-yocto:
> "menuconfig,mconf-cfg: Allow specification of ncurses location"
> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77

This change should not be required to have menuconfig working when
pkg-config is used.

>
>
> Seems like your commit needs to be reverted or a change made to work with the upstream kernel.
> Or, the linux-yocto change needs to actually be upstreamed.  I submitted it and the upstream maintainer questioned why the change is needed:
> https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/

The problem is if it was accepted, every kernel prior to its inclusion
would need to be patched, as well as other projects (u-boot, busybox).
This makes supporting menuconfig using that change for kconfig
generically problematic. This is why the pkg-config solution is
preferable.

Regards,
Nathan
