Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B85C61DB3
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:27:06 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.92283.1673627219414320654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KgXmHfW/;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id d22so1890629iof.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 08:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EEsqfB8CnWerYJkLfvvGpPkwnyj3RRIJ1Z84zIyz0L4=;
        b=KgXmHfW/9JrBL5f2c+4vniIh191mdeIHB5g1dbxdQw3yMI6eSVKyma9ykQ1VDnvY1j
         gor59aBnpgU4XZtSvJu5qLVy1ftk8faTXz6JuP5rxCGGhQqPWrF2E6+ebm+J4LlwpDYN
         AdxA+5G4Z7DGTqdY9C4jXkHud1xV/EZlOJapLWSv1OdHAVN9Ic7Fo6Zj28+bEUfKasgS
         2nzvug3XPlIc184XbhM8oUFOFGVify7g1mQfbm3WkdYWVsMjy/SU7WesHjeOKiOp3SuZ
         m+fCNh9nhEGTjjxKd2IuM7baCikJMNirQtqyLStIh5W2Ze9Uf2I3/H01ohJ1iYLdSi7a
         HngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEsqfB8CnWerYJkLfvvGpPkwnyj3RRIJ1Z84zIyz0L4=;
        b=VbOFZYhHNdZF/twfIrpt+DxMjhJz5qoy0bcDdOyZIR8q/G3/4B2rZZcOlKleUkQFxj
         ODVIEh1nLYbOKv98Dfx7MhNlyZ/AuebS2yq6ItCX36FaWkEkX0ghTnbBkY9lZ8gWcMwv
         p0y864Pc48khii7xdUJYL/J51w1t5Ofxm3TWiUltS0SIu4Coj0EkS3uY2eZheH18D10l
         NTvNRS68iaMUOUjKQTYHUAm+L+aE6JVyTTH4RZ+Uu//SBzPlGf7QYyiT77SXEfSV0iZl
         o+d/pm47gPUg3tJCb9fpP6/8bA5zCm5NGScQ+4OAAdULNo21xoFFKdYsmmJdjtP+1OEn
         BtyQ==
X-Gm-Message-State: AFqh2kr8NoINxBhl2+KAsXbhEgTx3X4viGzSiMTraNyFyUbY1uNyZBOA
	gr7hia5KuxFFPMthTyVMBiljrZY2RSCSH9TEk0o=
X-Google-Smtp-Source: AMrXdXvgv2+mFwsuZKtHTOcc2raBUimGNTjPlYAeHYvATKByjJaMq01ci8iyxMBVRORZP5Uo4l7/rZl881sfMEv6mSQ=
X-Received: by 2002:a5d:9657:0:b0:6e3:628:bec with SMTP id d23-20020a5d9657000000b006e306280becmr7701709ios.83.1673627218750;
 Fri, 13 Jan 2023 08:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20230112213301.11768-1-s.zhmylev@yadro.com> <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
 <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
 <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
 <2ef83acb208a3e7222b699a6ecf894b184f87444.camel@yadro.com>
 <B94C4C10-689A-4105-93A1-0DC0EBA92161@arm.com> <77a8632e7d40624f3af87feba2adccaa986390ed.camel@yadro.com>
In-Reply-To: <77a8632e7d40624f3af87feba2adccaa986390ed.camel@yadro.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Jan 2023 11:26:47 -0500
Message-ID: <CADkTA4PaweaFXFMcpLO28auC0YfJAQatet8GHTWaN4pC=+jC7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 16:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175837

On Fri, Jan 13, 2023 at 11:01 AM Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
>
> >
> > What is the use-case for this level of control then, and why would it
> > be specific to RPM?
> >
>
> Despite Alexander's words about this document, most of (I suppose,
> actually all) wide-used rpm-based distros use the same well-known rpm
> packages naming convention: red hat, opensuse, centos, oracle
> enterprise linux, fedora, ...
>
> There are a lot of useful tools in this huge world of enterprise-level
> distros, especially all those staff related to static security
> scans/audit and around SBOM collection and processing.  Those tools
> rely on some basic rules of rpm naming for their analysis and do not
> handle architectures like "genericx86_64".

You mean things that the Yocto Project does itself ? :)

My humorous answer is on purpose. If there are gaps in the tooling,
the project is interested in filing those gaps, and doing it in a way
that anyone using the project could leverage. Not just the users of
a specific packaging format.

It isn't that we wouldn't want to enable that sort of tools / packaging
capability, but if it opens us up to complexity or other issues down
the road, it needs to be carefully considered. Which is what the questions
in the thread are trying to determine.

>
> I.e. this level of control opens for us a tremendous window of
> possibilities when our build pretends to be a mature distro.
>

FWIW. I would not characterize a distro created with the
Yocto project as "immature".

Cheers,

Bruce

> BR, Sergei
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175836): https://lists.openembedded.org/g/openembedded-core/message/175836
> Mute This Topic: https://lists.openembedded.org/mt/96233100/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

