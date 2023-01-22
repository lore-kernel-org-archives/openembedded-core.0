Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB84C25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 22:19:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.29126.1674425973065999522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 14:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CApQ23rq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id q8so7722594wmo.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 14:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6SJ3CeJiqGpIUYZiLT7Q05rchR4bX/emqrnE49qFek=;
        b=CApQ23rqEvSMM9709XbY2PCiUQwE+jamJpfziWnLu0kA2paWeeuXFyG06giZiKQiP3
         4dK6em3w0JdXkB8bCvOXqeuVIx/Y7kTeIEmimzgYCHMwg59JerBeA/llSadP4FUsVlVA
         XgRviwh0m0UuIvKt7e74I+PWQrWxqBRN3wf7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6SJ3CeJiqGpIUYZiLT7Q05rchR4bX/emqrnE49qFek=;
        b=ndSBYtt/6EAqT0/r4p0Cz85ajgWU0byRZHUwLh8AU+TbYNL0uBHRLpgsZTBucy3Y8h
         QXtCp3xrBWjzEiqG/yU8MQpvB3aj7bElKSW4UP+oHVhf1f7nlTjmxDKiwIhWge5JFAMa
         MP/k7jJ33cFLXS/h2DBI0VPsDUNXngsB+kztdveT+uEaiDEWdlVWwKnCpGYUIac5hDrZ
         9GCz3jGwXhjCvHF0NFD8B1+Edmvwp7MTgiqFWUMFisbE6/YXwn7tJwPAr7CWGK3iElvP
         mF1GnMNUeXQRUVRoasS0/S/x515PUa9qvxtqagUn4+96MS4IahP9xguFHdJp7ib4DlIs
         7bzQ==
X-Gm-Message-State: AFqh2koypoiILqkluw7EC+cWvwT9QALg/CHGCZu1k9YTW8eusG5Znuoz
	e/7x01zdugcPwR9s4M/If+gNQg==
X-Google-Smtp-Source: AMrXdXuniP9EJ3KdD4HSVTYQmBAMww46lRawMOm1IPLP5yXm0FLGQ2qxmyzt19jc4V8mhm9ew8pK9g==
X-Received: by 2002:a05:600c:539a:b0:3db:419:8d3b with SMTP id hg26-20020a05600c539a00b003db04198d3bmr21779235wmb.39.1674425971237;
        Sun, 22 Jan 2023 14:19:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9195:b014:a064:8114? ([2001:8b0:aba:5f3c:9195:b014:a064:8114])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d64e2000000b002be063f6820sm24087327wri.81.2023.01.22.14.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 14:19:30 -0800 (PST)
Message-ID: <1cfa5fc2c0edda2cd9990de4839d130e3f7b5be9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jan 2023 22:19:29 +0000
In-Reply-To: <b354270257b047d5bcfcc73a7ac13270@axis.com>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230119102423.3493565d@booty>
	 <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
	 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
	 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
	 <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
	 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
	 <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
	 <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
	 <3b311ccc982ae39cc72c428ddc97386fe8d653e7.camel@linuxfoundation.org>
	 <b354270257b047d5bcfcc73a7ac13270@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 22:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176263

On Sun, 2023-01-22 at 12:46 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 21 januari 2023 00:01
> > To: Alexander Kanavin <alex.kanavin@gmail.com>; Bruce Ashfield
> > <bruce.ashfield@gmail.com>
> > Cc: Ross Burton <Ross.Burton@arm.com>; OE-core <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
> > handling
> >=20
> > On Fri, 2023-01-20 at 20:38 +0100, Alexander Kanavin wrote:
> > > On Fri, 20 Jan 2023 at 20:29, Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
> > > > Because I'm simply not going to insist on it in all the patches. I
> > > > need all the contributions I can get, and I'm not going to
> > > > pedantically insist on that.
> > > >=20
> > > > meta-virt is not oe-core, I do the lifting. Therefore, if bitbake
> > > > errors, I have to fix it.
> > >=20
> > > But you do not need to insist on the needed metadata or fix it after
> > > the fact. Bitbake will do the insisting for you, when contributors
> > > test the change locally *before* they send it to you. If bitbake
> > > errors on your side, this means they never built their contribution,
> > > and you should raise a concern for that reason, and not for the
> > > missing metadata.
> >=20
> > It isn't that simple since this is a configurable QA warning, all it
> > takes is one layer/distro to disable it and it is disabled for all
> > layers that user works on.
> >=20
> > This is why "core" is a separate config to "noncore" but we can't have
> > a config for every layer and even if we did, people would still turn it
> > off.
>=20
> Rather than having separate QA tests for "patch-status-core" and=20
> "patch-status-noncore", couldn't we have a single "patch-status" and then=
=20
> configure it using a separate variable that specifies the layers that
> require the Upstream-Status trailer? Then each layer with this requiremen=
t=20
> can add itself in its layer.conf file and thus it is up to the maintainer=
=20
> to decide whether they want it or not.

Even now, the QA warning/error code isn't entirely straight forward and
having the two categories keeps things simple and means we don't need
some new mechanism.

What you describe is possible, but there is a lot more runtime
computation overhead, which will further impact parsing time since
knowing what data to put into the task hashes and what not to put in
becomes more complicated.

I was hoping something simpler would suffice. I don't think I have a
lot of interest in going beyond this, particularly given the likely
impacts, both code wise and socially. If people don't want to do this I
am really running low on the energy to try and push it forward. Making
changes is hard, the socialising acceptance of a patch is the piece
many people overlook and it isn't here in this case.

Cheers,

Richard

