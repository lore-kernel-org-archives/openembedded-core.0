Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.2738.1615405956034012506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 11:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AbGFU9e1;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id e19so41239389ejt.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bSiQ6zPgb9bbQouvkdjJKnwjHRs9BO3frECmUYDrqJg=;
        b=AbGFU9e1AXd6OGI9Tzp2BYhS5C//eHDpnWTl8d/YsoUternN5IHf7fuU0SK41SjSSN
         JP8qqObQCA4CY56oOznD9Ok6dPA0hXEkp8l1ykuJnIWRQKSIF8p0K7EPNk2yIHcstmNy
         BriczpjASCn4JNOm2Jsvb61/2SfEuBeL7OA9upiDThhwsbJy/BHwMTGUwLZTqF00XB/C
         8NiN2GxGZujvPvUSyAbsNBW97FxaptAdEW6dPyJYOSN9r53rXezoBQVKu0aIrn39/8mE
         02yjH2LjPQRsXMWlEgmoR9lcmJ033ksTCcxzsyEsPlJRNznM3Pcvhy7QRo6zExcVziEi
         WorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bSiQ6zPgb9bbQouvkdjJKnwjHRs9BO3frECmUYDrqJg=;
        b=mOThc5QLQSAg1c4WVIRq2HgMdLiLVrwGxJhd2YSYY13ja1Jm4h7xJCSqxc1D+7YMfC
         9xadZiZ0EDsZOZlfaQ0TcQy4RD72RmRIQPb0CgmIuSTWNSE3kZOc87v4xeFXUfkn6xNq
         BlyCz4HanmN6uYS+ZD5MbhH+TH2l5f1ous3frc7sRuJWN4OVgvTjr66maNuyRwOgH8CC
         2IssKwYb8lm/RnVL06FxM8hNlqImASlkcyP1cXg7+xKPgi2L1f998xFrihsqak+EMwhy
         /oqYzmc8qYRwUaa9pJhmexegQ9GAN5KBZqs7sgnMQTpreiy4+llK2LP97O4DundKGSON
         M4sA==
X-Gm-Message-State: AOAM530Wa8Hko4mE2OsZdMwgyDr0U9DE/TLDwyFbnGQO1CeJr+XrHsuq
	mOT8l6ws2R5GeVMGMyS1PMgv9ts25PdQsNExb20=
X-Google-Smtp-Source: ABdhPJxEfUtm6Kcr4VVB+CzMYYCblVSmY/kB++Uih9w1x+k4NRNWOlXImykdI6gGKkUH9ZxrmLxsjejok4wbbHiCd4k=
X-Received: by 2002:a17:906:110d:: with SMTP id h13mr77283eja.357.1615405954468;
 Wed, 10 Mar 2021 11:52:34 -0800 (PST)
MIME-Version: 1.0
References: <BY5PR11MB40242781588BD3BB72E0FE3ED9919@BY5PR11MB4024.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB40242781588BD3BB72E0FE3ED9919@BY5PR11MB4024.namprd11.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 10 Mar 2021 14:52:23 -0500
Message-ID: <CADkTA4PzympFhYPJMuOcqunDeP2N=-e3wY=8uw0AJzkXAcCCaw@mail.gmail.com>
Subject: Re: perf: fix reproducibility issues
To: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)" <dzagorui@cisco.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 2:21 PM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC at Cisco) <dzagorui@cisco.com> wrote:
>
> Hi Bruce
>
> I've just found that were working on the same reproducibility issues for perf package. You fixed that in yocto
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-kernel/perf/perf.bb?id=dea57aa1cd879df4feae1b9595b38c5b6ff74574
> i prepared a patch to kernel that i want to send to community, maybe you have concerns about this.

The fixes in the yocto tree aren't enough for full reproducibility. If
you've also fixed the pmu-events.c issues, then that is of interest,
since they still remain.

Due to the way we build perf, we can't actually patch it for fixes, it
must be source modifications like I've done in my initial pass.
Eventually once upstream is fully reproducible, and our oldest support
kernel is newer than those versions, we'll drop the perf recipe
changes.

The right thing is to fix it in the kernel, which is what I was going
to submit after we had proven our changes, but it sounds like I won't
have to do that part :D If you have a pointer to any submitted
patches, that would be great .. since I took a look at my lkml
subscription and didn't see anything obvious.

Cheers,

Bruce

>
> Regards,
> Denys




--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
