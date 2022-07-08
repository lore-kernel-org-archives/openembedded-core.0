Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FE7C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 19:20:41 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.3155.1657308031092063311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XoIP6ZxB;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id d12so14531317lfq.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VwEIWCKrsgN25ibgmEbh8ySq0qz2D0kiQVssBQfphdY=;
        b=XoIP6ZxBPSMIIs2cnzkzsebgDyq/UgGa+CsVnxnXs8dfWb0saZ8ukD7GpeHV6E312/
         3LyXFSTPnBHlKxiOOJv9XKpe79P3tCIYQQQalr9wc7+UK5tdEMmIPnvbA3H9+ZM2SAih
         l0Zwimr+Sl3RdO3iOHsrwijTzrXJ2dp9nYyH7mfkwYh1E7f7XmG0nA3Q6fF9cVh/e+yE
         y6v6i3H2w2qiFwW2L2+9XpO9NhzjjiO4K1TAIN5kokc2XCLVdJf5Mf93Lh/IsOnuvKxp
         N5IPBPGTj0D5xMSCO3FyIeIOdHgVrzySvZqnF1elYsxpil3hMlx1AA3WgGjTps5ZbhTH
         y/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VwEIWCKrsgN25ibgmEbh8ySq0qz2D0kiQVssBQfphdY=;
        b=f8oHOWm4so+LiDcq8MxTroLYsCmeZjHkqku4RjvGrZTsJJxisAcqucpmb9eQ3S69V4
         +mhc0Q2YCFjOyuIOaSpJYUtxbT0ezCR/HutpiWGYThJzOIImKgy0x3XBlRsqwKiopaQg
         jnhO+fJxzBESenopkLCD91znfRvdxKVJLfs1boTfVCUg44fpCQsVtzy/YFwV/A5+Q/g1
         vFS/eRKH57QRytUG7dj95lGLY7drBuUELo7bdBiKpDoKf2WKMopwp9SMxrz4Rq8c032B
         nw8z3UkWF9DUPuEgdjqTgSoLKi/LfMAGduZpZbybnIqd+4I3aw6eiWZY6Ch1VoQ0iGaH
         PqDw==
X-Gm-Message-State: AJIora8mJuj8zCTSIU/cSnGenDrx6Xkfk/7XkX1SU30sBOGh2JzJCHP/
	YnY0Vc7aEOngD7LVk5oW9KIAoWhdEISEtsvx+7PvyGxJywyR9g==
X-Google-Smtp-Source: 
 AGRyM1sfCRaCsYQTZ7hBJQwN3/3L2qOI4uC/GXXtwp8ONmidEFtSr+ljRNk4lCSwlo0udXOX97suuUTTa/0VYt+2AMQ=
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr2108219lfr.26.1657308029216; Fri, 08 Jul
 2022 12:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
 <CANNYZj_6PJ=E3M5X21eYhih3am62jvVE+G+vgjenKoSfRCL36g@mail.gmail.com>
 <CAJdd5Gai4N1MXGVOMhqceocjWGpr9D4zEjRgvu3vN8Lgi8WAzg@mail.gmail.com>
 <CANx9H-Db+K=hMKGJzwmRQbyz+VTLC=tcMviSj5kPzKkTCWKBTg@mail.gmail.com>
 <CANNYZj_OZ735VtV_QYH9H-0ckT_1faeOZ35H=qN5zXN8H8C4Xg@mail.gmail.com>
 <CANx9H-Dz+qoXt-uEkfj+fvYHcDbL74DsnTpHmEFpQo2kom8ZLw@mail.gmail.com>
 <CANNYZj9ndgsgKRFGBKSiJ2y_k8kK5dsxJgYWnrVk4_sfLO2QxQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9ndgsgKRFGBKSiJ2y_k8kK5dsxJgYWnrVk4_sfLO2QxQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Jul 2022 21:20:17 +0200
Message-ID: 
 <CANNYZj8mED0koTaCuZ_3tN+t8peJ9H1MNLbc_HG=OFiwucgOdw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Tim Orling <ticotimo@gmail.com>,
	Adrian Freihofer <adrian.freihofer@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 19:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167831

Okay, the reworked version of the layer tooling is now out as well.
I've addressed most of the feedback, and placed the things still TBD
in FIXME notes in the commits.


Alex

On Wed, 6 Jul 2022 at 20:34, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sat, 2 Jul 2022 at 10:28, Tim Orling <ticotimo@gmail.com> wrote:
> >> Configuration will be handled with TEMPLATECONF and a set of templates
> >> in a product/platform layer. It's already in core, it's simple to
> >> understand and it works. We used it in a very large project. It also
> >> requires a certain bit of discipline, which is a good thing: you don't
> >> get to implement ugly local.conf hacks in a turing complete language,
> >> and must design your configuration (distro, machines and images)
> >> carefully in a static manner. Then local.conf must contain only DISTRO
> >> and MACHINE, and a 'confuguration' is essentially a choice of those
> >> two plus a set of enabled layers plus site-specific settings for
> >> sstate, downloads, proxies and parallelism level. Back to
> >> (maintainable) basics.
>
> I just sent out patches for this bit (build configuration). The layer
> configuration generator/script needs a few changes which I'll do next.
>
> Alex

