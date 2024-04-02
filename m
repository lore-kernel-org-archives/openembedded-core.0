Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C0ECD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 16:51:23 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.126.1712076681911492063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 09:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhEmHUmY;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c3ca3c3bbaso3058851b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712076681; x=1712681481; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NseYEsfjoQnDqZ5KPu9LSR7i5eSVLrP0qC108sp/yWs=;
        b=fhEmHUmYyEI8CdC0W3GRi9J6xf9tKbLmZ2Tk2Xgbc+PzzbAVxh+bWeofsWX7674Tgn
         ePQeG/GM+mxxH1TMHJgW4N61rum1tv6VBnjwAWQu+SammNxv0DjJ6nzr+t+O/pbPHKDw
         rY1/IRIRJVI7VJGFkjq+zxix7yGBSjHNptqgS4ZVXBpNPAiPWATAllsea7GKDIrG1czb
         nQWm1k+p724hPCnorI/2ML++IGhkXyZidmdU/YWh8BBCl4AWV4nS7GrZu+Ck8kgoK1Um
         qjgtHSk/UEx39zKo6Uj5qdwTmkiXejibXK3WRlbNPUDyvVStrqw44aIaNtHNr2XvdsTT
         3xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076681; x=1712681481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NseYEsfjoQnDqZ5KPu9LSR7i5eSVLrP0qC108sp/yWs=;
        b=w/0roBKnaBG54ps/YQBeSVoRW5pLYfvm29M/lYB+Fvd++e93FgQcqmqOIV7Iriy9rB
         y7LwRtCkaqhVyQrtj5AVgju+WA0LL8BIepRpEqzizKS85hkU51jK2/OxYFxAK7+BzMX+
         t0bVCsV35gVm31umLNicEC9vopVGjF/DXUzuvW+3jpwmGkPp2HA5Q4UVHDud3bTKGGCX
         F7F870f2Z0HdgGSVQ0e6dErV5eEmlSw5jxNFKqQyVXDq9fsSwj0wKS50AwuhvWHtlIUl
         TGxiW7IxVZ5vrZtotC+gpyWkMAcDUXBgr2WGT92nlFgvcDnTc/lbMU9Wl+RbAh8wG0WR
         M1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaL1Y1bTRpVsT7wdVagis33JCfXZgKG/Ts+dDb0n0UBQUVz8H66mV7RnU4nOQNdyDqSlNxMjrVmoUnwU3h6Zd0lCsPRZxE8C1v8+cNttw8Bk/uWtWST0nU
X-Gm-Message-State: AOJu0Yz/RGJxZf76TbCByOxBR2Rlj+qTHHUYeQ4l/fPd1OYxZ93e0UJe
	LXNbyfkFR8gXfFxKsyby/AXsPrYZyAltCHm8TVm1fG030smLoR4rtHUtUCeSr5VJvBrw5GKyYl8
	xRtREuB4o7XZpu8iD+z57pHQCTM8=
X-Google-Smtp-Source: AGHT+IFl2AhDLptvaFCPaqL6ZfdfVLiv/xmkvS6UWI1X9QiDOXpjiprYntRGaNvoirtm8u8IRd+891Xh68lCfKrBhjk=
X-Received: by 2002:a05:6871:7813:b0:22a:5690:f05a with SMTP id
 oy19-20020a056871781300b0022a5690f05amr13970489oac.24.1712076681091; Tue, 02
 Apr 2024 09:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
 <CAMKF1spGJ_JjvgHezfhaEwuZHAmnyzK2vmWvqGps0AwOfbz2pg@mail.gmail.com>
 <74eb50cf-730d-4627-bfb0-4e45877e6ee7@windriver.com> <4d5d50b9c079b6998f773a651c8c06e764c3e362.camel@linuxfoundation.org>
In-Reply-To: <4d5d50b9c079b6998f773a651c8c06e764c3e362.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Apr 2024 09:50:55 -0700
Message-ID: <CAMKF1sqEcreVccQcwxWikHDrr_EX4vcHVYJ0AUr5z22necOLiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 16:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197873

On Tue, Apr 2, 2024 at 7:29=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-04-02 at 12:45 +0530, Shinde, Yash via
> lists.openembedded.org wrote:
> >  On 02-04-2024 01:28, Khem Raj wrote:
> >  it would be better to disable them just for architectures where it
> > > fails since it seems to be a workaround, it would be good to keep
> > > it
> > > as small as possible
> > >
> >  Initially, we implemented the changes to handle only for
> > architectures where it fails and reviewed it with Richard in a
> > meeting,
> >  but it was decided to skip the test cases rather than doing hard-
> > coded changes.
>
> You could make the application of the patch conditional upon being the
> mips or powerpc architectures.

I think that will be more hassle than disabling it for all architectures.

>
> That does have advantages and disadvantages in that it is easy to miss
> when upgrading the glibc recipe though.
>
> Cheers,
>
> Richard

