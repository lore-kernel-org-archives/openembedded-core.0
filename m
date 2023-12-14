Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E694C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:49:48 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.22470.1702561783871298762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0qx4pai;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ca0c36f5beso106689561fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561782; x=1703166582; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMkZEu0it/33uLujsWs4umZkYB71isq08fWafkDK0mA=;
        b=G0qx4paiPwnDWCJ7jhcqzUbw14LSKuYPMXW7bKUkSjFGUVbL52ISt58VyIMcHfTs+V
         NA130KTJAIzmR7g1SZefwAWhApuPcMSGOz7vkzjkTVuT7yVWQEKCX9oh81Urdb5bJ0hw
         I26AakdC1SpUChPhCvV1qf755MV0K5uxhBPNLxQsgoD/+1L077Oz45naaQzQhtaH6TWY
         2eWQMSXHThrlmVfj+l9BPxyw9pyUrHTxvylUVDSUXrlgXoeguwLX06xkrqC6YBojzJl8
         69oo18bCrvbis2WIMoCNTUgth32Uu1VLdcimrJl3mMrpD+UEX7EXQqSgG+ocYbuwFxnJ
         vhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561782; x=1703166582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMkZEu0it/33uLujsWs4umZkYB71isq08fWafkDK0mA=;
        b=fsd9Fi23Wq+fIZ/sCsbZXkRHLhV2oPtKgSSZqs9BqPujtVOk+OHqMT3X3BOO7Uc31Z
         cMMH5SdZzsQThAn4A+Osgg26mVFRDXrenbyrd1fVW/tyPLF4tBLTStifaiGuBsoIx9l5
         lMP1RxbWIm7dPpj8mwZrq6wGGWChCXSrYjOvzDn5LkzfF/uFy0WYI+bt8xcus5l0awOV
         bxNKakeSVhXeY9djMCKBkTxcQ1JN84I4rM144RwIkL/9S/xTn1QffiHgk4TfIFp5gTi9
         uX5TNkpm0jZo6RdhG7bgIQsb+mJ+KECqC74uVAa8rSatmsnUVaz6Rt2N9HBeq51pxIHB
         YMcA==
X-Gm-Message-State: AOJu0YxuMfyKtAWu34iWehhh5Ect0JXBpKHSlSOxG3Vs6GA4TrAlcMKH
	Ykl2VuXqr0Oj2rrIG4Prh/2nSKeI/KYRZvrORhs=
X-Google-Smtp-Source: AGHT+IHsUY7fGFZmlbr+e9PHOYXsAVfxxuw9zH/Kjm211BWRzET473zXu7vFgZL9Sa5sZQn/SDjOmxmojHGr2aoprzU=
X-Received: by 2002:a2e:a805:0:b0:2cc:1e83:65ee with SMTP id
 l5-20020a2ea805000000b002cc1e8365eemr5763163ljq.56.1702561781841; Thu, 14 Dec
 2023 05:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20231212140820.2900963-1-ross.burton@arm.com> <20231212140820.2900963-2-ross.burton@arm.com>
 <20231214074932cba7c5f3@mail.local> <812D443A-B8A1-47A9-88A7-80877EE659E7@arm.com>
 <9e88162576e34bce6d698bc8ef84ce2da6e2ba1c.camel@linuxfoundation.org>
In-Reply-To: <9e88162576e34bce6d698bc8ef84ce2da6e2ba1c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 14:49:30 +0100
Message-ID: <CANNYZj_2zMc8i1jM+M=O=2RJNhqCuZacrT62ewvyTbj-7snpiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/9] nativesdk: ensure features don't get backfilled
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192380

FWIW in the upcoming python 3.12 update I have removed the pgo patch
(0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch) with
the rationale that "pgo support has been rewritten upstream and needs
to be reenabled and tested separately". I simply don't have bandwidth
to make it work, with a ton of recipes in meta-oe that still need
fixing with 3.12.

Alex

On Thu, 14 Dec 2023 at 14:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-12-14 at 13:31 +0000, Ross Burton wrote:
> > On 14 Dec 2023, at 07:49, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > Not obvious but this is the cause of:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/869=
7
> >
> > That was a fun rabbithole to dig.
> >
> > The error from the log is:
> >
> > ERROR: /home/pokybuild/yocto-worker/buildtools/build/meta/recipes-
> > devtools/python/python3_3.11.5.bb: pgo cannot be enabled as there is
> > no qemu-usermode support for this architecture/machine
> >
> > Which was intentional fallout: MACHINE_FEATURES don=E2=80=99t describe =
the
> > SDK so that this ever worked was more luck than judgement.  Also the
> > python3 recipe will write the qemu-calling wrapper script using the
> > architecture only for target builds, so we=E2=80=99ve not had PGO nativ=
esdk
> > python since the 3.7.2 upgrade in 2019[1] which changed this from all
> > builds to target only.
> >
> > Maybe we should allow machine-sdk configurations to extend
> > SDK_MACHINE_FEATURES and then nativesdk can use that?  This might
> > allow the MACHINE_FEATURES to =E2=80=9Cwork=E2=80=9D without being base=
d on the
> > target machine.
>
> Sadly I suspect we're going to have to go down this route eventually in
> some form.
>
> > Alternatively, I can remove the pgo from the buildtools build, as it
> > doesn=E2=80=99t actually do anything right now anyway.
>
> It was a decent win at one point so that would seem sad.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192370): https://lists.openembedded.org/g/openembedde=
d-core/message/192370
> Mute This Topic: https://lists.openembedded.org/mt/103129922/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

