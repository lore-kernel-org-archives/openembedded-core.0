Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.9472.1618173030292820604
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 13:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MHTk6VdY;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id i9so5135583qvo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 13:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhVgufKAGTuAVKYMvSvHxlUTnw5+qWRi9MzTbQGgYt4=;
        b=MHTk6VdYjv2lvLxR9v+lhTCTTuCwhkkrugoYWdg+ygn5lJ8jPUv9fojh+0tgF4x4BH
         Kxwv/YGmuwxfc8chuYKPsjsST/CYZkGBZY+tkP6+DPwLS1gqu804BZepQcYuK2NWhV51
         e7kK8UI1wSUPO3fbNzhDg2FHwVn6VuF7AMeT1uJbrgxHz2eLMqLh/mXwwIajT99creL4
         fwo6Zcs/DmE+aIA2ojTdxErvQ56FCZtbA6V8wPq8g2ziyLRBogyhCs/NrZFf2yAlu2YT
         qLQF7lzUUfjxdyaVPbG0iDvfpMLW55bunCCuOUchGPg8hUiGHZyP/TyOMqMPM8d07uZD
         gNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MhVgufKAGTuAVKYMvSvHxlUTnw5+qWRi9MzTbQGgYt4=;
        b=RMG+Q3fDQcL7KMkv3O4t2jQHcKqYyhm6cXSiWb367VZFAmKrnnq9Yp13F23Ry7SGAg
         C4TcSgxyc9mkLPqMfoxMD5q5LJNquyYfEDHTpuaELj7Q6iIS+VePUt/EVOXlRX7s9mXs
         LJYwmoVKWsLqTBS67yuc8+E+VJfAQEWbc0nFjfUJRoh/MRit95+ewmiidGiY5uFoHVYP
         DtlmCVwulcEryfdxBMGP5DWNLBAUOOKZnE/9mNx8Y/rG12JXjoDzV3+0TIcHWxinjZpL
         1nJp1MzJCKn6x1QUHmX0zs+WDS2Lw1a9Xq3xyuVnPC6/eejukcjEyUjiNGn8GKp316b+
         xL8w==
X-Gm-Message-State: AOAM531N9WdY4imadlK7CaNWf17uhH9GKpr8xPznhHYvN+j1dLOeNdR4
	xtDM/ariC5+WnkUA0V9aVPHx2BOXSyz071EE/i8=
X-Google-Smtp-Source: ABdhPJzuctAQ/qmeMgsxmVxiagEpoT9/ScWRN5lfQgwCWLgK7LTMrossVVYSFhTyQ0iWIalF+lDt0PV/94BSYXrb+N0=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr25299042qvb.50.1618173029401;
 Sun, 11 Apr 2021 13:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210410084015.4110978-1-raj.khem@gmail.com> <e5b63b5a5c0d8aaeee01a78ac94cf771098a6bc5.camel@linuxfoundation.org>
In-Reply-To: <e5b63b5a5c0d8aaeee01a78ac94cf771098a6bc5.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 11 Apr 2021 13:30:03 -0700
Message-ID: <CAMKF1spPHEG07B8MbNVD=+_hNKyxP-fOk6TE97KBMJdXmApE7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Upgrade to 10.3.0 bug-fix release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 11, 2021 at 5:17 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2021-04-10 at 01:40 -0700, Khem Raj wrote:
> > Drop aarch64 backports which are already upstream
> > List of bugs fixed is [1]
> >
> > [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Delete duplicate definition of BINV
>
> Seems to have triggered:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2005/steps/14/logs/stdio
>
> One is an easy fix to the maintainers entry for gcc-source, the other,
> a failure in a new selftest for sysroot posioning added by Ross,
> "oe-selftest -r buildoptions.Poisoning.test_poisoning".
>

yeah using PV in recipe maintainer entry is perhaps better which is part of v3
and selftest failure was good as I realized that I have not updated
Ross's changes
in my gcc tree, as a result the patch went to older version. that
should be fixed too

try v3 out.

> Cheers,
>
> Richard
>
