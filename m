Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.10485.1622218481903288053
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 09:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:38550 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmf8C-008tNr-Su; Fri, 28 May 2021 12:14:41 -0400
Date: Fri, 28 May 2021 12:14:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
In-Reply-To: <20210528152626.aihuhwh5p5jbfl2d@qschulz>
Message-ID: <7b19f92-d277-b192-63d8-b7e1c173a9b@crashcourse.ca>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca> <20210528130557.zr762og6uvyv577b@qschulz> <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca> <20210528141615.klk5hwfmo4gwqfbg@qschulz> <3c62eb6a-ed4c-881f-ded6-625cc4b726da@crashcourse.ca>
 <20210528150703.mueernohsx4wlgry@qschulz> <57954bd8-dd61-ded9-83b1-61cbbc129d8b@crashcourse.ca> <20210528152626.aihuhwh5p5jbfl2d@qschulz>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 May 2021, Quentin Schulz wrote:

> On Fri, May 28, 2021 at 11:15:40AM -0400, Robert P. J. Day wrote:
> > On Fri, 28 May 2021, Quentin Schulz wrote:
> >
> > > On Fri, May 28, 2021 at 10:47:30AM -0400, Robert P. J. Day wrote:
> > > > On Fri, 28 May 2021, Quentin Schulz wrote:
> > > >
> > > > > On Fri, May 28, 2021 at 09:57:26AM -0400, Robert P. J. Day wrote:
> > > > > > On Fri, 28 May 2021, Quentin Schulz wrote:
> > > > > >
> > > > > > > On Fri, May 28, 2021 at 08:51:51AM -0400, Robert P. J. Day wrote:
> > > > > > > >
> > > > > > > >   as a short followup to my earlier note about creating a bunch of
> > > > > > > > externalsrc-based recipes to demonstrate their proper structure, it's
> > > > > > > > easy to add the recipe files to a layer, but i then realized i needed
> > > > > > > > to figure out where to put the corresponding source, and how i would
> > > > > > > > refer to it with the EXTERNALSRC variable, and after some thought, it
> > > > > > > > occurred that the simplest solution is to simply put the source in a
> > > > > > > > "src" subdirectory next to the recipe itself, and use:
> > > > > > > >
> > > > > > > >   inherit externalsrc
> > > > > > > >
> > > > > > > >   EXTERNALSRC = "${THISDIR}/src"
> > > > > > >
> > > > > > > FWIW, we use multiple ../ in the variable and it works just fine.
> > > > > > > Might be a slightly better example than having it next to the
> > > > > > > recipe, since this would actually be covered by SRC_URI =
> > > > > > > "file://whatever". In that case, you could add the sources in
> > > > > > > `yocto-docs/externalsrc-src` for example?
> > > > > >
> > > > > >   after further cogitation, it seems like using SRC_URI might be the
> > > > > > way to go after all, unless i drastically misunderstand some features
> > > > > > of "externalsrc".
> > > > > >
> > > > > >   at the moment, most of this external source has to be compiled in
> > > > > > place; very little of it supports "out of tree" building, which means
> > > > > > that i'm forced to(?):
> > > > >
> > > > > What make you say that? Links, sources? By default it builds in the
> > > > > usual ${WORKDIR}/${BPN}-${PV}.
> > > >
> > > >   i know, but if i do this with the source example i'm playing with:
> > > >
> > > > EXTERNALSRC = "${THISDIR}/src"
> > > > # EXTERNALSRC_BUILD = "${EXTERNALSRC}"
> > > >
> > > > and let EXTERNALSRC_BUILD default to the value you identify, i get:
> > > >
> > > > | make: *** No rule to make target 'install'.  Stop.
> > > >
> > > > i clearly don't understand something fundamental about using
> > > > externalsrc -- how do i get that external, remote source to build
> > > > under WORKDIR?
> > > >
> > >
> > > Would you mind sharing your work so far (recipe + source)? So we can
> > > try to reproduce on our side? I have a very complex recipe without
> > > EXTERNALSRC_BUILD set (on thud though, but with some backports from
> > > later versions for the externalsrc class).
> > >
> > > I couldn't find tests for externalsrc recipes, so either I'm blind
> > > (can't exclude it) or we're missing such tests, which we should add
> > > :)
> >
> >   i'm just using dmidecode as grabbed from here:
> >
> > http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb?h=master
> >
> > but let me ask a fairly basic question that might clear this up.
> >
> >   AIUI (and lord knows i could be wrong), depending on the
> > structure of the Makefile for some blob of source, it may not be
> > possible to build that source "out of tree". unless you've built
> > that sort of functionality into the Makefile, then you have no
> > choice but to do the build in the source tree. as in, ${B} = ${S}.
> >
> >   based on what i see, the dmidecode source must be built in-tree
> > -- there is no functionality in the Makefile to support
> > out-of-tree building. so if i use externalsrc with dmidecode, then
> > the build *must* happen in the source directory i identify with
> > EXTERNALSRC.
>
> ${B} = ${S} by default, so that might explain why it works without
> externalsrc being inherited.
>
> You can see in the makefile that this is assumed. Only the install
> tasks are installing somewhere else (DESTDIR), c.f.
> https://git.savannah.nongnu.org/cgit/dmidecode.git/tree/Makefile
>
> So yes, except if you patch the Makefile to support out-of-tree
> build, you would need both EXTERNALSRC and EXTERNALSRC_BUILD set to
> the same value.

  exactly, which is why if one is saddled with source directories that
can't build out-of-tree, then using externalsrc for any of those
directories if multiple developers are trying to build at the same
time would crash and burn in short order as they stepped all over each
other; hence, the need to back off and use SRC_URI in cases like that.

> Maybe a Cmake example would suit better since B is set to
> "${WORKDIR}/build" by default?
>
> Otherwise, write a proper Makefile that allows out-of-tree builds
> for the example :)

  nice idea if you have the kind of authority that allows you to
dictate how developers develop. :-) ok, i think we've resolved this.

rday
