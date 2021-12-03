Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66592C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:07:43 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.14994.1638554862377178683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ka89z4ux;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id t26so8372215lfk.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oa699x7mCnyD2VSFRaH0VT8NvrWD9df0aZL0fh9xh1k=;
        b=ka89z4ux1P9YuJv60vQ4z6e18QABKBJZENVr2wUPILR+tmw+TsgznmxNWxNNefdtK5
         F7a+y/fB3cK3fqf1RgFzGvstf+mfdzsqdgQurSTi9WuHo49IAT/xGi2mKVrMX+Qx1AAc
         auWjpsk65Qmc5rfupkLyiDA/j41ad+QCxbKDW517UqCU3wgokN0QISyn24CSIspqe3od
         ESOkqGNKzb8nLJrnPgVWbl4R+nhr5ZpNwFoZ7KgMF92CrPE2a8j8Jxfmo11TR7tfGaIL
         CWNEJ/Hi5hBq2CPY3zp1ly872DqJGuLS41zZxER8z/p2MokUzj53aXfdQDFeGiIv1jPX
         +wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oa699x7mCnyD2VSFRaH0VT8NvrWD9df0aZL0fh9xh1k=;
        b=P+2fIyEHlq7ooLxF+aN8ilvoSr3yjKT8iX2CRMBw/UJRmBwtiaM0PvD1f4ywEx9Xk9
         OmmRi+Q8/ZZ3wVisBGlI/mqjo8uO0kP/GUTqYUarCG9N08zfsCpLo+fn8rzczrz8BEYH
         bYn+fvmVpCB0C6UT7yDNaEWR3bfjUsSI9aW64vWQ453dDBnmZ3/ZpwuP7YhkqCkFIliH
         S1ax1rJ0G0fguLNFkthNEuOy4TTcCLv5odJy8QRYicn7x5GQ2QEEdIkKgJ5tEoOdSKfc
         nvFpYyNd4Go9BPBAbqXuAI1wBOhPuyNIvz56y7W7O/tF4mfBdyhizZweMlyoDHxnQn4F
         sVLw==
X-Gm-Message-State: AOAM533NzJ06NEf9K5EaK9kgT4czsrhCXYvY2iVqXuEwxZ4KTs2mfXUQ
	PLVVKiO3KZpqiXqCV8gvtN1pyfo15IlgutxlWNw=
X-Google-Smtp-Source: 
 ABdhPJzZIvZYWKUSJf+Q6loV0IVrvtUYjvpEk0XEwkST+cDVLJEgXQhX1h+5OWerX09iJm+DUAiy1p1ZSlBPighhYGU=
X-Received: by 2002:a05:6512:4017:: with SMTP id
 br23mr19258785lfb.270.1638554860522;
 Fri, 03 Dec 2021 10:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
 <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
 <CAJ86T=Uzdei4V_GYHH_Cd=C64Yo_HJ9+jW8Nbsq_sS2FjkiEng@mail.gmail.com>
 <61ee860e605c5e1db1aac7cc1c8cee15c23a4071.camel@linuxfoundation.org>
In-Reply-To: 
 <61ee860e605c5e1db1aac7cc1c8cee15c23a4071.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 3 Dec 2021 10:07:24 -0800
Message-ID: 
 <CAJ86T=Vea1X9ZToanqUpqhMCt5YD_7d-RZWwyFgs3bXgZm58+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:07:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159125

On Fri, Dec 3, 2021 at 2:06 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-12-03 at 01:39 -0800, Andre McCurdy wrote:
> > On Wed, Dec 1, 2021 at 2:33 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2021-11-30 at 13:45 -0800, Andre McCurdy wrote:
> > > > On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com> wrote:
> > > > >
> > > > > On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > > > > This isn't equivalent - it will cause a change in behaviour for anyone
> > > > > > using PACKAGECONFIG += "foo" from a .bbappend.
> > > > >
> > > > > Correct, but this is likely the only recipe in the greater ecosystem
> > > > > which has this behaviour, so I'm not that bothered to be honest. :)
> > > >
> > > > The only recipe? There are many recipes which set a default
> > > > PACKAGECONFIG with ?= and many which set it with ??=. Your change is
> > > > effectively switching the vim recipe from one approach to the other.
> > > > The fact that adding PACKAGECONFIG options from a .bbappend with +=
> > > > sometimes works OK and sometimes not is a source of confusion for new
> > > > users.
> > > >
> > > > You are right that no one seems to care though...
> > >
> > > Some of us very much do care, it is actually bothering me a lot and I've posted
> > > several times on the architecture list about this kind of issue.
> > >
> > > We haven't worked out what we can agree to do about it though :(.
> >
> > As a first, very easy, step, make a statement here on the mailing list
> > that all PACKAGECONFIG defaults should be assigned with ?= instead of
> > ??= and fix the recipes in oe-core accordingly.
>
> The question is whether we all agree on that and I'm not sure we all do.

What are the possible objections?

> > As a second step, the parser could generate a warning (or even an
> > error) if any variable is assigned to with only ??= and += (the end
> > result of that combination is not what any user would expect and I
> > doubt if any legitimate use case relies on it).
>
> Would be interesting to see if there is valid use so it is probably worth some
> tests/analysis. The ??= operator never did what I'd hoped it would in reality
> sadly.

I agree ??= is way overused and very often in places where ?= or a
direct assignment would be better. I'm not the one accepting and
merging patches though... you are!

