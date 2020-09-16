Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.23717.1600266361239780967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 07:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=H+rM/WZS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.65, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f65.google.com with SMTP id y13so8465884iow.4
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SCBMVpJuWZjg9jtMDTa5jvfXCtzTkNwD17KTpB5DY+8=;
        b=H+rM/WZSNbbtKVIv/uKNRIYnO96V5epHHC8EA+rcHgDyz2wRp5dVrdHQrbfZ7/9thY
         svEaVn9o67TNSt24IPbEpYF45BBbJqXNIFHNLuFbgoCX4yJkel4xDzCzwynIddrWL2YM
         EWtDTPYG3WgwFQTbzxR9gEOH7e3P3JHGz3N8+ZaLJ2dNOO8hW7xg0fVNKKaA/3fsPR+E
         WkU5KG5WNLMlqzLeffBDCaqj3RjlRZYrDiqk2C6sdSGRIXVd+4vcSXM/J62/TYGu8fNz
         NG1CcehsCZ92n47Ut5f6/MPUIYIS9Psc8J9tZO4alDTXvMVLO3YNrX1zQgu/1F9t5+ou
         x0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SCBMVpJuWZjg9jtMDTa5jvfXCtzTkNwD17KTpB5DY+8=;
        b=kdccqObK0hDdCxq/cJOj6ywPxIepZfZtiGsxiyFs/Ft68FXlQ/IHcrYt+O/5n1b++7
         IIkT1C1AcmX5cZO6xhlhDjoelWtvq/2RnpGZPa/yHGMwLYtwbt9a2LFO56X2wMB4JSHn
         7c+Gx/uLKI1GdUts1Y9lwcbDD4B55RAITgZ7A7sKTPqJl0Eo0O2OVF/BW8FX9sKh+Ylf
         5f2SZDtffK0GnvlPK2GZh4OOL9k7grAVs6h50QoZLwkHGQWZV5X5ZYfNkTsPzkJ1h6Zd
         pyrxuiGHX+zdqnWBYAWxOmSFwgBYz/IKt307e6Th/sLolkJax3GEbp60zUChIZzgCWKt
         qW4w==
X-Gm-Message-State: AOAM5305pW51IbVolHiIQvDhgITbN6bot8eIaBooWYz7Uw381qVCG9L6
	0Uz9rfLFT5gEJzzYjRJc4Tmurm6xDJ8nKMib5FLwiA==
X-Google-Smtp-Source: ABdhPJxUAc17TKY3f34QWsWh29GRPPtAwZDSHZGMzmHEmQ5nIvjV7QZ4fAvSbFdlAZunaa5s4vzbOAngbBJf4SKJBgc=
X-Received: by 2002:a6b:6e0b:: with SMTP id d11mr19417074ioh.155.1600266360424;
 Wed, 16 Sep 2020 07:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200914151359.11240-1-jon.mason@arm.com> <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
 <CAPoiz9yVTQAH2WJbVdbfED6r1EWKfaAnfRjSLbrcCzJL7og92Q@mail.gmail.com> <c8e4bad572b1305b1b1a15b96643aeafe2272f6b.camel@linuxfoundation.org>
In-Reply-To: <c8e4bad572b1305b1b1a15b96643aeafe2272f6b.camel@linuxfoundation.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 16 Sep 2020 10:25:49 -0400
Message-ID: <CAPoiz9w55vmv+TPB69CFc_Js_qfBRk63EQ9q3kZ8j-xGaFmjZQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2020 at 9:49 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-09-16 at 09:45 -0400, Jon Mason wrote:
> > On Wed, Sep 16, 2020 at 9:26 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2020-09-14 at 11:13 -0400, Jon Mason wrote:
> > > > There is a large number of Arm Tune files located in
> > > > meta/conf/machine/include/, and to support the current and
> > > > upcoming Arm
> > > > cores, more are needed.  Adding more files is simply going to
> > > > make it
> > > > harder to find the relevant ones for an OE/YP
> > > > developer/user.  Also,
> > > > there are problems with stale and erroneous configs (see my
> > > > previous
> > > > series), which will only be exacerbated by having more files.
> > > >
> > > > I am proposing a reorganization of the existing tune files by
> > > > including
> > > > them in the generic family include file.  For example, the
> > > > tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> > > > tune-cortexa57.inc would be moved into arch-armv8a.inc.  This
> > > > reduces
> > > > the number of files from 12 to 2 for ARMv8a, and that is
> > > > excluding the
> > > > 13 I am adding in this series that would otherwise be unique
> > > > files.
> > > >
> > > > To use, simply add
> > > > ...
> > > > DEFAULTTUNE ?= "neoversen1"
> > > > require conf/machine/include/arm/arch-armv8-2a.inc
> > > > ...
> > > >
> > > > Which is arguably what should be done anyway (instead of taking
> > > > the
> > > > default of the tune include file).
> > > > See the qemuarm64 patch in the series for a working example.
> > > >
> > > > Of course, by removing the existing tune files, current users are
> > > > going
> > > > to break.  A simple script can be written to use sed (or similar)
> > > > to
> > > > replace the relevant parts for those users that would be affected
> > > > (at
> > > > least for those that are in the layer index and update
> > > > regularly).
> > >
> > > I've just looked at this in a bit more details and I'm worried.
> > >
> > > The intent is the BSP includes the processor/core tune file that
> > > its
> > > based upon. The BSP should usually know which one is present.
> > >
> > > That tune then presents the possible options which the BSPs selects
> > > from but the end user or distro can override.
> > >
> > > With this change, you get all tunes and you don't know which are
> > > compatible with a given core/processor. I'm not sure that is an
> > > improvement.
> >
> > Before you were selecting an A75 inc file (for example), now you are
> > specifying an ARMv8.2 inc file and saying it is an A75 from the
> > available list.  Either way, you needed to know which core you were
> > running.
> >
> > In addition to this, you have the ability to run the generic default
> > for the family, which will work for all of them.  And for ARMv8, even
> > the more generic armv8 will work for all of them.  So, there isn't an
> > incompatibility problem.
>
> You should have the ability to access the generic tune with either
> approach?
>
> > > I appreciate not wanting "lots of files" but we need to consider
> > > the
> > > usability too.
> > >
> > > As others have mentioned, the errors are fairly obvious with diff
> > > between the files (or a GUI like meld).
> > >
> > > What are the advantages this brings other than fewer files? Am I
> > > missing something?
> >
> > This is the main benefit of it, TBH.  If I add 25 more arm tunes,
> > it's going to get ugly.  And if Arm keeps adding cores at this same
> > pace every year, it's going to get even uglier.  However, I'm fine to
> > send out those patches if it only bothers me to have so many files.
>
> My worry is that the current system:
>
> a) tells BSP developers to select their processor, not an arch
> b) only shows them tunes that work on that processor
>
> So we're changing the model, but only for armv8XXX. This is going to be
> confusing. I do like only showing people things they can use too.
>
> How about we split the difference and add the new tune files into
> subdirs by architecture?

So it would look something like
meta/conf/machine/arm/armv8.0/tune-cortexa57.inc
meta/conf/machine/arm/armv8.2/tune-cortexa75.inc

And inside of those, it would reference
meta/conf/machine/include/arm/arch-armv8.inc or
meta/conf/machine/include/arm/arch-armv8-2a.inc (just as it does now).
Correct?

Assuming so, does it make sense to try and match this with all the
other CPU architectures (e.g., x86, ppc, mips, armv7, etc)?

Thanks,
Jon


> Cheers,
>
> Richard
>
