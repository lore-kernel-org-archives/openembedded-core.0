Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C73DC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 09:40:14 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.9706.1638524413279300595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 01:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pyrlke4d;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id k23so5078079lje.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 01:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncefGOuiub35q6z8oAgqdSeLdlFQRj+0o6WYOBBubsU=;
        b=pyrlke4dzrBNCeMEcqXto0RdHZxU+XxY8G1B0KXe0zXbVVMOsUhA1zoRJHTGLhSM7j
         WVRc1/G1gHzmGiXDyft/ShIMkRjF8DS7Gg2C5BApJIh0UScOit+To+aBZPLw51veCPHr
         BDHdM9SdQtIfZYWykLZu8h+b6hj7QwCvw1MKJNNkjjTSsZcxbrXxyNXWkU2v23+JpgkJ
         Z4nOuYrSwjXxPli4299Pl8XTpcSbyG5BynXvzX1xmtLcn34YIkosClt8+anDczI578rg
         DC7RfxuE+fihcQmki1HKyLPxYOUHQLLoBaRrgY1z+tVs3WEZs4KReFkdC+gRDJgfHSUB
         UqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncefGOuiub35q6z8oAgqdSeLdlFQRj+0o6WYOBBubsU=;
        b=Xd/UmPBhx8/wq3WZwNcA4ss6X5Gco2N/Uy3BLpD04u5cOtoodUdnuEvneQRroy0BIY
         FoDU/kcjkkldaA0rj4JUTBYI3FgIZ8CW1M7OLAOg3y389uLxOBGZgGguFwFrEAYUWtRe
         V1hvrH/CPshfprLP3tRxSf2qKrYlGnzUcprVRQkIvjZKLrQWLw4+V/ZDkGdbDmpTgZiV
         Yj+uh/osJNi9CJiZKbCzQ1xh9TSBkmHAfqXilK2RAzUol/S6s1KDaR1DHi405xzQZ3ZD
         8w7rbOqEYpIW/hHGWCUMTW++4RVhasqF4kLw47TidjHP6PpokTf/YmZBgUkbPXqm3AG8
         e+og==
X-Gm-Message-State: AOAM530LEzczf8OPeLDOBWh0Zv2jzWy7zjCtQ1HHy3/EtZnvASMt8Zgv
	msyc9BjZ5h6tupoTwAoq+EuX8zupuSHhRQHTe7s=
X-Google-Smtp-Source: 
 ABdhPJxJ39s/z+VMLAIDPIMpdFk3Wo2SwUWW8z+vAOoZjBD14Tl3reOK6n/KnpQ9nrSR59xbbYrBGSl/ugcTMnoMjo4=
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr17309782ljc.238.1638524411199;
 Fri, 03 Dec 2021 01:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
 <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
In-Reply-To: 
 <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 3 Dec 2021 01:39:55 -0800
Message-ID: 
 <CAJ86T=Uzdei4V_GYHH_Cd=C64Yo_HJ9+jW8Nbsq_sS2FjkiEng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 09:40:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159112

On Wed, Dec 1, 2021 at 2:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-11-30 at 13:45 -0800, Andre McCurdy wrote:
> > On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com> wrote:
> > >
> > > On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > > This isn't equivalent - it will cause a change in behaviour for anyone
> > > > using PACKAGECONFIG += "foo" from a .bbappend.
> > >
> > > Correct, but this is likely the only recipe in the greater ecosystem
> > > which has this behaviour, so I'm not that bothered to be honest. :)
> >
> > The only recipe? There are many recipes which set a default
> > PACKAGECONFIG with ?= and many which set it with ??=. Your change is
> > effectively switching the vim recipe from one approach to the other.
> > The fact that adding PACKAGECONFIG options from a .bbappend with +=
> > sometimes works OK and sometimes not is a source of confusion for new
> > users.
> >
> > You are right that no one seems to care though...
>
> Some of us very much do care, it is actually bothering me a lot and I've posted
> several times on the architecture list about this kind of issue.
>
> We haven't worked out what we can agree to do about it though :(.

As a first, very easy, step, make a statement here on the mailing list
that all PACKAGECONFIG defaults should be assigned with ?= instead of
??= and fix the recipes in oe-core accordingly.

As a second step, the parser could generate a warning (or even an
error) if any variable is assigned to with only ??= and += (the end
result of that combination is not what any user would expect and I
doubt if any legitimate use case relies on it).

