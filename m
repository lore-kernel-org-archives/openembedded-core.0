Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B2CC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 19:24:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.2324.1699730684128899256
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 11:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ry7+1hW+;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.54, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507ad511315so4484647e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 11:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699730682; x=1700335482; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRS1HYOzAInu9DK7Fgrt7UHyeEEoLjyV7oyA1Ma1Npg=;
        b=ry7+1hW+bEdHkX+fhaitsu92REW6LWeGuLez3z7R6iMEYLi1Zrw+Y0RJGk5HXre2YF
         Yf4gMji2Z2UNQwKRdsfK0Km1j3isJmOwumaGrrS4U1P1X1tK2nsMaK+aUOiFLTBfJh5M
         yxhyGbE7Fh9nuFmKrXcLME3d8yS9rvDRUht5DilsOUG85x4bgX9xYhAkeJBqjBuiupwj
         uL6651FVzqrilXZPyKbh6uYvk4PbaAzuBFVl/cgOjv5AxFtIw+NJJpY5cXlPPFV0Kru5
         nZnI5lo9MGEmK9N7ACz/1lt4qqe+62JKIkoDowG6tsl9SIzInljPKrRid1o+YbIYHD3Q
         wyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699730682; x=1700335482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRS1HYOzAInu9DK7Fgrt7UHyeEEoLjyV7oyA1Ma1Npg=;
        b=mor097AhWz0v9DNsPE3Z+YVlC5xQ9qwHZ1bSP4+9haTHZ/Ht+j+pPAE/7faTJtgeD6
         rhI/w2egTbK4XiAdUoxB/K1AAEG55SMSW621WUgIHc1WwFXQ3IelZOUQMK9EGaqYjQAv
         0jTZWQW/dMqY8yUX8cS9Lv3vb04MqSCgScIvmAvCYZLTNqTuRCYvlOSIruihofG/m+St
         ODEFJNcatf8PMBzVC34Dhtt1Btes9cHQ3UetHyTIE44Axv91cpoB1JvGZknm98lDxZjq
         8WwbN3jePzo7g9BPoUnJmCL7tARXB0+xCF1MZSOI4TiBDFtgkdkc5572qTNT+Lsphv0T
         tILA==
X-Gm-Message-State: AOJu0YySigQK1iL5zoQlJYZnURIpH73FzpiMdWOt1v/TL4i3dHWMCi2V
	SYm2AKxbzy7Z+YizS9Z9Hr2pzNtlmHYZrFBDXnRtmA==
X-Google-Smtp-Source: AGHT+IHhhWL4JbxO4BjSsw5MJ4YlD564M54JLcL+LXvRtXuvftsdeLLMqZ9jvGz4Fd6uDG8CWvbbZgCJaAw33eYHYJs=
X-Received: by 2002:a2e:3306:0:b0:2c8:3531:27d1 with SMTP id
 d6-20020a2e3306000000b002c8353127d1mr1821332ljc.25.1699730681900; Sat, 11 Nov
 2023 11:24:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699714834.git.steve@sakoman.com> <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
 <98dcc905adef3d2d828af60abdaa40291abd458d.camel@linuxfoundation.org>
 <CAMKF1sqRD+yX+gFHSPhmrdY2nBHpLh24YYHv6HusfkSS5tmT5w@mail.gmail.com>
 <CAOSpxdZLvOAhz9t-m3BeOzpXjLjSELQMJpqn6hCpcxZY2wx3CA@mail.gmail.com> <f0a66fa3f97bf3eda5667077540cbf2900e753fe.camel@linuxfoundation.org>
In-Reply-To: <f0a66fa3f97bf3eda5667077540cbf2900e753fe.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 11 Nov 2023 09:24:30 -1000
Message-ID: <CAOSpxdb00gS3rzP8mijzdVhAdfji0a27f3BKxmQTJJfB6RCa=g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 19:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190440

On Sat, Nov 11, 2023 at 8:47=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-11-11 at 08:20 -1000, Steve Sakoman wrote:
> > On Sat, Nov 11, 2023 at 8:08=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > On Sat, Nov 11, 2023 at 9:36=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > > > > We are seeing reproducibility issues where gcc-cross sometimes de=
faults
> > > > > to gnu11 and other times to gnu17.
> > > >
> > > > Why is gcc-cross doing that? It is supposed to be deterministic so =
we
> > > > really need to get to the bottom of this :/.
> > >
> > > I think the previous patch to enforce OE cflags is exposing this
> > > problem.
> >
> > No, the problem also exists without the previous patch.
> >
> > Richard suggested the backport as a potential solution, since it fixed
> > a repro issue in master.
> >
> > It turned out to not be a complete fix in dunfell, hence my second patc=
h.
> >
> > I agree that it would be good to get to the bottom of the gcc
> > reproducibility problem.  But until we do, this second patch will fix
> > the issue now and will do no harm once gcc is fixed since it is just
> > explicitly specifying what should be the gcc default.
>
> I worry that if we merge that, we'll not spend the time needed to get
> to the bottom of the gcc issue :(. We don't know if the issue is there
> on master or not :/.

Given that my knowledge of gcc is pretty much non-existent, I don't
see myself getting to the bottom of this while still maintaining the
three stable branches. So help from experts is required.

If you are OK with ongoing lz4 repro errors in dunfell, I'm happy to
drop the patches and wait for someone knowledgeable to fix gcc.

Steve

