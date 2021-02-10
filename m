Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.3467.1612951031137604160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 01:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bFJ/N+Qb;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a17so2018890ljq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUjayvwG0XgWZ5kOpMEOnnCiOeVGKPkFCxMP+T4Q5Jw=;
        b=bFJ/N+QboDrOr3nQEGLPc+xmu1QQ0ziQI1JXBCJA31bcGjY+FyWTYdZ+slpUHVLht0
         NEX/oibbR97/cT3Qznbw1SSxiRvk5MJ5842+PdJiLBAIpRB/iObqW+O+0Ve3DRurbqcp
         QagUK2zEdUePHMueBvnz7VzRJ0Bj85jcIBxCY2oO75ZW2TNUy52aO4MeaIlOuYctIHgB
         5xqNstg7yI8m9FOeS1aF8PkO7mBr53sGd+QaXDylHaSFZzX6GTG7rCqwwLxOZ8J3JFtg
         CFyILZFhMv04LZDJv7fMoB9lKgSxh3r3thXPfUBUqR1yrfqxbat8E2t5xgWJj/ZJt3dZ
         UdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUjayvwG0XgWZ5kOpMEOnnCiOeVGKPkFCxMP+T4Q5Jw=;
        b=gQLTlwcZ/voOhF2p8kpnCFGdZ8/yjUEFDhJ1CRkW+XIeKwSEEEwfCMAvWeJvxCeMER
         EwEKeFHW3vj3ly8PbYmq6T4kAjj66z+g7PCIIlL79/XZAsiS2feEhtakg9LCFkte2CAh
         CKkTR8NvrIdP9xclc0271RwGCwo/PXSTnQgUDVsfXlu1kkPUx3V5YuPTsK1osO0xk3MO
         3yPpZy4TaLbtrAc2ghoP2HE8xN+Ma0CrxsFDRp4Vda273mmWwIeifeD6efBSYjbruk3v
         jhlb+wPyIRqK/6xCoB68lKW53/lHsu3lKZ9y3zBomgCHF8+0LPaPo+bJEFRziB/czrrV
         v4oA==
X-Gm-Message-State: AOAM530UkYlSABllSqn8kgKv8/wFf4jxxkLmjnaCDM1iQO5LrE0SJ2kU
	MzJSyeT668H6SCGyfSjwJFi7HU7ecEjbvu78hkM=
X-Google-Smtp-Source: ABdhPJxO92IOZQu1yq03TeF1tq/zWwUhMhqoV9/c0ujJKaJBFOZtO0BpNKwe0zX89TncILXvjpfLsunhpaj/h2tu6vQ=
X-Received: by 2002:a05:651c:102c:: with SMTP id w12mr1460989ljm.432.1612951029296;
 Wed, 10 Feb 2021 01:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20210206063138.1649019-1-raj.khem@gmail.com> <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
 <CAMKF1so+8XcjgVUjSbn3ph1ZMRQRjnLQbq4na9WNEfTT_TPwuQ@mail.gmail.com> <YCOd2Ru/zB/fZedT@korppu>
In-Reply-To: <YCOd2Ru/zB/fZedT@korppu>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 10 Feb 2021 01:56:58 -0800
Message-ID: <CAJ86T=WTgTHUMb8s+jjUPJDRCwLjr_qpoT2vU3_nUgyheHDALQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Khem Raj <raj.khem@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 12:48 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> Hi,
>
> On Tue, Feb 09, 2021 at 11:37:39PM -0800, Khem Raj wrote:
> > In this case -O  will take effect sadly. and it seems to be that
> > autconf munges the compiler cmdline
> > while generating CFLAGS in generated Makefiles and appends the value
> > of -On coming from CC
> > variable last.
> >
> > I think right solution would be to add same -O<level> as specified in
> > SELECTED_OPTIMIZATION so it remains
> > in sync always, I have sent a patch to ml. Could you test it out and
> > let me know if it works for you as well.
>
> Or let it go? A lot of recipes amend their own optimization flags and override
> distro wide optimization and other compiler flags. I once fixes all recipes
> in a project which were not obeying Os until buildhistory showed change in binary
> sizes... that was a lot of work for a PoC..

If the goal is to ensure that the optimisation flag from
FULL_OPTIMIZATION and the -D_FORTIFY_SOURCE flag from
lcl_maybe_fortify are always applied together then isn't the easiest
solution to move -D_FORTIFY_SOURCE out of lcl_maybe_fortify and into
FULL_OPTIMIZATION ?

Putting a separate optimisation flag in lcl_maybe_fortify and trying
to arrange for it not to clash with or override the one already in
FULL_OPTIMIZATION seems like an ugly solution, even if it can be made
to work.
