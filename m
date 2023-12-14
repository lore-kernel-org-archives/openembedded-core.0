Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B74C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:15:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.23165.1702563306995676383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lb7ObKHL;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso6560831fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702563305; x=1703168105; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8WBnbA3kK1e5BYw0wNy8gd5g920FMF53GdqOCCRdj0=;
        b=Lb7ObKHL6c7JllCn54HlotmMgkkSkp2rcGpTm9bEIR3o+klYTyjFqb+/7uAOXRgcdw
         rTPuxFtlNqDAqDCxAD7X0B3+K2dpetTmIM7tNoDx8H9CQGPZQ0qAknGyxMooXxgUCAEw
         MhH/vwh8WWpRJDIH2bORCohIONyNMz1oV11P6OI0trtUKx8fkz/MyhTO1h2VPIWABvu4
         nQjf4pFmNd0bWSE84PbS+3XHlEGQpei5jl3r30Dztukm6KogF9oQS487HKZWzZGYgM2i
         wYFfUjGKklD1owBN2UVjoOk9chugD+vSGCDxtSA1t56UUu1UHQxZaV/rDrOKwg38fwwC
         0rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702563305; x=1703168105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8WBnbA3kK1e5BYw0wNy8gd5g920FMF53GdqOCCRdj0=;
        b=Q04HG3tE9uood1xCikjEJHlkwV3q3x7m2Xeh+E3nf69fPYZLp3KJOi472YtuKSIpQL
         1POQ4moQiE6roJ3DBVIAgrERLpUKwz/FvEFrKUu7+MPrws1ckTJU0XrnQDjBcqGWlWzj
         7tvYmLzngEekMBizO1cqpat0g+arfUiBgjykFf+6S/GMmQOCsdgCY/fOGIBI47qyjR/g
         lKFyS7G0yBrCghpH+miS2fqCwq4fq9hzycFdbgQrmHOavDdZeVrvv58aKctHvbhPz63i
         jptxAKt4KMdFgRI1VlUXwvisVzh9H8g62jmk6qjWVwIi1mqTsu0InQa5UDZIzcMXrGtT
         v9sQ==
X-Gm-Message-State: AOJu0Yz8LbazL7br/rcq4MM55gnjJ6/bD85Cqn6lH8XQB12tEkkAPqPr
	+dHvQ6vD2hZIpF3v9kS7GYj/N672D7gv1utRPhU=
X-Google-Smtp-Source: AGHT+IG33cWAksgpbDOmuGfnMoqU4rXo9NTY1M8K4Bxgxf9JWZ7V0WpljF8B2d0oUjeg41g6uvlX8+Y71+AslIVZFPk=
X-Received: by 2002:a2e:9186:0:b0:2ca:92a:c109 with SMTP id
 f6-20020a2e9186000000b002ca092ac109mr6239959ljg.24.1702563304966; Thu, 14 Dec
 2023 06:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20231212140820.2900963-1-ross.burton@arm.com> <20231212140820.2900963-2-ross.burton@arm.com>
 <20231214074932cba7c5f3@mail.local> <812D443A-B8A1-47A9-88A7-80877EE659E7@arm.com>
 <9e88162576e34bce6d698bc8ef84ce2da6e2ba1c.camel@linuxfoundation.org> <17A0B6EC18C51F9F.5876@lists.openembedded.org>
In-Reply-To: <17A0B6EC18C51F9F.5876@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 15:14:53 +0100
Message-ID: <CANNYZj971m6OHrN4QqaUr6N+3d_V+Y_FZt60ZmKsQJpzn-F17w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/9] nativesdk: ensure features don't get backfilled
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192382

Correction: they didn't rewrite it, they just moved around the lines:
https://github.com/python/cpython/commit/9084e1b04f8d35721b535a3acd550b920d=
50f11a
and I didn't look thoroughly enough for the new location.

Neverthless, given that a-full still passed with the patch removed
means pgo can be completely broken or completely working, and we would
have no idea. I lean towards 'completely broken' but I'll reinstate
the patch.

Alex


On Thu, 14 Dec 2023 at 14:49, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> FWIW in the upcoming python 3.12 update I have removed the pgo patch
> (0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch) with
> the rationale that "pgo support has been rewritten upstream and needs
> to be reenabled and tested separately". I simply don't have bandwidth
> to make it work, with a ton of recipes in meta-oe that still need
> fixing with 3.12.
>
> Alex
>
> On Thu, 14 Dec 2023 at 14:35, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2023-12-14 at 13:31 +0000, Ross Burton wrote:
> > > On 14 Dec 2023, at 07:49, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > > Not obvious but this is the cause of:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/8=
697
> > >
> > > That was a fun rabbithole to dig.
> > >
> > > The error from the log is:
> > >
> > > ERROR: /home/pokybuild/yocto-worker/buildtools/build/meta/recipes-
> > > devtools/python/python3_3.11.5.bb: pgo cannot be enabled as there is
> > > no qemu-usermode support for this architecture/machine
> > >
> > > Which was intentional fallout: MACHINE_FEATURES don=E2=80=99t describ=
e the
> > > SDK so that this ever worked was more luck than judgement.  Also the
> > > python3 recipe will write the qemu-calling wrapper script using the
> > > architecture only for target builds, so we=E2=80=99ve not had PGO nat=
ivesdk
> > > python since the 3.7.2 upgrade in 2019[1] which changed this from all
> > > builds to target only.
> > >
> > > Maybe we should allow machine-sdk configurations to extend
> > > SDK_MACHINE_FEATURES and then nativesdk can use that?  This might
> > > allow the MACHINE_FEATURES to =E2=80=9Cwork=E2=80=9D without being ba=
sed on the
> > > target machine.
> >
> > Sadly I suspect we're going to have to go down this route eventually in
> > some form.
> >
> > > Alternatively, I can remove the pgo from the buildtools build, as it
> > > doesn=E2=80=99t actually do anything right now anyway.
> >
> > It was a decent win at one point so that would seem sad.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192380): https://lists.openembedded.org/g/openembedde=
d-core/message/192380
> Mute This Topic: https://lists.openembedded.org/mt/103129922/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

