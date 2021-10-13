Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39EAC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:25:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.7271.1634127951419332455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fGH37yim;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t16so9411146eds.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKTwULNxg8GMV+m7OfPWV/2SDKVR9gf1MN47jfIN6Hs=;
        b=fGH37yim7trHUruEs8V5T3vALKAT5Juj9QAtXoGbqcyCEMoPbSbppjrZRVci61oxht
         MgjU4y583ffuTQzlWCvv1a/PYZl5RAH+mT7bC9xTkxKYvxn0tJ2DcVtvoQF5f+gPAQTy
         sPjUz17uFlzWzVFrvRekpsv/5HUetZfQEAOHbCsJSSJJ5c2UBIwB/qR5ozzimCyBD/Jx
         RmULl0q9z0FERmZi2/u38Z59KNRVokrll4416KFk7wwcwIjxsBG3eHBYH76dzmw6VYb8
         lgzmZT1CL7l3HB3fqdW9G2x5db0AoD5S0pXfnfLMeGYsdjxhLVTiqqaT+gtZOye//YJU
         bpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKTwULNxg8GMV+m7OfPWV/2SDKVR9gf1MN47jfIN6Hs=;
        b=m1lWS0Fa9wDzBIjmFpElCo7cfwzWEPjDHlR21KNcfBHXNGisaDSjof7DHV5I9kisXV
         7ATyBBwGqd2m0TWTbF5i8Wl+IHx0wZoN8gMLl/yaktBfusDqZYzCPULRki5kWJqpSrOp
         0dIFIZqG46cAa/hguOlHfPBpPrrkDh4q3w/c1DPcHRwTN69+7TFlOmZRe5sHespMgIWb
         NYdE8jxgXCLSBSxk0Ma6Nsj8x+IHRw5YVhtNgkoWdBu5SKc4qCWFxkqYA715zc/qHW8z
         Ta2lWYrIcF+6Qy0zV30NOkmqSLq84nWk7LJdJj8kG4+/pyWRMgl0wfbhbYf4x5g8lyb5
         lt1A==
X-Gm-Message-State: AOAM532ayqW7NjfmowGKvYSuDecnJDmTTetPelv51WWXbpwz/deWY3pC
	6r2UtIl6cDHcjlh47a2HcbGL17hwVGDz/LbRoig=
X-Google-Smtp-Source: 
 ABdhPJy39JOFwDQJ4MrENmk2rdlpP+InPDnJW5tqPBtxENMbbZB8n/1T+s6HZ0HHPNV/7p1heGSZZNTDeKSIsDh37/k=
X-Received: by 2002:a17:906:fca5:: with SMTP id
 qw5mr39710134ejb.315.1634127949679;
 Wed, 13 Oct 2021 05:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
 <CAAnfSTtj0bS5p05+dEJmLWG8MM-fyr1ZqVxB1MA_hcXHcGXfPQ@mail.gmail.com>
 <CADkTA4OK-K0O1zMQHiMFoHATcZ=se8wZLC0Q0tKEZRF-bfrrhw@mail.gmail.com>
 <YWar9C9+p9fPduVI@piout.net>
In-Reply-To: <YWar9C9+p9fPduVI@piout.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Oct 2021 08:25:38 -0400
Message-ID: 
 <CADkTA4PK2Dt-GSnaeZTmxgr5hJV4V-6Vw2fh8_QGu5KYtQ1tkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <ross@burtonini.com>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:25:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156904

On Wed, Oct 13, 2021 at 5:50 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 12/10/2021 10:36:12-0400, Bruce Ashfield wrote:
> > On Thu, Oct 7, 2021 at 6:13 AM Ross Burton <ross@burtonini.com> wrote:
> > >
> > > On Wed, 6 Oct 2021 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > > Does it have to be native or target dependency ?
> > >
> > > Native, as it builds compiler plugins for the host.
> >
> > I was out most of last week, and this was a holiday weekend here, so
> > I'm running behind.
> >
> > I didn't notice this on master or master-next, so I've grabbed it and
> > made the same change to linux-yocto-dev.
> >
> > I'll send them out in my next pull request.
> >
>
> Actually, this has been in my kirkstone-next and now my master-next for
> a while but not in any green a-full build yet.

Can you point me at that branch ?

If it isn't poky master-next, or opembedded-core master-next, it might
as well not exist, since it isn't something I'm going to check.

Bruce

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

