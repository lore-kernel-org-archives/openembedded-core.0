Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E233C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.202.1649865755656821108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5oC2UH4R;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id v4so2951810edl.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHt6lbyb3EemGaUQyPqpFLken9wj1IUNtQbPJQ/epDo=;
        b=5oC2UH4R4Z3+xZzI6fn/BeMuGAH0LovyieQbN4KR+XK+paI/hd5kadBDBZ63IIiuSP
         ldBTD7wwik3ApKhcIjsadx4w3StsX4DWyoDYDgi4/TNi34BjFhXof2N5JRras01QT1o7
         jao3prYYEU0MjsqZrMW0oQPmT1lCdn50aRKcwBB6M18xMsNleUNa+JpZFYoMOUQVsswS
         c6XrKiRsosFtL9F1+rCdHToGfhxk/7cC4RAgpcE8ixOhyv7+h4GScMJlXitAt3sXOIak
         ulULESRnGCin21i02EGu6C/y+meAEE7hJUGYJ/BdkORmNdxzWx2vL3TcQ4eimtA1NtBV
         7NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHt6lbyb3EemGaUQyPqpFLken9wj1IUNtQbPJQ/epDo=;
        b=A1Y2Y/igIPAHX2UmI9/3xtSZNyEUEaF4noD9tW1EJ/ZKqoscrfLCrt2ZX9Q6SswJ/e
         0IoL7L11cAHbhSYcyE/yrn5wJvztsX4Ox+N2I4OfiK4JaZnnw3rkMxAOyShy2crxFjAL
         +rbm2Agc0XVck0QV8umlUpG9/JkORE0GmyuOUhJFVJTVCyFFB2GtHg+T/3kwPgtCvOkt
         7bxCuKLED9YUWCOB1ize6a08DIbpI0ZTODEnpLMsapWgWB7+6o98lmxpdnkvp1n/qZKy
         jzJK60GOlP/nptDlv1QjOcOSJADV67v70NIxFAt01cPOTF2N+rlF833nlWS66rYMzKXc
         XrtQ==
X-Gm-Message-State: AOAM533YtkjbxxNM/uW2Yl+T7EThndyKpluuGqIYyFMQCUOGyBUQG7A1
	641G5n4dQaq4Fx8apxXcG4KMytgZBsjIh02cV5CNlA==
X-Google-Smtp-Source: 
 ABdhPJzGwhOJLHKrfyUYkRS3GC9dy8j5yvUtv0j8By6yL75c5TmLGm/Lp9aO3iZ2sK6CWco/0VsL8CudDiOuKnPCm14=
X-Received: by 2002:a05:6402:1a44:b0:41d:8969:e4c9 with SMTP id
 bf4-20020a0564021a4400b0041d8969e4c9mr11776185edb.299.1649865753746; Wed, 13
 Apr 2022 09:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
In-Reply-To: <16E57E79FD292EFA.13992@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 06:02:22 -1000
Message-ID: 
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: steve@sakoman.com
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
 Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164339

On Wed, Apr 13, 2022 at 5:31 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Tue, Apr 12, 2022 at 3:21 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> >
> > On Tue, Apr 12, 2022 at 5:49 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > > I added a debug option to the failing command and did another autobuilder run.
> > >
> > > You can see the output here:
> > >
> > > https://errors.yoctoproject.org/Errors/Details/654608/
> >
> > Okay, same error, "Hash Sum mismatch". And if I squint between all the
> > URL-encoding, I can see the md5/sha1/sha256/sha512sum values.
> >
> > The "apt update" command is doing the following:
> > - fetch the file called "Release"
> > - fetch the file called "Packages.gz" --> error occurs here
> >
> > Looking inside the Release file, it is plain text, and contains the
> > md5/sha1/sha256/sha512 sums of both Packages and Packages.gz (and also
> > the first two lines of Release).
> >
> > Manually checking each of those sums reveals an inconsistency: all the
> > sha256 values inside Release are incorrect, while all the other
> > md1/sha1/sha512 values are correct.
> >
> > And when we look at the URL-encoded debug info... the sha256 value is
> > the correct one for Packages.gz (as computed manually). However it
> > does not match the (incorrect) value within the Release file. Thus it
> > seems apt-get is justified when it complains about "Hash Sum
> > mismatch".
> >
> > Going back to my Ubuntu system, and looking at the generated Release
> > file... all the checksums are correct, including the sha256sum.
> >
> > So I am now looking into how Release file gets generated... as the
> > problem appears to be there... and it happens on Fedora but not
> > Ubuntu.
>
> As far as I can tell it is done here:
>
> https://git.yoctoproject.org/poky/tree/meta/lib/oe/package_manager.py?h=dunfell#n301
>
> > One additional point to add: on the same Fedora 35 system, I did a
> > full rebuild *without* with xz/gzip CVE fixes, and the apt failure
> > still occurs. To be certain, I nuked cache, sstate-cache and tmp (so
> > basically the entire build directory) and the rebuild took several
> > hours.
>
> Now that is really strange!  In my experience it has only appeared
> after adding the zlib or xz CVE fix patches.
>
> I just started two runs on the autobuilder, with the zlib patch as the
> only difference.  Both on Fedora 35.

Both runs completed and I'm still seeing success without the zlib patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5069

and failure with the patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5070

Steve

