Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926B8C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:13:01 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.15048.1638555180315084714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WnZ5tsNL;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id n12so8511709lfe.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8NG/CsZ/yi9dwQNei/mWnO9SdQGf/419Hhf3NkaXr+c=;
        b=WnZ5tsNLc/huC4gSXcof80t9VeyoINBIe/6lHWNdwGw2kVzqhpAjtmMxZazkGtubon
         OfKAPB+BOMwY0HjqB3/sQpUzZ1XYikQes7dBCw0t6pypvk+p6D55t6nn87TAlMQyvAnZ
         BG/dXakIzuZfil4PHsFPJeWCFB9vHiBfXioziE3FzRi03OoeyftgCX8sRGR0ePLrNp+L
         B4M0yaCATX2cFM66vw+NnCyeYRSHNAzE4lNHyLJdEvFIG0ReAIbg2PgEcTKMI/SZ7ywL
         j44dgyUMBkuzuQ4cxcu2b/x9pkGRw7wvSYMq4pCdgE8VFy4efK8B4U/i1Gs7VirgKVB4
         8jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8NG/CsZ/yi9dwQNei/mWnO9SdQGf/419Hhf3NkaXr+c=;
        b=BcLhgk2O692XTBipnlmtYsDB0PkgdNkl5zGI63YkJ5GiLW9BRx337UMYw/u1CMVUK1
         EQ7yqq89nfRO4PcTW5euvxgZb0HB+7EFDToGQjHEYTz22V5ctAu5p4fYZCJks/hdLBlw
         Fx8rWAxCkVjE38Gi5uofoxYdPUUtTA7PHKmcytVn1dcyE9sLEjpcRL4Jg+t0PdQncoxz
         nMSbfOXH9rigF/orKnrqJ8HGw/aUOXsD7LnWNz93EbwRGRMm/NgQArOgtfwYiVaoprJo
         6P6pe+nbLgW8L9WDv+AxeKn72nSNt0x7cxhTsehO9VENMK3CXnYP1jtCUmGCmhwBWIfM
         5jtQ==
X-Gm-Message-State: AOAM532qSvSO2VYE5/xfRtK1Y4U/oP+m0BU18gOtNO1wAeEw/oaKjMXo
	XTrklnkS54Uwbr2hfv/UHs7pY72alK9k6J7YrxE=
X-Google-Smtp-Source: 
 ABdhPJweowe87KgTeweYgs8PLjybSELhfb/3HPBL1qPZ/QeYLG5jIyK8wIq7BUbTAYnk6Kc2GgZmwC0bwpD6IxiXbd8=
X-Received: by 2002:a05:6512:4017:: with SMTP id
 br23mr19284012lfb.270.1638555178427;
 Fri, 03 Dec 2021 10:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
 <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
 <CAJ86T=Uzdei4V_GYHH_Cd=C64Yo_HJ9+jW8Nbsq_sS2FjkiEng@mail.gmail.com>
 <61ee860e605c5e1db1aac7cc1c8cee15c23a4071.camel@linuxfoundation.org>
 <9425bc823580451c885178a688b08353@axis.com>
In-Reply-To: <9425bc823580451c885178a688b08353@axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 3 Dec 2021 10:12:42 -0800
Message-ID: 
 <CAJ86T=URVM9p-veyn33LqhGBfFx6TOe6eUohprw5Vvxt=T58AQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross@burtonini.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:13:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159126

On Fri, Dec 3, 2021 at 5:59 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 3 december 2021 11:07
> > To: Andre McCurdy <armccurdy@gmail.com>
> > Cc: Ross Burton <ross@burtonini.com>; OE Core mailing list <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
> >
> > On Fri, 2021-12-03 at 01:39 -0800, Andre McCurdy wrote:
> > > On Wed, Dec 1, 2021 at 2:33 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, 2021-11-30 at 13:45 -0800, Andre McCurdy wrote:
> > > > > On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com>
> > wrote:
> > > > > >
> > > > > > On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com>
> > wrote:
> > > > > > > This isn't equivalent - it will cause a change in behaviour for
> > anyone
> > > > > > > using PACKAGECONFIG += "foo" from a .bbappend.
> > > > > >
> > > > > > Correct, but this is likely the only recipe in the greater
> > ecosystem
> > > > > > which has this behaviour, so I'm not that bothered to be honest.
> > :)
> > > > >
> > > > > The only recipe? There are many recipes which set a default
> > > > > PACKAGECONFIG with ?= and many which set it with ??=. Your change is
> > > > > effectively switching the vim recipe from one approach to the other.
> > > > > The fact that adding PACKAGECONFIG options from a .bbappend with +=
> > > > > sometimes works OK and sometimes not is a source of confusion for
> > new
> > > > > users.
> > > > >
> > > > > You are right that no one seems to care though...
> > > >
> > > > Some of us very much do care, it is actually bothering me a lot and
> > I've posted
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
> I definitely agree that using "??=" in the recipe for PACKAGECONFIG is
> a bad idea. In all our own recipes we use "=" so that is what I would
> prefer, but "?=" is ok and it would alleviate the need to use
> PACKAGECONFIG:append in bbappends instead of "PACKAGECONFIG +=".
>
> The reason I think "=" is better than "?=" is that if you want to
> override the PACKAGECONFIG in a bbappend, using "=" a second time will
> work fine, and if you want to do the override in a configuration file
> like local.conf, you would use PACKAGECONFIG:pn-foo, which also would
> override whatever the recipe set using "=". So unless I am missing a
> use case, there really isn't a need to use "?=".

Using = would certainly be OK and an improvement over the current
mess. The reason I'd still argue that ?= is better is that it gives a
clear hint that PACKAGECONFIG values in recipes are something a user
may want to review and consider changing.

