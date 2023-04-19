Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAE3C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 22:54:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.53162.1681944888023300636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 15:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=M3JLDuX0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id q5so393200wmo.4
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681944886; x=1684536886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CglSmM+jm9zNl2dsd8y4vI8frPCsRKwJza7ImAclA/0=;
        b=M3JLDuX0BBqIa9IyH1/Jn0+UBNKuxRqGjc6R/TxyYH0T4lLHjD2lDHBB/3Gv3iSX4i
         VDEbIwCJN0/z7GzSh9o1ezk6htNbGIZvYMFLgoQf7wmRefNlZDjEAnNAE1qOWt1gRtwb
         g6De3Zgaw5bocqVP1I5qSGYrUJs6yPe0rxYkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681944886; x=1684536886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CglSmM+jm9zNl2dsd8y4vI8frPCsRKwJza7ImAclA/0=;
        b=EBeB+gvXQ2ahe8FvvAKi+PrD6KTIpmVRIojFTmGQ/WST258ypJ5xP2svkWYpizILY6
         jS7iv8qfwI8Q8uCL0PwyQptmhWy6VJmWdSHaZHBx9QlaK8EfrAdSbPQs2SwoPhL4nkkB
         LtloEkNx1FCDZMRxU3NizGg9S8ydSJgOz8nSFOuNavL2//h3EmPvVcykDxXQZMQeobJZ
         s3qrgknLk15cdMXGUd6ZfDd8dNsKIdZSL5QP/LvUHYxdxk2Nq/uhqD2l4VKbnkEV29px
         nzwE7Lltz8YmV7EZApsSIdK6DdQq93Syd3+M5qfoNcF40LpulMg7zsu0XFgJceWXsHmc
         0pFQ==
X-Gm-Message-State: AAQBX9dl05cdm6nnCHS+TD6hBa6kwekMMjGomnBEpLbFVjlcwSibKiD+
	ux2dIgbshIsBGaUD5ga2qlu5Hw==
X-Google-Smtp-Source: AKy350ZCYUUXxD0HatrGC1kWqd+gB3ya9N9+8dHZ+Ldqj7wn/GekBgKZX/oSEwyhxMxHUIV3J+o37A==
X-Received: by 2002:a05:600c:21d8:b0:3f1:7975:6942 with SMTP id x24-20020a05600c21d800b003f179756942mr6163676wmj.11.1681944886377;
        Wed, 19 Apr 2023 15:54:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce55:21b0:963b:173c? ([2001:8b0:aba:5f3c:ce55:21b0:963b:173c])
        by smtp.gmail.com with ESMTPSA id z26-20020a7bc7da000000b003ef5bb63f13sm3447789wmk.10.2023.04.19.15.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:54:45 -0700 (PDT)
Message-ID: <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Christoph Lauer <christoph.lauer@email.de>, 
	openembedded-core@lists.openembedded.org, Christoph Lauer
	 <christoph.lauer@xtronic.de>
Date: Wed, 19 Apr 2023 23:54:45 +0100
In-Reply-To: <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
References: <20230416103052.28268-1-christoph.lauer@email.de>
	 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
	 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
	 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
	 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
	 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
	 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
	 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
	 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 22:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180231

On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> Hi,
>=20
> Not related with the previous discussion but just for
> your=C2=A0information.
> The rm_work.bbclass has an exception for the kernel recipes [1].
> So I don't understand why we can't do the same for the make-mod-
> scripts
> who is the twin brother of all these kernel recipes.
>=20
> [1]
> https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_work.=
bbclass#n168

Ideally we wouldn't be doing this for the kernel recipes.

There is also a big difference to that and the proposed patch. The
proposed patch was preserving a specific directory rather than an
entire recipe. Removing the task stamps but leaving a small piece of
WORKDIR is quite different to preserving WORKDIR and STAMPS for a
specific recipe. The former is not tested and will break things. The
latter is better tolerated by bitbake.

So yes, we could do the same. I'm sure there will be other recipes
people want to preserve for other reasons. Where do we draw the line?
We could preserve everything and drop rm_work, then we wouldn't have
these problems? :)

Cheers,

Richard

