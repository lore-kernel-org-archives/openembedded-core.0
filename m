Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.22849.1600263934364298674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=XOapyWRo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.68, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f68.google.com with SMTP id z25so8256906iol.10
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ujBlPHK5r3457HNHyQ2PMir30pLO8ve36JMuGy0NKUA=;
        b=XOapyWRoUVgt2rLb9p79ekLFpL+vSsFyrYrKwxVTll2OzV6ewmnnZrZ+Eb6UQNojq8
         9j1sYKKa0WImi7WdsoEaSLlRU5pyO78QkQ49gKr8/PcpOzUI/jS/vJr1g0irUx1p0Uzw
         dSEOneGcGcziN0qvNzYrnN2PZlyAGbSliWzCoP+cLrj4PcWm5i/XTPlQvAMerRUhIOpw
         HOAWBI1E1YYdT6zaBu/W+g7+pO/uKdLn/MJGKnofbT2H0rivCIy58vgUsMDR7Yz95oad
         8EkdE5cOCmkyrcatMQ1ovhvoK0fj0Q+pdMkaxGSZAEQCgZ/MDxxe2ALnRna+03UQLevi
         7q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ujBlPHK5r3457HNHyQ2PMir30pLO8ve36JMuGy0NKUA=;
        b=rqFG5Z8X2JnfFQNknuY09b1Uuqt76b7Kv2rTqJS4YejSJ87xQZ7rNPNof1GRHwStqV
         iexgMAvDpICgYKm3GN5Dq4z+KwWK5bZOWQj1bfTb1ujH7k+RBWbnfe5Ogihh2IjSXBFa
         NEM9vhHsRnz0ucaCqZ/3+stSVQMfyx0i0PuuXPGvuG4HLzZZXwM6my59PjoCQRj8ngVc
         Tmcv+lsLvLy7lq9S9ejnMBT2q2ivzs93i5v2D5B8f/Z+KlGHD4JoSlFmHVfURF9VrEKP
         hEj0C32Q6tyUg+KYEpYqDPb0WnI3idTR6bwbTWwS0uFMFVjGnVOEYGz45XhVY8F0rG1F
         Ab9g==
X-Gm-Message-State: AOAM530OKT/sNr3wiWpBm38xPI0jMVVdX4dazPzuRag1ERhD2ohdL1Ti
	36V7UB0+s6Y3VX5hISo6bRgCFUC3WkSRuV7dh72b7A==
X-Google-Smtp-Source: ABdhPJwSfqteTDauGH820WG2mKx79cY5FSIcHNODYIpFtVHiIeRFFwlKnQKZivwF5vdumLlIXwzbswMBxIiJdixLc0w=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr19805222iom.3.1600263933651;
 Wed, 16 Sep 2020 06:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200914151359.11240-1-jon.mason@arm.com> <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
In-Reply-To: <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 16 Sep 2020 09:45:22 -0400
Message-ID: <CAPoiz9yVTQAH2WJbVdbfED6r1EWKfaAnfRjSLbrcCzJL7og92Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2020 at 9:26 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-09-14 at 11:13 -0400, Jon Mason wrote:
> > There is a large number of Arm Tune files located in
> > meta/conf/machine/include/, and to support the current and upcoming Arm
> > cores, more are needed.  Adding more files is simply going to make it
> > harder to find the relevant ones for an OE/YP developer/user.  Also,
> > there are problems with stale and erroneous configs (see my previous
> > series), which will only be exacerbated by having more files.
> >
> > I am proposing a reorganization of the existing tune files by including
> > them in the generic family include file.  For example, the
> > tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> > tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
> > the number of files from 12 to 2 for ARMv8a, and that is excluding the
> > 13 I am adding in this series that would otherwise be unique files.
> >
> > To use, simply add
> > ...
> > DEFAULTTUNE ?= "neoversen1"
> > require conf/machine/include/arm/arch-armv8-2a.inc
> > ...
> >
> > Which is arguably what should be done anyway (instead of taking the
> > default of the tune include file).
> > See the qemuarm64 patch in the series for a working example.
> >
> > Of course, by removing the existing tune files, current users are going
> > to break.  A simple script can be written to use sed (or similar) to
> > replace the relevant parts for those users that would be affected (at
> > least for those that are in the layer index and update regularly).
>
> I've just looked at this in a bit more details and I'm worried.
>
> The intent is the BSP includes the processor/core tune file that its
> based upon. The BSP should usually know which one is present.
>
> That tune then presents the possible options which the BSPs selects
> from but the end user or distro can override.
>
> With this change, you get all tunes and you don't know which are
> compatible with a given core/processor. I'm not sure that is an
> improvement.

Before you were selecting an A75 inc file (for example), now you are
specifying an ARMv8.2 inc file and saying it is an A75 from the
available list.  Either way, you needed to know which core you were
running.

In addition to this, you have the ability to run the generic default
for the family, which will work for all of them.  And for ARMv8, even
the more generic armv8 will work for all of them.  So, there isn't an
incompatibility problem.

> I appreciate not wanting "lots of files" but we need to consider the
> usability too.
>
> As others have mentioned, the errors are fairly obvious with diff
> between the files (or a GUI like meld).
>
> What are the advantages this brings other than fewer files? Am I
> missing something?

This is the main benefit of it, TBH.  If I add 25 more arm tunes, it's
going to get ugly.  And if Arm keeps adding cores at this same pace
every year, it's going to get even uglier.  However, I'm fine to send
out those patches if it only bothers me to have so many files.

Thanks,
Jon

>
> Cheers,
>
> Richard
>
>
>
