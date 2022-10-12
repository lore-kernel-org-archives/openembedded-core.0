Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFEBC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:40:27 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.150.1665592820200821797
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 09:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vZYPtuQP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id l22so25223776edj.5
        for <Openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E4u0ZovoR4O6c00qSaDdDkmN7g7KGvi5QzbjmbpX6Y4=;
        b=vZYPtuQPcqk9rbSJKKpUTnuBSMw80kxTZBjfbG8rf/Sz5Kq43ZX1xWfEFohoW3Qz3c
         UtDmWuAbkuxf20/7tsUtEZT4PdLiueVHEswylJbMLpI/j6dmGUoOZJZ1yE+KWQnXfunf
         /65jKfF8Ez4MZA5t9UvTFcSt3xr3DCRCMywui7jBwpKOi9+8O8+NtlEoR6p9hKN8N0l8
         aWh+OXcKObwAvSAfs1C1crHulEZW6agIdDr5aun/nM7WpTkbX9V/PftadDjWj04mQ5o4
         5OaPWXS++2dGjHGRqTDbMNk7tXbeYQTqzqpF+WSt1GIfhFSP36fPIgo4wTOaZ0s9NFCA
         5NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4u0ZovoR4O6c00qSaDdDkmN7g7KGvi5QzbjmbpX6Y4=;
        b=w/UfaQ/lY4dimtLcK1oLzhW6aGAPYx6Lzq56L5nBPcHwSI3fSHh8dhFbcpUovMWy/p
         3a8TNN2xyy7yKom38uzseuiJvIt+gs6UJz+2PBfcRYxcX3Qt7GyL35PoNL9rCl66ApjX
         SZd+Zv0lUQm3RmARnmLQ6wygJyClRRIwG7eeZk4W/9iKpOeEOtOgstLTluwb4zttwwex
         VtVzxjIsmwupO5tHBjELT9HYN6ZvHEv6It1mnwrcx42QfFaKNFuvkEOmhKVHhdicCUmP
         UTR3AVDoxgoVvEMuov2OXdvvpsQVhbSYRKxOS4sP8OkTXK41aCTPbtIbFftO9ZJmM5Ws
         ZZ9Q==
X-Gm-Message-State: ACrzQf070T5RHASPEhvZugk0vSlnb8P+BbHw5T94kE1SYqFcPMeBaprB
	5eWwcUDaGAyhzqvN+IyXBO3kdWZzCRRIbJjzYvcFSg==
X-Google-Smtp-Source: AMsMyM5p8kveQ9hARjlynDIDDRdmRfVSIQ23mVk/CkchuvuxAbWUgSOrK4zmMhUsLbxm/hC/ndn+Q1ARUYwouJPcBko=
X-Received: by 2002:a05:6402:1e8e:b0:45c:af84:63dd with SMTP id
 f14-20020a0564021e8e00b0045caf8463ddmr3587746edf.190.1665592818477; Wed, 12
 Oct 2022 09:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <171B283596D3592B.13098@lists.openembedded.org> <0e797990-cfaf-c3ab-2c07-903bda62aac2@gmail.com>
In-Reply-To: <0e797990-cfaf-c3ab-2c07-903bda62aac2@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 12 Oct 2022 06:40:07 -1000
Message-ID: <CAOSpxdZ9gdJrndM3UHiL__ahwN-pHCbNZdnAFgsoJj=pY8=WdQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] overlayfs: Allow not used mount points
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, 
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 16:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171671

On Tue, Oct 11, 2022 at 7:23 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> Just checking if something is missing to include this fix to kirkstone.

Yes, it needs to make it into the master branch first :-) I will then
cherry-pick for langdale and kirstone.

Richard is on holiday until 24 Oct, so it will occur shortly
thereafter.  It is already queued for the master branch, so there is
nothing else you need to do!

Steve

> On 05.10.2022 13:17, Vyacheslav Yurkov via lists.openembedded.org wrote:
> > From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> >
> > When machine configuration defines a mount point, which is not used in
> > any recipe, allow to fall through and only report a note in the logs.
> > This can be expected behavior, when a mount point is defined for several
> > machines, but not used in all of them
> >
> > Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> > ---
> >   meta/classes/overlayfs.bbclass | 6 +++++-
> >   meta/lib/oe/overlayfs.py       | 6 +++++-
> >   2 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> > index f7069edd41..c3564b6ec1 100644
> > --- a/meta/classes/overlayfs.bbclass
> > +++ b/meta/classes/overlayfs.bbclass
> > @@ -96,7 +96,11 @@ python do_create_overlayfs_units() {
> >       overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> >       for mountPoint in overlayMountPoints:
> >           bb.debug(1, "Process variable flag %s" % mountPoint)
> > -        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> > +        lowerList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
> > +        if not lowerList:
> > +            bb.note("No mount points defined for %s flag, skipping" % (mountPoint))
> > +            continue
> > +        for lower in lowerList.split():
> >               bb.debug(1, "Prepare mount unit for %s with data mount point %s" %
> >                        (lower, d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)))
> >               prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
> > diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
> > index b5d5e88e80..590c0de58a 100644
> > --- a/meta/lib/oe/overlayfs.py
> > +++ b/meta/lib/oe/overlayfs.py
> > @@ -38,7 +38,11 @@ def unitFileList(d):
> >               bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
> >
> >       for mountPoint in overlayMountPoints:
> > -        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> > +        mountPointList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
> > +        if not mountPointList:
> > +            bb.debug(1, "No mount points defined for %s flag, don't add to file list", mountPoint)
> > +            continue
> > +        for path in mountPointList.split():
> >               fileList.append(mountUnitName(path))
> >               fileList.append(helperUnitName(path))
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171457): https://lists.openembedded.org/g/openembedded-core/message/171457
> > Mute This Topic: https://lists.openembedded.org/mt/94132926/4455192
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

