Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.21812.1596969312158121087
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 03:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EmoFRo2S;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id l17so6106463iok.7
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RyKOOJRu/SPkfkx3vzrmL8xy0HWpJwoat178GolcGag=;
        b=EmoFRo2SfdQVIZzCXyq+TUouOQlNHBkAqUkVksKyD6BCfF6eq8/R72IBV7Rid3H45S
         w4q9U3BvCROx6PzWprSx50LEgn+gSMm1H9UkXkoqeLPoUDpDp+zSIlt9RtGgmkBZzBnn
         rYJwnlc6i7SYE7zw7dUnoGkeO9+o30v2Jvlx/0+BEQdJBNfqZL5u2OPcXmvnO/ALtZ8J
         NfSqjtXF9oUxalo9/ABfiaoKEr6PayY0eb1bTXHJVL8MauewVd8Cu/KHPCr1jJReQg20
         aSZFIoyeWWRW0xi9VyO4/Zu3BeT/NKnOGJz0dE3Uc4bCeXAkdoE1mVNI4qoKuSpr/iB+
         MCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RyKOOJRu/SPkfkx3vzrmL8xy0HWpJwoat178GolcGag=;
        b=dTlmltSCPKruqjIJmqtR/How7XLjFrZ5zE15t0FQnetDqLDyG0IiwIP5adRdodXY4r
         0zOdQ9iOe3EnA6bh8ldLiRY7f5G+HqXyhetBxts/4nYZ68b+JmRgPPsXFrQcAolsI2W6
         DMZhCCQRY2QBMWyZx15BazxsjRqznwub8uwK82Y066LXbe1y2flknt94Lm502cjf9eKZ
         ppmpUGJ25BXfjD395FLGbegF48UDT5fnV8VVvx0Tlx9MNeie09SmyWL8g/+7uFwvbU/a
         pQdZvCWmXuqp9yYaONkQnlihgqLMEXTpUaQFaG8nKm/Vab5877xxZLp0cLbCyGj5JQJt
         4Iig==
X-Gm-Message-State: AOAM533eVbqETk+hV4PdqJhGlIVI/UM5WKB/ORt0brBIBOS8RpgO9mar
	3KSOknqrrAQO78+pUY6+2QeqN7WJEwWsz1Glp2w=
X-Google-Smtp-Source: ABdhPJxDZJQjR32zlS4/p9OCMUk5pU9JA/XTH3XpAWT3mbFVeBy10Y/zx4LS1LzkuGhlD7CjnEWziNY+dAvkKnFzCfA=
X-Received: by 2002:a6b:ba06:: with SMTP id k6mr12882405iof.101.1596969311609;
 Sun, 09 Aug 2020 03:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200807164249.32605-1-alex.kiernan@gmail.com> <CAMKF1spoj_R_-=CvzV6OE==jpEb0SiGj6FXPi17LoNZjivCOWA@mail.gmail.com>
In-Reply-To: <CAMKF1spoj_R_-=CvzV6OE==jpEb0SiGj6FXPi17LoNZjivCOWA@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Sun, 9 Aug 2020 11:35:00 +0100
Message-ID: <CAO5Uq5Q3g+Tm16EH7SqTqr9_S8DJubxqyZhJ0DAT1x1TeRdUjg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] systemd: upgrade v245.6 -> v246
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 9, 2020 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Alex
>
> I am seeing a packaging failure for iwd
>
> http://errors.yoctoproject.org/Errors/Details/459665/
>
>  which seems to originate from this patch
> iwd configure detects path to systemd modules load directory if
> --with-systemd-modloaddir is not specified using pkgconfing to enquire
> modulesloaddir variable from systemd.pc
> and the value for this has changed in latest systemd via this patch
>
> https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b
>
> as a result now
>
> modules_load_dir=${rootprefix}/lib/modules-load.d
> modulesloaddir=${modules_load_dir}
>
> but rootprefix is empty in OE version of systemd.pc i systemd < 246  had
>
> modulesloaddir=${prefix}/lib/modules-load.d
>
> and prefix=/usr
>
> I could have easily fixed it in iwd by adding the additional configure
> option but it seems that systemd recipe should rather be fixed to use
> proper value for ROOTPREFIX
>

Presumably this is building with usrmerge?

> Can you take care of this via a followup to systemd in oe-core ?
>

Will do.


-- 
Alex Kiernan
