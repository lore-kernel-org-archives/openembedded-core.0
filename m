Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web09.8910.1622211379170491314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 07:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Fs6Dd1D7tz5tlB;
	Fri, 28 May 2021 16:16:16 +0200 (CEST)
Date: Fri, 28 May 2021 16:16:15 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
Message-ID: <20210528141615.klk5hwfmo4gwqfbg@qschulz>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca>
 <20210528130557.zr762og6uvyv577b@qschulz>
 <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 28, 2021 at 09:57:26AM -0400, Robert P. J. Day wrote:
> On Fri, 28 May 2021, Quentin Schulz wrote:
> 
> > On Fri, May 28, 2021 at 08:51:51AM -0400, Robert P. J. Day wrote:
> > >
> > >   as a short followup to my earlier note about creating a bunch of
> > > externalsrc-based recipes to demonstrate their proper structure, it's
> > > easy to add the recipe files to a layer, but i then realized i needed
> > > to figure out where to put the corresponding source, and how i would
> > > refer to it with the EXTERNALSRC variable, and after some thought, it
> > > occurred that the simplest solution is to simply put the source in a
> > > "src" subdirectory next to the recipe itself, and use:
> > >
> > >   inherit externalsrc
> > >
> > >   EXTERNALSRC = "${THISDIR}/src"
> >
> > FWIW, we use multiple ../ in the variable and it works just fine.
> > Might be a slightly better example than having it next to the
> > recipe, since this would actually be covered by SRC_URI =
> > "file://whatever". In that case, you could add the sources in
> > `yocto-docs/externalsrc-src` for example?
> 
>   after further cogitation, it seems like using SRC_URI might be the
> way to go after all, unless i drastically misunderstand some features
> of "externalsrc".
> 
>   at the moment, most of this external source has to be compiled in
> place; very little of it supports "out of tree" building, which means
> that i'm forced to(?):

What make you say that? Links, sources? By default it builds in the
usual ${WORKDIR}/${BPN}-${PV}.

> 
>   EXTERNALSRC = <source location>
>   EXTERNALSRC_BUILD = "${EXTERNALSRC}"
> 
> however, that obviously(?) means that only one developer can build
> that recipe at a time, else they would step on each other's ongoing
> builds -- do i understand that correctly?
> 

In the case of EXTERNALSRC_BUILD = "${EXTERNALSRC}" I would say that
this is correct?

Sharing the same externalsrc sources between two distinct Yocto
setups is most likely bound to fail at some point. Anyway, you should
see externalsrc as stable as AUTOREV in SRCREV, at least that's what it
is to me.

externalsrc isn't much more than a stripped down SRC_URI =
"file://src/", the fetch/unpack are different, the way to track if files
is different too.

>   using SRC_URI, on the other hand, would copy the source directory
> into the WORKDIR, so that solves that problem. am i understanding this
> correctly?
> 

SRC_URI by default is looked only in three directories next to the
recipe and therefore is part of the git repo of your Yocto metadata.
externalsrc can be used to have sources anywhere on a filesystem.

I'm not sure I fully understood your confusion therefore I might have
not made anything clearer. Let me know what's confusing in SRC_URI vs
externalsrc or something else, I may be able to help.

Cheers,
Quentin
