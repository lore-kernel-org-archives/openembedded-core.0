Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F18C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 13:38:13 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.34590.1691415484282119739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 06:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ZhZMGcPB;
 spf=pass (domain: baylibre.com, ip: 209.85.208.41, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5221c6a2d3dso6322957a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691415482; x=1692020282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwYS5GyLlBiDJLynOoRSjD+NvMSOH3e8YVCtomsys00=;
        b=ZhZMGcPBn9hOnQdHDgsNR+NRQXCLw/vENY/xzemZ29vJbpbtbKOE+CsNuqA9dUgW1+
         wuQdVzFR5fYq0BdfQbQl+Gu0CBtmi/xRQcmvToEwWIBExferd0HSo0qMroPjo5u6gTMi
         EYRq3otBa31BLdS2VVEfpQ9XSZMpQKonA7qISzNyq+qo8hd4Nrw7hrOWcJYFF1dL1Tj9
         BDd90mdcJcP75CGNx/C+TZ3HhDLArjwPaMnBAlkJORBazw21cu3A/+SmD5RXnTz8OSbJ
         yX51yj4csuiii8VqRPobnYRWqktPoP9x2De5uBupWBAKLBFBM5Oo++qhawYOAhc3Il2d
         WQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415482; x=1692020282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwYS5GyLlBiDJLynOoRSjD+NvMSOH3e8YVCtomsys00=;
        b=SdqSK8sTttXQPPaHKsIIp4B+/l+SXdikGVoVTDO8cdMu9WgdqKsC2rlRZpwYmMhXF6
         1ekOQ0H+97AR5Yrmz0uODzkoiNJv5tVj5toKUvWM0WmkVLRS3VQThT4qv1z7SCfizdZ7
         LaLXkQ2L53USa+zffnLfs7YPbwuEJLez5GPFGnIRcFwM6VNaZQjNsqtBqVe2DE+NUeCI
         5haWNg/Jt6K7/WCrMU4MoKEmBRRgm+h7FI555125fkza1+InrazYmUXbPXyG1BAPEpXY
         LSRa4CtTgHq+OyZhgGQTeNw2kB8NhwnuwgJKa2G5rQwwfh0GxR/1qULPwrEVtPKZPEYj
         xF0A==
X-Gm-Message-State: AOJu0Yx8ZbAL8ll8Y+ClQTnCs8oKGBDzxnsZexeEOaIpJYYGGoZrLL8C
	spW18EzpYNj3wShtf1JKAehsCLJLd8hTAz4KCvIstA==
X-Google-Smtp-Source: AGHT+IFLHwUEC/4GuyRqJfy0NV4YlMsu4TJzqG+qrwlzRTZQ8HN+4ptmgw052TVobRj7B6hmtaWzJIMtFAGlO3OEYtY=
X-Received: by 2002:aa7:c6d9:0:b0:523:19f0:b113 with SMTP id
 b25-20020aa7c6d9000000b0052319f0b113mr8220496eds.31.1691415482273; Mon, 07
 Aug 2023 06:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230721142543.246415-1-jstephan@baylibre.com>
 <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
 <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
 <CANNYZj_4GRz3j20Mc5wow2fpgHyhoTRsuwnYyHe6yiwnQM-vvA@mail.gmail.com>
 <ythwlmw5z74zvdz5csmmccksb4jmcyjckthqn6qhl2m27tisan@w3ng7x7q2gy6> <CANNYZj9iZVZ8qunaPQxLCk8x3MiVFEhTbr2i=hO=U138EmwHLg@mail.gmail.com>
In-Reply-To: <CANNYZj9iZVZ8qunaPQxLCk8x3MiVFEhTbr2i=hO=U138EmwHLg@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 7 Aug 2023 15:37:50 +0200
Message-ID: <CAEHHSvbzEZja7unnFTwy4RF51qmvWSWDmj=0qHuQHLeGULQp7g@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 13:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185598

Le jeu. 27 juil. 2023 =C3=A0 16:28, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> Sure; if you can write a script and show it here, we can figure out
> where to place the test officially.
>
> Alex

Hi Alexander,

I sent a v4 with an oeqa self test. What do you think about it?
https://lists.openembedded.org/g/openembedded-core/message/185408

Cheers
Julien

>
> On Thu, 27 Jul 2023 at 16:15, Julien Stephan <jstephan@baylibre.com> wrot=
e:
> >
> > On Mon, Jul 24, 2023 at 10:36:28AM +0200, Alexander Kanavin wrote:
> > > On Mon, 24 Jul 2023 at 10:25, Julien Stephan <jstephan@baylibre.com> =
wrote:
> > > > > Thanks for working on this. Should we think about how this could =
be tested?
> > > > Do you mean we should consider addind self test for bblock? or you =
want
> > > > to discuss about acceptance criteria for bblock?
> > >
> > > Hello,
> > > I mean mostly about what should be tested. How can we verify that the
> > > script does what it's supposed to, in an automated way, so it won't
> > > silently break as new changes to bitbake/oe-core are added? What
> > > should such a test contain?
> > > The specific form of tests (whether it's selftest, or maybe a part of
> > > SDK testing, or something else) is secondary.
> > >
> > > Alex
> >
> > Hi Alex,
> >
> > I just send the v3 with a lot of improvements!
> >
> > Here is what I do during my dev:
> > - lock a recipe's task for a given arch (qemux86-64 vs qemuarm)
> > - modify the given task
> > - check that for the selected arch, task is locked (but not for other a=
rch)
> >
> > Maybe we need to be more formal with that?
> >
> > I would be happy to provide a test script if needed.
> >
> > Cheers
> > Julien

