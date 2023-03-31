Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADABCC761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 15:55:29 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.58844.1680278126374236259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CGYJPeVq;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g19so16393340lfr.9
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680278124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOVbmxbpq01Cm8QY53TSwbwNWetVBI7FV+GfI/VcGpY=;
        b=CGYJPeVquBS80dOKjuVBFbr3BsBWdkr2oFR6FCVpDFHKn2oiJqte7XOkrjvhCE+aWa
         S7R6rf1uq7b++FXdB5t3xpb3X86yKOf+6UcjxQIfzOvZBf1AES69XEwCAw8xgReyf/Fl
         LSzc6OBuwUHSq6hgavxIa0hL9MbPS0PxpPZanOo7Yl4AcVn7udC4/nxxme+55ZvfZPGG
         t12/cxvRXn139jTps20L7uBBliOS+h0j0W6DIfh7w9nwehEnzZfx2XWlH/HnCHWO1fH/
         Qsg1HvyUwW+1zc/EuuvDfbbEoMQx/dBJf+PAY7yH7dRyE1Mjt9Ufm64X3DhE9KjeiGhf
         lAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680278124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOVbmxbpq01Cm8QY53TSwbwNWetVBI7FV+GfI/VcGpY=;
        b=Cg9JrZ3oOoGSknSxAHCJMA8+s7j2/TBh+jhaCv6JWTDfEntV1rT6baFK92jt2rgrJd
         eyldITwGsQIeWMELChWfT3sXNH3UMUnSh/UkU4H9CYckPDTSRHruuUMZaft1UmeNlxri
         xeZ2VsTObU5teIfJwlxHV7AHxDhmqL6PBWmXSk+7/VfZUDkyGG54zNc7+7s2K6DxbWrl
         JVFN18E4wS+OHZzZXkWtPk/iRffFGvz/1kBvJJjLACNAzuEKEbygW+Yt869CS7TAxHii
         Z9r8qYwCZ2R6nyjeHq3w2hpzY+/O02rgOIRpRzTAowwG6i9ot86nj9T8hVSBaswiWoxf
         phzA==
X-Gm-Message-State: AAQBX9cJMDr59vXERXZrXoc6ezaj1ML3g4ExdHn12347oIb84w5iMonq
	BraOFG5Cfyn9WR1vhVgTUfA5T8Wk+Qt6dIb85sA=
X-Google-Smtp-Source: AKy350Y6dxaisR8qmn2t7kQcz6aCUfixnPvIZk5DF4GAc9J3AtB1m6OAC5c8ua9H/obUEznVTsLjgGRQvtbQfFx0nC0=
X-Received: by 2002:ac2:4a9d:0:b0:4e8:9988:f8ab with SMTP id
 l29-20020ac24a9d000000b004e89988f8abmr8207529lfp.11.1680278124405; Fri, 31
 Mar 2023 08:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
 <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
 <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com> <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com>
In-Reply-To: <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Mar 2023 17:55:13 +0200
Message-ID: <CANNYZj9jH0XvVT0nDropkBV8_R2KSJ69_YL8En7TwaUQvgG+uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for zvariant
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 15:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179450

You need to set up two identical builds in different build directories
and verify that what gets installed and packaged is identical (in this
case it's not). The most common problem is build paths leaking into
the binaries or other installed artifacts, and it can be tricky to
narrow it down to a specific point where it happens in a build.

The broader rationale for doing this is here https://reproducible-builds.or=
g/

Alex

On Fri, 31 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Ok I'll take a look at this next week. But I don't know anything about re=
productability build so if you have any info that can point me to the right=
 direction, I'll be glad to read it.
>
> Le ven. 31 mars 2023, 15:50, Alexander Kanavin <alex.kanavin@gmail.com> a=
 =C3=A9crit :
>>
>> On Fri, 31 Mar 2023 at 15:26, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > > > We do have other reproducibility issues in rust and had to exclude=
 some
>> > > > packages from the test because of this. We do want to resolve thos=
e
>> > > > issues though.
>> > >
>> > > But aren't recipes in meta-selftest exempted from reproducibility re=
quirement?
>> >
>> > I suspect we can put an EXCLUDE_FROM_WORLD =3D "1" in there and then t=
his
>> > will "go away" but shouldn't our output be reproducible and isn't this
>> > therefore actually a good test?
>>
>> That's true. There's also rust itself which continues to be the only
>> item in core that's in the reproducibility exception list.
>>
>> Alex

