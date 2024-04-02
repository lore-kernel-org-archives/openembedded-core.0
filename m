Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE0C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 05:42:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.5657.1712036531765831473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 22:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVk5nGea;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so2746957a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 22:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712036531; x=1712641331; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRZ0kriFq8GBCmRbumTmJS9D25wfZ0fmZgSk7McFl54=;
        b=WVk5nGeaCbp7uTWzC/9JWOYMLjUhpUfxUqiOuqicdVeXJCKe+E061VDVKzO9+n1CmO
         KIIZG05ckyzR3elqMw5GxIqFG9BmpIlD/FINdUpUg7M9YO8NAGGfBkITPT+HMM3RtCNM
         x5Od9N2N7aF+LCqdzrLnOkpUGh58TEmAYbjenoDm0cJ8oNCuYzO4SMAEHYLELlbTVcKW
         fLvFsmAWmpepEiSZce/bDEHDr8fc2AgTmxsfkjDfyxnvq71Ek/TWTPbczFT2Lz/zzgBj
         QrgoMcz+58D0S8WoCcgyFK3hunx2LOv6Wx2Jia4neJmphK0fiSoFJtYbhNaGbAs0Eqp1
         hg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712036531; x=1712641331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRZ0kriFq8GBCmRbumTmJS9D25wfZ0fmZgSk7McFl54=;
        b=Ygkwd2W/NaKF0XMUWHbeweTNLzOUW/NDxfM+/uJbjiLu0wNqAma+woc6uTOFfC0UCi
         cmCKyU1BbuWq8dDIM9zQQSpNfJ1omDzUcMpFASxizdZfAl5tSkUk5DzJVLz3upTIPzh5
         SFOeIdyiTbNtOXVnOQGzc24be49rrASszDFN3/GDeIceHhpAb9y5VgSXbDSxqRBUcivA
         YMIj6mEvjx3/BBZiIrWvVhlIiHf3ilP+ejTCUEno8lDoJM2+alF2g7jO5MxJ74OQ1Wqk
         htoANYck8hKjtc0xd77aMHLutlWuIaAocOaMIJDalXyOY65rDgKw1FcVyEEMHiZmmjUb
         29Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7zi0wewuukg1br51jALFVBp1F8wG7mRMdhXJiy7bc1ZE0W0KSPRSozKttv0hcmGPMSqe+642FyCSjOZSCkTDkfD339TM6Hf0yBMiZ5XTTKfaYyY/Sbn0
X-Gm-Message-State: AOJu0Yzz9j6QCXcmd8j5PUAUed22EpXHh6swrlwgCxFNzCDEPMr2KD3y
	5TCspovwqeJaN8f/iTgTrCtr/i+fZIHlvHFbkvILYMQ+lOn7U2SWzu5cY5ixLe9dDtR2dgZ2Pyq
	VGdTyQ3gnutA3d+T0EbjW1F8VefA=
X-Google-Smtp-Source: AGHT+IGSD2G4CCz5Dv2kegmxWjbqSGIvoDThGEjP8CJJNyOw3t/kzOZ3CiTNVMafhatVcxul4ad2+UIu3lUSq3jGC5M=
X-Received: by 2002:a05:6a20:d387:b0:1a3:3c5f:2ebd with SMTP id
 iq7-20020a056a20d38700b001a33c5f2ebdmr14275678pzb.59.1712036531101; Mon, 01
 Apr 2024 22:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com> <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
 <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com> <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
In-Reply-To: <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 2 Apr 2024 07:41:59 +0200
Message-ID: <CAApg2=R3Kd-fj0+GtN=H7OEMor+rTR=w+FFCTzRA_Bw7shQn6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>, wangmy@fujitsu.com, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 05:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197866

On Sat, Mar 30, 2024 at 1:26=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2024-03-30 at 13:08 +0100, Marta Rybczynska wrote:
> > Absolutely confirm. DO NOT UPDATE
> >
> > Marta
> >
> > On Sat, 30 Mar 2024, 02:04 Mark Hatle,
> > <mark.hatle@kernel.crashing.org> wrote:
> > > I know this request is a week or so old..
> > >
> > > But do NOT upgrade to 'xz' 5.6.0 or 5.6.1.  It has been
> > > compromised:
> > >
> > > https://www.openwall.com/lists/oss-security/2024/03/29/4
> > >
> > > --Mark
>
> We're not going to. The upgrade was already dropped after it failed
> build testing. I do wonder why it failed.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/8737
>
> I've ensured the sources were removed from our mirrors too.


It looks to me that the Autobuilder has actually seen a side-effect of
the backdoor...

Marta

