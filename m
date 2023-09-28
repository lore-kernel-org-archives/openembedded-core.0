Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297D5E732F4
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 16:49:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.18445.1695919794033581395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 09:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PnPlO/Ui;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-405361bb9cdso134223215e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695919792; x=1696524592; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GCCRuzAD5lGi58L/t6pFVomOHLjem4H6Me909zPv/IM=;
        b=PnPlO/UipP/d9DvKZjWTDHLkgVFrcqFUQqoVwE6xglTBluzm6LOikA7/KQR8d1Pqgy
         CnA7X45AaIehndaLl0Fq3ZYBMDrun/Va/OJ1r6ut+cv5W8sv+AiAogmC19ShxS66zGsX
         KL7WHmtuyfwNBMrnr/W5nGH7ejB+wieiZ37o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695919792; x=1696524592;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCCRuzAD5lGi58L/t6pFVomOHLjem4H6Me909zPv/IM=;
        b=LJYnv8A/MHlJKjhEhqQ6vVqNiJOIF3HU3ncFfGgVowOQ5bN5v+BwfPsStVeqWur9YC
         IpWxiBv7A4uyYXO2HGTtsesp8qwIDwDb0PZ2VDf83jwStbI4MktNtRj5lP3SkhF+c8XM
         Sjnxhc2GIdVHiuTxoWCkBJP+PmPDlwjQreo41e0eFsoRixdn8y5cNZbfwwWO/B0nPWVF
         BU/z1wK4RwGpGwRI72qObAvXSNpL/IIqcxEGXCQiqZK0sqMLxrgVfzctfCR/M8hBQ0eZ
         f8tGdSWyTKiVjo1+wFqKbW7yYrSW45iBF66uiYnEDQeddReCvQq0/QAROtrO+SphJMl6
         NHrg==
X-Gm-Message-State: AOJu0YzS/bftpNxQr2rJ4pXh/fgNA/uzNlBSGIL0wgMapLYknvNnVe4+
	+Wy8ETxCy7UOD//kXL8L42F4+Q==
X-Google-Smtp-Source: AGHT+IEMmyOmGNo0sjiy7UDF3sMt+pDDFxI1BUlbUsFPM3vaOgco5A4yC7gV7nHLNdXLznq/rOQLeA==
X-Received: by 2002:a05:600c:249:b0:3fe:1232:93fa with SMTP id 9-20020a05600c024900b003fe123293famr1688637wmj.22.1695919792397;
        Thu, 28 Sep 2023 09:49:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93? ([2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040535648639sm20392155wmn.36.2023.09.28.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 09:49:51 -0700 (PDT)
Message-ID: <7564ae2b6c036b10a35e8c9927c0ab2cf533f35c.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, 
 ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Thu, 28 Sep 2023 17:49:50 +0100
In-Reply-To: <CANNYZj-YBTN_yje-fyzp12YDF9XMaZSuMvLh6qA1H+9GEYEmfA@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
	 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
	 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
	 <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com>
	 <24b60007a669d075fa1e4ccd18980ada93714c7a.camel@linuxfoundation.org>
	 <CANNYZj-YBTN_yje-fyzp12YDF9XMaZSuMvLh6qA1H+9GEYEmfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188375

On Thu, 2023-09-28 at 18:43 +0200, Alexander Kanavin wrote:
> On Fri, 22 Sept 2023 at 12:42, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Things which used to be problematic:
> >=20
> > a) changes involving changes to gcc-source since it uses a shared
> > sources stamps which confused the tools (at least used to). That may
> > have been before gcc-source became a recipe?
> > b) changes to a very common component (e.g. autoconf-native's
> > do_configure) which make it hard to understand where the root cause of
> > the changes came from
> > c) changes which affect many recipes at once, e.g. the do_configure
> > function in base.bbclass
> >=20
> > It might be helpful to write test cases for the scenario you showed as
> > working above and some of the ones I mention above, then we can
> > document they work and have an easier way to add tests for issues
> > if/as/when we identify the problematic scenarios in future.
>=20
> I've now written down the tests for these three scenarios and got them
> to pass (in oe-selftest too \0/):
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/sstate-for=
-all
> (check the commit message too)
>=20
> I am going to look closer at bitbake-whatchanged, what it aims to do
> and why it doesn't work. I have a hunch it can produce useful high
> level reports, and so shouldn't be simply thrown away. 'bitbake -S
> printdiff' is too techy and verbose for some use cases. Maybe we can
> fold that functionality into 'bitbake -S whatchanged'.

I've wondered if we should split bitbake -S printdiff into a separate
utility? It exists from a time before we had bitbake command APIs.

I'm curious to see what you find with analysis of bitbake-whatchanged.
I'm also somewhat surprised the scenarios you're testing all work!

I'm guess one of the commits I pointed to must have fixed them (the
removal of paths from the sig files)?

Cheers,

Richard

