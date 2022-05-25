Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BE8C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:01:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7147.1653487301675955504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vMgS0tb7;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id t26so2068594edt.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HhKT0tsmC/9ZH4JUofbu6gxyRci4xK55Od7ZNVPytdY=;
        b=vMgS0tb7yKAl/k3uYrj/XGkuh9bwLOQIzQkx9gyTKvDssW+tGRUuc3RzoV8pgOHLA6
         rEMv26B5ODGUa+GhUyeGeMKHxxaAl4uIWhX9h2neREYo90ekDVyI5tiCb72PSiQGJUuQ
         exzYnKaN0oVfrqkLkTSYbw0UORGff8/N+Agyil6u3acEgDR1yndpeKBSmEwJwSA8L3dI
         zNpkHtMp8VzFGQ9znU1bTAXIY1OVEnzFJA1TNnNZ7Z7Nviu1O7jw3lULhivSpUQjbDhO
         Qp8x7c7+eEhjMGuLfPz6Y4dapbDeaBQIViP6DqlcaMKFKnp04zegxFM2G07/JtVJSRJF
         vKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HhKT0tsmC/9ZH4JUofbu6gxyRci4xK55Od7ZNVPytdY=;
        b=Pqb1SQD6ZQUB1STuIj3iVsaNV0TkgOy62IOLf4StMUjq8zIIyG0vKQjiiScwLdaibB
         DSrve5YgJR3jDFqGHi2hqQyEqCrDNwiydEA8xodSjDKWKoFDLCIXAhyH7aR0VcmHPRed
         QngANf4z3E4CTFRezrYtzAPiv7KiMMZq10kPqnm0QfDtDBeNG7BCqgRW2p+3YfQn3gzu
         LNtumfMwvIpOMv1ricyyFHbQcj3h9kA9DfzxHtxRP+execmxbFeuFGTRKA2E+P5HjDDX
         CMIIP2fVtaaL6rxg3JLdiF/j7q2qmtlzjLR4RcWGhb5UZPUJPiT9uPKqdqnudC9EPrg4
         5DxA==
X-Gm-Message-State: AOAM533MgvSxoA1n1Oza1kw9Om00v5MKdxL1Vs8J8/g/srWl8R86ra1p
	VODPVvx4NJ5cUcXhndTaMxWiIiu+4V+H4hgXYrJ+5w==
X-Google-Smtp-Source: 
 ABdhPJy0lPZglEe73T81ao1Jk9WIVyDHx7wL2XmNCVsDdpLkqgiJqyTJbi2CnrFSX8S+sNLgQ5ZmJBOwN53uNKgZXSM=
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr35348675edb.71.1653487299916; Wed, 25
 May 2022 07:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220524130724.15435-1-mikko.rapeli@bmw.de>
 <CAApg2=RDpk2JJZR+sFDQcDh6xuknt3UqSuDxNAmG55fw54PPHg@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RDpk2JJZR+sFDQcDh6xuknt3UqSuDxNAmG55fw54PPHg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 25 May 2022 04:01:27 -1000
Message-ID: 
 <CAOSpxdagdx+eJ8M3xuHY1EW30bTTuJhFVUtmsdA9WYoxvpBKZA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] cve-check: Fix report generation
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:01:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166125

On Tue, May 24, 2022 at 11:38 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Tue, May 24, 2022 at 3:07 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
> >
> > From: Mikko Rapeli <mikko.rapeli@bmw.de>
> >
> > From: Marta Rybczynska <rybczynska@gmail.com>
> >
> > The addition of summary output caused two issues: error when building
> > an image and the fact that JSON output was generated even when
> > CVE_CHECK_FORMAT_JSON.
> >
>
> Hello Mikko,
> This patch has been already picked up by Steve. We're waiting for
> the final review now. It should land in dunfell (very) soon.

Actually it landed yesterday:

https://git.yoctoproject.org/poky/commit/?h=dunfell&id=232b5533de22bba7a747f73f684d609e217531f9

I'll be sending the pull request containing the kirkstone version later today.

Steve

