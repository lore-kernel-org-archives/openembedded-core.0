Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350A1C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 17:16:51 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.54739.1638811010233526818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ag1r87O/;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e11so22201765ljo.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJjqh0I9OOd/+R2nTIRVboKCVG4viMujFnqHa6+bRGU=;
        b=ag1r87O/fk1LCwFDf2ZLorcuqd9LSNW/lDBcaHz+tMMnka+u44ixHBCdl/bMQV4dmX
         CaT9lnE8geDDJ8Ja6/KHch8lAiEHU7UJC9Xv7VKeC73dKPbn7UAskiF29a2Hkl2sOLYp
         wLI0oUMnYFHn/H1qHP17++b546Xjcto4AZu1cucK2L2oxpwuBpo+8WzVX1/wBsYng4aF
         ggp+IOk5W1pgG7q1H8VHpr6qkof4I/zzV4wJWtiDXKcalW27d1/iyk4zVMtas/p7c+Rg
         g0snySwdiwt6zGJqTQ7yzEK/DANuX9KNJNlErIea8mAXX1PEc5KcG9wRRutRQSqbKFjS
         a/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJjqh0I9OOd/+R2nTIRVboKCVG4viMujFnqHa6+bRGU=;
        b=x7+qqq3/hOmQQ3cJ8nN6mj/s011BMMH3nOtOseZhXunSgAbhj4IIFwu86kPJm/Ac7U
         KB+X3uRQTYYnQGb/678nJ1/DaxbvOsq0svr5BSuth1OqoEAMuo4SrV2L8IJeA75ZZOvW
         iYMJySXOEMQOd0NPy5x8GG5LIeAAL6jJSRK3hNmA6fPO7q3tbNZZk+09D48yxlaqcBpp
         n8fz2Na1c/bzJpVilb1jhpgsWzht/L5sPSA7Qh1myKj0nNUdZ7uNBms587khmrnvldrM
         PvYai2EoFHTVobBUNgCcyh0PyvcEY76jgC4bJYgyovhLob5gdHh/raxr2Z4jYfGfn4Eb
         mW/A==
X-Gm-Message-State: AOAM533ODRofgryFfRObolUljb5ham9nnHb5NBVRcB9O0iAs2LjAd015
	swbSQKIBSRU0uUVPqNw5tzut+cLfaZl46K9YSzA=
X-Google-Smtp-Source: 
 ABdhPJzBiAT5BWqSFdYHDmtZQAJoVvSLUUh7PAQXBXuE1Vqt6M1MfU8C491Dk21L4she5KItbhxaznTabHCfXbgvbGM=
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr37095755ljc.238.1638811008394;
 Mon, 06 Dec 2021 09:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
 <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
 <CAJ86T=Uzdei4V_GYHH_Cd=C64Yo_HJ9+jW8Nbsq_sS2FjkiEng@mail.gmail.com>
 <61ee860e605c5e1db1aac7cc1c8cee15c23a4071.camel@linuxfoundation.org>
 <CAJ86T=Vea1X9ZToanqUpqhMCt5YD_7d-RZWwyFgs3bXgZm58+A@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=Vea1X9ZToanqUpqhMCt5YD_7d-RZWwyFgs3bXgZm58+A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Dec 2021 09:16:31 -0800
Message-ID: 
 <CAJ86T=Vs7kTuF-74s6kCywyREWbLLjfF+ki2yi5XeUszpvXiNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 17:16:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159264

On Fri, Dec 3, 2021 at 10:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Dec 3, 2021 at 2:06 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2021-12-03 at 01:39 -0800, Andre McCurdy wrote:
> > > On Wed, Dec 1, 2021 at 2:33 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, 2021-11-30 at 13:45 -0800, Andre McCurdy wrote:
> > > > > On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com> wrote:
> > > > > >
> > > > > > On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > > > > > This isn't equivalent - it will cause a change in behaviour for anyone
> > > > > > > using PACKAGECONFIG += "foo" from a .bbappend.
> > > > > >
> > > > > > Correct, but this is likely the only recipe in the greater ecosystem
> > > > > > which has this behaviour, so I'm not that bothered to be honest. :)
> > > > >
> > > > > The only recipe? There are many recipes which set a default
> > > > > PACKAGECONFIG with ?= and many which set it with ??=. Your change is
> > > > > effectively switching the vim recipe from one approach to the other.
> > > > > The fact that adding PACKAGECONFIG options from a .bbappend with +=
> > > > > sometimes works OK and sometimes not is a source of confusion for new
> > > > > users.
> > > > >
> > > > > You are right that no one seems to care though...
> > > >
> > > > Some of us very much do care, it is actually bothering me a lot and I've posted
> > > > several times on the architecture list about this kind of issue.
> > > >
> > > > We haven't worked out what we can agree to do about it though :(.
> > >
> > > As a first, very easy, step, make a statement here on the mailing list
> > > that all PACKAGECONFIG defaults should be assigned with ?= instead of
> > > ??= and fix the recipes in oe-core accordingly.
> >
> > The question is whether we all agree on that and I'm not sure we all do.
>
> What are the possible objections?

Any more feedback? The misconception that no one cares about improving
this could be because discussions on the topic always seem to peter
out leaving these unanswered questions.

