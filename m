Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5744AC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:22:02 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.12425.1742401314454759189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZFp6RlkC;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3fa6c54cdb2so4716253b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742401314; x=1743006114; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYFKPyafj3WpyicAXPlDySGn2Rs/bQOmTS+SRiU1YRo=;
        b=ZFp6RlkC1gE3Z7c3FAGaYYBWZkcadYrqRriAtqI0U+sZ4cnWZCBCj6e+k+9mAjqUhu
         R5FIxeuEABzBIFENHSsGiCQwAYxhL+dbvvLfdAzvshWSUxUV5Lvd1qkWHscqRV8ODzw4
         4wknHdvhbsuEi5aTCKGykbt/EfhEmTPlDvGD+zAoSNqkIrRElasM7SMpth8OGDckO23s
         4StXPwa0MNKYR9I/vf6kABCJFQuF2KdaL64zu24oxnxf8BcVwAQDAlsFVyidaQnaTpMp
         bVIWcx56K7kw0+2SvnWaprs5gEY3k4CzggNr3a3XOxU5YbOyi8DgM03//CD85cjPVLyU
         Zbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401314; x=1743006114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYFKPyafj3WpyicAXPlDySGn2Rs/bQOmTS+SRiU1YRo=;
        b=Pr6kwMkicjExmJ2iRgn8lKQFu9gbHt1yXaZ2Ac+fHhW7qnp9MuyaDAvtf+2RNLx8/Q
         kXv3rNuqIiQWHeNzsLPkDropuB6w/ooAi65y4Po4R1G65umRJpDnGDylnLXnAjmY5ABw
         0qX/wisd0U8lZ0spfbQAOSeTnEu3nHC3yrdXbv2TFiz+oaM4cwb44I0k3rHuqsxKL/Aw
         RajkjkJ0Lqq4T5zcaV3ttEp0El3SQJvvetl8YPOLosY52r7xj4FuBcpX+itM3C786c7Q
         g3z+/6+1kBKY4R4BJLfhxaNuYSxbTbhcEh8aAicQyPy4I5F2dqL2wQemEamFEcdGn1+j
         Wptg==
X-Gm-Message-State: AOJu0YyS7Zb1eOlaJx8dbw1RuLcgHfKjGMgIXP/eCCb9l2hzEA7X/CWu
	lqZyrlRm+Aqkq7LjRDjlSPUFxmV2k27kcyr4mjXVLfwPKzHlbxuDawbNQJz6c+f+0OIbOoERc57
	i8WbehZfFM7k7DS5OPN98v6iOarg=
X-Gm-Gg: ASbGncvg0dKMJOtc4jOzPPHGsTECA5SpQVB2tOCPxjItxQX5Dpei5Jp511Xdb6fgG6z
	D9nx9HuL/NssxZO/otl+LVPiGFneVx1MDerwPipYtUf7eUq0OB4xun6IKaZT7YDNq5ZQRwqbUEE
	7sQLWWcyv38dxXOxwUF+8D8NR9
X-Google-Smtp-Source: AGHT+IHWjoNm15wiM7LpLYU8S8QrgfQednqOTDT5AwsN8eYWpmnHIx4iuUNhMvR326hN+3D3gzsbab4o6E4/AU6s07E=
X-Received: by 2002:a05:6808:1887:b0:3fb:e9d1:9548 with SMTP id
 5614622812f47-3feb4b805b3mr50140b6e.26.1742401313679; Wed, 19 Mar 2025
 09:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250319081610.3536475-1-raj.khem@gmail.com> <9f97a4f6c9b8a5bc55f862f69012bb9e8d11a1b9.camel@linuxfoundation.org>
 <CAMKF1sq-BajTxiE+BwkyyZbo07JiN3OxrcrprMvZubjVcGguKg@mail.gmail.com> <b825d8eb3f5ba20b9ae2ed2b76d7cbf0889e22db.camel@linuxfoundation.org>
In-Reply-To: <b825d8eb3f5ba20b9ae2ed2b76d7cbf0889e22db.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 09:21:27 -0700
X-Gm-Features: AQ5f1Jok8Gwitg3QRtl3R1UnPTIrwFVUpPajW-3nrC6nCVjNYoqQYdIFixblu6M
Message-ID: <CAMKF1sq487JEOzbipbTg0=JTvMyCM+wzE0yWsNkFhjJvnqR36Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/27] webkitgtk: 2.46.6 -> 2.48.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 16:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213345

On Wed, Mar 19, 2025 at 9:11=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2025-03-19 at 09:07 -0700, Khem Raj wrote:
> > On Wed, Mar 19, 2025 at 2:40=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Khem,
> > >
> > > I appreciate this patch series is a work in progress and evolving but
> > > it is creating a headache for those trying to help merge patches.
> > >
> > > The problem is that we have bits of this series already going through
> > > testing/review. We now have a v3 and no idea which bits of it have
> > > changed. The logical thing for us to do is throw away what we've done
> > > and start again. If you could give an idea of what has changed that
> > > would help.
> > >
> >
> > Yeah, I was trying to hurry a bit and pulling many strings together,
> > sending patches upstream, addressing that feedback where needed and
> > also ensuring
> > test combinations are working, probably a cover letter would have been =
better
> >
> > v2 - Address feedback from Mathieu and Alex except ncurses and man-db
> > patch, fix webkit to work with clang-20
> > v3 - man-db fix is enhanced to address root cause which is musl
> > specific and had to do more sadly, address ncurses issue
> >
> > The good thing is the changes are done now. I do see some parts of
> > these changes are already merged so I will send the remaining in v4
> > after rebase.
>
> Sounds good thanks. I did go through and tried to isolate the bits
> which hadn't changed and had been tested.
>
> I've upgraded dbus-glib, could you check and see if the new version
> needs gcc 15 fixes or not please?

yeah will factor that into v4

>
> I also merged fixes for the libmatchbox and psplash recipes so my
> patches should replace yours there.
>
I also see you have bluez5 fix in master-next as well, I will drop
that one too in v4

> Resending what is left is the best way forward once those are resolved.
>
> Cheers,
>
> Richard
>
>

