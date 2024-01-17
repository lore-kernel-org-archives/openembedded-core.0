Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21931C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 08:54:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.5420.1705481688752043717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 00:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dA9oC/Ab;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wlY9ZkEo4WP/SouSnuS8un3hSsYs3y3C2XlACc7v5p4=; b=dA9oC/AbZi1zbmCxPx4k9gVtaC
	l7l1/ALMO/9GbEZjU6OQBLcyMxW6VDj5yKyVCdGjY+SjK+EaSIsEeGyL1pfk14lZNmfInN1vPFYAT
	e2TWLZ7tiBgmxkNJduJ/mEv/qlbHN+IlZ7DDsvOtt+MPfGxq8l/4QAS33+czo3H5grZUMDPgeLhk6
	sobCpaT8udxO+ld3O8jn7ehCAsbCpTYQp0tgIirGV7wUslnQeBQgf33KqupRLcuMILwOgN0ujnwqy
	+T6+N4b7enVKctreudrVrL5zkBcPtySnM0rIKTk1gWtSy3G2SQL2QVc2orfCCaZdQM6dpWLwlGNTL
	g07mkaiQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49868 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rQ1h7-00E2ns-2O;
	Wed, 17 Jan 2024 03:54:46 -0500
Date: Wed, 17 Jan 2024 03:54:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how badly do symlinks from within ${S} to outside ${S}
 mess up sstate?
In-Reply-To: <36a4f6c58a7d96873ddc772f4b2c0e302ec1ff62.camel@linuxfoundation.org>
Message-ID: <739f7494-c293-5580-bd51-cfd63ff813d@crashcourse.ca>
References: <57164b82-ca31-8438-f2f0-f6dcaece8b9f@crashcourse.ca> <36a4f6c58a7d96873ddc772f4b2c0e302ec1ff62.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193903

On Tue, 16 Jan 2024, Richard Purdie wrote:

> On Tue, 2024-01-16 at 09:23 -0500, Robert P. J. Day wrote:
> >   a very weird question, to be sure, but i literally just ran across a
> > recipe that does the following (i will paraphrase some stuff to
> > protect the innocent).
> >
> >   the recipe processes a bunch of XML source files, and generates from
> > them JSON files, so any change in any of the XML source files should
> > (obviously) trigger a rebuild of the recipe. and here's the problem.
> >
> >   the XML files are not copied into the recipe source directory, and
> > are not even referenced by SRC_URI. rather, the files live in a
> > well-known location on the build host (placed there by a monstrous
> > "repo sync"), and to save time and space, the recipe just *symlinks*
> > from inside ${S} to the XML source files outside of ${S}, then
> > proceeds to process them to generate the subsequent JSON files.
> >
> >   the complaint is that, when the build pipeline started taking
> > advantage of sstate-cache, even after some of the XML files were
> > changed, the recipe would not rebuild.
> >
> >   once i understood what was happening, my immediate reaction was
> > along the lines, "well, since what is under ${S} is simply symlinks to
> > files *outside* of ${S} and (worse) those symlink names will never
> > change (all that will change is the XML files at the other end), how
> > is bitbake supposed to have any idea that those XML files have
> > changed to kick off a rebuild?"
> >
> >   so my initial response was, "this does not surprise me at all," but
> > does my reasoning hold up? obviously, this should probably use a
> > combination of bin_package and externalsrc, but as it is now, is it
> > moderately accurate to suggest that it is those symlinks that are
> > preventing bitbake from understanding that anything has changed, so
> > that it continues to use the old sstate-cache?
>
> Inputs to a recipe need to come through SRC_URI. That way bitbake can
> know when they change. If you point at some random place via a symlink
> how is bitbake supposed to know if/when they change?
>
> Yes, pointing at a large tree of files will take time to hash and yes,
> that can make parsing slow. Either you care when it changes or you
> don't.
>
> The inputs are used to generate a hash which makes up the hash
> representing the task. When the hash changes, we know that sstate is
> invalid and we need to rebuild.

  thanks, richard, i appreciate the time you took to clarify this. i'm
going to paraphrase and add it to my WIP "OE/YP best practices"
internal doc; this advice would be contained in the chapter, "for the
love of god, stop doing this!"

  thanks again.

rday

