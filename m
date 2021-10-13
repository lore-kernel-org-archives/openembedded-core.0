Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610A8C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:43:12 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.7595.1634128991671265757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ii10+snW;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id d3so9725097edp.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKOGbp3uHSv1jsFVvTNTkx9AWqSfiGk2LWvAsNqeufk=;
        b=ii10+snWsRcXbuO8CJlh4briLCf3P/NDFn1vvz3S+2MmvrDmsM4y8X+6OKbEfoXAO5
         rAeGgySa9/NkOxsAWaJvxSZxrDnvuKUx0xBYHD6JVO9NlruT4RSZXxnL1AIvDz7fpWQB
         JgC4AgJhV+0qQhdpuVNVMtTIlMeyGC+zI9/bzhGtufYHVUeOgXcbZzehyHQgFEVm4xqa
         oGfhOm9jTD6UmjHNWzwT75t7XTJqqLqhvvP+6xw3R+VRx8dz/QOju9NnqfjavOJ0Rl9u
         U5yc46Pr/PuqosUYO2jZGiuGKUnmOd388QhlO36pjdLPc/WKFpPdbYEGb4upKtveFpan
         1gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKOGbp3uHSv1jsFVvTNTkx9AWqSfiGk2LWvAsNqeufk=;
        b=GDSpG7P9bzZiB+D/hSD1cb+3RS2Mbu1+j42ogCoSW7nidOh0zJldP8Z9b3cLOqWdsh
         HnY3CRTquEswJ98Vs5qlLlUx86oZOqWMfkccXRVO7tYLMKqCuljv78vL/IWPOjGanVDh
         XOM8tk6ONLDqJtMxYH7RzQ1RzSMIL+kJw7F69kx/4CP4qq2WIC6MMZ63jvzytkGo1yGL
         eTRavAAOyHDAx7PliJ1XXdsv3v8JajmBnxzH30pjQl8891tx+/rAvQvRpsQGnwtme1Nt
         8IVPZcXvFQmiMaRJsOXDgTPAtDF857krWnKzdpgxYsmG3GhkEseT19z7TwCnII84aMbc
         1wlQ==
X-Gm-Message-State: AOAM532SFpiX+wVoKCaZp8W/hJKv9QIYuHfatNxQLEzVCU1dpkFKK3fP
	keg/wAA07Dz+lDO2McvWSaYmXWl1FIsZZkcmv1c=
X-Google-Smtp-Source: 
 ABdhPJytKG2vEZfwKEffFMmvG1jawwUPwqYGlBb9k7vIyHv4VzpAJOFXW9y+GjtIADhHI6mrO6RlaN9Rhwh5AZV1+eU=
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr42985861ejc.81.1634128989055;
 Wed, 13 Oct 2021 05:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
 <CAAnfSTtj0bS5p05+dEJmLWG8MM-fyr1ZqVxB1MA_hcXHcGXfPQ@mail.gmail.com>
 <CADkTA4OK-K0O1zMQHiMFoHATcZ=se8wZLC0Q0tKEZRF-bfrrhw@mail.gmail.com>
 <YWar9C9+p9fPduVI@piout.net>
 <CADkTA4PK2Dt-GSnaeZTmxgr5hJV4V-6Vw2fh8_QGu5KYtQ1tkg@mail.gmail.com>
 <YWbSUQ5slJyMGqJW@piout.net> <YWbSyEYfmopoeEJs@piout.net>
In-Reply-To: <YWbSyEYfmopoeEJs@piout.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Oct 2021 08:42:58 -0400
Message-ID: 
 <CADkTA4OwKG2pbmM3b3rtGawMgVk8ACpCgAWWNFONr56+2Aya7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <ross@burtonini.com>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:43:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156907

On Wed, Oct 13, 2021 at 8:36 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 13/10/2021 14:34:25+0200, Alexandre Belloni wrote:
> > On 13/10/2021 08:25:38-0400, Bruce Ashfield wrote:
> > > On Wed, Oct 13, 2021 at 5:50 AM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > On 12/10/2021 10:36:12-0400, Bruce Ashfield wrote:
> > > > > On Thu, Oct 7, 2021 at 6:13 AM Ross Burton <ross@burtonini.com> wrote:
> > > > > >
> > > > > > On Wed, 6 Oct 2021 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > > Does it have to be native or target dependency ?
> > > > > >
> > > > > > Native, as it builds compiler plugins for the host.
> > > > >
> > > > > I was out most of last week, and this was a holiday weekend here, so
> > > > > I'm running behind.
> > > > >
> > > > > I didn't notice this on master or master-next, so I've grabbed it and
> > > > > made the same change to linux-yocto-dev.
> > > > >
> > > > > I'll send them out in my next pull request.
> > > > >
> > > >
> > > > Actually, this has been in my kirkstone-next and now my master-next for
> > > > a while but not in any green a-full build yet.
> > >
> > > Can you point me at that branch ?
> > >
> > > If it isn't poky master-next, or opembedded-core master-next, it might
> > > as well not exist, since it isn't something I'm going to check.
> > >
> >
> > Sure, it is here:
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abelloni/master-next
> >
>
> BTW, it is perfectly fine if you include again it in your next PR.

Thanks. I'll write it down, and hopefully remember to check your branch as well!

I'll keep it locally, and when I update against master I'll double
check if it is still pending. But it can flow through via your branch,
no concerns about that.

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

