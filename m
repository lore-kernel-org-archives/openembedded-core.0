Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FCDEE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 12:28:28 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.6667.1692707303321896999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 05:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J+pB2rcQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ff8a1746e0so6744545e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692707301; x=1693312101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UGb3HgHXvPBBvTkz0ab8AtQdbQfRfarWSBV4AiSK5fk=;
        b=J+pB2rcQBjfNOgwwOwit/bzI7scPugpl7tp8QrEkhNebiYDfozflya15oToHz+LpGW
         DTgh9BPQkLn7GtXIZlxMBeift+E1+FqW6B4a1CPQ4SuOgFq1pkyvThRPnoh/DwrdmrzU
         KfVlONPl6WmoIaXszIOwTatDr9yW3JZT85LRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692707301; x=1693312101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGb3HgHXvPBBvTkz0ab8AtQdbQfRfarWSBV4AiSK5fk=;
        b=ImbDOmRicI0BFGPn9slncXwvr5DHKZDsZ4po6jmbZLn04ljoL7ud7dQJB6JTnSklpW
         wllF1W8OxoyI46z36Oh0fj4U1YY1lHc3GZGwPYO9RCCieWSpNj3MH3SqgVJMn/ioIuYc
         +uD/pqia6fFXrQplTZHJs0Bcvdo5jpDz5YYRHv89IfQEfXhFpXNNGULTn353SU6g9jRw
         C7bSpJPMaxcAWniTPp2wZp99DKk+u7YDYLIwOTTq6DTAKYxFPzkzJETYy4VnFSEt0y5Q
         Bj68kYdrouA+veTP7SSVGwBmUC8rWqhgc68iOEznK+qmWDyZ5kiSSJpleKTkw4eXw5uC
         7xeA==
X-Gm-Message-State: AOJu0YxVIbvjtGAFzI2ExorQt53yBs5DuoeARcWue7mXyDS1cDUsAFLs
	eUXDFX9qOrQuNnm+6QnKdIemmPcOGJVtF7owBVM=
X-Google-Smtp-Source: AGHT+IFN9CckH+LbMwuFWqPHaeCRITOUdr5lq15zlZH2/CR/mkDRUHmUDrB9Ilkl8ReBYREIwy/euw==
X-Received: by 2002:ac2:4c4f:0:b0:4fe:62f:35eb with SMTP id o15-20020ac24c4f000000b004fe062f35ebmr8305174lfk.20.1692707301441;
        Tue, 22 Aug 2023 05:28:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1? ([2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c379200b003fc01189b0dsm15659476wmr.42.2023.08.22.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 05:28:20 -0700 (PDT)
Message-ID: <16dbcda04582734da0d6cb2e34c914b3320cbf43.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 13:28:20 +0100
In-Reply-To: <ZOSoIXLG7vH/GC1l@nuoska>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
	 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186506

On Tue, 2023-08-22 at 15:20 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, Aug 22, 2023 at 12:47:04PM +0100, Richard Purdie wrote:
> > so between 6.1.38 and 6.1.39?
>=20
> Maybe:
>=20
> commit b1cdc56bc177c2e182c204bb08ad4e87bfd67942
> Author:     Paul E. McKenney <paulmck@kernel.org>
> AuthorDate: Wed Apr 26 11:11:29 2023 -0700
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Wed Jul 19 16:21:01 2023 +0200
>=20
>     rcu-tasks: Stop rcu_tasks_invoke_cbs() from using never-onlined CPUs
>=20
> and
>=20
> commit d58f0f0ce6332ffeb406540295cc49732c26fb51
> Author:     Paul E. McKenney <paulmck@kernel.org>
> AuthorDate: Thu Apr 27 10:50:47 2023 -0700
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Wed Jul 19 16:21:01 2023 +0200
>=20
>     rcu: Make rcu_cpu_starting() rely on interrupts being disabled
>=20
> ?
>=20
> master branch seems to have larger set of changes to rcu.

I wondered that but my test says
deda0761dc6161f03278da4679d96d4727992e91 is "good" which is after
those.

> Maybe locking debugging options could help to find this on every boot.

Perhaps. I think given where I'm at now I'll just try and bisect it...

> Then wasn't
>=20
> commit 77cc52f1b8d76c995648cb4286e57142cac8ce0a
> Author:     Wen Yang <wenyang.linux@foxmail.com>
> AuthorDate: Fri May 5 00:12:53 2023 +0800
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Wed Jul 19 16:20:59 2023 +0200
>=20
>     tick/rcu: Fix bogus ratelimit condition
>    =20
>     [ Upstream commit a7e282c77785c7eabf98836431b1f029481085ad ]
>=20
> causing some issues too?

Yes, but I think this is something different...

Cheers,

Richard

