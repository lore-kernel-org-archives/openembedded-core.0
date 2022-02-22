Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79728C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:35:01 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.1325.1645554900662928147
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eK4R2QT1;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id c7so802746qka.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kn2BQjaanpfgTk0d3XWBv3ByVU4iuTseevf/4tuFPN4=;
        b=eK4R2QT1CX/FzYhrWE7N1anETg4B2jduCPpuRKyYx8KHK4RMn0HyNwZYkgjE33dGiR
         XN6yrDNAxnq0iqWdJt6nQaiqhDb8I5lHxrE8g6L8G5Dio2aDlcLY9QZl4wJW8s75LvdJ
         G/fwqdqCUzLFpw3Dy9rBFhH13rH1R8fP9gDll9veLAYnnX+WZuJqGt3A3kZsvAsxT/A/
         z6F8i18ePeaMDsAmWhoKYZOHtLtq0DyLMBAU2K4E7OH/MoV/k83t3dADNugaVtgEtlUC
         8SiobHXHMcdjvkwXc6Uqhv+zNNU4bZ/IoghFhrGaXd6gRrVmSNP6NNyi6AL3CvfBFqmB
         BwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kn2BQjaanpfgTk0d3XWBv3ByVU4iuTseevf/4tuFPN4=;
        b=1qgpVLrn6CDhUx6/Va72y5KR9kjepplARXHOeZabCj1LCJfPgfSgSz+bWCKHBYQrcq
         7f6MoA1eO8B+04PjOx5kITLDmps+7239yU0JvG6DFRzd+14q3nXc+MqcntUJA4PNTQKR
         nBDBqEpjnN26RlB1v2nX8oh0guyd7xS3220OSyeOtoDid0kNM/DnDzOLFlB2uqmlVYXY
         5N2KOtlqGiyUGN3T0dXeoIRL5xbi4QfQJaSCWeZWNN809Sp9VNen7nsejHeutG4jGVc6
         mVUMzVz5OwFMyoSwrGve2ShpXS5vwWiSgE25tWxRtQSxOFaF6R8DodC9W0A3GX86bPSO
         8cqQ==
X-Gm-Message-State: AOAM5322jH6MOsP2lUtzJ5PzT3+z9Vb0odxsHiYbBNjJFD6kjDNajrsk
	ZB2hVncB6nr4J/VytMGfJkvnw/mlYeq+vbiGDkk=
X-Google-Smtp-Source: 
 ABdhPJxUNMqpWIbOOY17YXdcSFkhaLH1to/2Qh1fwjc94acQ3zJFBhYFAWmclXn3UzK1nLPQXZrFkj0YOvd3SLrg0OM=
X-Received: by 2002:a05:620a:817:b0:648:d856:3fdc with SMTP id
 s23-20020a05620a081700b00648d8563fdcmr7078490qks.180.1645554899352; Tue, 22
 Feb 2022 10:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
 <CANNYZj_G4Y0=sO7j7VaPeLc8gF6EFGwnuHTKcXhouTKmzODoog@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_G4Y0=sO7j7VaPeLc8gF6EFGwnuHTKcXhouTKmzODoog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Feb 2022 10:34:33 -0800
Message-ID: 
 <CAMKF1sp6c40ZRaBkkpAo+wdmcRd57TKZEk8xADpJCt8SPmmdEg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andrew Jeffery <andrew@aj.id.au>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 18:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162187

On Tue, Feb 22, 2022 at 6:24 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 22 Feb 2022 at 13:28, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
> > > I have to note that YP does not support ppc systems as build hosts;
> > > can this be kept in a bbappend?
> >
> > It isn't official but there are obviously people using it. I think we should try
> > and do something in core but there is a question of how we maintain this given
> > our infrastructure/tests don't cover it :(
>
> Worse yet, there is no way to test this locally either.  If the ppc64
> binary tarball checksums are added to the core rust recipe, presumably
> I'd be expected to update them together with x86 and arm64 binary
> checksums on version updates, but I'd have to do this completely
> blindly with no testing of any kind :(

as long as it does not impede main testing I would think thats ok and
we can expect the OE community
members like Andrew to test this and report issues or better fix them

That's why I am asking to keep
> them in an external bbappend.
>
> Andrew, how hard is it to obtain a shell on ppc64 machines nowadays?
> Is it something specific to your employer?
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162134): https://lists.openembedded.org/g/openembedded-core/message/162134
> Mute This Topic: https://lists.openembedded.org/mt/89310363/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

