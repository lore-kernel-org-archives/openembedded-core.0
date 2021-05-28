Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9329.1622213255191564451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 07:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:38106 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmdlt-008X8z-PH; Fri, 28 May 2021 10:47:33 -0400
Date: Fri, 28 May 2021 10:47:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
In-Reply-To: <20210528141615.klk5hwfmo4gwqfbg@qschulz>
Message-ID: <3c62eb6a-ed4c-881f-ded6-625cc4b726da@crashcourse.ca>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca> <20210528130557.zr762og6uvyv577b@qschulz> <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca> <20210528141615.klk5hwfmo4gwqfbg@qschulz>
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

> On Fri, May 28, 2021 at 09:57:26AM -0400, Robert P. J. Day wrote:
> > On Fri, 28 May 2021, Quentin Schulz wrote:
> >
> > > On Fri, May 28, 2021 at 08:51:51AM -0400, Robert P. J. Day wrote:
> > > >
> > > >   as a short followup to my earlier note about creating a bunch of
> > > > externalsrc-based recipes to demonstrate their proper structure, it's
> > > > easy to add the recipe files to a layer, but i then realized i needed
> > > > to figure out where to put the corresponding source, and how i would
> > > > refer to it with the EXTERNALSRC variable, and after some thought, it
> > > > occurred that the simplest solution is to simply put the source in a
> > > > "src" subdirectory next to the recipe itself, and use:
> > > >
> > > >   inherit externalsrc
> > > >
> > > >   EXTERNALSRC = "${THISDIR}/src"
> > >
> > > FWIW, we use multiple ../ in the variable and it works just fine.
> > > Might be a slightly better example than having it next to the
> > > recipe, since this would actually be covered by SRC_URI =
> > > "file://whatever". In that case, you could add the sources in
> > > `yocto-docs/externalsrc-src` for example?
> >
> >   after further cogitation, it seems like using SRC_URI might be the
> > way to go after all, unless i drastically misunderstand some features
> > of "externalsrc".
> >
> >   at the moment, most of this external source has to be compiled in
> > place; very little of it supports "out of tree" building, which means
> > that i'm forced to(?):
>
> What make you say that? Links, sources? By default it builds in the
> usual ${WORKDIR}/${BPN}-${PV}.

  i know, but if i do this with the source example i'm playing with:

EXTERNALSRC = "${THISDIR}/src"
# EXTERNALSRC_BUILD = "${EXTERNALSRC}"

and let EXTERNALSRC_BUILD default to the value you identify, i get:

| make: *** No rule to make target 'install'.  Stop.

i clearly don't understand something fundamental about using
externalsrc -- how do i get that external, remote source to build
under WORKDIR?

rday
