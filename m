Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D71C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 11:22:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.18294.1708946574703396413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 03:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cBAwQHTL;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d094bc2244so33459621fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708946573; x=1709551373; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+un2MiJJd3MxrUMq6eh+kg/BOEO9gQVeUJRlVSMmsxM=;
        b=cBAwQHTLW5PYvcf/byeaj1hJoHa3+5h40G5D1NZF6DsHCAfo9Dx19+tUF2PX/lv2Mq
         LgqMUxom50DDlDT6EAty88ARnnEoLArb5u9JL8zrEjy/3+gvCOsArcd0NfDqn6tnv/wh
         DfBmVClqn/n9f1MJoHP5NNYhRFSWzJcyjKipOWGF5Y73LIowkdKSSRx36y7rBsa/uOcA
         vqvjzpglNi9xC+BOTGLFhgnKFiTZWSzSgNlzoLVXun4IhgfmZ/N4vCuGKRoPhHKySHIa
         cKQh5TOUYHePadaQlH5Mz149ILueDDA42I29tQB4wHdX50YEu6UVT9ym7AHcNniHyJNB
         Mm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708946573; x=1709551373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+un2MiJJd3MxrUMq6eh+kg/BOEO9gQVeUJRlVSMmsxM=;
        b=mSLoMHFun0h8aYu18q2UI1oSshgmNnXC2StGs+u2rvJSvzNbhEZfx1JRWm578C85Oo
         /tCreJ1aGhR5SSRFZPMPAXs6YwOofqqBj8fEmDlMUt23oe+N3olz6APtOdPAGIuQCo/Z
         dLzmfTkk5CdNWkJjVk5U2mfeJGjMFEkfXdxU13qFra5h+5tRSl380att0Pd5tZZ/d7sG
         Z1vnhSl9zdrZ1A4I13e6HwyD/6XI6ITdAiZ5umU/J2dc5Lo3RKOSdObGUt9MAZBebH0T
         C02Q57ZT+eD5rpoM3+B1qc3Hc5nVLhn/TrPyYt/E9aspqGkrdTYyKovw/99DwIYIEaG9
         9KGw==
X-Forwarded-Encrypted: i=1; AJvYcCVm4bdDPfwpuvxR3DNtTGs0ZWmsRogbbXg7ApHPsBdYQQwz0QIglMbkSFzn5weISJZM2Hvkdnoiix4FTQetEBcBoguT5qG9HKIb8VyulDs7O3hy1SvN0jqi
X-Gm-Message-State: AOJu0YyYRpL7kgSxcWgWxuEzxzg0Eboeg2DvKFLSGJbwTvyUNOKoOYie
	z/77kbc53K7pkEk9e4CGYI3rM9WJb+EtGHbKWafWPIad/7452WWFJY+1A4fBkePhFOwB1bxDCJ/
	kAOiS85Xl7Eg64rttZ59TL9wvq5daBESXNeU=
X-Google-Smtp-Source: AGHT+IEHDfZLfSjuiLF7byPDSX5AlKdaC22kpykK0mWNdFrNWar1V2v9eZCWShUOP+rv7xInTQLjAkZbtFH+a+mxmV8=
X-Received: by 2002:a2e:3316:0:b0:2d1:26f0:8167 with SMTP id
 d22-20020a2e3316000000b002d126f08167mr3943054ljc.35.1708946572653; Mon, 26
 Feb 2024 03:22:52 -0800 (PST)
MIME-Version: 1.0
References: <17B69806B1DEE2BA.25421@lists.openembedded.org>
 <ba284035-ee83-42d0-be21-a6f31532f9cb@mvista.com> <f3b16ac13c9a4cdbc7409296267446c23332d56f.camel@linuxfoundation.org>
 <8e02178a-106e-498c-92a0-c0fc760cff0f@mvista.com> <6613bed9-5643-45cd-b0f3-89eb9f22700b@mvista.com>
 <0a042b9f-425b-443a-981b-1574e9efaf2b@mvista.com>
In-Reply-To: <0a042b9f-425b-443a-981b-1574e9efaf2b@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Feb 2024 12:22:41 +0100
Message-ID: <CANNYZj_sju_FdPdYLDZv99U_hyUx=ABJAfOq9Vcu7aSZY=shLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing directory.
To: jpuhlman@mvista.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 11:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196200

This was the commit that introduced the DIRFILES variable:
https://git.yoctoproject.org/poky/commit/?id=2f42ef8d8fb1febf28252b98884cebabc931f720

Given that it's undocumented, untested, rpm-specific, and currently
broken, and looks like a workaround for security label conflicts
elsewhere I'm inclined to remove the code paths that use it
altogether.

Alex

On Sun, 25 Feb 2024 at 19:34, Jeremy Puhlman via
lists.openembedded.org <jpuhlman=mvista.com@lists.openembedded.org>
wrote:
>
>
>
> On 2/25/2024 10:32 AM, Jeremy Puhlman wrote:
> >
> >
> > On 2/25/2024 9:22 AM, Jeremy Puhlman wrote:
> >>
> >>
> >> On 2/24/2024 2:13 PM, Richard Purdie wrote:
> >>> On Fri, 2024-02-23 at 12:33 -0800, Jeremy Puhlman via
> >>> lists.openembedded.org wrote:
> >>>> It says usr//usr in the comment, but when I ran on a clean build it
> >>>> started complaining about opt//opt as well. Its not really clear why
> >>>> it is looking for those directories, and I am sure this is not likely
> >>>> the correct solution, but I wanted to get it out here so someone who
> >>>> has kicked this area of code might know what may be happening.
> >>> Unfortunately there are layers of different pieces which could be the
> >>> issue, such as pseudo in combination with the host distro libraries and
> >>> uninative.
> >>>
> >>> Can you create a test case which reproduces the issue?
> >> Yeah, I was going to try to get to it, but time got away from me.
> >> Hopefully I should
> >> be able to get some time later today.
> >
> > Trying to reduce the recipe to bare bones, I narrowed it down the the
> > DIRFILES setting.
> > Deep in the top level class configuration for the layer, it sets
> > DIRFILES="1", which looks
> > wrong given the code. OTOH, nothing else in any of the layers we are
> > using sets the value
> > to anything, so what ever recent changes that were made there are
> > untested by anything.
> >
> > Turning that off should resolve my issue, but it looks like that code
> > path may be vestigial at
> > this point.
> >
> As an aside, adding:
> DIRFILES = "${bindir}"
> To something like the bash recipe, reproduces the behavior.
>
> >>
> >>>   Does it always
> >>> happen with this recipe?
> >> Yes. Originally it was happening in our distro setup, minimizing it
> >> to just poky and the
> >> meta-oe/meta-python, it happens with the recipe with the default
> >> distro as well.
> >>
> >>>   Does it happen on different host distros?
> >> I have not tried that, so far it was just rocky 8.
> >>
> >>>   Are
> >>> you using uninative?
> >> Yes. It happens with the default poky distro, too.
> >>
> >>> What about buildtools-tarball?
> >> We always use buildtools-extended-tarball, to isolate as much as
> >> possible from the host.
> >>
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>
> >
>
> --
> Jeremy Puhlman
> jpuhlman@mvista.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196145): https://lists.openembedded.org/g/openembedded-core/message/196145
> Mute This Topic: https://lists.openembedded.org/mt/104536226/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

