Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A62C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:38:43 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.7612.1639755522619369895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=HwxV40h1;
 spf=pass (domain: madison.systems, ip: 209.85.208.173,
 mailfrom: matt@madison.systems)
Received: by mail-lj1-f173.google.com with SMTP id k23so4004825lje.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WUDP/jKgtzcws8mU+CWKyh9c3jek0Lub+vCDi+EKlaM=;
        b=HwxV40h1U84fYYa6q5NSwTswZ/u9z48l4lOH3kITZWd10TYvL4L2m3f8M7MUcqNiqO
         vOpT7NZx1Ad13s/WxPvFIDMdelB3nwa/MOjal6QQrugA+TPE/9yfAen0JRnhG0cSBz5X
         nTGoyFOg9DiSE++iZGW6MxzHNXwpnvEiiIE+Uj0p3Crd/f3XQceD/egWXWwJ2Xm10UDo
         n98wuvfZWvYMdr+JfErPlw6SKZWwAUyoeDti3u6+N247GrsCZxSM/hi825LcQgCtig38
         T1lxgGHC4pmbnUqVXc/2xIpaoc5L8GVQgwFVZrFiHLT2tWhoC9P/22TsiM2rNeaHTtOH
         XZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WUDP/jKgtzcws8mU+CWKyh9c3jek0Lub+vCDi+EKlaM=;
        b=yqQUQE1y2dOmJdfLSmTPxRjTr+OPYUd1bost0ir+3b7ftgN5QG44OeeeArSAUrPpDp
         6it4UcQdTu2bNnxC3GQSetKsA5v4wYQCtH1sClZPNdK6cOA6HBF/KkwWrzStp6e5DzKu
         XcRQJlNt1loKUfbJeKgmoqfDHliD/+0sljYgAAA6GnnWON2hh6MsWYBWyATU65gCJUmi
         WxN6w43CMxto6vqj02G1KmA4fVMGtSZmyP3ZHTgqEWxa6EpPfYAwMUirXS4AsazabJFZ
         ecRdLkyXHwK6jpfkgldUvKC4NC4gR3rkSuJZJggbr6zTpLQFu6F1YZE945baFCc0lxjV
         fScg==
X-Gm-Message-State: AOAM532pbzW0wBcuK0F+PRpvsLPk/CPguRaZgiL9pWneh2bYKxx9wQ32
	xv2UXn/QETBjIda7F6Sh4fKjFTiAwiQVmqGZFvtOhw==
X-Google-Smtp-Source: 
 ABdhPJyOc8fogXkZLVs6zR7DvPpMBKZz1WqbZQEyp+yi325kotW3tzLtgUkJ1GdhqWKbCoXzOZux7xI18QXYK3Kjegc=
X-Received: by 2002:a2e:9ed6:: with SMTP id h22mr3243210ljk.410.1639755520709;
 Fri, 17 Dec 2021 07:38:40 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAGgRHJqMNi+rfsiojpsxTG6e2JurK22zwK6CLOoyzz2BW0RQmA@mail.gmail.com>
 <CAJdd5GYn5ozdUsdhd67+xXESuyyTjxyr=-zgRox1zvmL+pLrww@mail.gmail.com>
 <16C1473316FC0603.32027@lists.openembedded.org>
 <16C14B59C1D676FC.6360@lists.openembedded.org>
In-Reply-To: <16C14B59C1D676FC.6360@lists.openembedded.org>
From: Matt Madison <matt@madison.systems>
Date: Fri, 17 Dec 2021 07:38:29 -0800
Message-ID: 
 <CAGgRHJoC3+1npOJFs4NmZ0ZF75cvCDRJ5uD7-78TiuZG8x0sWw@mail.gmail.com>
Subject: Re: [OE-core] cargo fetcher, SRCPV, and setscene issues
To: Matt Madison <matt@madison.systems>
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 15:38:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159833

On Thu, Dec 16, 2021 at 9:09 AM Matt Madison via
lists.openembedded.org <matt=madison.systems@lists.openembedded.org>
wrote:
>
> On Thu, Dec 16, 2021 at 7:53 AM Matt Madison via
> lists.openembedded.org <matt=madison.systems@lists.openembedded.org>
> wrote:
> >
> > On Thu, Dec 16, 2021 at 6:47 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >
> > > On Wed, Dec 15, 2021 at 8:16 AM Matt Madison <matt@madison.systems> wrote:
> > > >
> > > > I'm finding that none of the Rust recipes are getting setscened in my builds off
> > > > master due to the the SRCPV hack that was added to make the cargo fetcher
> > > > visible during parsing. There's no error reported about it, but by adding an
> > > > exception handler into the sstate code I tracked it down to pstaging_fetch()'s
> > > > using d.getVar('SRCPV').  Since the cargo fetcher doesn't advertise
> > > > srcrev support,
> > > > the base fetcher class raises an exception on this, causing the
> > > > mostly-silent failure.
> > >
> > > Hmm, this is strange. I have this recipe:
> > > https://github.com/JPEWdev/meta-phosh/blob/master/recipes-graphics/squeekboard/squeekboard_git.bb
> > > that is using the cargo fetcher and it is definitely using sstate like
> > > I would expect; perhaps there is some other strange interaction with
> > > another class?
> >
> > I'm just talking about the rust toolchain, libstd-rs, cargo, etc.
> > It's simple enough for me to reproduce with a bare-bones setup:
> >
> > 1. clone openembedded-core and bitbake
> > 2. init build environment
> > 3. set MACHINE="qemuarm64" in local.conf
> > 4. bitbake librsvg
> > 5. Copy sstate-cache contents to a web server
> > 6. Wipe build workspace, re-init, and set SSTATE_MIRRORS to point to
> > the web server
> > 7. bitbake --setscene-only librsvg
> >
> > I've attached the cooker log of a sample build.  You'll see from the
> > sstate summary that everything was found, but there will be warnings
> > when executing the setscenes.
>
> And if I apply the following patch:
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0326d27c74..ffc3b08b7d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -761,7 +761,12 @@ def pstaging_fetch(sstatefetch, d):
>      localdata.setVar('FILESPATH', dldir)
>      localdata.setVar('DL_DIR', dldir)
>      localdata.setVar('PREMIRRORS', mirrors)
> -    localdata.setVar('SRCPV', d.getVar('SRCPV'))
> +    try:
> +        curpv = d.getVar('SRCPV')
> +    except Exception as e:
> +        bb.warn("Failed to get SRCPV: %s" % e)
> +        curpv = ''
> +    localdata.setVar('SRCPV', curpv)
>
> the setscenes work, and the warning is:
>
> WARNING: libstd-rs-1.57.0-r0 do_packagedata_setscene: Failed to get
> SRCPV: Failure expanding variable SRCPV, expression was
> ${@crate_get_srcrev(d)} which triggered exception FetchError: Fetcher
> failure: SRCREV was used yet no valid SCM was found in SRC_URI
> The variable dependency chain for the failure is: SRCPV
>
> I'm just not sure whether that's the right place to fix this.

I think I've figured out a clean way to solve the problem, and have
sent patches for review.

-M

>
> -M
>
>
> >
> > -Matt
> >
> > >
> > > >
> > > > There's no issue if the sstate package is already in the local cache;
> > > > it only affects
> > > > builds where I need to fetch from my sstate mirror.
> > > >
> > > > I'd submit a patch, but I'm not sure what the right solution would be.
> > > >
> > > > Regards,
> > > > -Matt
> > > >
> > > >
> > > >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159798): https://lists.openembedded.org/g/openembedded-core/message/159798
> Mute This Topic: https://lists.openembedded.org/mt/87744591/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

