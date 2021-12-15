Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6779C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 11:40:49 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.39211.1639568446273625997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 03:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:50750 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mxSeL-0000X3-15; Wed, 15 Dec 2021 06:40:44 -0500
Date: Wed, 15 Dec 2021 06:40:41 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <ross@burtonini.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] ROOTFS_POSTPROCESS_COMMAND versus do_install_append()
 and using ${D}?
In-Reply-To: 
 <CAAnfSTvyCdxsF1jjGqKXEecA2t_wj9UohEnuzAPLJV-My7mEKg@mail.gmail.com>
Message-ID: <12cb18e3-e3ae-ab79-9d69-87bec7beb0c7@crashcourse.ca>
References: <a3f88955-541b-7aef-d3b6-b5de28cfa83@crashcourse.ca>
 <CAAnfSTvyCdxsF1jjGqKXEecA2t_wj9UohEnuzAPLJV-My7mEKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 11:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159722

On Tue, 14 Dec 2021, Ross Burton wrote:

> On Tue, 14 Dec 2021 at 11:39, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   what i'm looking at now does it in a more curious way. there is
> > a catch-all recipe file (call it "catchall.bb") which lists, as
> > its DEPENDS list, *all* of the recipes that make up the image,
> > which means that building catchall.bb builds and populates an
> > image directory with the combination of all those other recipes,
> > after which it defines both pkg_postinst_${PN} *and*
> > do_install_append(), both of which run around and make changes
> > relative to ${D}, given that the image directory for that recipe
> > effectively contains, well, everything that will go into the
> > rootfs.
>
> Either you're explaining badly, or that isn't doing what you expect.
>
> A normal catchall.bb recipe which DEPENDS on all other relevant
> recipes will result in the recipe-sysroot directory containing the
> sysroots for those recipes, but that is all.  the image directory
> won't contain anything apart from what catchall.bb's do_install
> installs.

  yes, i was explaining badly ... actually, no, i just had no idea
what i was talking about, so let's try again.

  stripped down version: i'm trying to clarify in my own mind the
myriad of ways one can customize a package/rootfs/image, via
do_install:append(), or pkg_postinst...,
or ROOTFS_{PRE,POST}...COMMAND, or IMAGE_..._COMMAND, and so on, but
let's start simple.

 in a recipe i was handed from a working system, there are two
customizations:

  1) pkg_postinst_${PN} runs a bunch of "setcap"s

  2) do_install_append() installs stuff into ${D}, and also runs
     a number of chown/chmod commands, and creates a couple of
     hard links

no one can explain to me why both features are being used, so it's
either because those two things run in different contexts, or perhaps
they were added once upon a time by two different people.

  so the firist question is, is there some requirement that the above
was done precisely that wasy?

  second question: is there somewhere in the docs a comprehensive list
of all the different ways to customize stuff as i mentioned above? a
colleague asked me this very thing, and i had to admit i didn't know
the full list so i would take a look (and maybe even write something
up).

  thoughts?

rday

p.s. i'm going to ask later about specifics of pkg_postinst() since
i'm still unclear on the exact mechanics.

