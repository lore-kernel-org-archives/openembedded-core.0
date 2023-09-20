Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFAECE79DA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:25:42 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.41025.1695219940802045453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 07:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Fof4ByuL;
 spf=pass (domain: baylibre.com, ip: 209.85.218.50, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9a6190af24aso933866766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695219939; x=1695824739; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1YaeXw8zcBj6Ioc08NInIbeNUOLvSIAgtxVqtKStpk=;
        b=Fof4ByuLLdOhZ/2N3DLYQ7zLGQf4rAFUjwtP4R37v3uzeo8kt+QN6pMfmJDmqYsJSF
         0ZHWIcEeSyETaZd6msRB/TBdWjgCw1cfGLidcmzY5Q75BYytSVXk0gHha/2sn5dFKLC8
         Dcihni0GFbzUkzJl9+kFb6ewyaE9GtbtoUqQUBdlT6SeqYKTfetaZixkJFIE2lrTNNWI
         VNyItdp5Cw5RhQzspSjfRPuC2yeafb26RQynIiigsjW4ZDxEmgCb5aF6qrlL4n+ionD7
         pQIn+rH1JGCijbPlBS8tPcKd9JvDuO4DrwKAY2m4egX7VLKSClaWqsjxN8JOt2gYgXku
         Iwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695219939; x=1695824739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1YaeXw8zcBj6Ioc08NInIbeNUOLvSIAgtxVqtKStpk=;
        b=fpOLqucPNxZVgPaK+j60P9gVZAkeQtJWJodjZig6lSs51hxbU96IgfEMUuVk+F/L2o
         EtopRATm/QTPsTppIZPT5NWh/ZH71QCBnsRjcS67Rkyyk8BlteJIfdqyw8/wofl4L17n
         +fLl4bKdEG621lWiL6pRCvFU7j80GJ4kCNk6cxDlpWXNG/KSxudC2MBWFrmgivGXTuRf
         ndSgjDO49fdAdpYCJtnrp1x5Pg/yglPWOXceVDz8rqZd6oxpuCBzzEjOMewydYJ5A8Qb
         OVyR8VTG3NehOaG1YSje43xRbdIxCwRMwZtzb7rTZ65zo0za3ivfjZisPKYTP4lN53eV
         o0VA==
X-Gm-Message-State: AOJu0Yz8sT4aQ4n82jnNrTdlrVon7D9NljnjErKjvFhzcY9EWJxt+hUP
	RVRgVj4JwRWUouSxqoZtypPc+AEytGd3Wj6L+tgYww==
X-Google-Smtp-Source: AGHT+IGrjGDUv8VGDD/kyHZlbXSTCs+DISj8UBEFP+M0AlP/wr9d60k/lcoNKASPiVFPAG3fmcQ4b+7sEwMDYSoUV5c=
X-Received: by 2002:a17:906:74db:b0:9ae:48e7:bac9 with SMTP id
 z27-20020a17090674db00b009ae48e7bac9mr1946976ejl.52.1695219938937; Wed, 20
 Sep 2023 07:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org> <CANNYZj9mekKZwHs839m3r8sYbTiTLPaqzP=8C_-9=4w6MiJTaA@mail.gmail.com>
In-Reply-To: <CANNYZj9mekKZwHs839m3r8sYbTiTLPaqzP=8C_-9=4w6MiJTaA@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 20 Sep 2023 16:25:26 +0200
Message-ID: <CAEHHSvbb9O_5zOBWvae+sCCouW+RyjMY+J8wOdtx2jixwFqN5A@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 14:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187926

Hi Alexander,
About bblock tool: I just force pushed my branch on poky-contrib
(https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bblock),
trying to fix an autobuilder issue reported by Alexandre Belloni.
I am still working on this, and I would be very happy to get this merged :)

Cheers
Julien

Le ven. 15 sept. 2023 =C3=A0 10:28, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> On Thu, 14 Sept 2023 at 21:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
> > Effectively those "configs" are what the eSDK is, you're just proposing
> > a server side set of them rather than a built copy. In many ways that
> > could be useful way of possibly rethinking the way the eSDK works.
> >
> > So in that sense I like the idea, we should just be clear the problem
> > it solves as it doesn't solve the "why is my build not using the cache"
> > question specifically but it potentially solves other issues.
>
> Right, I didn't make it clear that this idea is not about 'why sstate
> is not being reused', but rather something I thought of to avoid
> placing people in that situation to begin with - offering them
> 'pre-fabricated builds' with guaranteed sstate availability. I have a
> hunch there'll be plenty, for whom this is just fine, and eventually
> this could be the basis of that oe-setup holy grail :)
>
> I'll start with the simplest enhancement of printing what would be
> rebuilt. There's a lot of code I need to understand, so this needs to
> be in manageable chunks :)
>
> Alex

