Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F75EC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:21:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.81001.1705328465478890561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ek1SCUl6;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50ec948ad31so8260883e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705328463; x=1705933263; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JTkqvswuRoSwPxP7mlrTYVyBBYMtDFTzExxb6A9YfxA=;
        b=Ek1SCUl65FEB91zN2/amltLQbJ80MY9rLy4934x0zoOUN4koRJCy7mVITm2wREs1EH
         VgLqy+FozmkyeisDhbWuni+NRBAGwXG5erbVYZRwNKAmfXzNLb2+qiGuIZPLYb2OIUXD
         4u5xUAc4tnnXkNPnv4WMBtj861swY3JdfX04z6hqV43bfPvtRxyuyEM0NMBygvIbeSdL
         z+YQepnuy8mnXPtnnzxFzTdaGkk+AmNn5pwqcPiSIp7YzrlBCFEGuh547Ry/d7MCR36e
         d5lg2HSoOjxw2aITk+Zwh3amvqRbzQtvoIYFDJUCrZyIq8yhNQomdMC8KSVE3DALhXy5
         T7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705328463; x=1705933263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTkqvswuRoSwPxP7mlrTYVyBBYMtDFTzExxb6A9YfxA=;
        b=YwwyM4ELt1/w7KQcTcT9aoWY86iWE+phYG42OLeWZpvKo61kwra598r6awkxDHru2w
         tWMuvIlCATPA0Nn150tUq6p9TKNJJNPoW97zW/o0xn24oMsPJIedLZBRss/PuTuhqiRP
         N29UPOPRsuWwP4qusVmWornQYzicAp6aQls97fzKBr0wd+NbHi4zpVCahuR6Xwl5/of6
         us6gxW3KfxEMbDNAQWT5iK8VNX/xSeiGqeC9eaiFp31ilzTKDMrDVf68mVqROhAWsf50
         DYaETp0y6z8HtyGFG8lFZoa4bbF7qZnddhrqFhg7usCGbTAeaDG1cNcZpey1Nnvjhrt1
         VNag==
X-Gm-Message-State: AOJu0Yy3QTSBx0K7M5X7WQbW8VjR9cF3DUgEj7/dW7ebcDXoS0puCT2p
	FpBiSpTaVFKTKc0jsZzyUJIv9jDUdKKcWpIxI+rwAxpMjWk=
X-Google-Smtp-Source: AGHT+IFmZshk3zL+EpPmkxgdcVnCsGDDFvyZmLjgluuXX00icYEUIcH437DRQLy8i0ZTBzm4v18XM7rLv6LSYfKNkUM=
X-Received: by 2002:a05:6512:28f:b0:50e:7fa7:9c68 with SMTP id
 j15-20020a056512028f00b0050e7fa79c68mr2203682lfp.139.1705328463320; Mon, 15
 Jan 2024 06:21:03 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
 <17AA7149AA53F0BC.13033@lists.openembedded.org> <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
 <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
 <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com>
 <17AA8A5B1D8D95A7.13033@lists.openembedded.org> <CANNYZj-LNrV6kJiyGLej+jy=7W-eoxUX9DX5wqf_jV2oJ2R7Jw@mail.gmail.com>
 <6514ea985fa4a0882142469baf10dd4e349f8b64.camel@iris-sensing.com>
In-Reply-To: <6514ea985fa4a0882142469baf10dd4e349f8b64.camel@iris-sensing.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 15:20:52 +0100
Message-ID: <CANNYZj-dN3c0QU7LQd24TbMKShuSAQXXcPpj2QbU9g1YcT-dhA@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: "alberto@pianon.eu" <alberto@pianon.eu>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193685

Alberto's commit I was referring to is:
https://git.yoctoproject.org/poky/commit/?h=master&id=ef3e46afd910d4b7727d42c4c18b501525c65695

You can also dig up the related dicussion on the bitbake list.

Alex

On Mon, 15 Jan 2024 at 15:17, Jasper Orschulko
<Jasper.Orschulko@iris-sensing.com> wrote:
>
> Ah nice, that is definitely something we would be interested in!
> Alberto, would you be so kind to share some details?
>
> On Mon, 2024-01-15 at 15:12 +0100, Alexander Kanavin wrote:
> > On Mon, 15 Jan 2024 at 15:05, Alexander Kanavin via
> > lists.openembedded.org
> > <alex.kanavin=gmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > On Mon, 15 Jan 2024 at 15:03, Jasper Orschulko
> > > <Jasper.Orschulko@iris-sensing.com> wrote:
> > > >
> > > > > Sadly it wouldn't. Auto-generated github archives are known to
> > > > > be
> > > > > non-deterministic, and we even have a qa check to ensure no
> > > > > recipe is
> > > > > using them. I didn't raise this point because my objections are
> > > > > on
> > > > > the
> > > > > principle of using release tarballs, not this technicality.
> > > >
> > > > Ah ok, that is interesting. Could you please elaborate on the
> > > > non-
> > > > deterministic nature of the github archives? This information
> > > > could be
> > > > vital for the Osselot project as well, as they currently use said
> > > > archives as the data basis.
> > >
> > > https://lwn.net/Articles/921787/ covers the subject well, I think.
> >
> > Oh, and before I forget: Alberto (in cc) has recently done some work
> > in bitbake to enable file-level source tracing, presumably for exact
> > same purpose as you are, so I'd suggest you discuss what kind of
> > approach he envisions (or maybe has implemented).
> >
> > Alex

